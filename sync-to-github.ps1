# ============================================================
#  数学建模资料 — 一键同步到 GitHub
#  Mathematical_Modeling_BUPT
# ============================================================

$repoPath = "D:\ppt\大学\数学建模"
$repoUrl  = "https://github.com/LinList/Mathematical_Modeling_BUPT"

# ---------- 颜色输出 ----------
function Write-Step  ($msg) { Write-Host $msg -ForegroundColor Cyan }
function Write-OK    ($msg) { Write-Host "   $msg" -ForegroundColor Green }
function Write-Info  ($msg) { Write-Host "   $msg" -ForegroundColor Yellow }
function Write-Error ($msg) { Write-Host "   $msg" -ForegroundColor Red }

# ---------- 标题 ----------
Clear-Host
Write-Host ""
Write-Host "╔════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║                                                ║" -ForegroundColor Cyan
Write-Host "║     数学建模资料 — 同步到 GitHub               ║" -ForegroundColor White
Write-Host "║     Mathematical_Modeling_BUPT                 ║" -ForegroundColor DarkCyan
Write-Host "║                                                ║" -ForegroundColor Cyan
Write-Host "╚════════════════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""

# ---------- 切换到仓库目录 ----------
Set-Location -LiteralPath $repoPath

# ---------- Step 1: 检查变更 ----------
Write-Step "[1/5] 扫描本地变更..."
$status = git status --short 2>&1
if ($LASTEXITCODE -ne 0) {
    Write-Error "git status 执行失败，请检查仓库状态。"
    Write-Host ""
    Read-Host "按 Enter 退出"
    exit 1
}

if (-not $status) {
    Write-Info "没有检测到任何变更，无需同步。"
    Write-Host ""
    Read-Host "按 Enter 退出"
    exit 0
}

# 显示变更文件列表
$status | ForEach-Object { Write-Host "   $_" -ForegroundColor DarkGray }
Write-Host ""

# ---------- Step 2: git add ----------
Write-Step "[2/5] 添加文件到暂存区..."
git add . 2>&1 | Out-Null
if ($LASTEXITCODE -ne 0) {
    Write-Error "git add 失败，请检查文件权限。"
    Write-Host ""
    Read-Host "按 Enter 退出"
    exit 1
}
Write-OK "已添加所有变更"

# ---------- Step 3: git commit ----------
Write-Step "[3/5] 本地提交..."
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm"
git commit -m "auto-update $timestamp" 2>&1 | Out-Null
if ($LASTEXITCODE -ne 0) {
    Write-Info "没有新内容需要提交（可能已在之前提交过）"
} else {
    Write-OK "已提交 — $timestamp"
}

# ---------- Step 4: git pull (团队安全) ----------
Write-Step "[4/5] 拉取远程最新内容..."
$pullOutput = git pull --rebase origin main 2>&1
if ($LASTEXITCODE -ne 0) {
    Write-Error "拉取失败！可能是远程有冲突，请手动处理。"
    Write-Host $pullOutput -ForegroundColor Red
    Write-Host ""
    Read-Host "按 Enter 退出"
    exit 1
}
if ($pullOutput -match "up to date") {
    Write-OK "远程已是最新，无需合并"
} else {
    Write-OK "已拉取并合并远程更新"
}

# ---------- Step 5: git push ----------
Write-Step "[5/5] 推送到 GitHub..."
$pushOutput = git push origin main 2>&1
if ($LASTEXITCODE -ne 0) {
    Write-Error "推送失败！请检查网络连接。"
    Write-Host $pushOutput -ForegroundColor Red
    Write-Host ""
    Read-Host "按 Enter 退出"
    exit 1
}

# ---------- 成功 ----------
Write-Host ""
Write-Host "╔════════════════════════════════════════════════╗" -ForegroundColor Green
Write-Host "║                                                ║" -ForegroundColor Green
Write-Host "║    ✓  同步完成！                                ║" -ForegroundColor White
Write-Host "║                                                ║" -ForegroundColor Green
Write-Host "║    仓库: $repoUrl" -ForegroundColor DarkCyan
Write-Host "║    时间: $timestamp" -ForegroundColor Gray
Write-Host "║                                                ║" -ForegroundColor Green
Write-Host "╚════════════════════════════════════════════════╝" -ForegroundColor Green
Write-Host ""

Start-Sleep -Seconds 2
