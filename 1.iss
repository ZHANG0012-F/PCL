#pragma parseroption -p
; PCL2打包脚本
#define AppName "PCL2 我的世界启动器"
#define AppVer "2.9.7"
#define AppPublisher "龙腾猫跃"

[Setup]
AppId={{8F2E7D45-1A9C-42F0-B6D3-9E7C1F8A3B2D}}
AppName={#AppName}
AppVersion={#AppVer}
AppPublisher={#AppPublisher}
DefaultDirName=D:\Program Files\MC
DirExistsWarning=auto
DefaultGroupName=PCL2 启动器
OutputDir=.\输出安装包
OutputBaseFilename=PCL2_Setup_{#AppVer}
Compression=lzma2
SolidCompression=yes

UninstallDisplayName={#AppName} V{#AppVer}
UninstallDisplayIcon={app}\Plain Craft Launcher 2.exe

; D:\Program Files\license.txt不存在就删除此行
LicenseFile="D:\Program Files\license.txt"

[Manifest]
RequestExecutionLevel=highest

[Files]
Source: "Plain Craft Launcher 2.exe"; DestDir: "{app}"

Source: ".\a.txt"; DestDir: "D:\Program Files"; Flags: ignoreversion

Source: "3.ico"; DestDir: "{app}"; Flags: ignoreversion
Source: "2.ico"; DestDir: "{app}"; Flags: ignoreversion
Source: "1.ico"; DestDir: "{app}"; Flags: ignoreversion
Source: "13.ico"; DestDir: "{app}"; Flags: ignoreversion
Source: "12.ico"; DestDir: "{app}"; Flags: ignoreversion
Source: "11.ico"; DestDir: "{app}"; Flags: ignoreversion
Source: "10.ico"; DestDir: "{app}"; Flags: ignoreversion
Source: "9.ico"; DestDir: "{app}"; Flags: ignoreversion
Source: "8.ico"; DestDir: "{app}"; Flags: ignoreversion
Source: "7.ico"; DestDir: "{app}"; Flags: ignoreversion
Source: "6.ico"; DestDir: "{app}"; Flags: ignoreversion
Source: "5.ico"; DestDir: "{app}"; Flags: ignoreversion
Source: "4"; DestDir: "{app}"; Flags: ignoreversion
[Icons]
Name: "{group}\启动 PCL2"; Filename: "{app}\Plain Craft Launcher 2.exe"
Name: "{group}\卸载 PCL2"; Filename: "{uninstallexe}"
Name: "{commondesktop}\PCL2"; Filename: "{app}\Plain Craft Launcher 2.exe"; Tasks: desktopicon

[Tasks]
Name: desktopicon; Description: "创建桌面快捷方式【PCL2】"; GroupDescription: "附加快捷方式："

[Run]
Filename: "cmd.exe"; Parameters: "/c if exist ""D:\Program Files\a.txt"" del /f /q ""D:\Program Files\a.txt"""; Flags: postinstall runhidden waituntilterminated
Filename: "{app}\Plain Craft Launcher 2.exe"; Flags: nowait postinstall skipifsilent

[UninstallRun]
Filename: "taskkill"; Parameters: "/f /im ""Plain Craft Launcher 2.exe"""; Flags: runhidden waituntilterminated skipifdoesntexist

[UninstallDelete]
Type: filesandordirs; Name: "{localappdata}\PCL2"
Type: filesandordirs; Name: "{userappdata}\.pcl2"