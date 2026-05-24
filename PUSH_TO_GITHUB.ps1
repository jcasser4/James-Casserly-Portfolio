$ErrorActionPreference = "Stop"

$repoUrl = "https://github.com/jcasser4/James-Casserly-Portfolio.git"
$targetDir = "James-Casserly-Portfolio"
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$parentDir = Split-Path -Parent $scriptDir
Set-Location $parentDir

if (Test-Path "$targetDir\.git") {
    Write-Host "Using existing $targetDir folder..."
    Set-Location $targetDir
    git pull --rebase origin main
} else {
    Write-Host "Cloning $repoUrl..."
    git clone $repoUrl $targetDir
    Set-Location $targetDir
}

# Copy site files, including .nojekyll.
Copy-Item -Path "$scriptDir\*" -Destination . -Recurse -Force
Copy-Item -Path "$scriptDir\.nojekyll" -Destination . -Force
Remove-Item -Path ".\PUSH_TO_GITHUB.sh" -ErrorAction SilentlyContinue
Remove-Item -Path ".\PUSH_TO_GITHUB.ps1" -ErrorAction SilentlyContinue

git add .
$changes = git diff --cached --name-only
if ($changes) {
    git commit -m "Add portfolio website"
} else {
    Write-Host "No changes to commit."
}

git branch -M main
git push -u origin main

Write-Host "Done. Now open the repo Settings > Pages and publish from main / root."
Write-Host "Expected Pages URL: https://jcasser4.github.io/James-Casserly-Portfolio/"
