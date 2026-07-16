# ============================================================
#  Mathematical Modeling Materials - Sync to GitHub
#  Mathematical_Modeling_BUPT
# ============================================================

$repoPath = "D:\ppt\大学\数学建模"
$repoUrl  = "https://github.com/LinList/Mathematical_Modeling_BUPT"

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
Write-Host "|  [Math Modeling]  Sync to GitHub                 |" -ForegroundColor White
Write-Host "|  Repository: Mathematical_Modeling_BUPT          |" -ForegroundColor DarkCyan
Write-Host "|                                                  |" -ForegroundColor Cyan
Write-Host "+==================================================+" -ForegroundColor Cyan
Write-Host ""

# ---------- Switch to repo ----------
Set-Location -LiteralPath $repoPath

# ---------- Step 1: Check changes ----------
Step "[1/5] Scanning local changes..."
$status = git status --short 2>&1
if ($LASTEXITCODE -ne 0) {
    Fail "git status failed. Please check repo state."
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
    Fail "git add failed. Please check file permissions."
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
$pullOutput = git pull --rebase origin main 2>&1
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
$pushOutput = git push origin main 2>&1
if ($LASTEXITCODE -ne 0) {
    Fail "Push failed! Please check your network."
    Write-Host $pushOutput -ForegroundColor Red
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
Write-Host "|   Repo:  $repoUrl" -ForegroundColor DarkCyan
Write-Host "|   Time:  $timestamp" -ForegroundColor Gray
Write-Host "|                                                  |" -ForegroundColor Green
Write-Host "+==================================================+" -ForegroundColor Green
Write-Host ""

Start-Sleep -Seconds 2