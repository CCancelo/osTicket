$ErrorActionPreference = "Stop"
$publishPath = "E:\projects\support"

Write-Host "Publishing gapShop.Support..." -ForegroundColor Cyan
dotnet publish E:\Projects\gapShop\gapShop.Support `
    -c Release `
    -o $publishPath `
    --runtime win-x64 `
    --self-contained false

if ($LASTEXITCODE -ne 0) {
    Write-Host "Publish failed." -ForegroundColor Red
    exit 1
}

Write-Host "Published to $publishPath" -ForegroundColor Green
Write-Host "Now run deploy-support-vm.ps1 on the VM." -ForegroundColor Yellow