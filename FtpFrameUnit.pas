unit FtpFrameUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.StdCtrls, System.ImageList, Vcl.ImgList, OverbyteIcsWndControl, OverbyteIcsFtpSrvT,
  OverbyteIcsFtpCli, Vcl.ComCtrls, System.Actions, Vcl.ActnList, System.RegularExpressions,
  Vcl.Buttons, Vcl.ToolWin, JvExComCtrls, JvToolBar, Vcl.Menus, JvProgressBar, Math;

type
  TFtpFrame = class(TFrame)
    BottomPanel: TPanel;
    InfoMemo: TMemo;
    FileView: TTreeView;
    FtpClient: TFtpClient;
    ImageList: TImageList;
    MiddlePanel: TPanel;
    ConnectBtn: TButton;
    DisconnectBtn: TButton;
    DownloadBtn: TButton;
    SaveDialog: TSaveDialog;
    OpenDialog: TOpenDialog;
    UploadBtn: TButton;
    FtpFrameActionList: TActionList;
    aConnect: TAction;
    aDisconnect: TAction;
    aDownload: TAction;
    aUpload: TAction;
    aCDup: TAction;
    HostNameEdit: TEdit;
    UsernameEdit: TEdit;
    PasswordEdit: TEdit;
    ShowPwdBtn: TButton;
    DirEdit: TEdit;
    PageControl: TPageControl;
    LogTabSheet: TTabSheet;
    DirectoryTabSheet: TTabSheet;
    aRemove: TAction;
    RemoveBtn: TButton;
    aMakeDir: TAction;
    MkdEdit: TEdit;
    MkdirBtn: TButton;
    DirPanel: TPanel;
    DirSplitter: TSplitter;
    DirUpLvlSpdBtn: TSpeedButton;
    JvToolBar: TJvToolBar;
    FileToolButton: TToolButton;
    ActionToolButton: TToolButton;
    MiscToolButton: TToolButton;
    TopPanel: TPanel;
    ActionPopupMenu: TPopupMenu;
    pmiUpload: TMenuItem;
    pmiDownload: TMenuItem;
    N1: TMenuItem;
    pmiMakeDir: TMenuItem;
    pmiCDup: TMenuItem;
    pmiRemove: TMenuItem;
    pmiRename: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    FilePopupMenu: TPopupMenu;
    pmiLoadSectionUpdate: TMenuItem;
    pmiSelectFile: TMenuItem;
    pmiSaveSectionUpdate: TMenuItem;
    aLoadSectionUpdate: TAction;
    aSelectFile: TAction;
    aSaveSectionUpdate: TAction;
    MiscPopupMenu: TPopupMenu;
    pmiInfoMemo: TMenuItem;
    aInfoMemo: TAction;
    pmiConnect: TMenuItem;
    pmiDisconnect: TMenuItem;
    aRename: TAction;
    XferProgressBar: TJvProgressBar;
    pmiTest: TMenuItem;
    aTest: TAction;
    FileSizeListBox: TListBox;
    procedure FtpClientSessionConnected(Sender: TObject; ErrCode: Word);
    procedure FtpClientSessionClosed(Sender: TObject; ErrCode: Word);
    procedure FtpClientDisplay(Sender: TObject; var Msg: string);
    procedure FtpClientRequestDone(Sender: TObject; RqType: TFtpRequest;
      ErrCode: Word);
    procedure DisplayFile(FileName: String);
    procedure FileViewDblClick(Sender: TObject);
    procedure aConnectExecute(Sender: TObject);
    procedure aDisconnectExecute(Sender: TObject);
    procedure aDownloadExecute(Sender: TObject);
    procedure aUploadExecute(Sender: TObject);
    procedure aCDupExecute(Sender: TObject);
    procedure ShowPwdBtnClick(Sender: TObject);
    procedure aRemoveExecute(Sender: TObject);
    procedure aMakeDirExecute(Sender: TObject);
    procedure MkdEditChange(Sender: TObject);
    procedure DirUpLvlSpdBtnClick(Sender: TObject);
    procedure LoadConnectionFile(FileName: String);
    procedure SaveConnectionFile(FileName: String);
    procedure aLoadSectionUpdateExecute(Sender: TObject);
    procedure SetDtaDir(DtaDirIn: String);
    procedure SetTmpDir(TmpDirIn: String);
    procedure aSelectFileExecute(Sender: TObject);
    procedure aSaveSectionUpdateExecute(Sender: TObject);
    procedure aInfoMemoExecute(Sender: TObject);
    procedure aRenameExecute(Sender: TObject);
    procedure FtpClientProgress64(Sender: TObject; Count: Int64;
      var Abort: Boolean);
    procedure aTestExecute(Sender: TObject);
    procedure FileViewMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    FLastProgress: Int64;
    FProgressCount: TFtpBigInt;
    FOkToUpdateProgressBar: Boolean;
    FFileSize: Int64;
    function GetSelectedNode: TTreeNode;
    function GetRootDir: String;
    procedure OpenDir(NewDir: string);
    procedure DisplayFtpServerFileList;
    procedure DirUpLvl;
    procedure CheckMkdEdit;
    procedure LoadSectionUpdate(SectionUpdateFilename: String);
    procedure SaveSectionUpdate(SectionUpdateFilename: String);
    function GetNodeIndex(NodeToIndex: TTreeNode): Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

const
  TEMP_FILE_NAME = 'FTPDIR.TXT';

var
  FFUTmpDir: String;

implementation

uses
  IniFiles, NetEncoding, SelectFileUnit, ShellApi, IMUnit, IOUtils, System.RegularExpressionsCore;

const
  SNoFilesSelected = 'No files selected!';

var
  lclDtaDir, lclTmpDir: String;

{$R *.dfm}

procedure PopMenuAtCursor(const pMenu: TPopupMenu);
var
  pt: TPoint;
begin
  if GetCursorPos(pt) then
  begin
    pMenu.Popup(pt.x, pt.y);
  end;
end;

procedure TFTPFrame.SetDtaDir(DtaDirIn: String);
begin
  lclDtaDir := DtaDirIn;
end;

procedure TFTPFrame.SetTmpDir(TmpDirIn: String);
begin
  lclTmpDir := TmpDirIn;
end;

procedure TFtpFrame.aConnectExecute(Sender: TObject);
var
  TmpDir: String;
begin
  FtpClient.HostName := HostNameEdit.Text;
  FtpClient.UserName := UsernameEdit.Text;
  FtpClient.PassWord := PasswordEdit.Text;
  FtpClient.HostDirName := '';
  TmpDir := DirEdit.Text;
  FOkToUpdateProgressBar := False;
  FtpClient.Connect;
  OpenDir(TmpDir);
end;

procedure TFtpFrame.aCDupExecute(Sender: TObject);
begin
  FtpClient.CDup;
  FtpClient.Pwd;
  DirEdit.Text := FtpClient.DirResult;
  DisplayFtpServerFileList;
end;

procedure TFtpFrame.aDisconnectExecute(Sender: TObject);
begin
  FtpClient.Quit;
end;

procedure TFtpFrame.aDownloadExecute(Sender: TObject);
var
  Node: TTreeNode;
begin
  aDownload.Enabled := False;
  Node := GetSelectedNode;
  if (Node = nil) or (Node.ImageIndex <> 0) then
  begin
    MessageDlg('No file selected', mtWarning, [mbOk], 0);
    aDownload.Enabled := True;
    Exit;
  end;
  SaveDialog.Options := SaveDialog.Options + [ofOverwritePrompt];
  SaveDialog.Title := 'Download file';
  SaveDialog.Filter := 'All files (*.*)|*.*';
  SaveDialog.FileName := Node.Text;
  try
    if SaveDialog.Execute then
    begin
      FLastProgress := 0;
      FProgressCount := 0;
      if FileExists(SaveDialog.FileName) then DeleteFile(SaveDialog.FileName);
      FtpClient.HostDirName := DirEdit.Text;
      FtpClient.HostFileName := Node.Text;
      XferProgressBar.Position := 0;
//      XferProgressBar.Max := StrToInt(FileSizeListBox.Items[GetNodeIndex(Node)]);
      FFileSize := StrToInt64(FileSizeListBox.Items[GetNodeIndex(Node)]);
      XferProgressBar.Max := 100;
      FOkToUpdateProgressBar := True;
      FtpClient.LocalFileName := SaveDialog.FileName;
      FtpClient.Get;
      FtpClient.LocalFileName := '';
    end;
  finally
    aDownload.Enabled := True;
  end;
end;

procedure TFtpFrame.aInfoMemoExecute(Sender: TObject);
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
      InfoMemoForm.Position := poDesktopCenter;
    end;
  end;
  InfoMemoForm.Show;
end;

procedure TFtpFrame.aLoadSectionUpdateExecute(Sender: TObject);
begin
  OpenDialog.Title := 'Select Section-Update File';
  OpenDialog.InitialDir := lclDtaDir;
  OpenDialog.DefaultExt := '.ini';
  OpenDialog.Filter := 'Ini Files (*.ini)|*.INI|All Files (*.*)|*.*';
  if OpenDialog.Execute then LoadSectionUpdate(OpenDialog.FileName);
end;

procedure TFTPFrame.LoadSectionUpdate(SectionUpdateFilename: String);
var
  RegIniFile: TIniFile;
begin
  RegIniFile := TIniFile.Create(SectionUpdateFilename);
  try
    HostNameEdit.Text := RegIniFile.ReadString('Section-Update', 'FtpHostName', '');
    UserNameEdit.Text := RegIniFile.ReadString('Section-Update', 'FtpUserName', '');
    PasswordEdit.Text := RegIniFile.ReadString('Section-Update', 'FtpPassWord', '');
    DirEdit.Text := RegIniFile.ReadString('Section-Update', 'IniDir', '');
  finally
    RegIniFile.Free;
  end;
end;

procedure TFtpFrame.aMakeDirExecute(Sender: TObject);
begin
  if DirEdit.Text = '/' then
  begin
    FtpClient.HostFileName := MkdEdit.Text; // For directory name
  end
  else
  begin
    FtpClient.HostFileName := DirEdit.Text + '/' + MkdEdit.Text; // For directory name
  end;
  FtpClient.Mkd;
  FtpClient.HostFileName := '';
  OpenDir(DirEdit.Text);
end;

procedure TFtpFrame.aRemoveExecute(Sender: TObject);
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
      if MessageDlg(Format(DEL_MSG, ['file', Node.Text]), mtConfirmation, [mbOk, mbCancel], 0) = mrOk then
      begin
        FtpClient.HostFileName := GetRootDir + Node.Text;
        FtpClient.Dele;
        FtpClient.HostFileName := '';
        OpenDir(DirEdit.Text);
      end;
    end;
    1: begin
      if MessageDlg(Format(DEL_MSG, ['directory', Node.Text +  ' and all its contents']), mtConfirmation, [mbOk, mbCancel], 0) = mrOk then begin
        try
          FtpClient.HostFileName := GetRootDir + Node.Text;
          InfoMemo.Lines.Append(GetRootDir + Node.Text);
          FtpClient.Rmd;
          FtpClient.HostFileName := '';
        finally
          OpenDir(DirEdit.Text);
        end;
      end;
    end;
  end;
end;

procedure TFtpFrame.aRenameExecute(Sender: TObject);
var
  Node: TTreeNode;
begin
  Node := GetSelectedNode;
  if Node = nil then Exit;
  case Node.ImageIndex of
    0: begin // File

       end;
    1: begin // Directory
         FtpClient.HostDirName := DirEdit.Text;            // Base directory
         FtpClient.HostFileName := GetRootDir + Node.Text; // Old name
         FtpClient.LocalFileName := MkdEdit.Text;          // New name
         FtpClient.Ren;                                    // Rename
         FtpClient.HostFileName := '';                     // Set name to blank for OpenDir
         OpenDir(DirEdit.Text);                            // Show remote directory
       end;
    2: begin // ..

       end;
  end;
end;

procedure TFtpFrame.aSaveSectionUpdateExecute(Sender: TObject);
begin
  SaveDialog.Title := 'Save Section-Update File';
  SaveDialog.InitialDir := lclDtaDir;
  SaveDialog.DefaultExt := '.ini';
  SaveDialog.Filter := 'Ini Files (*.ini)|*.INI|All Files (*.*)|*.*';
  SaveDialog.FileName := 'Section-Update.INI';
  if SaveDialog.Execute then
  begin
    SaveSectionUpdate(SaveDialog.FileName);
    InfoMemoForm.InfoMemo.Lines.Append(SaveDialog.FileName);
  end;
end;

procedure TFTPFrame.SaveSectionUpdate(SectionUpdateFilename: String);
var
  RegIniFile: TIniFile;
begin
  RegIniFile := TIniFile.Create(SectionUpdateFilename);
  try
    RegIniFile.WriteString('Section-Update', 'FtpHostName', HostNameEdit.Text);
    RegIniFile.WriteString('Section-Update', 'FtpUserName', UserNameEdit.Text);
    RegIniFile.WriteString('Section-Update', 'FtpPassWord', PasswordEdit.Text);
    RegIniFile.WriteString('Section-Update', 'IniDir', DirEdit.Text);
  finally
    RegIniFile.Free;
  end;
end;

procedure TFtpFrame.aSelectFileExecute(Sender: TObject);
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

function TFtpFrame.GetNodeIndex(NodeToIndex: TTreeNode): Integer;
var
  Node: TTreeNode;
  i: Integer;
begin
  Result := -1;
  for i := 0 to FileView.Items.Count-1 do
  begin
    if FileView.Items[i] = NodeToIndex then
    begin
      Result := i + 1;
      Exit;
    end;
  end;
end;

procedure TFtpFrame.aTestExecute(Sender: TObject);
var
//  TmpMax, TmpPos: Int64;
  Node: TTreeNode;
begin
{
  XferProgressBar.Min := 0;
  TmpMax := 1048576000;
  XferProgressBar.Max := TmpMax;
  TmpPos := 524288000;
  XferProgressBar.Position := TmpPos;
}
  Node := GetSelectedNode;
  if (Node = nil) or (Node.ImageIndex <> 0) then
  begin
    MessageDlg('No file selected', mtWarning, [mbOk], 0);
    Exit;
  end;

  InfoMemoForm.InfoMemo.Lines.Append('');
  InfoMemoForm.InfoMemo.Lines.Append(FileSizeListBox.Items[GetNodeIndex(Node)]);

//  FtpClient.HostDirName := DirEdit.Text;
//  FtpClient.HostFileName := Node.Text;
//  FtpClient.FileSize;

  InfoMemoForm.InfoMemo.Lines.Append('');
  InfoMemoForm.InfoMemo.Lines.Append('DirEdit.Text = ' + DirEdit.Text);
  InfoMemoForm.InfoMemo.Lines.Append('Node.Text = ' + Node.Text);
  InfoMemoForm.InfoMemo.Lines.Append(FileSizeListBox.Items[GetNodeIndex(Node)]);
//  InfoMemoForm.InfoMemo.Lines.Append('SizeResult = ' + IntToStr(FtpClient.SizeResult));
//  XferProgressBar.Max := FtpClient.SizeResult;

//  FtpClient.HostFileName := '';

end;

procedure TFtpFrame.aUploadExecute(Sender: TObject);
begin
  aUpload.Enabled := False;
  OpenDialog.Title := 'Upload file';
  OpenDialog.Filter := 'All files (*.*)|*.*';
  if OpenDialog.Execute then
  begin
    FtpClient.HostDirName := DirEdit.Text;
    FtpClient.HostFileName := ExtractFileName(OpenDialog.FileName);
    FtpClient.LocalFileName := OpenDialog.FileName;
    FtpClient.Passive := True;

    XferProgressBar.Position := 0;
    XferProgressBar.Max := 100;
    FFileSize := IOUtils.TFile.GetSize(OpenDialog.FileName);
    FOkToUpdateProgressBar := True;

    FtpClient.Put;
    FtpClient.HostFileName := '';
    DisplayFtpServerFileList;
  end;
  aUpload.Enabled := True;
end;

procedure TFtpFrame.ShowPwdBtnClick(Sender: TObject);
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

function TFtpFrame.GetSelectedNode: TTreeNode;
begin
  Result := nil;
  if FileView.Items.Count = 0 then Exit;
  Result := FileView.Selected;
  if Result = nil then Result := FileView.Items[0];
end;

procedure TFtpFrame.MkdEditChange(Sender: TObject);
begin
  CheckMkdEdit;
end;

function TFtpFrame.GetRootDir: String;
begin
  Result := DirEdit.Text;
  if IsDelimiter('/', Result, Length(Result)) and (Result[Length(Result)] = '/') then Exit;
  if IsDelimiter('\', Result, Length(Result)) and (Result[Length(Result)] = '\') then Exit;
  Result := Result + '/';
end;

procedure TFtpFrame.OpenDir(NewDir: string);
begin
  FtpClient.HostDirName := NewDir;
  FtpClient.Cwd;
  FtpClient.Pwd;
  DirEdit.Text := FtpClient.DirResult;
  DisplayFtpServerFileList;
end;

procedure TFtpFrame.DisplayFtpServerFileList;
begin
  DeleteFile(FFUTmpDir + TEMP_FILE_NAME);
  FtpClient.LocalFileName := FFUTmpDir + TEMP_FILE_NAME;
  FtpClient.Dir;
end;

procedure TFtpFrame.DirUpLvl;
begin
  FtpClient.CDup;
  FtpClient.Pwd;
  DirEdit.Text := FtpClient.DirResult;
  DisplayFtpServerFileList;
end;

procedure TFtpFrame.CheckMkdEdit;
begin
  if TRegEx.IsMatch(MkdEdit.Text, '\A[\w%.~-]{1,63}\z') then
  begin
    aMakeDir.Enabled := True;
  end
  else
  begin
    aMakeDir.Enabled := False;
  end;
end;

procedure TFtpFrame.DirUpLvlSpdBtnClick(Sender: TObject);
begin
  DirUpLvl;
end;

procedure TFtpFrame.FileViewDblClick(Sender: TObject);
var
  Node: TTreeNode;
begin
  Node := GetSelectedNode;
  if Node = nil then Exit;

  case Node.ImageIndex of
//    0: btViewFileClick(Sender);
    1: OpenDir(GetRootDir + Node.Text);
    2: DirUpLvl;
  end;
end;

procedure TFtpFrame.FileViewMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbRight then
  begin
    var TreeNode := FileView.GetNodeAt(X, Y);
    if Assigned(TreeNode) then TreeNode.Selected := True;
    PopMenuAtCursor(ActionPopupMenu);
  end;
end;

procedure TFtpFrame.FtpClientDisplay(Sender: TObject; var Msg: string);
begin
  InfoMemo.Lines.Append(Msg);
end;

procedure TFtpFrame.FtpClientProgress64(Sender: TObject; Count: Int64;
  var Abort: Boolean);
begin
  FProgressCount := Count;
  { Be sure to update screen only once every second }
  if FLastProgress < GetTickCount then
  begin
    FLastProgress := GetTickCount + 100;
    if FOkToUpdateProgressBar then
    begin
      InfoMemoForm.InfoMemo.Lines.Append(IntToStr(FProgressCount));
      InfoMemoForm.InfoMemo.Lines.Append(IntToStr((FProgressCount * 100) div FFileSize) + '%');
      XferProgressBar.Position := (FProgressCount * 100) div FFileSize;
    end;
    Application.ProcessMessages;
  end;
end;

procedure TFtpFrame.FtpClientRequestDone(Sender: TObject; RqType: TFtpRequest; ErrCode: Word);
begin
  if ErrCode = 0 then
  begin
    case RqType of
      ftpDirAsync,
      ftpDirectoryAsync,
      ftpLsAsync,
      ftpListAsync,
      ftpMlsdAsync,
      ftpSiteCmlsdAsync,
      ftpXCmlsdAsync,
      ftpXDmlsdAsync,
      ftpSiteDmlsdAsync,
      ftpSiteIndexAsync: DisplayFile(FFUTmpDir + TEMP_FILE_NAME);
      ftpConnectAsync: begin
                         FtpClient.Pwd;
                         DirEdit.Text := FtpClient.DirResult;
                         DisplayFtpServerFileList;
                       end;
      ftpPutAsync: begin
                     InfoMemo.Lines.Append('ftpPutAsync');
                     FOkToUpdateProgressBar := False;
                     XferProgressBar.Position := XferProgressBar.Max;
                   end;
      ftpGetAsync: begin
                     InfoMemo.Lines.Append('ftpGetAsync');
                     FOkToUpdateProgressBar := False;
                     XferProgressBar.Position := XferProgressBar.Max;
                   end;
    end;
    InfoMemo.Lines.Append('RqType: ' + IntToStr(Ord(RqType)));
  end;
end;

procedure TFtpFrame.FtpClientSessionClosed(Sender: TObject; ErrCode: Word);
begin
  FileView.Items.Clear;
  DirEdit.Text := '';
  aConnect.Enabled := True;
  aDisconnect.Enabled := False;
  HostNameEdit.Enabled := True;
  UsernameEdit.Enabled := True;
  PasswordEdit.Enabled := True;
  aDownload.Enabled := False;
  aUpload.Enabled := False;
  aMakeDir.Enabled := False;
  MkdEdit.ReadOnly := True;
  aMakeDir.Enabled := False;
  aCDup.Enabled := False;
  aRemove.Enabled := False;
end;

procedure TFtpFrame.FtpClientSessionConnected(Sender: TObject; ErrCode: Word);
begin
  aDisconnect.Enabled := True;
  aConnect.Enabled := False;
  HostNameEdit.Enabled := False;
  UsernameEdit.Enabled := False;
  PasswordEdit.Enabled := False;
  aDownload.Enabled := True;
  aUpload.Enabled := True;
  CheckMkdEdit;
  MkdEdit.ReadOnly := False;
  aMakeDir.Enabled := True;
  aCDup.Enabled := True;
  aRemove.Enabled := True;
end;

procedure TFtpFrame.DisplayFile(FileName: String);
var
  Node: TTreeNode;
  FileList: TStringList;
  i: Integer;
	RegexObj: TRegEx;
	MatchResults: TMatch;
	GroupObj: TGroup;
  RegExFileName: String;
begin
  FileView.Items.Clear;
  FileSizeListBox.Clear;
  FileList := TStringList.Create;
  FileList.LoadFromFile(FileName);

  try
    RegexObj := TRegEx.Create(
      '^(?<Directory>[d-])[r-][w-][x-][r-][w-][x-][r-][w-][x-] +[\da-z]+ (?<Owner>[\da-z]+) +(?<Group>[\da-z]+) +(?<FileSize>[0-9]+) +(?:Feb\h+(?:[12][0-9]|0?[1-9])|(?:Apr|Jun|Sep|Nov)\h+(?:30|[12][0-9]|0?[1-9])|(?:Jan|Mar|May|Jul|Aug|Oct|Dec)\h+(?:3[01]|[12][0-' +
      '9]|0?[1-9])) +(?:(?:2[0-3]|[01][0-9])[:.][0-5][0-9]|[0-9]{4}) +(?<FileName>[]\d\t !"#$%&''()*+,./:;<=>?@[\\_`a-z{|}~^-]+)$',
      [roIgnoreCase, roMultiLine]);
    MatchResults := RegexObj.Match(FileList.Text);
    while MatchResults.Success do
    begin
      FileSizeListBox.Items.Append(MatchResults.Groups['FileSize'].Value);
      RegExFileName := MatchResults.Groups['FileName'].Value;
      if RegExFileName <> '.' then
      begin
        Node := FileView.Items.Add(nil, '');
        if RegExFileName = '..' then
        begin
          Node.ImageIndex := 2;
          Node.SelectedIndex := 2;
        end
        else if MatchResults.Groups['Directory'].Value = 'd' then
        begin
          Node.ImageIndex := 1;
          Node.SelectedIndex := 1;
        end;
        Node.Text := RegExFileName; // for sorting
      end;
      MatchResults := MatchResults.NextMatch();
    end;
  except
    on E: ERegularExpressionError do
    begin
      // Syntax error in the regular expression
    end;
  end;
{
  for i := 0 to FileList.Count - 1 do
  begin
    FileSizeListBox.Items.Append(Trim(Copy(FileList[i], 29, 12)));
    if Copy(FileList[i], 55) <> '.' then
    begin
      Node := FileView.Items.Add(nil, '');
      if Copy(FileList[i], 55) = '..' then
      begin
        Node.ImageIndex := 2;
        Node.SelectedIndex := 2;
      end
      else if Pos('d', FileList[i]) = 1 then
      begin
        Node.ImageIndex := 1;
        Node.SelectedIndex := 1;
      end;
      Node.Text := Copy(FileList[i], 55); // for sorting
    end;
  end;
}
  FileList.Free;
end;

procedure TFtpFrame.LoadConnectionFile(FileName: String);
var
  RegIniFile: TIniFile;
begin
  RegIniFile := TIniFile.Create(FileName);
  try
    HostNameEdit.Text := RegIniFile.ReadString('SavedUser-Section', 'FTPHost', 'LocalHost');
    UserNameEdit.Text := RegIniFile.ReadString('SavedUser-Section', 'FTPUserName', 'user');
    PasswordEdit.Text := TNetEncoding.Base64.Decode(RegIniFile.ReadString('SavedUser-Section', 'FTPPassword', 'bm9uZQ=='));
  finally
    RegIniFile.Free;
  end;
end;

procedure TFtpFrame.SaveConnectionFile(FileName: String);
var
  RegIniFile: TIniFile;
begin
  RegIniFile := TIniFile.Create(FileName);
  try
    RegIniFile.WriteString('SavedUser-Section', 'FTPHost', HostNameEdit.Text);
    RegIniFile.WriteString('SavedUser-Section', 'FTPUserName', UserNameEdit.Text);
    RegIniFile.WriteString('SavedUser-Section', 'FTPPassword', TNetEncoding.Base64.Encode(PasswordEdit.Text));
  finally
    RegIniFile.Free;
  end;
end;

end.
