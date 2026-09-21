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
    "src/components/features/decision-loop.tsx",
    "src/components/features/scrolly-story.tsx",
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

$header = Get-Content -Raw -LiteralPath (Join-Path $ProjectRoot "src/components/layout/site-header.tsx")
$decisionLoop = Get-Content -Raw -LiteralPath (Join-Path $ProjectRoot "src/components/features/decision-loop.tsx")
$scrollyStory = Get-Content -Raw -LiteralPath (Join-Path $ProjectRoot "src/components/features/scrolly-story.tsx")
if ($header -notmatch 'aria-current' -or $header -notmatch 'reading-progress') {
    throw "ALLinTraders navigation must retain active-section and reading-progress feedback."
}
if ($decisionLoop -notmatch 'role="tablist"' -or $decisionLoop -notmatch 'ArrowLeft' -or $decisionLoop -notmatch 'ArrowRight') {
    throw "ALLinTraders decision loop must retain its accessible keyboard interaction."
}
if ($page -notmatch 'ScrollyStory' -or $scrollyStory -notmatch 'id="story"' -or $scrollyStory -notmatch 'IntersectionObserver' -or $scrollyStory -notmatch '<svg') {
    throw "ALLinTraders must retain its scroll-tracked SVG storytelling sequence."
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
$forbiddenRenderPattern = '(?i)<canvas|WebGLRenderingContext|getContext\s*\(\s*["'']webgl|from\s+["'']three["'']|@react-three|babylon'
foreach ($sourceFile in $sourceFiles) {
    $matches = Select-String -LiteralPath $sourceFile.FullName -Pattern $placeholderPattern
    if ($matches) {
        throw "Final project source contains a forbidden placeholder in $($sourceFile.FullName)."
    }
    $forbiddenRenderMatches = Select-String -LiteralPath $sourceFile.FullName -Pattern $forbiddenRenderPattern
    if ($forbiddenRenderMatches) {
        throw "ALLinTraders source must remain free of WebGL, canvas and 3D renderers: $($sourceFile.FullName)."
    }
}

Write-Host "Project validation passed: ALLinTraders is scroll-tracked, non-3D, WebGL-free, placeholder-free, interactive, accessible, provenance-tracked and license-complete."

$ShowcaseRoot = Join-Path $RepoRoot "projects/interface-atlas-showcase"
$showcaseRequiredFiles = @(
    "BRIEF.md",
    "PROVENANCE.md",
    "QUALITY.md",
    "THIRD_PARTY_NOTICES.md",
    "package.json",
    "src/app/layout.tsx",
    "src/app/page.tsx",
    "src/app/globals.css",
    "src/components/features/scroll-story.tsx",
    "src/components/features/interaction-lab.tsx",
    "src/components/features/data-atlas.tsx",
    "src/components/features/system-lab.tsx",
    "src/components/features/spatial-topology.tsx",
    "src/components/ui/blur-fade.tsx",
    "src/components/ui/animated-grid-pattern.tsx",
    "licenses/MAGIC_UI_MIT.txt",
    "licenses/MOTION_MIT.txt",
    "licenses/LUCIDE_ISC.txt",
    "licenses/MANROPE_OFL.txt",
    "licenses/THREE_MIT.txt",
    "licenses/REACT_THREE_FIBER_MIT.txt"
)

foreach ($relativePath in $showcaseRequiredFiles) {
    if (-not (Test-Path -LiteralPath (Join-Path $ShowcaseRoot $relativePath) -PathType Leaf)) {
        throw "Interface Atlas project is missing required file: $relativePath"
    }
}

$showcasePackage = Get-Content -Raw -LiteralPath (Join-Path $ShowcaseRoot "package.json") | ConvertFrom-Json
$showcaseDependencyNames = @($showcasePackage.dependencies.PSObject.Properties.Name)
foreach ($dependency in @("motion", "three", "@react-three/fiber", "lucide-react", "@fontsource-variable/manrope")) {
    if ($dependency -notin $showcaseDependencyNames) {
        throw "Interface Atlas is missing required, provenance-tracked dependency: $dependency"
    }
}

$showcaseLayout = Get-Content -Raw -LiteralPath (Join-Path $ShowcaseRoot "src/app/layout.tsx")
$showcasePage = Get-Content -Raw -LiteralPath (Join-Path $ShowcaseRoot "src/app/page.tsx")
$showcaseStyles = Get-Content -Raw -LiteralPath (Join-Path $ShowcaseRoot "src/app/globals.css")
$showcaseStory = Get-Content -Raw -LiteralPath (Join-Path $ShowcaseRoot "src/components/features/scroll-story.tsx")
$showcaseSpatial = Get-Content -Raw -LiteralPath (Join-Path $ShowcaseRoot "src/components/features/spatial-topology.tsx")

if ($showcaseLayout -notmatch '<html\s+lang="pl"' -or $showcasePage -notmatch '<main' -or $showcasePage -notmatch '<h1') {
    throw "Interface Atlas must retain Polish language, semantic main and a primary heading."
}
if ($showcasePage -notmatch 'skip-link' -or $showcaseStyles -notmatch ':focus-visible' -or $showcaseStyles -notmatch 'prefers-reduced-motion') {
    throw "Interface Atlas must retain skip navigation, focus visibility and reduced-motion support."
}
if ($showcaseStory -notmatch 'IntersectionObserver' -or $showcaseStory -notmatch 'aria-current' -or $showcaseSpatial -notmatch '<Canvas') {
    throw "Interface Atlas must retain scroll tracking and its purposeful spatial layer."
}
if ($showcaseSpatial -notmatch 'StaticTopology' -or $showcaseSpatial -notmatch 'dpr=\{\[1, 1\.5\]\}' -or $showcaseSpatial -notmatch 'frameloop=') {
    throw "Interface Atlas WebGL layer must retain its SVG fallback, DPR cap and viewport-aware render loop."
}

$showcaseProvenanceFiles = Get-ChildItem -LiteralPath (Join-Path $ShowcaseRoot "provenance") -Filter "*.json" -File
if ($showcaseProvenanceFiles.Count -lt 7) {
    throw "Interface Atlas must retain provenance records for each external source."
}
foreach ($provenanceFile in $showcaseProvenanceFiles) {
    $null = Get-Content -Raw -LiteralPath $provenanceFile.FullName | ConvertFrom-Json
}

$showcaseSourceFiles = Get-ChildItem -LiteralPath (Join-Path $ShowcaseRoot "src") -Recurse -File -Include "*.ts", "*.tsx", "*.css"
foreach ($sourceFile in $showcaseSourceFiles) {
    $matches = Select-String -LiteralPath $sourceFile.FullName -Pattern $placeholderPattern
    if ($matches) {
        throw "Interface Atlas contains a forbidden placeholder in $($sourceFile.FullName)."
    }
}

Write-Host "Project validation passed: Interface Atlas is interactive, scroll-tracked, WebGL-fallback-safe, placeholder-free, accessible, provenance-tracked and license-complete."
