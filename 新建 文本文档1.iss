; ; 无数字签名，自带EXE文件版本信息（属性-详细信息）
#pragma parseroption -p

#define MyAppName "PCL2"
#define MyAppVersion "2.13.0.1"
#define MyAppPublisher "龙腾猫跃"
#define MyAppURL "https://pcl.ruanmao.net/"
#define MyAppExeName "Plain Craft Launcher 2.exe"

[Setup]
AppId={{B0D122F4-6B40-4D9B-8837-F21D712679A9}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={autopf}\{#MyAppName}
UninstallDisplayIcon={app}\{#MyAppExeName}
DisableProgramGroupPage=yes

LicenseFile=miaoda-code.TXT
InfoBeforeFile=miaoda-code (1).TXT
InfoAfterFile=miaoda-code (2).TXT

PrivilegesRequiredOverridesAllowed=dialog
OutputDir=D:\Inno输出
OutputBaseFilename=PCL2_Setup_2.13.0.1
; SetupIconFile 已移除
SolidCompression=yes
WizardStyle=modern

; ========== EXE 文件详细信息（重点！控制属性面板内容）==========
VersionInfoCompany={#MyAppPublisher}
VersionInfoProductName={#MyAppName}
VersionInfoCopyright="Copyright (C) 龙腾猫跃"
VersionInfoDescription="Plain Craft Launcher 安装程序"
VersionInfoOriginalFileName="PCL2_Setup_2.13.0.1.exe"
; =================================================================

[Languages]
Name: "chinesesimp"; MessagesFile: "ChineseSimplified.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "E:\PCL2\Plain Craft Launcher 2.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "E:\PCL2\PCL\*"; DestDir: "{app}"; Flags: ignoreversion
Source: "E:\PCL2\.minecraft\*"; DestDir: "{app}"; Flags: ignoreversion
Source: "E:\新建文件夹\README.md"; DestDir: "{app}"; Flags: ignoreversion
Source: "E:\新建文件夹\README"; DestDir: "{app}"; Flags: ignoreversion
Source: "E:\新建文件夹\LICENCE"; DestDir: "{app}"; Flags: ignoreversion
Source: "E:\新建文件夹\license.rtf"; DestDir: "{app}"; Flags: ignoreversion
Source: "E:\新建文件夹\右键添加管理员.reg"; DestDir: "{app}"; Flags: ignoreversion
Source: "E:\新建文件夹\pcl2_admin.reg"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{autoprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

[UninstallRun]
Filename: "taskkill.exe"; Parameters: "/f /im ""{#MyAppExeName}"""; Flags: runhidden waituntilterminated skipifdoesntexist

[UninstallDelete]
Type: files; Name: "{app}\Plain Craft Launcher 2.exe"
Type: files; Name: "{app}\README"
Type: files; Name: "{app}\README.md"
Type: files; Name: "{app}\Setup.ini"
Type: files; Name: "{app}\unins000.dat"
Type: files; Name: "{app}\unins000.exe"
Type: files; Name: "{app}\右键添加管理员.reg"
Type: filesandordirs; Name: "{app}\.minecraft"
Type: filesandordirs; Name: "{app}\PCL"
Type: files; Name: "{app}\JavaWrapper.jar"
Type: files; Name: "{app}\LatestLaunch.bat"
Type: files; Name: "{app}\launcher_profiles.json"
Type: files; Name: "{app}\libjlw-x86_64-1.4.4.dll"
Type: files; Name: "{app}\libwebp.dll"
Type: files; Name: "{app}\LICENCE"
Type: files; Name: "{app}\license.rtf"
Type: files; Name: "{app}\Log1.txt"
Type: files; Name: "{app}\Log2.txt"
Type: files; Name: "{app}\Log3.txt"
Type: files; Name: "{app}\Log4.txt"
Type: files; Name: "{app}\Log5.txt"
Type: files; Name: "{app}\PCL.ini"
Type: files; Name: "{app}\pcl2_admin.reg"

