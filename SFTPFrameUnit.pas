unit SFTPFrameUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ScBridge, ScSFTPClient,
  ScSSHClient, System.ImageList, Vcl.ImgList, Vcl.ComCtrls, ScSFTPUtils,
  Vcl.StdCtrls, ScUtils, System.Actions, Vcl.ActnList, ScCLRClasses,
  Vcl.Samples.Gauges, Vcl.ExtCtrls, Vcl.ToolWin, JvExComCtrls, JvToolBar, ScTypes,
  Vcl.Menus, Vcl.Buttons, JvProgressBar;

type
  TSFTPFrame = class(TFrame)
    ScSSHClientF: TScSSHClient;
    ScSFTPClientF: TScSFTPClient;
    ScFileStorageF: TScFileStorage;
    ImageList: TImageList;
    FileView: TTreeView;
    lbRootDir: TEdit;
    ConnectSSHBtn: TButton;
    DisconnectSSHBtn: TButton;
    StartSFTPBtn: TButton;
    StopSFTPBtn: TButton;
    ActionList: TActionList;
    HostNameEdit: TEdit;
    UserNameEdit: TEdit;
    PasswordEdit: TEdit;
    aConnectSSH: TAction;
    aDisconnectSSH: TAction;
    aStartSFTP: TAction;
    aStopSFTP: TAction;
    aDownload: TAction;
    SaveDialog: TSaveDialog;
    OpenDialog: TOpenDialog;
    DownloadBtn: TButton;
    aUpload: TAction;
    UploadBtn: TButton;
    ShowPasswordBtn: TButton;
    TopPanel: TPanel;
    JvToolBar: TJvToolBar;
    aMakeDir: TAction;
    aRemove: TAction;
    ActionToolButton: TToolButton;
    ActionPopupMenu: TPopupMenu;
    pmiRemove: TMenuItem;
    pmiMakeDir: TMenuItem;
    aRename: TAction;
    pmiRename: TMenuItem;
    aViewFile: TAction;
    pmiViewFile: TMenuItem;
    aChgDir: TAction;
    pmiChgDir: TMenuItem;
    ChgDirBtn: TButton;
    aDirUpLvl: TAction;
    DirUpLvlSpdBtn: TSpeedButton;
    aInfoMemo: TAction;
    XferProgressBar: TJvProgressBar;
    CancelToolButton: TToolButton;
    aCancel: TAction;
    pmiUpload: TMenuItem;
    pmiDownload: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    aGetFileList: TAction;
    aLoadSectionUpdate: TAction;
    aSelectFile: TAction;
    aOpenKeyDirInExplorer: TAction;
    FileToolButton: TToolButton;
    FilePopupMenu: TPopupMenu;
    pmiLoadSectionUpdate: TMenuItem;
    pmiSelectFile: TMenuItem;
    pmiOpenKeyDirinExplorer: TMenuItem;
    MiscToolButton: TToolButton;
    MiscPopupMenu: TPopupMenu;
    pmiInfoMemo: TMenuItem;
    pmiGetFileList: TMenuItem;
    procedure ScSFTPClientFDirectoryList(Sender: TObject; const Path: String;
      const Handle: TArray<System.Byte>; FileInfo: TScSFTPFileInfo;
      EOF: Boolean);
    procedure ScSFTPClientFCreateLocalFile(Sender: TObject; const LocalFileName,
      RemoteFileName: String; Attrs: TScSFTPFileAttributes;
      var Handle: NativeUInt);
    procedure ScSSHClientFAfterConnect(Sender: TObject);
    procedure ScSSHClientFAfterDisconnect(Sender: TObject);
    procedure ScSSHClientFServerKeyValidate(Sender: TObject;
      NewServerKey: TScKey; var Accept: Boolean);
    procedure FileViewDblClick(Sender: TObject);
    procedure aConnectSSHExecute(Sender: TObject);
    procedure aDisconnectSSHExecute(Sender: TObject);
    procedure aStartSFTPExecute(Sender: TObject);
    procedure aStopSFTPExecute(Sender: TObject);
    procedure aDownloadExecute(Sender: TObject);
    procedure aUploadExecute(Sender: TObject);
    procedure LoadConnectionFile(FileName: String);
    procedure SaveConnectionFile(FileName: String);
    procedure ShowPasswordBtnClick(Sender: TObject);
    procedure aMakeDirExecute(Sender: TObject);
    procedure aRemoveExecute(Sender: TObject);
    procedure aRenameExecute(Sender: TObject);
    procedure aViewFileExecute(Sender: TObject);
    procedure aChgDirExecute(Sender: TObject);
    procedure aDirUpLvlExecute(Sender: TObject);
    procedure aInfoMemoExecute(Sender: TObject);
    procedure ScSFTPClientFBeforeWriteDataEx(Sender: TObject;
      const FileName: String; const Handle: TArray<System.Byte>;
      FileOffset: Int64; var Buffer: TArray<System.Byte>; var Offset,
      Count: Integer; EOF: Boolean; var Cancel: Boolean);
    procedure aCancelExecute(Sender: TObject);
    procedure ScSFTPClientFBeforeReadData(Sender: TObject;
      const FileName: String; const Handle: TArray<System.Byte>;
      FileOffset: Int64; Count: Integer; var Cancel: Boolean);
    procedure FileViewMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure aGetFileListExecute(Sender: TObject);
    procedure SetDtaDir(DtaDirIn: String);
    procedure SetTmpDir(TmpDirIn: String);
    procedure GetFileList(SectionUpdateFilename: String; FileListFileName: String);
    procedure aLoadSectionUpdateExecute(Sender: TObject);
    procedure ScSFTPClientFConnect(Sender: TObject);
    procedure ScSFTPClientFDisconnect(Sender: TObject);
    procedure aSelectFileExecute(Sender: TObject);
    procedure SetScFileStorageFPath(Path: String);
    procedure aOpenKeyDirInExplorerExecute(Sender: TObject);
    procedure SetKeyDir(Path: String);
  private
    procedure ShowSSHButtons(Connected: Boolean);
    procedure ShowSFTPButtons(Connected: Boolean);
    procedure DisconnectSFTP;
    procedure DoServerKeyValidate(FileStorage: TScFileStorage;
      const HostKeyName: String; NewServerKey: TScKey; var Accept: Boolean);
    procedure DisconnectAll;
    procedure OpenDir(const Path: String; const SelectedName: String = '');
    function GetRootDir: String;
    function GetSelectedNode: TTreeNode;
    procedure btViewFileClick(Sender: TObject);
    procedure RemoveDir(const Path: String);
    function GetSFTPFileSize(Path, FileName: String): Int64;
    procedure ConnectSSH;
    procedure StartSFTP;
    procedure LoadSectionUpdate(SectionUpdateFilename: String);
    procedure OpenDirectory(DirectoryName: String);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SFTPFrame: TSFTPFrame;

implementation

uses
  IniFiles, FileViewForm, NewNameForm, IMUnit, NetEncoding, SelectFileUnit, ShellApi;

const
  SNoFilesSelected = 'No files selected!';

var
  XferCancelled: Boolean;
  FileList: TStringList;
  lclDtaDir, lclTmpDir, lclKeyDir: String;

{$R *.dfm}

function FileSize(const aFilename: String): Int64;
var
  info: TWin32FileAttributeData;
begin
  result := -1;

  if NOT GetFileAttributesEx(PWideChar(aFileName), GetFileExInfoStandard, @info) then
    EXIT;

  result := Int64(info.nFileSizeLow) or Int64(info.nFileSizeHigh shl 32);
end;

procedure PopMenuAtCursor(const pMenu: TPopupMenu);
var
  MousePoint: TPoint;
begin
  if GetCursorPos(MousePoint) then
  begin
    pMenu.Popup(MousePoint.X, MousePoint.Y);
  end;
end;

procedure TSFTPFrame.SetScFileStorageFPath(Path: String);
begin
  ScFileStorageF.Path := Path;
end;

procedure TSFTPFrame.SetDtaDir(DtaDirIn: String);
begin
  lclDtaDir := DtaDirIn;
end;

procedure TSFTPFrame.SetTmpDir(TmpDirIn: String);
begin
  lclTmpDir := TmpDirIn;
end;

procedure TSFTPFrame.DisconnectAll;
begin
  DisconnectSFTP;
  ScSSHClientF.Disconnect;
  ShowSSHButtons(False);
end;

procedure TSFTPFrame.DisconnectSFTP;
begin
  try
    ScSFTPClientF.Disconnect;
  finally
    ShowSFTPButtons(False);
    lbRootDir.Text := '.';
    FileView.Items.Clear;
  end;
end;

procedure TSFTPFrame.DoServerKeyValidate(FileStorage: TScFileStorage;
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

procedure TSFTPFrame.aCancelExecute(Sender: TObject);
begin
  XferCancelled := True;
end;

procedure TSFTPFrame.aChgDirExecute(Sender: TObject);
begin
  OpenDir(StringReplace(lbRootDir.Text, '/', PathDelim, [rfReplaceAll]));
end;

procedure TSFTPFrame.aConnectSSHExecute(Sender: TObject);
begin
  ConnectSSH;
end;

procedure TSFTPFrame.aDirUpLvlExecute(Sender: TObject);
var
  TmpStr: String;
begin
  TmpStr := lbRootDir.Text;
  Delete(TmpStr, LastDelimiter('/', TmpStr), Length(TmpStr));
  OpenDir(TmpStr);
end;

procedure TSFTPFrame.aDisconnectSSHExecute(Sender: TObject);
begin
  DisconnectAll;
end;

function TSFTPFrame.GetSFTPFileSize(Path, FileName: String): Int64;
var
  OldCursor: TCursor;
  Handle: TScSFTPFileHandle;
  List: TCRObjectList;
  FileInfo: TScSFTPFileInfo;
  i: integer;
begin
  Result := 0;
  OldCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;

    Handle := ScSFTPClientF.OpenDirectory(Path);
    try
      List := TCRObjectList.Create;
      try
        ScSFTPClientF.ReadDirectoryToList(Handle, List);

        for i := 0 to List.Count - 1 do
        begin
          FileInfo := TScSFTPFileInfo(List[i]);
          if FileInfo.Filename = FileName then
          begin
            Result := FileInfo.Attributes.Size;
          end;
        end;
      finally
        List.Free;
      end;
    finally
      ScSFTPClientF.CloseHandle(Handle);
    end;

  finally
    Screen.Cursor := OldCursor;
  end;
end;

procedure TSFTPFrame.ConnectSSH;
var
  OldCursor: Smallint;
begin
  ScSSHClientF.HostName := HostNameEdit.Text;
  ScSSHClientF.Port := 22;
  ScSSHClientF.User := UserNameEdit.Text;
  ScSSHClientF.Password := PasswordEdit.Text;
  OldCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    ScSSHClientF.Connect;
  finally
    Screen.Cursor := OldCursor;
  end;
end;

procedure TSFTPFrame.StartSFTP;
begin
  ScSFTPClientF.Initialize;
  ShowSFTPButtons(True);
  OpenDir(lbRootDir.Text);
end;

procedure TSFTPFrame.LoadSectionUpdate(SectionUpdateFilename: String);
var
  RegIniFile: TIniFile;
begin
  RegIniFile := TIniFile.Create(SectionUpdateFilename);
  try
    HostNameEdit.Text := RegIniFile.ReadString('Section-Update', 'FtpHostName', '');
    UserNameEdit.Text := RegIniFile.ReadString('Section-Update', 'FtpUserName', '');
    PasswordEdit.Text := RegIniFile.ReadString('Section-Update', 'FtpPassWord', '');
    lbRootDir.Text := '/APPS/' + RegIniFile.ReadString('Section-Update', 'AppName', '');
  finally
    RegIniFile.Free;
  end;
end;

procedure TSFTPFrame.GetFileList(SectionUpdateFilename: String; FileListFileName: String);
begin
  if FileExists(SectionUpdateFilename) then
  begin
    LoadSectionUpdate(SectionUpdateFilename);
    if FileExists(FileListFileName) then DeleteFile(FileListFileName);
    Application.ProcessMessages;
    if aConnectSSH.Enabled then ConnectSSH;
    Application.ProcessMessages;
    Sleep(1000);
    if aStartSFTP.Enabled then StartSFTP;
    Application.ProcessMessages;
    Sleep(1000);
    OpenDir(StringReplace(lbRootDir.Text, '/', PathDelim, [rfReplaceAll]));
    if Assigned(FileList) then FileList.SaveToFile(FileListFileName);
    Application.ProcessMessages;
    Sleep(1000);
    DisconnectAll;
  end;
end;

procedure TSFTPFrame.aDownloadExecute(Sender: TObject);
var
  Node: TTreeNode;
  Fi: TScSFTPFileInfo;
begin
  aDownload.Enabled := False;
  aUpload.Enabled := False;
  aStopSftp.Enabled := False;
  aDisconnectSSH.Enabled := False;
  aChgDir.Enabled := False;
  aDirUpLvl.Enabled := False;
  Node := GetSelectedNode;
  if (Node = nil) or (Node.ImageIndex <> 0) then
  begin
    MessageDlg(SNoFilesSelected, mtConfirmation, [mbOk], 0);
    Exit;
  end;

  SaveDialog.Options := SaveDialog.Options + [ofOverwritePrompt];
  SaveDialog.Title := 'Download file';
  SaveDialog.Filter := 'All files (*.*)|*.*';
  SaveDialog.FileName := Node.Text;
  try
    if SaveDialog.Execute then
    begin
      if FileExists(SaveDialog.FileName) then DeleteFile(SaveDialog.FileName);
      XferCancelled := False;
      // set XferProgressBar.Max
      XferProgressBar.Max := GetSFTPFileSize(GetRootDir, Node.Text);
      ScSFTPClientF.DownloadFile(GetRootDir + Node.Text, SaveDialog.FileName, True);
      XferProgressBar.Position := 0;
    end;
  finally
    aDirUpLvl.Enabled := True;
    aChgDir.Enabled := True;
    aDisconnectSSH.Enabled := True;
    aStopSftp.Enabled := True;
    aUpload.Enabled := True;
    aDownload.Enabled := True;
  end;
end;

procedure TSFTPFrame.aInfoMemoExecute(Sender: TObject);
begin
  if Application.MainForm.Left + Application.MainForm.Width + InfoMemoForm.Width < Screen.WorkAreaWidth then
  begin
    InfoMemoForm.Position := poDesigned;
    InfoMemoForm.Top := Application.MainForm.Top;
    InfoMemoForm.Left := Application.MainForm.Left + Application.MainForm.Width;
  end
  else
  begin
    if Application.MainForm.Top + Application.MainForm.Height + InfoMemoForm.Height < Screen.WorkAreaHeight then
    begin
      InfoMemoForm.Position := poDesigned;
      InfoMemoForm.Top := Application.MainForm.Top + Application.MainForm.Height;
      InfoMemoForm.Left := Application.MainForm.Left;
    end
    else
    begin
//      InfoMemoForm.Position := poMainFormCenter;
      InfoMemoForm.Position := poDesktopCenter;
    end;
  end;
  InfoMemoForm.Show;
end;

procedure TSFTPFrame.aLoadSectionUpdateExecute(Sender: TObject);
begin
  OpenDialog.Title := 'Select Section-Update File';
  OpenDialog.InitialDir := lclDtaDir;
  OpenDialog.DefaultExt := '.ini';
  OpenDialog.Filter := 'Ini Files (*.ini)|*.INI|All Files (*.*)|*.*';
  if OpenDialog.Execute then LoadSectionUpdate(OpenDialog.FileName);
end;

procedure TSFTPFrame.aMakeDirExecute(Sender: TObject);
var
  DirName: String;
begin
  fmNewName.lbCaption.Caption := 'New directory';
  fmNewName.edNewName.Text := '';

  if fmNewName.ShowModal = mrOk then begin
    DirName := Trim(fmNewName.edNewName.Text);
    if DirName <> '' then
      ScSFTPClientF.MakeDirectory(GetRootDir + DirName);
    OpenDir(lbRootDir.Text, DirName);
  end;
end;

procedure TSFTPFrame.OpenDirectory(DirectoryName: String);
begin
  ShellExecute(Application.Handle,
    nil,
    'explorer.exe',
    PChar(DirectoryName), //wherever you want the window to open to
    nil,
    SW_NORMAL     //see other possibilities by ctrl+clicking on SW_NORMAL
    );
end;

procedure TSFTPFrame.SetKeyDir(Path: String);
begin
  lclKeyDir := Path;
end;

procedure TSFTPFrame.aOpenKeyDirInExplorerExecute(Sender: TObject);
begin
  OpenDirectory(lclKeyDir);
end;

procedure TSFTPFrame.aRemoveExecute(Sender: TObject);
const
  DEL_MSG = 'Do you really want to delete the %s %s?';
var
  Node: TTreeNode;
begin
  Node := GetSelectedNode;
  if (Node = nil) or (Node.ImageIndex = 2) then begin
    MessageDlg(SNoFilesSelected, mtConfirmation, [mbOk], 0);
    Exit;
  end;

  case Node.ImageIndex of
    0: begin
      if MessageDlg(Format(DEL_MSG, ['file', Node.Text]), mtConfirmation, [mbOk, mbCancel], 0) = mrOk then begin
        ScSFTPClientF.RemoveFile(GetRootDir + Node.Text);
        OpenDir(lbRootDir.Text);
      end;
    end;
    1: begin
      if MessageDlg(Format(DEL_MSG, ['directory', Node.Text +  ' and all its contents']), mtConfirmation, [mbOk, mbCancel], 0) = mrOk then begin
        try
          RemoveDir(GetRootDir + Node.Text);
        finally
          OpenDir(lbRootDir.Text);
        end;
      end;
    end;
  end;
end;

procedure TSFTPFrame.aRenameExecute(Sender: TObject);
const
  RENAME_MSG = 'Rename "%s" to';
var
  Node: TTreeNode;
  NewName: String;
begin
  Node := GetSelectedNode;
  if (Node = nil) or (Node.ImageIndex = 2) then begin
    MessageDlg(SNoFilesSelected, mtConfirmation, [mbOk], 0);
    Exit;
  end;

  fmNewName.lbCaption.Caption := Format(RENAME_MSG, [Node.Text]);
  fmNewName.edNewName.Text := Node.Text;

  if fmNewName.ShowModal = mrOk then begin
    NewName := Trim(fmNewName.edNewName.Text);
    if (NewName <> '') and (NewName <> Node.Text) then begin
      ScSFTPClientF.RenameFile(GetRootDir + Node.Text, GetRootDir + NewName);
      OpenDir(lbRootDir.Text, NewName);
    end;
  end;
end;

procedure TSFTPFrame.RemoveDir(const Path: String);
var
  OldCursor: TCursor;
  Handle: TScSFTPFileHandle;
  List: TCRObjectList;
  FileInfo: TScSFTPFileInfo;
  i: integer;
begin
  OldCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;

    Handle := ScSFTPClientF.OpenDirectory(Path);
    try
      List := TCRObjectList.Create;
      try
        ScSFTPClientF.ReadDirectoryToList(Handle, List);

        for i := 0 to List.Count - 1 do begin
          FileInfo := TScSFTPFileInfo(List[i]);
          if (FileInfo.Filename = '.') or (FileInfo.Filename = '..') then
            Continue;

          if (Length(FileInfo.Longname) > 0) and (FileInfo.Longname[1] = 'd') then
            RemoveDir(Path + '/' + FileInfo.Filename)
          else
            ScSFTPClientF.RemoveFile(Path + '/' + FileInfo.Filename);
        end;
      finally
        List.Free;
      end;
    finally
      ScSFTPClientF.CloseHandle(Handle);
    end;

    ScSFTPClientF.RemoveDirectory(Path);
  finally
    Screen.Cursor := OldCursor;
  end;
end;

procedure TSFTPFrame.aGetFileListExecute(Sender: TObject);
begin
  GetFileList(LclDtaDir + 'Section-Update.INI', lclTmpDir + 'FileList.txt');
end;

procedure TSFTPFrame.aSelectFileExecute(Sender: TObject);
var
  TmpStr: String;
begin
  SelectFileDlg.SelectFileFrame.SetFileListPath(lclDtaDir);
  SelectFileDlg.SelectFileFrame.SetFileListMask('*.ini');
  SelectFileDlg.SelectFileFrame.LoadFileList;
  if SelectFileDlg.ShowModal = mrOk then
  begin
    if Pos('[L] ', SelectFileDlg.FileName) = 1 then
    begin
      TmpStr := Copy(SelectFileDlg.FileName, 5);
      LoadSectionUpdate(TmpStr);
    end;
    if Pos('[E] ', SelectFileDlg.FileName) = 1 then
    begin
      TmpStr := Copy(SelectFileDlg.FileName, 5);
      ShellExecute(Handle, 'open', PChar(TmpStr), nil, nil, SW_SHOWNORMAL); // Open file in default text editor
    end;
  end;
end;

procedure TSFTPFrame.aStartSFTPExecute(Sender: TObject);
begin
  StartSFTP;
end;

procedure TSFTPFrame.aStopSFTPExecute(Sender: TObject);
begin
  DisconnectSFTP;
end;

procedure TSFTPFrame.aUploadExecute(Sender: TObject);
begin
  aDownload.Enabled := False;
  aUpload.Enabled := False;
  aStopSftp.Enabled := False;
  aDisconnectSSH.Enabled := False;
  aChgDir.Enabled := False;
  aDirUpLvl.Enabled := False;
  OpenDialog.Title := 'Upload file';
  OpenDialog.Filter := 'All files (*.*)|*.*';
  if OpenDialog.Execute then
  begin
    XferCancelled := False;
    XferProgressBar.Max := FileSize(OpenDialog.FileName);
    ScSFTPClientF.UploadFile(OpenDialog.FileName, GetRootDir + ExtractFileName(OpenDialog.FileName), True);
    OpenDir(lbRootDir.Text, ExtractFileName(OpenDialog.FileName));
    XferProgressBar.Position := 0;
  end;
  aDirUpLvl.Enabled := True;
  aChgDir.Enabled := True;
  aDisconnectSSH.Enabled := True;
  aStopSftp.Enabled := True;
  aUpload.Enabled := True;
  aDownload.Enabled := True;
end;

procedure TSFTPFrame.aViewFileExecute(Sender: TObject);
var
  Node: TTreeNode;
  Handle: TScSFTPFileHandle;
  FileOffset: Int64;
  Buffer: TBytes;
  Count: Integer;
begin
  SetLength(Handle, 0);
  Node := GetSelectedNode;
  if (Node = nil) or (Node.ImageIndex <> 0) then
  begin
    MessageDlg(SNoFilesSelected, mtConfirmation, [mbOk], 0);
    Exit;
  end;

  fmFileView.Caption := Node.Text;
  fmFileView.Memo.Clear;

  Handle := ScSFTPClientF.OpenFile(GetRootDir + Node.Text, [foRead]);
  try
    SetLength(Buffer, 32768);
    FileOffset := 0;
    while not ScSFTPClientF.EOF(Handle) do
    begin
      Count := ScSFTPClientF.ReadFile(Handle, FileOffset, Buffer, 0, Length(Buffer));
      if Count > 0 then
        fmFileView.Memo.Lines.Text := fmFileView.Memo.Lines.Text + string(Encoding.ASCII.GetString(Buffer, 0, Count));
      FileOffset := FileOffset + Count;
    end;
  finally
    ScSFTPClientF.CloseHandle(Handle);
  end;

  fmFileView.ShowModal;
end;

procedure TSFTPFrame.btViewFileClick(Sender: TObject);
var
  Node: TTreeNode;
  Handle: TScSFTPFileHandle;
  FileOffset: Int64;
  Buffer: TBytes;
  Count: Integer;
begin
  SetLength(Handle, 0);
  Node := GetSelectedNode;
  if (Node = nil) or (Node.ImageIndex <> 0) then
  begin
    MessageDlg(SNoFilesSelected, mtConfirmation, [mbOk], 0);
    Exit;
  end;

  fmFileView.Caption := Node.Text;
  fmFileView.Memo.Clear;

  Handle := ScSFTPClientF.OpenFile(GetRootDir + Node.Text, [foRead]);
  try
    SetLength(Buffer, 32768);
    FileOffset := 0;
    while not ScSFTPClientF.EOF(Handle) do
    begin
      Count := ScSFTPClientF.ReadFile(Handle, FileOffset, Buffer, 0, Length(Buffer));
      if Count > 0 then
        fmFileView.Memo.Lines.Text := fmFileView.Memo.Lines.Text + string(Encoding.ASCII.GetString(Buffer, 0, Count));
      FileOffset := FileOffset + Count;
    end;
  finally
    ScSFTPClientF.CloseHandle(Handle);
  end;

  fmFileView.ShowModal;
end;

function TSFTPFrame.GetRootDir: String;
begin
  Result := lbRootDir.Text;
  if IsDelimiter('/', Result, Length(Result)) and (Result[Length(Result)] = '/') then Exit;
  if IsDelimiter('\', Result, Length(Result)) and (Result[Length(Result)] = '\') then Exit;
  Result := Result + '/';
end;

function TSFTPFrame.GetSelectedNode: TTreeNode;
begin
  Result := nil;
  if FileView.Items.Count = 0 then Exit;
  Result := FileView.Selected;
  if Result = nil then Result := FileView.Items[0];
end;

procedure TSFTPFrame.FileViewDblClick(Sender: TObject);
var
  Node: TTreeNode;
begin
  Node := GetSelectedNode;
  if Node = nil then Exit;

  case Node.ImageIndex of
    0: btViewFileClick(Sender);
    1: OpenDir(GetRootDir + Node.Text, '..');
    2: OpenDir(GetRootDir + Node.Text, ExtractFileName(StringReplace(lbRootDir.Text, '/', PathDelim, [rfReplaceAll])));
  end;
end;

procedure TSFTPFrame.FileViewMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbRight then
  begin
    FileView.Selected := FileView.GetNodeAt(X, Y);
    PopMenuAtCursor(ActionPopupMenu);
  end;
end;

procedure TSFTPFrame.OpenDir(const Path: String; const SelectedName: String = '');
var
  OldCursor: TCursor;
  Handle: TScSFTPFileHandle;
  RootDir: String;
  i: Integer;
begin
  OldCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;

    RootDir := ScSFTPClientF.RetrieveAbsolutePath(Trim(Path));
    Handle := ScSFTPClientF.OpenDirectory(RootDir);
    lbRootDir.Text := RootDir;

    try
      FileView.Items.Clear;
      while not ScSFTPClientF.EOF(Handle) do
        ScSFTPClientF.ReadDirectory(Handle);
    finally
      ScSFTPClientF.CloseHandle(Handle);
    end;

    if SelectedName <> '' then
    begin
      for i := 0 to FileView.Items.Count - 1 do
        if LowerCase(FileView.Items[i].Text) = LowerCase(SelectedName) then
        begin
          FileView.Selected := FileView.Items[i];
          Exit;
        end;
    end;
  finally
    Screen.Cursor := OldCursor;
  end;
end;

procedure TSFTPFrame.ScSFTPClientFBeforeReadData(Sender: TObject;
  const FileName: String; const Handle: TArray<System.Byte>; FileOffset: Int64;
  Count: Integer; var Cancel: Boolean);
begin // Download
  Application.ProcessMessages;
  Cancel := XferCancelled;
  XferProgressBar.Position := FileOffset; // Progress gets to 100 too quick, before download is done.
end;

procedure TSFTPFrame.ScSFTPClientFBeforeWriteDataEx(Sender: TObject;
  const FileName: String; const Handle: TArray<System.Byte>; FileOffset: Int64;
  var Buffer: TArray<System.Byte>; var Offset, Count: Integer; EOF: Boolean;
  var Cancel: Boolean);
begin // Upload
  Application.ProcessMessages;
  Cancel := XferCancelled;
  XferProgressBar.Position := FileOffset;
end;

procedure TSFTPFrame.ScSFTPClientFConnect(Sender: TObject);
begin
  FileView.Enabled := True;
end;

procedure TSFTPFrame.ScSFTPClientFCreateLocalFile(Sender: TObject;
  const LocalFileName, RemoteFileName: String; Attrs: TScSFTPFileAttributes;
  var Handle: NativeUInt);
var
  dwFlags: DWORD;
begin
  if aAttrs in Attrs.ValidAttributes then
  begin
    dwFlags := 0;
    if faReadonly in Attrs.Attrs then
      dwFlags := dwFlags or FILE_ATTRIBUTE_READONLY;
    if faSystem in Attrs.Attrs then
      dwFlags := dwFlags or FILE_ATTRIBUTE_SYSTEM;
    if faHidden in Attrs.Attrs then
      dwFlags := dwFlags or FILE_ATTRIBUTE_HIDDEN;
    if faArchive in Attrs.Attrs then
      dwFlags := dwFlags or FILE_ATTRIBUTE_ARCHIVE;
    if faCompressed in Attrs.Attrs then
      dwFlags := dwFlags or FILE_ATTRIBUTE_COMPRESSED;
  end
  else
    dwFlags := FILE_ATTRIBUTE_NORMAL;

  Handle := CreateFile(PChar(LocalFileName),
    GENERIC_READ or GENERIC_WRITE, 0, nil, CREATE_NEW, dwFlags, 0);
end;

procedure TSFTPFrame.ScSFTPClientFDirectoryList(Sender: TObject;
  const Path: String; const Handle: TArray<System.Byte>;
  FileInfo: TScSFTPFileInfo; EOF: Boolean);
var
  Node: TTreeNode;
begin
  if (FileInfo = nil) or (FileInfo.Filename = '.') then
    Exit;

  Node := FileView.Items.Add(nil, '');
  if FileInfo.Filename = '..' then
  begin
    Node.ImageIndex := 2;
    Node.SelectedIndex := 2;
  end
  else if (Length(FileInfo.Longname) > 0) and (FileInfo.Longname[1] = 'd') then
  begin
    Node.ImageIndex := 1;
    Node.SelectedIndex := 1;
  end;

  Node.Text := FileInfo.Filename; // for sorting
  FileList.Append(FileInfo.Filename);

end;

procedure TSFTPFrame.ScSFTPClientFDisconnect(Sender: TObject);
begin
  FileView.Enabled := False;
end;

procedure TSFTPFrame.ScSSHClientFAfterConnect(Sender: TObject);
begin
  ShowSSHButtons(True);
//  if not Assigned(FileList) then
  FileList := TStringList.Create;
end;

procedure TSFTPFrame.ScSSHClientFAfterDisconnect(Sender: TObject);
begin
  ShowSSHButtons(False);
  DisconnectSFTP;
  if Assigned(FileList) then FileList.Free;
end;

procedure TSFTPFrame.ScSSHClientFServerKeyValidate(Sender: TObject;
  NewServerKey: TScKey; var Accept: Boolean);
var
  CurHostKeyName: String;
begin
  if ScSSHClientF.HostKeyName = '' then
    CurHostKeyName := ScSSHClientF.HostName
  else
    CurHostKeyName := ScSSHClientF.HostKeyName;

  DoServerKeyValidate(ScFileStorageF, CurHostKeyName, NewServerKey, Accept);
end;

procedure TSFTPFrame.ShowPasswordBtnClick(Sender: TObject);
begin
  if PasswordEdit.PasswordChar = '.' then
  begin
    PasswordEdit.PasswordChar := #0;
  end
  else
  begin
    PasswordEdit.PasswordChar := '.';
  end;
end;

procedure TSFTPFrame.ShowSFTPButtons(Connected: Boolean);
begin
  aStartSFTP.Enabled := not Connected and ScSSHClientF.Connected;
  aStopSFTP.Enabled := Connected;
  aUpload.Enabled := Connected;
  aDownload.Enabled := Connected;
  aViewFile.Enabled := Connected;
  aMakeDir.Enabled := Connected;
  aRemove.Enabled := Connected;
  aRename.Enabled := Connected;
  aChgDir.Enabled := Connected;
  aDirUpLvl.Enabled := Connected;
end;

procedure TSFTPFrame.ShowSSHButtons(Connected: Boolean);
begin
  aConnectSSH.Enabled := not Connected;
  aDisconnectSSH.Enabled := Connected;
  aStartSFTP.Enabled := Connected;
end;

procedure TSFTPFrame.LoadConnectionFile(FileName: String);
var
  RegIniFile: TIniFile;
begin
  RegIniFile := TIniFile.Create(FileName);
  try
    HostNameEdit.Text := RegIniFile.ReadString('SavedUser-Section', 'SSHHost', 'LocalHost');
    UserNameEdit.Text := RegIniFile.ReadString('SavedUser-Section', 'SSHUserName', 'user');
    PasswordEdit.Text := TNetEncoding.Base64.Decode(RegIniFile.ReadString('SavedUser-Section', 'SSHPassword', 'none'));
  finally
    RegIniFile.Free;
  end;
end;

procedure TSFTPFrame.SaveConnectionFile(FileName: String);
var
  RegIniFile: TIniFile;
begin
  RegIniFile := TIniFile.Create(FileName);
  try
    RegIniFile.WriteString('SavedUser-Section', 'SSHHost', HostNameEdit.Text);
    RegIniFile.WriteString('SavedUser-Section', 'SSHUserName', UserNameEdit.Text);
    RegIniFile.WriteString('SavedUser-Section', 'SSHPassword', TNetEncoding.Base64.Encode(PasswordEdit.Text));
  finally
    RegIniFile.Free;
  end;
end;

end.
