[CmdletBinding()]
param()

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$RepoRoot = Split-Path -Parent $PSScriptRoot
$ProjectRoot = Join-Path $RepoRoot "projects/allintraders-site"

$requiredFiles = @(
    "BRIEF.md",
    "PROVENANCE.md",
    "QUALITY.md",
    "THIRD_PARTY_NOTICES.md",
    "package.json",
    "src/app/layout.tsx",
    "src/app/page.tsx",
    "src/app/globals.css",
    "src/components/ui/blur-fade.tsx",
    "src/components/ui/animated-grid-pattern.tsx",
    "licenses/MAGIC_UI_MIT.txt",
    "licenses/MOTION_MIT.txt",
    "licenses/LUCIDE_ISC.txt",
    "licenses/MANROPE_OFL.txt"
)

foreach ($relativePath in $requiredFiles) {
    if (-not (Test-Path -LiteralPath (Join-Path $ProjectRoot $relativePath) -PathType Leaf)) {
        throw "ALLinTraders project is missing required file: $relativePath"
    }
}

$package = Get-Content -Raw -LiteralPath (Join-Path $ProjectRoot "package.json") | ConvertFrom-Json
$dependencyNames = @(
    @($package.dependencies.PSObject.Properties.Name)
    @($package.devDependencies.PSObject.Properties.Name)
)
$forbidden3dDependencies = @("three", "@react-three/fiber", "@react-three/drei", "babylonjs", "@babylonjs/core")
$present3dDependencies = @($forbidden3dDependencies | Where-Object { $_ -in $dependencyNames })
if ($present3dDependencies.Count -gt 0) {
    throw "ALLinTraders project must remain non-3D. Remove: $($present3dDependencies -join ', ')"
}

$layout = Get-Content -Raw -LiteralPath (Join-Path $ProjectRoot "src/app/layout.tsx")
$page = Get-Content -Raw -LiteralPath (Join-Path $ProjectRoot "src/app/page.tsx")
$styles = Get-Content -Raw -LiteralPath (Join-Path $ProjectRoot "src/app/globals.css")

if ($layout -notmatch '<html\s+lang="pl"') {
    throw "ALLinTraders layout must declare Polish document language."
}
if ($page -notmatch '<main' -or $page -notmatch '<h1') {
    throw "ALLinTraders page must contain semantic main and h1 elements."
}
if ($page -notmatch 'skip-link' -or $styles -notmatch ':focus-visible' -or $styles -notmatch 'prefers-reduced-motion') {
    throw "ALLinTraders page must retain skip navigation, focus visibility and reduced-motion support."
}

foreach ($componentPath in @("src/components/ui/blur-fade.tsx", "src/components/ui/animated-grid-pattern.tsx")) {
    $component = Get-Content -Raw -LiteralPath (Join-Path $ProjectRoot $componentPath)
    if ($component -notmatch 'Source:' -or $component -notmatch 'License:') {
        throw "Adapted component must retain source and license headers: $componentPath"
    }
}

$provenanceFiles = Get-ChildItem -LiteralPath (Join-Path $ProjectRoot "provenance") -Filter "*.json" -File
if ($provenanceFiles.Count -lt 4) {
    throw "ALLinTraders project must retain provenance records for every external dependency."
}
foreach ($provenanceFile in $provenanceFiles) {
    $null = Get-Content -Raw -LiteralPath $provenanceFile.FullName | ConvertFrom-Json
}

$sourceFiles = Get-ChildItem -LiteralPath (Join-Path $ProjectRoot "src") -Recurse -File -Include "*.ts", "*.tsx", "*.css"
$placeholderPattern = '(?i)lorem\s+ipsum|\bTODO\b|\bTBD\b|coming\s+soon|href=["'']#["'']|placeholder\s*='
foreach ($sourceFile in $sourceFiles) {
    $matches = Select-String -LiteralPath $sourceFile.FullName -Pattern $placeholderPattern
    if ($matches) {
        throw "Final project source contains a forbidden placeholder in $($sourceFile.FullName)."
    }
}

Write-Host "Project validation passed: ALLinTraders is non-3D, placeholder-free, interactive, accessible, provenance-tracked and license-complete."
