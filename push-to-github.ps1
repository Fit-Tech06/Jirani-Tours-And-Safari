# Push this project to GitHub
# 1. Install Git from https://git-scm.com/download/win if needed
# 2. Create a new empty repo at https://github.com/new (no README)
# 3. Edit below: set $githubUser and $repoName
# 4. Run: Right-click this file -> Run with PowerShell (or: powershell -File push-to-github.ps1)

$githubUser = "YOUR_GITHUB_USERNAME"   # e.g. johndoe
$repoName   = "afroresilience-trust"   # or jirani-tours, etc.

$projectRoot = $PSScriptRoot
Set-Location $projectRoot

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "Git is not installed or not in PATH. Install from: https://git-scm.com/download/win" -ForegroundColor Red
    exit 1
}

Write-Host "Initializing git and pushing to GitHub..." -ForegroundColor Cyan
git init
git add .
git commit -m "Initial commit: Jirani Tours & Safaris website"
git branch -M main
git remote remove origin 2>$null
git remote add origin "https://github.com/$githubUser/$repoName.git"
git push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host "`nDone! Shareable links:" -ForegroundColor Green
    Write-Host "  Repo:  https://github.com/$githubUser/$repoName"
    Write-Host "  Pages: https://$githubUser.github.io/$repoName/  (after enabling GitHub Pages in repo Settings)"
}
else {
    Write-Host "`nPush failed. Check: (1) Git installed, (2) repo exists on GitHub, (3) you're logged in (git credential or browser)." -ForegroundColor Yellow
}
