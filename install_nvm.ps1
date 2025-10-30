# Requires running PowerShell as Administrator

Write-Host "Fetching latest NVM for Windows release..." -ForegroundColor Cyan

# Get the latest release info from GitHub
$releaseInfo = Invoke-RestMethod -Uri "https://api.github.com/repos/coreybutler/nvm-windows/releases/latest"

# Extract download URL for nvm-setup.exe
$asset = $releaseInfo.assets | Where-Object { $_.name -match "nvm-setup.exe" }
$nvmInstallerUrl = $asset.browser_download_url

Write-Host "Downloading installer: $nvmInstallerUrl" -ForegroundColor Cyan

# Temp path
$installerPath = "$env:TEMP\nvm-setup.exe"

Invoke-WebRequest -Uri $nvmInstallerUrl -OutFile $installerPath -UseBasicParsing

Write-Host "Running NVM installer..." -ForegroundColor Cyan
Start-Process -FilePath $installerPath -Wait

# Add NVM to PATH (if not already)
$nvmPath = "$env:ProgramFiles\nvm"
if (Test-Path $nvmPath) {
    [Environment]::SetEnvironmentVariable("NVM_HOME", $nvmPath, "Machine")
    [Environment]::SetEnvironmentVariable("NVM_SYMLINK", "$env:ProgramFiles\nodejs", "Machine")

    $path = [Environment]::GetEnvironmentVariable("Path", "Machine")
    if ($path -notlike "*$nvmPath*") {
        $newPath = "$path;$nvmPath;$env:ProgramFiles\nodejs"
        [Environment]::SetEnvironmentVariable("Path", $newPath, "Machine")
    }
}

Write-Host "Installation complete. Restart PowerShell or run the following command:" -ForegroundColor Green
Write-Host "`n`trefreshenv`n" -ForegroundColor Yellow
Write-Host "Then verify with:" -ForegroundColor Green
Write-Host "`tnvm version`n"

# Optional: auto-install latest Node LTS version
Write-Host "Do you want to install the latest Node.js LTS version now? (y/n): " -NoNewline
$response = Read-Host
if ($response -eq "y") {
    Write-Host "Installing latest LTS Node.js..." -ForegroundColor Cyan
    nvm install lts
    nvm use lts
    Write-Host "Node.js LTS installed successfully." -ForegroundColor Green
}
