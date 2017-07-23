$moduleSource = ''
$moduleSource += (Get-Content -Raw -Path (Join-Path -Path $PSScriptRoot -ChildPath 'DSCResources\cTestResource1\cTestResource1.psm1')).TrimEnd() + "`n"
$moduleSource += (Get-Content -Raw -Path (Join-Path -Path $PSScriptRoot -ChildPath 'DSCResources\cTestResource2\cTestResource2.psm1')).TrimEnd() + "`n"
Set-Content -Path (Join-Path -Path $PSScriptRoot -ChildPath 'cMultipleClassResourcesTest.psm1') -Value $moduleSource
