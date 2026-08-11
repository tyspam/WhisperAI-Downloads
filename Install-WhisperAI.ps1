[CmdletBinding()]
param()

$ErrorActionPreference = "Stop"
$expectedThumbprint = "FEE74A7A291A3667C65FE2AFC42A1935B6C7B038"
$base = "https://github.com/tyspam/WhisperAI-Downloads/releases/latest/download"
$work = Join-Path $env:TEMP "WhisperAI-Install"
$certificate = Join-Path $work "WhisperAI-Publisher.cer"
$appInstaller = Join-Path $work "WhisperAI.appinstaller"

$identity = [Security.Principal.WindowsIdentity]::GetCurrent()
$principal = [Security.Principal.WindowsPrincipal]::new($identity)
if (-not $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    throw "Open Windows PowerShell with Run as administrator, then run this script again."
}

New-Item -ItemType Directory -Force -Path $work | Out-Null
Invoke-WebRequest "$base/WhisperAI-Publisher.cer" -OutFile $certificate
Invoke-WebRequest "$base/WhisperAI.appinstaller" -OutFile $appInstaller

$actual = (Get-PfxCertificate -FilePath $certificate).Thumbprint
if ($actual -ne $expectedThumbprint) {
    throw "Publisher certificate fingerprint mismatch. Nothing was installed."
}

Import-Certificate -FilePath $certificate -CertStoreLocation Cert:\LocalMachine\TrustedPeople | Out-Null
Start-Process -FilePath $appInstaller
Write-Host "Publisher trusted. Complete installation in the Windows App Installer window."

