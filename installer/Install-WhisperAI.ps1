[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)][string]$CertificatePath,
    [Parameter(Mandatory = $true)][string]$AppInstallerPath
)

$ErrorActionPreference = "Stop"
$expectedThumbprint = "FEE74A7A291A3667C65FE2AFC42A1935B6C7B038"

$identity = [Security.Principal.WindowsIdentity]::GetCurrent()
$principal = [Security.Principal.WindowsPrincipal]::new($identity)
if (-not $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    throw "Administrator approval is required to trust the Whisper AI publisher."
}

if (-not (Test-Path -LiteralPath $CertificatePath -PathType Leaf)) {
    throw "The bundled publisher certificate is missing."
}
if (-not (Test-Path -LiteralPath $AppInstallerPath -PathType Leaf)) {
    throw "The bundled application installer is missing."
}

$actualThumbprint = (Get-PfxCertificate -FilePath $CertificatePath).Thumbprint
if ($actualThumbprint -ne $expectedThumbprint) {
    throw "Publisher certificate fingerprint mismatch. Nothing was installed."
}

Import-Certificate -FilePath $CertificatePath `
    -CertStoreLocation Cert:\LocalMachine\TrustedPeople | Out-Null

Start-Process -FilePath $AppInstallerPath

