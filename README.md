# Whisper AI Case Workspace Downloads

This repository contains signed Windows installers and update manifests for the
Whisper AI Case Workspace. It does **not** contain application source code,
audio, transcripts, case metadata, or evidence packages.

## Install on a colleague's laptop

This is a private-team distribution that uses a self-signed publisher
certificate. Windows must trust that public certificate once before it will
install or update the application.

1. Open the [latest release](../../releases/latest).
2. Download `WhisperAI-Publisher.cer` and `Install-WhisperAI.ps1` into the same folder.
3. Right-click **Windows PowerShell**, choose **Run as administrator**, and run:

   ```powershell
   powershell -ExecutionPolicy Bypass -File .\Install-WhisperAI.ps1
   ```

4. Approve the Windows installation dialog.

The script verifies the exact expected certificate fingerprint before trusting
it. The private signing key is never included in this repository or an installer.

## Updates

The installed application checks this repository's latest release when it
starts. Windows offers new signed versions without requiring Python, FFmpeg, or
GitHub to be installed on the laptop.

## Security boundary

Only install files published by this repository. The expected publisher is
`CN=Whisper AI Internal Distribution`. This free internal certificate is not a
publicly trusted commercial identity; it is appropriate only for colleagues who
have received and trusted the certificate through the installation procedure.

