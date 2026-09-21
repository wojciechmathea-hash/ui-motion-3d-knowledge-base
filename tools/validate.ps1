[CmdletBinding()]
param()

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$RepoRoot = Split-Path -Parent $PSScriptRoot
$RegistryPath = Join-Path $RepoRoot "catalog/source-registry.json"
$AssetsPath = Join-Path $RepoRoot "catalog/generated-assets.json"
$SummaryPath = Join-Path $RepoRoot "catalog/generated-summary.json"

$registry = Get-Content -Raw -LiteralPath $RegistryPath | ConvertFrom-Json

if ($registry.repositoryPolicy.visibility -ne "private") {
    throw "Repository policy must remain private."
}
if (-not $registry.repositoryPolicy.freeOnly) {
    throw "Repository policy must remain free-only."
}
if ($registry.repositoryPolicy.proAllowed) {
    throw "Pro assets must remain disabled."
}
if ($registry.repositoryPolicy.redistribution) {
    throw "Redistribution must remain disabled."
}

$expectedUrls = @(
    "https://threeui.com/browse",
    "https://animejs.com",
    "https://pro.magicui.design",
    "https://magicui.net",
    "https://21st.dev",
    "https://reactbits.dev"
)
$actualUrls = @($registry.sources.requestedUrl)
$missingUrls = @($expectedUrls | Where-Object { $_ -notin $actualUrls })
if ($missingUrls.Count -gt 0) {
    throw "Missing requested sources: $($missingUrls -join ', ')"
}

if ($registry.sources.Count -ne $expectedUrls.Count) {
    throw "The registry must contain exactly one record for each of the six requested websites."
}

foreach ($source in $registry.sources) {
    if ($source.PSObject.Properties.Name -contains "upstreamPath") {
        $upstreamPath = Join-Path $RepoRoot $source.upstreamPath
        if (-not (Test-Path -LiteralPath $upstreamPath)) {
            throw "Missing upstream path for $($source.id): $($source.upstreamPath)"
        }
    }

    foreach ($licenseFile in @($source.licenseFiles)) {
        if (-not (Test-Path -LiteralPath (Join-Path $RepoRoot $licenseFile))) {
            throw "Missing license file for $($source.id): $licenseFile"
        }
    }
}

foreach ($generatedPath in @($AssetsPath, $SummaryPath)) {
    if (-not (Test-Path -LiteralPath $generatedPath)) {
        throw "Missing generated catalog: $generatedPath. Run tools/build-catalog.ps1."
    }
    $null = Get-Content -Raw -LiteralPath $generatedPath | ConvertFrom-Json
}

$assets = Get-Content -Raw -LiteralPath $AssetsPath | ConvertFrom-Json
if (-not $assets.policy.private -or -not $assets.policy.freeOnly -or $assets.policy.proAllowed -or $assets.policy.redistribution) {
    throw "Generated catalog policy does not match private/free-only/no-Pro/no-redistribution requirements."
}

$submoduleStatus = @(git -C $RepoRoot submodule status)
if ($LASTEXITCODE -ne 0) {
    throw "Unable to read submodule status."
}
$uninitialized = @($submoduleStatus | Where-Object { $_ -match '^-' })
if ($uninitialized.Count -gt 0) {
    throw "Uninitialized submodules detected. Run: git submodule update --init --recursive --depth 1"
}

Write-Host "Validation passed: private, free-only, no Pro, no redistribution; all six websites are registered."

