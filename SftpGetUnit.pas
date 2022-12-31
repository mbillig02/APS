unit SftpGetUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ScSSHClient, ScSFTPClient, ScBridge, ScUtils, ScSFTPUtils,
  Vcl.StdCtrls;

type
  TSftpGetForm = class(TForm)
    PgmUpdFileStorage: TScFileStorage;
    PgmUpdSFTPClient: TScSFTPClient;
    PgmUpdSSHClient: TScSSHClient;
    FileListMemo: TMemo;
    procedure PgmUpdSSHClientServerKeyValidate(Sender: TObject;
      NewServerKey: TScKey; var Accept: Boolean);
    procedure PgmUpdSFTPClientDirectoryList(Sender: TObject; const Path: string;
      const Handle: TArray<System.Byte>; FileInfo: TScSFTPFileInfo;
      EOF: Boolean);
    function SftpDirectory(const Hostname, Username, Password,
      Directory: String; var FileList: TStringList): Boolean;
    function SftpDownload(const Hostname, Username, Password,
      SourceFilename, DestFilename: String): Boolean;
  private
    procedure DoServerKeyValidate(FileStorage: TScFileStorage;
      const HostKeyName: String; NewServerKey: TScKey; var Accept: Boolean);
    procedure OpenDir(const Path: String);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SftpGetForm: TSftpGetForm;

implementation

{$R *.dfm}

uses IMUnit;

procedure TSftpGetForm.PgmUpdSFTPClientDirectoryList(Sender: TObject;
  const Path: string; const Handle: TArray<System.Byte>;
  FileInfo: TScSFTPFileInfo; EOF: Boolean);
begin
  if (FileInfo = nil) or (FileInfo.Filename = '.') or (FileInfo.Filename = '..') then Exit;
  if Assigned(FileListMemo.Lines) then FileListMemo.Lines.Append(FileInfo.Filename);
end;

procedure TSftpGetForm.PgmUpdSSHClientServerKeyValidate(Sender: TObject;
  NewServerKey: TScKey; var Accept: Boolean);
var
  CurHostKeyName: String;
begin
  if PgmUpdSSHClient.HostKeyName = '' then
    CurHostKeyName := PgmUpdSSHClient.HostName
  else
    CurHostKeyName := PgmUpdSSHClient.HostKeyName;

  DoServerKeyValidate(PgmUpdFileStorage, CurHostKeyName, NewServerKey, Accept);
end;

procedure TSftpGetForm.DoServerKeyValidate(FileStorage: TScFileStorage;
  const HostKeyName: String; NewServerKey: TScKey; var Accept: Boolean);
var
  Key: TScKey;
  NewKeyFP, ExistingKeyFP, msg: String;
begin
  Key := FileStorage.Keys.FindKey(HostKeyName);
  if (Key = nil) or not Key.Ready then
  begin
    NewServerKey.GetFingerPrint(haMD5, NewKeyFP);
    msg := 'The authenticity of server can not be verified.'#13#10 +
           'Fingerprint for the key received from server: ' + NewKeyFP + '.'#13#10 +
           'Key length: ' + IntToStr(NewServerKey.BitCount) + ' bits.'#13#10 +
           'Are you sure you want to continue connecting?';
    if MessageDlg(msg, mtConfirmation, [mbOk, mbCancel], 0) = mrOk then
    begin
      Key := TScKey.Create(nil);
      try
        Key.Assign(NewServerKey);
        Key.KeyName := HostKeyName;
        FileStorage.Keys.Add(Key);
      except
        Key.Free;
        raise;
      end;
      Accept := True;
    end;
  end
  else
  begin
    Key.GetFingerPrint(haMD5, ExistingKeyFP);
    NewServerKey.GetFingerPrint(haMD5, NewKeyFP);
    msg := 'The existing Key Fingerprint is: ' + ExistingKeyFP + #13#10#10 +
           'Fingerprint for the key received from server: ' + NewKeyFP + #13#10#10 +
           'Are you sure you want to continue connecting?';
    if MessageDlg(msg, mtConfirmation, [mbOk, mbCancel], 0) = mrOk then
    begin
      FileStorage.Keys.Remove(Key);
      NewServerKey.KeyName := HostKeyName;
      FileStorage.Keys.Add(NewServerKey);
      Accept := True;
    end;
  end;
end;

function TSftpGetForm.SftpDirectory(const Hostname, Username, Password, Directory: String; var FileList: TStringList): Boolean;
begin
  PgmUpdSSHClient.HostName := HostName;
  PgmUpdSSHClient.Port := 22;
  PgmUpdSSHClient.User := Username;
  PgmUpdSSHClient.Password := Password;
  if not PgmUpdSFTPClient.Active then PgmUpdSFTPClient.Initialize;
  OpenDir(Directory);
  PgmUpdSSHClient.Disconnect;
  FileList.Text := FileListMemo.Text;
  if FileList.Text = ('Directory "' + Directory + '" not found') then Result := False else Result := True;
end;

function TSftpGetForm.SftpDownload(const Hostname, Username, Password, SourceFilename, DestFilename: String): Boolean;
begin
  if FileExists(DestFilename) then DeleteFile(DestFilename);
  PgmUpdSSHClient.HostName := HostName;
  PgmUpdSSHClient.Port := 22;
  PgmUpdSSHClient.User := Username;
  PgmUpdSSHClient.Password := Password;
  if not PgmUpdSFTPClient.Active then PgmUpdSFTPClient.Initialize;
  PgmUpdSFTPClient.DownloadFile(SourceFilename, DestFilename, True);
  PgmUpdSSHClient.Disconnect;
  Result := FileExists(DestFilename);
end;

procedure TSftpGetForm.OpenDir(const Path: String);
var
  OldCursor: TCursor;
  Handle: TScSFTPFileHandle;
  RootDir: String;
begin
  OldCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    try
      RootDir := PgmUpdSFTPClient.RetrieveAbsolutePath(Trim(Path));
      Handle := PgmUpdSFTPClient.OpenDirectory(RootDir);
      try
        FileListMemo.Clear;
        while not PgmUpdSFTPClient.EOF(Handle) do PgmUpdSFTPClient.ReadDirectory(Handle);
      finally
        PgmUpdSFTPClient.CloseHandle(Handle);
      end;
    except
      FileListMemo.Text := 'Directory "' + Path + '" not found';
    end;
  finally
    Screen.Cursor := OldCursor;
  end;
end;

end.
