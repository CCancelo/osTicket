$ErrorActionPreference = "Stop"
$sourcePath = "\\tsclient\E\projects\support"
$destPath   = "C:\inetpub\support"

Write-Host "Stopping DeskFlow site..." -ForegroundColor Cyan
Import-Module WebAdministration
Stop-Website -Name "DeskFlow"
Stop-WebAppPool -Name "DeskFlowPool"
Start-Sleep -Seconds 3

Write-Host "Copying files..." -ForegroundColor Cyan
Get-ChildItem $sourcePath -Exclude "appsettings.Production.json", "appsettings.json" | ForEach-Object {
    Copy-Item $_.FullName -Destination (Join-Path $destPath $_.Name) -Force -Recurse
}

Write-Host "Starting DeskFlow site..." -ForegroundColor Cyan
Start-WebAppPool -Name "DeskFlowPool"
Start-Website -Name "DeskFlow"
Start-Sleep -Seconds 2
iisreset

Write-Host "Deploy complete!" -ForegroundColor Green
(Get-Item "$destPath\gapShop.Support.dll").LastWriteTime