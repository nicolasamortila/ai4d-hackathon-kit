# Installe les prérequis du Hackathon Champions (Windows 10/11) : Git, Node.js 22, Claude Code, uv, Spec Kit.
# Sans droits administrateur : tout s'installe dans le profil utilisateur. Relançable sans risque.
#
#   Dans PowerShell (pas besoin de l'ouvrir en administrateur) :
#   irm https://raw.githubusercontent.com/zenika-dev/ai4d-hackathon-kit/main/installation/installer-prerequis.ps1 | iex
#
# Vérification seule :  $env:VERIFIER_SEULEMENT = "1"; puis la même commande
# Version de Spec Kit : $env:SPEC_KIT_REF = "<tag>"; puis la même commande (défaut : main)

$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$SpecKitRef = if ($env:SPEC_KIT_REF) { $env:SPEC_KIT_REF } else { 'main' }
$NodeMajor  = 22
$Programs   = Join-Path $env:LOCALAPPDATA 'Programs'
$NodeDir    = Join-Path $Programs 'nodejs'
$GitDir     = Join-Path $Programs 'PortableGit'
$LocalBin   = Join-Path $env:USERPROFILE '.local\bin'
$CheckOnly  = $env:VERIFIER_SEULEMENT -eq '1'

function Etape($t) { Write-Host "`n> $t" -ForegroundColor White }
function Ok($t)    { Write-Host $t -ForegroundColor Green }
function Ko($t)    { Write-Host $t -ForegroundColor Red }

# Recharge le PATH de la session depuis le registre (utilisateur + machine).
function Update-SessionPath {
  $m = [Environment]::GetEnvironmentVariable('Path', 'Machine')
  $u = [Environment]::GetEnvironmentVariable('Path', 'User')
  $env:Path = (@($u, $m, $LocalBin) | Where-Object { $_ }) -join ';'
}

# Ajoute un dossier au PATH utilisateur, une seule fois.
function Add-UserPath($dir) {
  $u = [Environment]::GetEnvironmentVariable('Path', 'User')
  $parts = @($u -split ';' | Where-Object { $_ })
  if ($parts -notcontains $dir) {
    [Environment]::SetEnvironmentVariable('Path', (@($dir) + $parts) -join ';', 'User')
  }
  Update-SessionPath
}

function Test-Cmd($name) { [bool](Get-Command $name -ErrorAction SilentlyContinue) }

function Test-Node {
  if (-not (Test-Cmd node)) { return $false }
  # Pas de redirection 2> sur les commandes natives : sous PowerShell 5.1 avec 'Stop', elle rend l'erreur bloquante.
  try { return ([int](node -p "process.versions.node.split('.')[0]") -ge 20) } catch { return $false }
}

# Claude Code a besoin de Git Bash sous Windows : on lui indique où il est.
function Set-GitBashPath {
  $git = (Get-Command git -ErrorAction SilentlyContinue).Source
  if (-not $git) { return }
  $root = Split-Path (Split-Path $git -Parent) -Parent
  $bash = Join-Path $root 'bin\bash.exe'
  if (Test-Path $bash) {
    [Environment]::SetEnvironmentVariable('CLAUDE_CODE_GIT_BASH_PATH', $bash, 'User')
    $env:CLAUDE_CODE_GIT_BASH_PATH = $bash
  }
}

function Install-Git {
  Etape 'Git'
  if (Test-Cmd git) { Ok "deja installe : $(git --version)"; Set-GitBashPath; return }
  $rel = Invoke-RestMethod 'https://api.github.com/repos/git-for-windows/git/releases/latest' -Headers @{ 'User-Agent' = 'hackathon-champions' } -UseBasicParsing
  $arch = if ($env:PROCESSOR_ARCHITECTURE -eq 'ARM64') { 'arm64' } else { '64-bit' }
  $asset = $rel.assets | Where-Object { $_.name -match "^PortableGit-.*-$arch\.7z\.exe$" } | Select-Object -First 1
  if (-not $asset) { throw "PortableGit introuvable dans la derniere version de Git for Windows" }
  $exe = Join-Path $env:TEMP $asset.name
  Write-Host "telechargement de $($asset.name)..."
  Invoke-WebRequest $asset.browser_download_url -OutFile $exe -UseBasicParsing
  if (Test-Path $GitDir) { Remove-Item $GitDir -Recurse -Force }
  Start-Process -FilePath $exe -ArgumentList "-y", "-o`"$GitDir`"" -Wait -NoNewWindow
  Remove-Item $exe -Force
  Add-UserPath (Join-Path $GitDir 'cmd')
  Set-GitBashPath
  Ok "installe : $(git --version)"
}

function Install-Node {
  Etape "Node.js $NodeMajor"
  if (Test-Node) { Ok "deja installe : node $(node --version)"; return }
  $arch = if ($env:PROCESSOR_ARCHITECTURE -eq 'ARM64') { 'arm64' } else { 'x64' }
  $base = "https://nodejs.org/dist/latest-v$NodeMajor.x"
  $sumsFile = Join-Path $env:TEMP 'node-SHASUMS256.txt'
  Invoke-WebRequest "$base/SHASUMS256.txt" -OutFile $sumsFile -UseBasicParsing
  $sums = Get-Content $sumsFile
  Remove-Item $sumsFile -Force
  $line = $sums | Where-Object { $_ -match "node-v[\d.]+-win-$arch\.zip$" } | Select-Object -First 1
  if (-not $line) { throw "archive Node introuvable pour win-$arch" }
  $hash, $file = ($line.Trim() -split '\s+')
  $zip = Join-Path $env:TEMP $file
  Write-Host "telechargement de $file..."
  Invoke-WebRequest "$base/$file" -OutFile $zip -UseBasicParsing
  if ((Get-FileHash $zip -Algorithm SHA256).Hash.ToLower() -ne $hash.ToLower()) { throw "empreinte invalide pour $file, installation annulee" }
  if (Test-Path $NodeDir) { Remove-Item $NodeDir -Recurse -Force }
  $tmp = Join-Path $env:TEMP 'node-extract'
  if (Test-Path $tmp) { Remove-Item $tmp -Recurse -Force }
  Expand-Archive $zip -DestinationPath $tmp
  Move-Item (Get-ChildItem $tmp | Select-Object -First 1).FullName $NodeDir
  Remove-Item $zip, $tmp -Recurse -Force
  Add-UserPath $NodeDir
  Ok "installe : node $(node --version)"
}

# Les installeurs officiels sont lancés dans un PowerShell séparé pour ne pas interrompre ce script.
function Invoke-Installer($url) {
  powershell -NoProfile -ExecutionPolicy Bypass -Command "irm $url | iex"
  Update-SessionPath
}

function Install-Claude {
  Etape 'Claude Code'
  if (Test-Cmd claude) { Ok "deja installe : $(claude --version)"; return }
  Invoke-Installer 'https://claude.ai/install.ps1'
  Add-UserPath $LocalBin
}

function Install-Uv {
  Etape 'uv'
  if (Test-Cmd uv) { Ok "deja installe : $(uv --version)"; return }
  $env:UV_NO_MODIFY_PATH = '1'
  Invoke-Installer 'https://astral.sh/uv/install.ps1'
  Add-UserPath $LocalBin
}

function Install-SpecKit {
  Etape "Spec Kit (specify, version $SpecKitRef)"
  if (-not (Test-Cmd uv)) { Ko 'uv manquant, Spec Kit ne peut pas etre installe'; return }
  uv tool install --force --quiet specify-cli --from "git+https://github.com/github/spec-kit.git@$SpecKitRef"
  Ok 'installe'
}

function Show-Bilan {
  Etape 'Bilan'
  $ko = $false
  foreach ($t in 'git', 'node', 'claude', 'uv', 'specify') {
    if (-not (Test-Cmd $t)) { Ko ("x {0,-8} absent" -f $t); $ko = $true; continue }
    $v = switch ($t) { 'specify' { 'ok' } default { (& $t --version | Select-Object -First 1) } }
    if ($t -eq 'node' -and -not (Test-Node)) { Ko "x node     version trop ancienne ($v), 20+ requis"; $ko = $true; continue }
    Ok ("v {0,-8} {1}" -f $t, $v)
  }
  if ($env:CLAUDE_CODE_GIT_BASH_PATH) { Ok "v git bash $env:CLAUDE_CODE_GIT_BASH_PATH" }
  Write-Host ''
  if ($ko) { Ko 'Il manque quelque chose. Copiez ce bilan et envoyez-le au support du hackathon.' }
  else     { Ok 'Tout est pret. Fermez PowerShell, ouvrez-en un NOUVEAU, puis suivez la fiche de demarrage.' }
}

New-Item -ItemType Directory -Force -Path $Programs, $LocalBin | Out-Null
Update-SessionPath
if (-not $CheckOnly) {
  $steps = @(
    @{ Name = 'Git';         Run = { Install-Git } },
    @{ Name = 'Node.js';     Run = { Install-Node } },
    @{ Name = 'Claude Code'; Run = { Install-Claude } },
    @{ Name = 'uv';          Run = { Install-Uv } },
    @{ Name = 'Spec Kit';    Run = { Install-SpecKit } }
  )
  foreach ($s in $steps) {
    try { & $s.Run } catch { Ko "echec de l'installation de $($s.Name) : $($_.Exception.Message)" }
  }
}
Show-Bilan
