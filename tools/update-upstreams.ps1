[CmdletBinding()]
param()

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$RepoRoot = Split-Path -Parent $PSScriptRoot

git -C $RepoRoot submodule update --init --recursive --depth 1
if ($LASTEXITCODE -ne 0) {
    throw "Submodule initialization failed."
}

git -C $RepoRoot submodule update --remote --checkout --recursive --depth 1
if ($LASTEXITCODE -ne 0) {
    throw "Submodule update failed."
}

& (Join-Path $PSScriptRoot "build-catalog.ps1")
& (Join-Path $PSScriptRoot "validate.ps1")

Write-Host "Upstreams updated. Review git diff --submodule=log and all license changes before committing."

