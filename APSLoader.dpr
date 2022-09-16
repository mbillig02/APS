program APSLoader;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils, InitAppUnit, IniFiles, ShellApi, Windows, Vcl.Forms;

var
  StartElevated: Boolean;
  ExeDir, AppExePath: String;

procedure LoadStartElevatedSetting;
var
  RegIniFile: TIniFile;
begin
  RegIniFile := TIniFile.Create(DtaDir + PgmIni);
  try
    StartElevated := RegIniFile.ReadBool('Section-Elevated', 'StartElevated', False);
  finally
    RegIniFile.Free;
  end;
end;

begin
  try
    { DONE -oUser -cConsole Main : Insert code here }
    InitDtaDir;
    LoadStartElevatedSetting;
    ExeDir := ExtractFilePath(Application.ExeName);
    AppExePath := ExeDir + PgmName + '.exe';
    if FileExists(AppExePath) then
    begin
      if StartElevated then
      begin
        ShellExecute(0, 'runas', PChar(AppExePath), nil, nil, SW_SHOWNORMAL);
      end
      else
      begin
        ShellExecute(0, 'open', PChar(AppExePath), nil, nil, SW_SHOWNORMAL);
      end;
    end;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
