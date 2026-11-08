#define MyAppName "PCL2"
#define MyAppVersion "2.13.0.1"
#define MyAppPublisher "龙腾猫跃"
#define MyAppURL "https://pcl.ruanmao.net/"
#define MyAppExeName "Plain Craft Launcher 2.exe"

[Setup]
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={sd}\PCL2
UninstallDisplayIcon={app}\{#MyAppExeName}
DisableProgramGroupPage=yes
UsePreviousAppDir=no
PrivilegesRequired=lowest
OutputDir=E:\新建文件夹
OutputBaseFilename=PCL2_Setup
Compression=lzma
SolidCompression=yes
WizardStyle=modern

[Languages]
Name: "chinesesimp"; MessagesFile: "compiler:Languages\ChineseSimplified.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "D:\E盘\PCL2\Plain Craft Launcher 2.exe"; DestDir: "{app}"; Flags: ignoreversion
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
Type: filesandordirs; Name: "{localappdata}\PCL2"
Type: filesandordirs; Name: "{userappdata}\.pcl2"

[Code]
function MessageBoxW(hWnd: Integer; lpText, lpCaption: WideString; uType: Cardinal): Integer;
external 'MessageBoxW@user32.dll stdcall';

function NextButtonClick(CurPageID: Integer): Boolean;
var
  SelPath: string;
begin
  Result := True;
  if CurPageID = wpSelectDir then
  begin
    SelPath := LowerCase(WizardDirValue);
    if Copy(SelPath, 1, 2) = 'c:' then
    begin
      MessageBoxW(0, '禁止安装到C盘！请选择D盘、E盘等其他磁盘', '提示', 16);
      Result := False;
    end;
  end;
end;

function BeforeUninstall(): Boolean;
var
  r: Integer;
begin
  Result := True;
  r := MessageBoxW(0, '⚠️ 警告：卸载将删除PCL2所有缓存、游戏存档与配置文件！'#13#10'请先自行备份重要存档，确认继续卸载吗？', '卸载确认', 4 + 32);
  if r <> 6 then
    Result := False;
end;
