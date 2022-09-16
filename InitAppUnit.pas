unit InitAppUnit;

interface

uses
  SysUtils;

const
  PgmName = 'APS';
  PgmIni = PgmName + '.INI';
  DtaDirLoc = 'PublicDocs'; // ['MyDocs', 'PublicDocs', 'AppDataRoaming', 'AppDataLocal', 'AppDataCommon']

  procedure InitDtaDir;

var
  DtaDir: String;

implementation

uses
  JclAnsiStrings, System.IOUtils, JclSysInfo;

procedure InitDtaDir;
begin
  {
  InfoMemo.Lines.Append('%MYDOCUMENTS%' + ' : ' + TPath.GetDocumentsPath);       // C:\Users\user\Documents       MyDocs
  InfoMemo.Lines.Append('%COMMONDOCUMENTS%' + ' : ' + GetCommonDocumentsFolder); // C:\Users\Public\Documents     PublicDocs
  InfoMemo.Lines.Append('%APPDATAROOT%' + ' : ' + GetAppdataFolder);             // C:\Users\user\AppData\Roaming AppDataRoaming
  InfoMemo.Lines.Append('%LOCALAPPDATAROOT%' + ' : ' + GetLocalAppData);         // C:\Users\user\AppData\Local   AppDataLocal
  InfoMemo.Lines.Append('%COMMONAPPDATAROOT%' + ' : ' + GetCommonAppdataFolder); // C:\ProgramData                AppDataCommon
}
  case StrIndex(DtaDirLoc, ['MyDocs', 'PublicDocs', 'AppDataRoaming', 'AppDataLocal', 'AppDataCommon']) of
    0:
      begin
        // DeployMaster - %MYDOCUMENTS%       C:\Users\user\Documents
        DtaDir := TPath.GetDocumentsPath + '\MWB\' + PgmName + '\';
        ForceDirectories(DtaDir);
      end;
    1:
      begin
        // DeployMaster - %COMMONDOCUMENTS%   C:\Users\Public\Documents
        DtaDir := GetCommonDocumentsFolder + '\MWB\' + PgmName + '\';
        ForceDirectories(DtaDir);
      end;
    2:
      begin
        // DeployMaster - %APPDATAROOT%       C:\Users\user\AppData\Roaming
        DtaDir := GetAppdataFolder + '\MWB\' + PgmName + '\';
        ForceDirectories(DtaDir);
      end;
    3:
      begin
        // DeployMaster - %LOCALAPPDATAROOT%  C:\Users\user\AppData\Local
        DtaDir := GetLocalAppData + '\MWB\' + PgmName + '\';
        ForceDirectories(DtaDir);
      end;
    4:
      begin
        // DeployMaster - %COMMONAPPDATAROOT% C:\ProgramData
        DtaDir := GetCommonAppdataFolder + '\MWB\' + PgmName + '\';
        ForceDirectories(DtaDir);
      end;
  end;
end;

end.
