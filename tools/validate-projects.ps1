[CmdletBinding()]
param()

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$RepoRoot = Split-Path -Parent $PSScriptRoot
$ProjectsRoot = Join-Path $RepoRoot "projects"

if (-not (Test-Path -LiteralPath $ProjectsRoot -PathType Container)) {
    Write-Host "Project validation passed: no project directories are present."
    return
}

$projectDirectories = @(Get-ChildItem -LiteralPath $ProjectsRoot -Directory | Where-Object {
    Test-Path -LiteralPath (Join-Path $_.FullName "package.json") -PathType Leaf
})

$requiredFiles = @(
    "BRIEF.md",
    "SOURCE_LOCK_MANIFEST.md",
    "PROVENANCE.md",
    "QUALITY.md",
    "THIRD_PARTY_NOTICES.md",
    "package.json",
    "src/app/layout.tsx",
    "src/app/page.tsx",
    "src/app/globals.css"
)
$forbidden3dDependencies = @("three", "@react-three/fiber", "@react-three/drei", "babylonjs", "@babylonjs/core")
$placeholderPattern = '(?i)lorem\s+ipsum|\bTODO\b|\bTBD\b|coming\s+soon|href=["'']#["'']|placeholder\s*='
$forbiddenRenderPattern = '(?i)<canvas|WebGLRenderingContext|getContext\s*\(\s*["'']webgl|from\s+["'']three["'']|@react-three|babylon'

foreach ($project in $projectDirectories) {
    foreach ($relativePath in $requiredFiles) {
        if (-not (Test-Path -LiteralPath (Join-Path $project.FullName $relativePath) -PathType Leaf)) {
            throw "$($project.Name) is missing required source-locked project file: $relativePath"
        }
    }

    $manifest = Get-Content -Raw -LiteralPath (Join-Path $project.FullName "SOURCE_LOCK_MANIFEST.md")
    foreach ($marker in @("Registry ID", "Upstream", "Licencja", "Provenance record", "100%")) {
        if ($manifest -notmatch [regex]::Escape($marker)) {
            throw "$($project.Name) source-lock manifest is missing marker: $marker"
        }
    }
    if ($manifest -match '(?im)^\|[^\r\n]*\|\s*(local-original|reference-only)\s*\|') {
        throw "$($project.Name) source-lock manifest contains a forbidden visual source."
    }

    $package = Get-Content -Raw -LiteralPath (Join-Path $project.FullName "package.json") | ConvertFrom-Json
    $dependencyNames = @(
        @($package.dependencies.PSObject.Properties.Name)
        @($package.devDependencies.PSObject.Properties.Name)
    )
    $present3dDependencies = @($forbidden3dDependencies | Where-Object { $_ -in $dependencyNames })
    if ($present3dDependencies.Count -gt 0) {
        throw "$($project.Name) must remain non-3D and WebGL-free. Remove: $($present3dDependencies -join ', ')"
    }

    $layout = Get-Content -Raw -LiteralPath (Join-Path $project.FullName "src/app/layout.tsx")
    $page = Get-Content -Raw -LiteralPath (Join-Path $project.FullName "src/app/page.tsx")
    $styles = Get-Content -Raw -LiteralPath (Join-Path $project.FullName "src/app/globals.css")
    if ($layout -notmatch '<html\s+lang="pl"' -or $page -notmatch '<main' -or $page -notmatch '<h1') {
        throw "$($project.Name) must retain Polish language, semantic main and a primary heading."
    }
    if ($page -notmatch 'href="#main"' -or $styles -notmatch 'prefers-reduced-motion') {
        throw "$($project.Name) must retain skip navigation and reduced-motion support."
    }

    $provenancePath = Join-Path $project.FullName "provenance"
    if (-not (Test-Path -LiteralPath $provenancePath -PathType Container)) {
        throw "$($project.Name) is missing the provenance directory."
    }
    $provenanceFiles = @(Get-ChildItem -LiteralPath $provenancePath -Filter "*.json" -File)
    if ($provenanceFiles.Count -lt 1) {
        throw "$($project.Name) must include provenance JSON records."
    }
    foreach ($provenanceFile in $provenanceFiles) {
        $record = Get-Content -Raw -LiteralPath $provenanceFile.FullName | ConvertFrom-Json
        foreach ($property in @("id", "originType", "source", "license", "modifications")) {
            if (-not ($record.PSObject.Properties.Name -contains $property)) {
                throw "$($project.Name) provenance file $($provenanceFile.Name) is missing: $property"
            }
        }
    }

    $sourceFiles = @(Get-ChildItem -LiteralPath (Join-Path $project.FullName "src") -Recurse -File -Include "*.ts", "*.tsx", "*.css")
    foreach ($sourceFile in $sourceFiles) {
        if (Select-String -LiteralPath $sourceFile.FullName -Pattern $placeholderPattern) {
            throw "$($project.Name) contains a forbidden placeholder in $($sourceFile.FullName)."
        }
        if (Select-String -LiteralPath $sourceFile.FullName -Pattern $forbiddenRenderPattern) {
            throw "$($project.Name) contains forbidden WebGL, canvas or 3D code in $($sourceFile.FullName)."
        }
    }

    Write-Host "Project validation passed: $($project.Name) is source-locked, non-3D, WebGL-free, placeholder-free, accessible, provenance-tracked and license-complete."
}

if ($projectDirectories.Count -eq 0) {
    Write-Host "Project validation passed: no package-based projects require validation."
}
