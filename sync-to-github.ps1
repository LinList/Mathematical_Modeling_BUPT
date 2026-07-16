# ============================================================
#  Universal Git Sync Script
#  Auto-detects: repo path, remote URL, branch name
#  Works on any computer, any repo, any branch
# ============================================================

# ---------- Color Output ----------
function Step  ($msg) { Write-Host $msg -ForegroundColor Cyan }
function OK    ($msg) { Write-Host "   [OK]  $msg" -ForegroundColor Green }
function Info  ($msg) { Write-Host "   [..]  $msg" -ForegroundColor Yellow }
function Fail  ($msg) { Write-Host "   [X]  $msg" -ForegroundColor Red }

# ---------- Banner ----------
Clear-Host
Write-Host ""
Write-Host "+==================================================+" -ForegroundColor Cyan
Write-Host "|                                                  |" -ForegroundColor Cyan
Write-Host "|  Git Sync - Auto Push to Remote                  |" -ForegroundColor White
Write-Host "|  Universal Edition                               |" -ForegroundColor DarkCyan
Write-Host "|                                                  |" -ForegroundColor Cyan
Write-Host "+==================================================+" -ForegroundColor Cyan
Write-Host ""

# ---------- Auto-detect repo path ----------
# $PSScriptRoot = directory where this .ps1 file lives
# Assuming the script is placed in the repo root
$repoPath = $PSScriptRoot
if (-not $repoPath) { $repoPath = Get-Location }

Set-Location -LiteralPath $repoPath
Info "Working dir: $repoPath"

# ---------- Pre-flight Checks ----------
Write-Host ""
Step "[0/5] Pre-flight checks..."

# Check 1: Is git installed?
$gitExe = Get-Command git -ErrorAction SilentlyContinue
if (-not $gitExe) {
    Fail "Git is NOT installed! Download from: https://git-scm.com/downloads"
    Write-Host ""
    Read-Host "Press Enter to exit"
    exit 1
}
OK "Git found: $($gitExe.Source)"

# Check 2: Is this a git repo?
$inRepo = git rev-parse --is-inside-work-tree 2>&1
if ($LASTEXITCODE -ne 0) {
    Fail "This folder is NOT a git repository!"
    Write-Host "   Run: git init"
    Write-Host "   Then: git remote add origin <your-repo-url>"
    Write-Host ""
    Read-Host "Press Enter to exit"
    exit 1
}
OK "Git repository confirmed"

# Check 3: Does remote 'origin' exist?
$remoteUrl = git remote get-url origin 2>&1
if ($LASTEXITCODE -ne 0) {
    Fail "No remote 'origin' configured!"
    Write-Host "   Run: git remote add origin https://github.com/USER/REPO.git"
    Write-Host ""
    Read-Host "Press Enter to exit"
    exit 1
}
# Clean URL for display (strip embedded credentials)
$displayUrl = $remoteUrl -replace "https://[^@]+@", "https://"
OK "Remote: $displayUrl"

# Check 4: Auto-detect current branch
$branch = git rev-parse --abbrev-ref HEAD 2>&1
if ($LASTEXITCODE -ne 0 -or [string]::IsNullOrWhiteSpace($branch)) {
    Fail "Cannot detect current branch!"
    Write-Host ""
    Read-Host "Press Enter to exit"
    exit 1
}
OK "Branch: $branch"

# Check 5: Is user.name configured?
$userName = git config user.name 2>&1
if ([string]::IsNullOrWhiteSpace($userName)) {
    Fail "git user.name is NOT set!"
    Write-Host "   Run: git config --global user.name ""Your Name"""
    Write-Host ""
    Read-Host "Press Enter to exit"
    exit 1
}
OK "Author: $userName"
Write-Host ""

# ---------- Step 1: Check changes ----------
Step "[1/5] Scanning local changes..."
$status = git status --short 2>&1
if ($LASTEXITCODE -ne 0) {
    Fail "git status failed."
    Write-Host ""
    Read-Host "Press Enter to exit"
    exit 1
}

if ([string]::IsNullOrWhiteSpace($status)) {
    Info "No changes detected. Nothing to sync."
    Write-Host ""
    Read-Host "Press Enter to exit"
    exit 0
}

$status | ForEach-Object { Write-Host "        $_" -ForegroundColor DarkGray }
Write-Host ""

# ---------- Step 2: git add ----------
Step "[2/5] Adding files to staging area..."
git add . 2>&1 | Out-Null
if ($LASTEXITCODE -ne 0) {
    Fail "git add failed. Check file permissions."
    Write-Host ""
    Read-Host "Press Enter to exit"
    exit 1
}
OK "All changes staged"

# ---------- Step 3: git commit ----------
Step "[3/5] Local commit..."
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm"
git commit -m "auto-update $timestamp" 2>&1 | Out-Null
if ($LASTEXITCODE -ne 0) {
    Info "Nothing new to commit (may already be committed)"
} else {
    OK "Committed - $timestamp"
}

# ---------- Step 4: git pull (team safety) ----------
Step "[4/5] Pulling remote latest..."
$pullOutput = git pull --rebase origin $branch 2>&1
if ($LASTEXITCODE -ne 0) {
    Fail "Pull failed! Possible conflict. Please resolve manually."
    Write-Host $pullOutput -ForegroundColor Red
    Write-Host ""
    Read-Host "Press Enter to exit"
    exit 1
}
if ($pullOutput -match "up to date") {
    OK "Remote is already up to date"
} else {
    OK "Remote updates merged"
}

# ---------- Step 5: git push ----------
Step "[5/5] Pushing to GitHub..."
$pushOutput = git push origin $branch 2>&1
if ($LASTEXITCODE -ne 0) {
    Fail "Push failed! Possible causes:"
    Write-Host $pushOutput -ForegroundColor Red
    Write-Host ""
    Write-Host "   [Auth Error?] Set up credentials:" -ForegroundColor Yellow
    Write-Host "     1. Generate a PAT: https://github.com/settings/tokens" -ForegroundColor Gray
    Write-Host "     2. Run: git config credential.helper store" -ForegroundColor Gray
    Write-Host "     3. Push once manually (git push), enter username + PAT" -ForegroundColor Gray
    Write-Host ""
    Read-Host "Press Enter to exit"
    exit 1
}

# ---------- Success ----------
Write-Host ""
Write-Host "+==================================================+" -ForegroundColor Green
Write-Host "|                                                  |" -ForegroundColor Green
Write-Host "|   [OK]  Sync completed!                          |" -ForegroundColor White
Write-Host "|                                                  |" -ForegroundColor Green
Write-Host "|   Repo:   $displayUrl" -ForegroundColor DarkCyan
Write-Host "|   Branch: $branch" -ForegroundColor DarkCyan
Write-Host "|   Author: $userName" -ForegroundColor Gray
Write-Host "|   Time:   $timestamp" -ForegroundColor Gray
Write-Host "|                                                  |" -ForegroundColor Green
Write-Host "+==================================================+" -ForegroundColor Green
Write-Host ""

Start-Sleep -Seconds 2