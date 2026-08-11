#define MyAppName "Whisper AI Case Workspace"
#define MyAppVersion GetEnv("WHISPERAI_VERSION")
#define MyAppPublisher "Whisper AI Internal Distribution"

[Setup]
AppId={{D898454D-B708-42E7-BFA2-37FC15DA7E8C}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
DefaultDirName={autopf}\Whisper AI Installer
DisableDirPage=yes
DisableProgramGroupPage=yes
DisableReadyPage=yes
DisableFinishedPage=no
OutputDir={#SourcePath}\..\dist
OutputBaseFilename=WhisperAI-Complete-Setup
Compression=lzma2/max
SolidCompression=yes
PrivilegesRequired=admin
ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible
Uninstallable=no
WizardStyle=modern

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
Source: "{#SourcePath}\..\WhisperAI-Publisher.cer"; DestDir: "{tmp}\WhisperAI-Setup"; Flags: ignoreversion deleteafterinstall
Source: "{#SourcePath}\..\WhisperAI.appinstaller"; DestDir: "{tmp}\WhisperAI-Setup"; Flags: ignoreversion deleteafterinstall
Source: "{#SourcePath}\Install-WhisperAI.ps1"; DestDir: "{tmp}\WhisperAI-Setup"; Flags: ignoreversion deleteafterinstall

[Run]
Filename: "{sys}\WindowsPowerShell\v1.0\powershell.exe"; Parameters: "-NoProfile -ExecutionPolicy Bypass -File ""{tmp}\WhisperAI-Setup\Install-WhisperAI.ps1"" -CertificatePath ""{tmp}\WhisperAI-Setup\WhisperAI-Publisher.cer"" -AppInstallerPath ""{tmp}\WhisperAI-Setup\WhisperAI.appinstaller"""; StatusMsg: "Trusting the publisher and opening Windows App Installer..."; Flags: waituntilterminated
