# Whisper AI Case Workspace Downloads

This repository contains signed Windows installers and update manifests for the
Whisper AI Case Workspace. It does **not** contain application source code,
audio, transcripts, case metadata, or evidence packages.

## Install on a colleague's laptop

This is a private-team distribution that uses a self-signed publisher
certificate. The one-file setup program verifies and trusts that exact
certificate, then opens Windows App Installer.

1. Open the [latest release](../../releases/latest).
2. Download and double-click `WhisperAI-Setup.exe`.
3. If Windows SmartScreen appears, choose **More info**, then **Run anyway**.
4. Approve the administrator prompt and complete the Windows App Installer dialog.

The setup program verifies the exact expected certificate fingerprint before
trusting it. The private signing key is never included in this repository or an
installer. Because this free internal certificate is not publicly trusted, the
first laptop installation can still show an **Unknown publisher** warning.

The certificate, AppInstaller file, and PowerShell script remain available in
the release as a manual fallback for IT staff.

## Updates

The installed application checks this repository's latest release when it
starts. Windows offers new signed versions without requiring Python, FFmpeg, or
GitHub to be installed on the laptop.

## Security boundary

Only install files published by this repository. The expected publisher is
`CN=Whisper AI Internal Distribution`. This free internal certificate is not a
publicly trusted commercial identity; it is appropriate only for colleagues who
have received and trusted the certificate through the installation procedure.
