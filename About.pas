unit About;

interface

{
Fade In / Out an About Box or any Modal Delphi Form
http://delphi.about.com/od/formsdialogs/a/fadeinmodalform.htm
~Zarko Gajic
}

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, pngimage, OverbyteIcsWndControl, OverbyteIcsFtpCli,
  JvExStdCtrls, JvButton, JvCtrls, ImgList, JvComponentBase, JvBalloonHint,
  System.ImageList, System.UITypes, AboutSftpUnit, SftpGetUnit;

type
  TFadeType = (ftIn, ftOut);
  TAboutBox = class(TForm)
    Panel: TPanel;
    ProgramIcon: TImage;
    Version: TLabel;
    fadeTimer: TTimer;
    ProgramLabel: TLabel;
    VersionLbl: TLabel;
    ProgrammerLbl: TLabel;
    EmailLbl: TLabel;
    CompilerLbl: TLabel;
    PgmUpdBtn: TButton;
    OKBtn: TButton;
    FtpClient: TFtpClient;
    PgmUpdDirJvImgBtn: TJvImgBtn;
    ImageList: TImageList;
    JvBalloonHint: TJvBalloonHint;
    TestSetVersionToZeroBtn: TButton;
    InstallBtn: TButton;
    ProtocolRadioGroup: TRadioGroup;
    procedure fadeTimerTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure PgmUpdDirJvImgBtnMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure JvBalloonHintClose(Sender: TObject);
    procedure TestSetVersionToZeroBtnClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure PgmUpdBtnMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure InstallBtnClick(Sender: TObject);
    procedure ProtocolRadioGroupClick(Sender: TObject);
  private

    fFadeType: TFadeType;
    function CheckForPgmUpdate(HostDirName, HostName, UserName, PassWord,
      PgmVersionStr, RegexStr: String): String;
    procedure DownloadPgmUpdate;
    procedure OpenDirectory(DirectoryName: String);
    procedure WriteIniFile(IniFileName: String);
    procedure InitAboutBox;
    property FadeType: TFadeType read fFadeType write fFadeType;
  public
    class function Execute(): TModalResult;
  end;

var
  FAboutInitialized, lclInstalled: Boolean;
  LclPgmUpdDir, LclTmpDir, LclVerStr, lclExeDir, LclDtaDir, lclKeyDir: String;
  CFPUHostName, CFPUUserName, CFPUPassWord, CFPUAppName: String;
  CFPUProtocol: Integer;

implementation

uses UtlUnit, PerlRegEx, ShellApi, ClipBrd, IniFiles, MFUnit, Dialogs, IMUnit,
  SFTPFrameUnit;

var
  UpdaterProgramFileName, UpdateStr: String;

{$R *.dfm}

function FileNameToVersionStr(FileNameStr: String): String;
var
  Regex: TPerlRegEx;
  Words: TStringList;
begin
  Regex := TPerlRegEx.Create;
  Regex.RegEx := '([0-9]{1,2}\.[0-9]{1,2}\.[0-9]{1,2}\.[0-9]{1,2})';
  Regex.Options := [];
  Regex.Subject := AnsiToUTF8(FileNameStr);
  if Regex.Match then
  begin
    Words := TStringList.Create;
    Parse(Utf8ToAnsi(Regex.MatchedText), '.', Words);
    Result := LPad(Words[0], 3, '0') + LPad(Words[1], 3, '0') + LPad(Words[2], 3, '0') + LPad(Words[3], 3, '0');
    Words.Free;
  end;
  Regex.Free;
end;

class function TAboutBox.Execute: TModalResult;
begin
  with TAboutBox.Create(nil) do
  begin
    try
      Result := ShowModal;
    finally
      Release;
    end;
  end;
end;

procedure TAboutBox.fadeTimerTimer(Sender: TObject);
const
  FADE_IN_SPEED = 5;
  FADE_OUT_SPEED = 20;
var
  newBlendValue: Integer;
begin
  case FadeType of
    ftIn:
      begin
        if AlphaBlendValue < 255 then
          AlphaBlendValue := FADE_IN_SPEED + AlphaBlendValue
        else
          fadeTimer.Enabled := False;
      end;
    ftOut:
      begin
        if AlphaBlendValue > 0 then
        begin
          newBlendValue := -1 * FADE_OUT_SPEED + AlphaBlendValue;
          if newBlendValue >  0 then
            AlphaBlendValue := newBlendValue
          else
            AlphaBlendValue := 0;
        end
        else
        begin
          fadeTimer.Enabled := False;
          Close;
        end;
      end;
  end;
end;

procedure TAboutBox.InitAboutBox;
var
  RegIniFile: TIniFile;
  SectionUpdateStrLst: TStringList;
begin
  if not FAboutInitialized then
  begin
    FAboutInitialized := True;
    ProtocolRadioGroup.ItemIndex := CFPUProtocol;
    PgmUpdBtn.Hint := 'Left-Click: Check for update' + #13#10 +
      'Right-Click: Simple Sftp Client' + #13#10 +
      'Shift-Left-Click: Edit Section-Update.ini' + #13#10 +
      'Shift-Right-Click: Load Section-Update.ini'; 
    PgmUpdBtn.ShowHint := True;
  end;
end;

procedure TAboutBox.FormCreate(Sender: TObject);
begin
  AlphaBlend := True;
  AlphaBlendValue := 0;
  fFadeType := ftIn;
  fadeTimer.Enabled := True;
  VersionLbl.Caption := GetVersionInfoStr(ParamStr(0));
  CompilerLbl.Caption := 'Application compiled with: ' + GetCompilerName(CompilerVersion);
  UpdaterProgramFileName := LclExeDir + 'PgmUpdater.exe';
  SftpGetForm.PgmUpdFileStorage.Path := lclKeyDir;
  InitAboutBox;
end;

procedure TAboutBox.InstallBtnClick(Sender: TObject);
begin
  DownloadPgmUpdate;
end;

procedure TAboutBox.JvBalloonHintClose(Sender: TObject);
begin
  PgmUpdDirJvImgBtn.Hint := 'Program update directory, LC-Open, RC-Copy to clipboard';
end;

procedure TAboutBox.PgmUpdBtnMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  HostDirName, PgmVersionStr, RegexStr: String;
  FileList: TStringList;
begin
  if ssShift in Shift then
  begin
    case Button of
      mbLeft:
      begin
        // Shift-Left-Click : Edit Section-Update
        ShellExecute(Handle, 'open', PChar(lclDtaDir + 'Section-Update.INI'), nil, nil, SW_SHOWNORMAL); // Open file in default text editor
{
        // get file
        PgmUpdBtn.Enabled := False;
        SftpGetForm.SftpDownload('LocalHost', 'TMSDelphiTools', 'TDT', '/APPS/SSC/Setup-SSC-v22.12.31.0.exe', LclPgmUpdDir + 'Setup-SSC-v22.12.31.0.exe');
        PgmUpdBtn.Enabled := True;
}
      end;
      mbRight:
      begin
        // Shift-Right-Click : Load Section-Update
        APSMainForm.LoadSectionUpdate;
{
        // get directory list
        PgmUpdBtn.Enabled := False;
        FileList := TStringList.Create;
        SftpGetForm.SftpDirectory('LocalHost', 'TMSDelphiTools', 'TDT', '/APPS/SSC', FileList);
        FileList.SaveToFile(LclTmpDir + 'FTPFileList.TXT');
        FileList.Free;
        PgmUpdBtn.Enabled := True;
}
      end;
    end;
  end
  else
  begin
    case Button of
      mbLeft:
      begin
        // Left-Click : check for updates
        PgmUpdBtn.Enabled := False;
        OKBtn.Enabled := False;
        PgmUpdDirJvImgBtn.Enabled := False;
        PgmUpdBtn.Caption := 'Checking...';
        PgmVersionStr := FileNameToVersionStr(LclVerStr);
        HostDirName := '/APPS/' + CFPUAppName;
        RegexStr := 'Setup-' + CFPUAppName + '-v([0-9]{1,2}\.[0-9]{1,2}\.[0-9]{1,2}\.[0-9]{1,2}).exe\b';
        try
          UpdateStr := CheckForPgmUpdate(HostDirName, CFPUHostName, CFPUUserName, CFPUPassWord, PgmVersionStr, RegexStr);
          if Length(UpdateStr) > 0 then
          begin
            PgmUpdBtn.Enabled := False;
            InstallBtn.Enabled := True;
            InstallBtn.Hint := 'Install updated version: ' + UpdateStr;
            PgmUpdBtn.Caption := 'Available';
            WriteIniFile(LclPgmUpdDir + 'PgmUpdater.ini');
          end
          else
          begin
            PgmUpdBtn.Caption := 'No update!';
          end;
          PgmUpdDirJvImgBtn.Enabled := True;
        finally
          PgmUpdBtn.Enabled := True;
          OKBtn.Enabled := True;
        end;
      end;
      mbRight:
      begin
        // Right-Click : sftp client
        AboutSftpForm.SFTPAboutFrame.SetDtaDir(lclDtaDir);
        AboutSftpForm.SetSFTPFrameKeyPath(lclKeyDir);
        AboutSftpForm.Execute;
      end;
    end;
  end;
end;

procedure TAboutBox.OpenDirectory(DirectoryName: String);
begin
  ShellExecute(Application.Handle,
    nil,
    'explorer.exe',
    PChar(DirectoryName), //wherever you want the window to open to
    nil,
    SW_NORMAL     //see other possibilities by ctrl+clicking on SW_NORMAL
    );
end;

procedure TAboutBox.PgmUpdDirJvImgBtnMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if ssShift in Shift then
  begin
    case Button of
      mbRight:
      begin
        // Shift-Right-Click
      end;
    end;
  end
  else
  begin
    case Button of
      mbLeft:
      begin
        // Left-Click
        OpenDirectory(LclPgmUpdDir);
      end;
      mbRight:
      begin
        // Right-Click
        PgmUpdDirJvImgBtn.Hint := '';
        Clipboard.AsText := LclPgmUpdDir;
        JvBalloonHint.ActivateHint(PgmUpdDirJvImgBtn, '(Copied to clipboard)', LclPgmUpdDir, 4000);
      end;
    end;
  end;
end;

procedure TAboutBox.ProtocolRadioGroupClick(Sender: TObject);
begin
  CFPUProtocol := ProtocolRadioGroup.ItemIndex;
end;

procedure TAboutBox.FormActivate(Sender: TObject);
var
  B1L, B1W, B2L, B2W, B3L, B3W, B4L, B4W, B5L, S1, S2, S3, S4, ST: Integer;
begin
  // Equally space buttons
  B1L := TestSetVersionToZeroBtn.Left;
  B1W := TestSetVersionToZeroBtn.Width;
  B2L := PgmUpdDirJvImgBtn.Left;
  B2W := PgmUpdDirJvImgBtn.Width;
  B3L := PgmUpdBtn.Left;
  B3W := PgmUpdBtn.Width;
  B4L := InstallBtn.Left;
  B4W := InstallBtn.Width;
  B5L := OKBtn.Left;
//  B4W := OKBtn.Width;
  S1 := B2L - (B1L + B1W);
  S2 := B3L - (B2L + B2W);
  S3 := B4L - (B3L + B3W);
  S4 := B5L - (B4L + B4W);
  ST := S1 + S2 + S3 + S4;
  B2L := B1L + B1W + (ST div 4);
  B3L := B2L + B2W + (ST div 4);
  B4L := B3L + B3W + (ST div 4);
  PgmUpdDirJvImgBtn.Left := B2L;
  PgmUpdBtn.Left := B3L;
  InstallBtn.Left := B4L;
  ProtocolRadioGroup.ItemIndex := CFPUProtocol;
end;

procedure TAboutBox.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  //cancel hint before closing form
  JvBalloonHint.CancelHint;
  //no close before we fade away
  if FadeType = ftIn then
  begin
    fFadeType := ftOut;
    AlphaBlendValue := 255;
    fadeTimer.Enabled := True;
    CanClose := False;
  end
  else
  begin
    CanClose := True;
  end;
end;

procedure TAboutBox.TestSetVersionToZeroBtnClick(Sender: TObject);
begin
  LclVerStr := CFPUAppName + '-v0.0.0.0';
  VersionLbl.Caption := '0.0.0.0';
end;

function TAboutBox.CheckForPgmUpdate(HostDirName, HostName, UserName, PassWord, PgmVersionStr, RegexStr: String): String;
var
  UpdateVersionStr: String;
  FileList: TStringList;
  i: Integer;
  Regex: TPerlRegEx;
  FtpVersionStr: String;
  GetFileListSuccessful: Boolean;
begin
  InfoMemoForm.InfoMemo.Lines.Append('CheckForPgmUpdate' + #13#10);
  Result := '';
  GetFileListSuccessful := False;
  Regex := TPerlRegEx.Create;
  UpdateVersionStr := '';
  if ProtocolRadioGroup.ItemIndex = 0 then
  begin
    FTPClient.HostName := HostName;
    FTPClient.UserName := UserName;
    FTPClient.PassWord := PassWord;
    FtpClient.HostDirName := HostDirName;
    FtpClient.HostFileName := '';
    FtpClient.LocalFileName := LclTmpDir + 'FTPFileList.TXT';
    GetFileListSuccessful := FtpClient.Directory; // Connect, Cwd, Download a directory listing to a file & Quit
    if FileExists(LclTmpDir + 'FTPFileList.TXT') then
    begin
      FileList := TStringList.Create;
      FileList.LoadFromFile(LclTmpDir + 'FTPFileList.TXT');
    end;
  end;
  if ProtocolRadioGroup.ItemIndex = 1 then
  begin
    FileList := TStringList.Create;
    GetFileListSuccessful := SftpGetForm.SftpDirectory(HostName, UserName, PassWord, HostDirName, FileList);
  end;
  if GetFileListSuccessful and Assigned(FileList) then
  begin
    for i := 0 to FileList.Count - 1 do
    begin
      Regex.RegEx := AnsiToUTF8(RegexStr);
      Regex.Options := [];
      Regex.Subject := AnsiToUTF8(FileList[i]);
      if Regex.Match then
      begin
        FtpVersionStr := FileNameToVersionStr(Utf8ToAnsi(Regex.MatchedText));
        if FtpVersionStr > PgmVersionStr then
        begin
          if FtpVersionStr > UpdateVersionStr then
          begin
            UpdateVersionStr := FtpVersionStr;
            Result := Utf8ToAnsi(Regex.MatchedText);
            InfoMemoForm.InfoMemo.Lines.Append('Update Found');
          end;
        end;
      end;
    end;
    FileList.Free;
  end;
  Regex.Free;
end;

procedure TAboutBox.WriteIniFile(IniFileName: String);
var
  RegIniFile: TIniFile;
begin
  RegIniFile := TIniFile.Create(IniFileName);
  try
    RegIniFile.WriteString('SectionFormClose', 'AboutCap', Caption);
    RegIniFile.WriteString('SectionFormClose', 'MainCap', APSMainForm.Caption);
    RegIniFile.WriteString('SectionPgmUpdater', 'PgmUpdDir', lclPgmUpdDir);
    RegIniFile.WriteString('SectionPgmUpdater', 'Installer', UpdateStr);
  finally
    RegIniFile.Free;
  end;
end;

procedure TAboutBox.DownloadPgmUpdate;
var
  HostDirName: String;
  FileDownloaded: Boolean;
begin
  InstallBtn.Caption := 'Working...';
  HostDirName := 'APPS/' + CFPUAppName;
  if ProtocolRadioGroup.ItemIndex = 0 then
  begin
    FTPClient.HostName := CFPUHostName;
    FTPClient.UserName := CFPUUserName;
    FTPClient.PassWord := CFPUPassWord;
    FTPClient.HostDirName := HostDirName;
    FTPClient.LocalFileName := LclPgmUpdDir + UpdateStr;
    FTPClient.HostFileName := UpdateStr;
    // Connect, Cwd, Download a file & Quit
    FileDownloaded := FTPClient.Receive;
  end;
  if ProtocolRadioGroup.ItemIndex = 1 then
  begin
    FileDownloaded := SftpGetForm.SftpDownload(CFPUHostName, CFPUUserName, CFPUPassWord, HostDirName + '/' + UpdateStr, LclPgmUpdDir + UpdateStr);
  end;
  if FileDownloaded then
  begin
    if SysUtils.FileExists(UpdaterProgramFileName) then // if PgmUpdater.exe in exe dir then run it else open FileExplorer
    begin
      Sleep(1000);
      ShellExecute(Application.Handle, nil, PWideChar(UpdaterProgramFileName), PWideChar(LclPgmUpdDir + 'PgmUpdater.ini'), nil, SW_MINIMIZE);
      //SW_NORMAL  //see other possibilities by ctrl+clicking on SW_NORMAL
    end
    else
    begin
      MessageDlg('Close program before running install', mtInformation, [mbOk], 0);
      OpenDirectory(LclPgmUpdDir);
    end;
  end
  else
  begin
    InstallBtn.Caption := 'Error!';
  end;
end;

end.

