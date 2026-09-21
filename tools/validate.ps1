[CmdletBinding()]
param()

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$RepoRoot = Split-Path -Parent $PSScriptRoot
$RegistryPath = Join-Path $RepoRoot "catalog/source-registry.json"
$GeneratorRegistryPath = Join-Path $RepoRoot "catalog/generator-registry.json"
$LearningRegistryPath = Join-Path $RepoRoot "catalog/learning-repository-registry.json"
$FontRegistryPath = Join-Path $RepoRoot "catalog/font-source-registry.json"
$ScrollytellingRegistryPath = Join-Path $RepoRoot "catalog/scrollytelling-inspiration-registry.json"
$CreationStandardPath = Join-Path $RepoRoot "CREATION_STANDARD.md"
$AssetsPath = Join-Path $RepoRoot "catalog/generated-assets.json"
$SummaryPath = Join-Path $RepoRoot "catalog/generated-summary.json"

$registry = Get-Content -Raw -LiteralPath $RegistryPath | ConvertFrom-Json
$generatorRegistry = Get-Content -Raw -LiteralPath $GeneratorRegistryPath | ConvertFrom-Json
$learningRegistry = Get-Content -Raw -LiteralPath $LearningRegistryPath | ConvertFrom-Json
$fontRegistry = Get-Content -Raw -LiteralPath $FontRegistryPath | ConvertFrom-Json
$scrollytellingRegistry = Get-Content -Raw -LiteralPath $ScrollytellingRegistryPath | ConvertFrom-Json

if (-not (Test-Path -LiteralPath $CreationStandardPath -PathType Leaf)) {
    throw "Missing the single authoritative creation instruction: CREATION_STANDARD.md"
}
$agentInstructions = Get-Content -Raw -LiteralPath (Join-Path $RepoRoot "AGENTS.md")
if ($agentInstructions -notmatch [regex]::Escape("CREATION_STANDARD.md") -or $agentInstructions -notmatch "jedyną nadrzędną instrukcją") {
    throw "AGENTS.md must route every creation task through the single authoritative CREATION_STANDARD.md file."
}

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

if ($registry.sources.Count -lt $expectedUrls.Count) {
    throw "The registry cannot contain fewer records than the six originally requested websites."
}

$duplicateIds = @($registry.sources | Group-Object id | Where-Object Count -gt 1)
if ($duplicateIds.Count -gt 0) {
    throw "Duplicate source ids: $($duplicateIds.Name -join ', ')"
}

$duplicateUrls = @($registry.sources | Group-Object requestedUrl | Where-Object Count -gt 1)
if ($duplicateUrls.Count -gt 0) {
    throw "Duplicate source URLs: $($duplicateUrls.Name -join ', ')"
}

foreach ($source in $registry.sources) {
    foreach ($requiredProperty in @("id", "name", "requestedUrl", "accessTier", "license", "inclusion", "redistribution", "excluded", "domains")) {
        if (-not ($source.PSObject.Properties.Name -contains $requiredProperty)) {
            throw "Missing property '$requiredProperty' for source $($source.id)."
        }
    }

    if ($source.PSObject.Properties.Name -contains "upstreamPath") {
        $upstreamPath = Join-Path $RepoRoot $source.upstreamPath
        if (-not (Test-Path -LiteralPath $upstreamPath)) {
            throw "Missing upstream path for $($source.id): $($source.upstreamPath)"
        }
    }

    if ($source.PSObject.Properties.Name -contains "licenseFiles") {
        foreach ($licenseFile in @($source.licenseFiles)) {
            if (-not (Test-Path -LiteralPath (Join-Path $RepoRoot $licenseFile))) {
                throw "Missing license file for $($source.id): $licenseFile"
            }
        }
    }
}

if (-not $generatorRegistry.policy.freeOnly -or $generatorRegistry.policy.paidPlanContentIncluded) {
    throw "Generator registry must remain free-only with paid-plan content excluded."
}
if ($generatorRegistry.policy.unknownOutputAction -ne "do-not-import") {
    throw "Unknown generator output rights must result in do-not-import."
}

$duplicateGeneratorIds = @($generatorRegistry.generators | Group-Object id | Where-Object Count -gt 1)
$duplicateGeneratorUrls = @($generatorRegistry.generators | Group-Object url | Where-Object Count -gt 1)
if ($duplicateGeneratorIds.Count -gt 0 -or $duplicateGeneratorUrls.Count -gt 0) {
    throw "Duplicate generator ids or URLs detected."
}
foreach ($generator in $generatorRegistry.generators) {
    foreach ($requiredProperty in @("id", "name", "url", "mode", "categories", "freeScope", "licenseOrTerms", "accountRequired", "outputPolicy", "privacy", "inclusion", "caveats", "verificationUrls")) {
        if (-not ($generator.PSObject.Properties.Name -contains $requiredProperty)) {
            throw "Missing property '$requiredProperty' for generator $($generator.id)."
        }
    }
    if ($generator.inclusion -notlike "catalog-link-only*") {
        throw "Generator $($generator.id) must remain link-only."
    }
}

if (-not $learningRegistry.policy.officialRepositoryLinksOnly -or -not $learningRegistry.policy.copyRequiresLicenseReview) {
    throw "Learning repository policy must require official links and license review."
}
$duplicateLearningIds = @($learningRegistry.repositories | Group-Object id | Where-Object Count -gt 1)
$duplicateLearningUrls = @($learningRegistry.repositories | Group-Object repository | Where-Object Count -gt 1)
if ($duplicateLearningIds.Count -gt 0 -or $duplicateLearningUrls.Count -gt 0) {
    throw "Duplicate learning repository ids or URLs detected."
}
foreach ($learningRepository in $learningRegistry.repositories) {
    foreach ($requiredProperty in @("id", "name", "repository", "license", "topics", "learningValue", "inclusion", "caveats")) {
        if (-not ($learningRepository.PSObject.Properties.Name -contains $requiredProperty)) {
            throw "Missing property '$requiredProperty' for learning repository $($learningRepository.id)."
        }
    }
    if ($learningRepository.repository -notlike "https://github.com/*") {
        throw "Learning repository must use an official GitHub URL: $($learningRepository.id)."
    }
}

if (-not $fontRegistry.policy.openSourceOnly -or $fontRegistry.policy.paidFontsAllowed -or $fontRegistry.policy.mixedLicenseCatalogsAllowed) {
    throw "Font registry must remain open-source-only with paid and mixed-license catalogs disabled."
}
if (-not $fontRegistry.policy.perFamilyLicenseCheckRequired) {
    throw "Font registry must require a license check for every selected family."
}
if ($fontRegistry.sources.Count -lt 5) {
    throw "Font registry must contain at least five vetted open-source catalogs."
}
$duplicateFontIds = @($fontRegistry.sources | Group-Object id | Where-Object Count -gt 1)
$duplicateFontUrls = @($fontRegistry.sources | Group-Object url | Where-Object Count -gt 1)
if ($duplicateFontIds.Count -gt 0 -or $duplicateFontUrls.Count -gt 0) {
    throw "Duplicate font source ids or URLs detected."
}
foreach ($fontSource in $fontRegistry.sources) {
    foreach ($requiredProperty in @("id", "name", "url", "repository", "licenseScope", "delivery", "bestFor", "requiredChecks", "inclusion")) {
        if (-not ($fontSource.PSObject.Properties.Name -contains $requiredProperty)) {
            throw "Missing property '$requiredProperty' for font source $($fontSource.id)."
        }
    }
    if ($fontSource.inclusion -notlike "approved-*") {
        throw "Font source $($fontSource.id) is not approved by the open-source policy."
    }
}

if (-not $scrollytellingRegistry.policy.referenceOnly -or $scrollytellingRegistry.policy.copyCodeOrAssets) {
    throw "Scrollytelling inspirations must remain reference-only with copying disabled."
}
if ($scrollytellingRegistry.inspirations.Count -lt 12) {
    throw "Scrollytelling registry must contain at least twelve curated inspirations."
}
$duplicateInspirationIds = @($scrollytellingRegistry.inspirations | Group-Object id | Where-Object Count -gt 1)
$duplicateInspirationUrls = @($scrollytellingRegistry.inspirations | Group-Object url | Where-Object Count -gt 1)
if ($duplicateInspirationIds.Count -gt 0 -or $duplicateInspirationUrls.Count -gt 0) {
    throw "Duplicate scrollytelling inspiration ids or URLs detected."
}
foreach ($inspiration in $scrollytellingRegistry.inspirations) {
    foreach ($requiredProperty in @("id", "name", "publisher", "year", "url", "format", "patterns", "learningValue", "risks", "usage")) {
        if (-not ($inspiration.PSObject.Properties.Name -contains $requiredProperty)) {
            throw "Missing property '$requiredProperty' for scrollytelling inspiration $($inspiration.id)."
        }
    }
    if ($inspiration.usage -ne "reference-only") {
        throw "Scrollytelling inspiration $($inspiration.id) must remain reference-only."
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

$summary = Get-Content -Raw -LiteralPath $SummaryPath | ConvertFrom-Json
if ($summary.sourceCount -ne $registry.sources.Count) {
    throw "Generated summary is stale. Run tools/build-catalog.ps1."
}
if ($summary.generatorCount -ne $generatorRegistry.generators.Count -or $summary.learningRepositoryCount -ne $learningRegistry.repositories.Count) {
    throw "Generated generator or learning repository summary is stale. Run tools/build-catalog.ps1."
}
if ($summary.fontSourceCount -ne $fontRegistry.sources.Count -or $summary.scrollytellingInspirationCount -ne $scrollytellingRegistry.inspirations.Count) {
    throw "Generated font or scrollytelling summary is stale. Run tools/build-catalog.ps1."
}

$submoduleStatus = @(git -C $RepoRoot submodule status)
if ($LASTEXITCODE -ne 0) {
    throw "Unable to read submodule status."
}
$uninitialized = @($submoduleStatus | Where-Object { $_ -match '^-' })
if ($uninitialized.Count -gt 0) {
    throw "Uninitialized submodules detected. Run: git submodule update --init --recursive --depth 1"
}

Write-Host "Validation passed: private, free-only, no Pro, no redistribution; one creation standard; $($registry.sources.Count) sources, $($generatorRegistry.generators.Count) generators, $($learningRegistry.repositories.Count) learning repositories, $($fontRegistry.sources.Count) font catalogs and $($scrollytellingRegistry.inspirations.Count) scrollytelling inspirations registered."
