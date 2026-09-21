[CmdletBinding()]
param()

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$RepoRoot = Split-Path -Parent $PSScriptRoot
$CatalogDirectory = Join-Path $RepoRoot "catalog"
$RegistryPath = Join-Path $CatalogDirectory "source-registry.json"
$registry = Get-Content -Raw -LiteralPath $RegistryPath | ConvertFrom-Json

function Get-CommitSha {
    param([Parameter(Mandatory)][string]$RelativePath)

    $absolutePath = Join-Path $RepoRoot $RelativePath
    if (-not (Test-Path -LiteralPath $absolutePath)) {
        return $null
    }

    $sha = git -C $absolutePath rev-parse HEAD 2>$null
    if ($LASTEXITCODE -ne 0) {
        return $null
    }

    return ($sha | Select-Object -First 1).Trim()
}

function Write-JsonFile {
    param(
        [Parameter(Mandatory)][string]$Path,
        [Parameter(Mandatory)]$Value
    )

    $json = $Value | ConvertTo-Json -Depth 20
    [System.IO.File]::WriteAllText(
        $Path,
        $json + [Environment]::NewLine,
        [System.Text.UTF8Encoding]::new($false)
    )
}

$threeUiReportPath = Join-Path $RepoRoot "upstream/threeui/public/community-sync-report.json"
$threeUiReport = Get-Content -Raw -LiteralPath $threeUiReportPath | ConvertFrom-Json
$threeUiItems = @(
    $threeUiReport.components | ForEach-Object {
        [ordered]@{
            id = $_.id
            variants = @($_.variantIds)
            controls = @($_.controlKeys)
            sourcePath = "upstream/threeui/src/data/shaders.tsx"
        }
    }
)

$animeExamplesPath = Join-Path $RepoRoot "upstream/animejs/examples"
$animeItems = @(
    Get-ChildItem -Directory -LiteralPath $animeExamplesPath |
        Where-Object Name -ne "assets" |
        Sort-Object Name |
        ForEach-Object {
            [ordered]@{
                id = $_.Name
                sourcePath = "upstream/animejs/examples/$($_.Name)"
            }
        }
)

$magicRegistryPath = Join-Path $RepoRoot "upstream/magicui/apps/www/registry.json"
$magicRegistry = Get-Content -Raw -LiteralPath $magicRegistryPath | ConvertFrom-Json
$magicItems = @(
    $magicRegistry.items |
        Where-Object name -ne "index" |
        ForEach-Object {
            [ordered]@{
                id = $_.name
                type = $_.type
                title = if ($_.PSObject.Properties.Name -contains "title") { $_.title } else { $null }
                description = if ($_.PSObject.Properties.Name -contains "description") { $_.description } else { $null }
                dependencies = if ($_.PSObject.Properties.Name -contains "dependencies") { @($_.dependencies) } else { @() }
                registryDependencies = if ($_.PSObject.Properties.Name -contains "registryDependencies") { @($_.registryDependencies) } else { @() }
            }
        }
)

$portfolioComponentRoot = Join-Path $RepoRoot "upstream/magicui-portfolio/src/components"
$portfolioItems = @(
    Get-ChildItem -File -Recurse -LiteralPath $portfolioComponentRoot -Filter "*.tsx" |
        Sort-Object FullName |
        ForEach-Object {
            $relative = [System.IO.Path]::GetRelativePath($RepoRoot, $_.FullName).Replace("\", "/")
            [ordered]@{
                id = [System.IO.Path]::GetFileNameWithoutExtension($_.Name)
                sourcePath = $relative
            }
        }
)

$reactBitsContentRoot = Join-Path $RepoRoot "upstream/react-bits/src/content"
$reactBitsItems = @(
    Get-ChildItem -Directory -LiteralPath $reactBitsContentRoot |
        Sort-Object Name |
        ForEach-Object {
            $category = $_.Name
            Get-ChildItem -Directory -LiteralPath $_.FullName |
                Sort-Object Name |
                ForEach-Object {
                    [ordered]@{
                        id = $_.Name
                        category = $category
                        sourcePath = "upstream/react-bits/src/content/$category/$($_.Name)"
                    }
                }
        }
)

$twentyFirstSkillsRoot = Join-Path $RepoRoot "upstream/21st-skill/skills"
$twentyFirstItems = @(
    Get-ChildItem -Directory -LiteralPath $twentyFirstSkillsRoot |
        Sort-Object Name |
        ForEach-Object {
            [ordered]@{
                id = $_.Name
                sourcePath = "upstream/21st-skill/skills/$($_.Name)"
                contentPolicy = "official-tooling-only; marketplace items require per-item license verification"
            }
        }
)

$curatedUpstreams = @(
    $registry.sources |
        Where-Object {
            $_.PSObject.Properties.Name -contains "upstreamPath" -and
            $_.upstreamPath -like "upstream/curated/*"
        } |
        Sort-Object id |
        ForEach-Object {
            [ordered]@{
                id = $_.id
                name = $_.name
                sourcePath = $_.upstreamPath
                commit = Get-CommitSha $_.upstreamPath
                license = $_.license
                domains = @($_.domains)
            }
        }
)

$assets = [ordered]@{
    schemaVersion = 1
    generatedAt = (Get-Date).ToUniversalTime().ToString("o")
    policy = [ordered]@{
        private = $true
        freeOnly = $true
        proAllowed = $false
        redistribution = $false
    }
    catalogs = [ordered]@{
        threeui = $threeUiItems
        animejs = $animeItems
        magicuiProFreeSurface = $portfolioItems
        magicuiFree = $magicItems
        twentyFirstDev = $twentyFirstItems
        reactBits = $reactBitsItems
        curatedUpstreams = $curatedUpstreams
    }
}

$sourceSummaries = @(
    [ordered]@{
        id = "threeui"
        commit = Get-CommitSha "upstream/threeui"
        itemCount = $threeUiItems.Count
        routeCount = $threeUiReport.communityRoutes
        variantCount = $threeUiReport.communityVariants
    },
    [ordered]@{
        id = "animejs"
        commit = Get-CommitSha "upstream/animejs"
        exampleCount = $animeItems.Count
    },
    [ordered]@{
        id = "magicui-pro-free-surface"
        commit = Get-CommitSha "upstream/magicui-portfolio"
        freeTemplateCount = 1
        componentFileCount = $portfolioItems.Count
    },
    [ordered]@{
        id = "magicui-net"
        commit = Get-CommitSha "upstream/magicui"
        registryItemCount = $magicItems.Count
    },
    [ordered]@{
        id = "21st-dev"
        commit = Get-CommitSha "upstream/21st-skill"
        officialSkillCount = $twentyFirstItems.Count
        marketplaceMirrorCount = 0
    },
    [ordered]@{
        id = "react-bits"
        commit = Get-CommitSha "upstream/react-bits"
        componentCount = $reactBitsItems.Count
        categories = @(
            $reactBitsItems |
                Group-Object { $_["category"] } |
                Sort-Object Name |
                ForEach-Object {
                    [ordered]@{
                        name = $_.Name
                        count = $_.Count
                    }
                }
        )
    }
)

$sourceSummaries += @(
    $curatedUpstreams | ForEach-Object {
        [ordered]@{
            id = $_.id
            commit = $_.commit
            sourcePath = $_.sourcePath
            license = $_.license
        }
    }
)

$summary = [ordered]@{
    schemaVersion = 1
    generatedAt = $assets.generatedAt
    sourceCount = $registry.sources.Count
    localUpstreamCount = @($registry.sources | Where-Object { $_.PSObject.Properties.Name -contains "upstreamPath" }).Count
    catalogOnlyCount = @($registry.sources | Where-Object { -not ($_.PSObject.Properties.Name -contains "upstreamPath") }).Count
    sources = $sourceSummaries
}

Write-JsonFile -Path (Join-Path $CatalogDirectory "generated-assets.json") -Value $assets
Write-JsonFile -Path (Join-Path $CatalogDirectory "generated-summary.json") -Value $summary

Write-Host "Generated catalog/generated-assets.json and catalog/generated-summary.json"
