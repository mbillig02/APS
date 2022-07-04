unit MFUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, VirtualTrees,
  JvComponentBase, JvBalloonHint, UtlUnit, Menus, About, ActnList,
  System.Actions, System.UITypes, Themes, MruUnit, comp.reticle,
  Vcl.Samples.Spin, Data.DB, Vcl.Grids, Vcl.DBGrids, JvDataSource, JvCsvData,
  Vcl.DBCtrls;

const
  PgmName = 'APS';
  PgmIni = PgmName + '.INI';
  DtaDirLoc = 'PublicDocs'; // ['MyDocs', 'PublicDocs', 'AppDataRoaming', 'AppDataLocal', 'AppDataCommon']

type
  TTopLeftHeightWidth = record
    Top: Integer;
    Left: Integer;
    Height: Integer;
    Width: Integer;
  end;
  TMainForm = class(TForm)
    aCopyDtaDirPathToClipboard: TAction;
    aCopyTmpDirPathToClipboard: TAction;
    ActionList: TActionList;
    aExit: TAction;
    aOpenDtaDirInExplorer: TAction;
    aOpenTmpDirInExplorer: TAction;
    aSettings: TAction;
    mmiExit: TMenuItem;
    MainMenu: TMainMenu;
    mmiCopyDtaDirPathToClipboard: TMenuItem;
    mmiCopyTmpDirPathToClipboard: TMenuItem;
    mmiFile: TMenuItem;
    mmiOpenDtaDirInExplorer: TMenuItem;
    mmiOpenTmpDirInExplorer: TMenuItem;
    mmiSettings: TMenuItem;
    mmiStyles: TMenuItem;
    mmiVersionAbout: TMenuItem;
    MostRecentFiles: TMostRecentFiles;
    N1: TMenuItem;
    N2: TMenuItem;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    aLoadListFile: TAction;
    aSaveListFile: TAction;
    aSelectListFile: TAction;
    mmiSelectListFile: TMenuItem;
    mmiLoadListFile: TMenuItem;
    mmiSaveListFile: TMenuItem;
    aOpenLstDirInExplorer: TAction;
    aCopyLstDirPathToClipboard: TAction;
    mmiOpenLstDirInExplorer: TMenuItem;
    mmiCopyLstDirPathToClipboard: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    LeftLbl: TLabel;
    TopLbl: TLabel;
    WidthLbl: TLabel;
    HeightLbl: TLabel;
    GetBtn: TButton;
    LeftSpinEdit: TSpinEdit;
    TopSpinEdit: TSpinEdit;
    WidthSpinEdit: TSpinEdit;
    HeightSpinEdit: TSpinEdit;
    SetBtn: TButton;
    WindowReticle: TWindowReticle;
    JvCsvDataSet: TJvCsvDataSet;
    JvDataSource: TJvDataSource;
    DBGrid: TDBGrid;
    OpenBtn: TButton;
    CloseBtn: TButton;
    ToDBBtn: TButton;
    DBNavigator: TDBNavigator;
    FromDBBtn: TButton;
    BottomPanel: TPanel;
    LeftPanel: TPanel;
    RightPanel: TPanel;
    RightBottomPanel: TPanel;
    WindowNameEdit: TEdit;
    aGetAppPosAndSize: TAction;
    aSetAppPosAndSize: TAction;
    aOpenDB: TAction;
    aCloseDB: TAction;
    aFromDB: TAction;
    aToDB: TAction;
    FileNameEdit: TEdit;
    InfoMemo: TMemo;
    aFullScreen: TAction;
    mmiBounds: TMenuItem;
    mmiFullScreen: TMenuItem;
    a1of4: TAction;
    mmi1of4: TMenuItem;
    a2of4: TAction;
    a3of4: TAction;
    a4of4: TAction;
    mmi2of4: TMenuItem;
    mmi3of4: TMenuItem;
    mmi4of4: TMenuItem;
    a90Percent: TAction;
    mmi90Percent: TMenuItem;
    a95Percent: TAction;
    mmi95Percent: TMenuItem;
    N5: TMenuItem;
    aFullMinus5: TAction;
    mmiFullMinus5: TMenuItem;
    mmiRestartElevated: TMenuItem;
    N6: TMenuItem;
    aRestartElevated: TAction;
    mmiScreenQuarters1: TMenuItem;
    aCenterInScreen: TAction;
    aCenterInScreen1: TMenuItem;
    a75Percent: TAction;
    mmi75Percent: TMenuItem;
    mmiScreenPercents: TMenuItem;
    aAllAppsToCSV: TAction;
    mmiAllAppsToCSV: TMenuItem;
    N7: TMenuItem;
    function GetDtaDir: String;
    function GetLstDir: String;
    function GetServiceListFileName: String;
    function GetTmpDir: String;
    procedure aCopyDtaDirPathToClipboardExecute(Sender: TObject);
    procedure aCopyLstDirPathToClipboardExecute(Sender: TObject);
    procedure aCopyTmpDirPathToClipboardExecute(Sender: TObject);
    procedure aExitExecute(Sender: TObject);
    procedure aLoadListFileExecute(Sender: TObject);
    procedure aOpenDtaDirInExplorerExecute(Sender: TObject);
    procedure aOpenLstDirInExplorerExecute(Sender: TObject);
    procedure aOpenTmpDirInExplorerExecute(Sender: TObject);
    procedure aSaveListFileExecute(Sender: TObject);
    procedure aSelectListFileExecute(Sender: TObject);
    procedure aSettingsExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure InfoMemoKeyPress(Sender: TObject; var Key: Char);
    procedure mmiVersionAboutClick(Sender: TObject);
    procedure MostRecentFilesMenuClick(Sender: TObject; const Filename: String);
    procedure RightMenu(mmiMoveRight: TMenuItem);
    procedure SetServiceListFileName(ServiceListFileName: String);
    procedure UpdateScrPosEdits;
    procedure WindowReticleWindowChange(Sender: TObject);
    procedure SetStayOnTopStatus;
    procedure FromDBBtnClick(Sender: TObject);
    procedure aGetAppPosAndSizeExecute(Sender: TObject);
    procedure aSetAppPosAndSizeExecute(Sender: TObject);
    procedure aOpenDBExecute(Sender: TObject);
    procedure aCloseDBExecute(Sender: TObject);
    procedure aFromDBExecute(Sender: TObject);
    procedure aToDBExecute(Sender: TObject);
    procedure aFullScreenExecute(Sender: TObject);
    procedure a1of4Execute(Sender: TObject);
    procedure a2of4Execute(Sender: TObject);
    procedure a3of4Execute(Sender: TObject);
    procedure a4of4Execute(Sender: TObject);
    procedure a90PercentExecute(Sender: TObject);
    procedure a95PercentExecute(Sender: TObject);
    procedure aFullMinus5Execute(Sender: TObject);
    procedure aRestartElevatedExecute(Sender: TObject);
    procedure aCenterInScreenExecute(Sender: TObject);
    procedure a75PercentExecute(Sender: TObject);
    procedure aAllAppsToCSVExecute(Sender: TObject);
  private
    function FindMenuItemByHint(AMainMenu: TMainMenu; const Hint: String): TMenuItem;
    function MatchingFileName(ListOfEditsText: String): String;
    procedure AddStylesToListBox;
    procedure AddStylesToMainMenu(StylesCaption: String);
    procedure CheckStyle(Menu: TMenuItem; StyleStr: String);
    procedure LoadListFile(FileName: String);
    procedure LoadSettingsFromFormActivate;
    procedure LoadSettingsFromFormCreate;
    procedure LoadSettingsLateFormActivate;
    procedure LoadStyleSettings;
    procedure mmiStylesClick(Sender: TObject);
    procedure OnMoving(var Msg: TWMMoving); message WM_MOVING;
    procedure OpenDirectory(DirectoryName: String);
    procedure RestoreMainFormPositionAndSize;
    procedure SaveSettings;
    procedure UnCheckStyles(Menu: TMenuItem);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;
  ExeDir, DtaDir, TmpDir, LstDir, PgmUpdDir, StyleStr: String;
  MainFormDefaultRect, MainFormRect: TTopLeftHeightWidth;
  SaveFormSize, SaveFormPosition, StylesMM, StylesEnabled, StayOnTopB: Boolean;

implementation

uses
  JclSecurity, ShellApi, ClipBrd, JclSysInfo, IniFiles,
  SelectFileUnit, SetUnit, JclAnsiStrings, System.IOUtils, Winapi.PsAPI;

var
  FInitialized: Boolean;
  FServiceListFileName: String;
  AppLst: TStringList;

{$R *.dfm}

procedure TMainForm.mmiVersionAboutClick(Sender: TObject);
var
  TmpBool: Boolean;
begin
  TmpBool := SettingsForm.StayOnTopCheckBox.Checked;
  SettingsForm.StayOnTopCheckBox.Checked := False;
  SetStayOnTopStatus;
  TAboutBox.Execute;
  SettingsForm.StayOnTopCheckBox.Checked := TmpBool;
  SetStayOnTopStatus;
end;

procedure TMainForm.MostRecentFilesMenuClick(Sender: TObject;
  const Filename: String);
begin
//  LoadListFile(FileName);
  FileNameEdit.Text := ExtractFileName(FileName);
end;

function TMainForm.GetServiceListFileName: String;
begin
  Result := FServiceListFileName;
end;

procedure TMainForm.SetServiceListFileName(ServiceListFileName: String);
begin
  FServiceListFileName := ServiceListFileName;
end;

function TMainForm.GetDtaDir: String;
begin
  Result := DtaDir;
end;

function TMainForm.GetLstDir: String;
begin
  Result := LstDir;
end;

function TMainForm.GetTmpDir: String;
begin
  Result := TmpDir;
end;

procedure TMainForm.InfoMemoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ^A then
  begin
    (Sender as TMemo).SelectAll;
    Key := #0;
  end;
end;

procedure TMainForm.a1of4Execute(Sender: TObject);
begin
  LeftSpinEdit.Value := 0;
  TopSpinEdit.Value := 0;
  WidthSpinEdit.Value := Screen.WorkAreaWidth div 2;
  HeightSpinEdit.Value := Screen.WorkAreaHeight div 2;
end;

procedure TMainForm.a2of4Execute(Sender: TObject);
begin
  LeftSpinEdit.Value := (Screen.WorkAreaWidth div 2) + 1;
  TopSpinEdit.Value := 0;
  WidthSpinEdit.Value := Screen.WorkAreaWidth div 2;
  HeightSpinEdit.Value := Screen.WorkAreaHeight div 2;
end;

procedure TMainForm.a3of4Execute(Sender: TObject);
begin
  LeftSpinEdit.Value := 0;
  TopSpinEdit.Value := (Screen.WorkAreaHeight div 2) + 1;
  WidthSpinEdit.Value := Screen.WorkAreaWidth div 2;
  HeightSpinEdit.Value := Screen.WorkAreaHeight div 2;
end;

procedure TMainForm.a4of4Execute(Sender: TObject);
begin
  LeftSpinEdit.Value := (Screen.WorkAreaWidth div 2) + 1;
  TopSpinEdit.Value := (Screen.WorkAreaHeight div 2) + 1;
  WidthSpinEdit.Value := Screen.WorkAreaWidth div 2;
  HeightSpinEdit.Value := Screen.WorkAreaHeight div 2;
end;

procedure TMainForm.a75PercentExecute(Sender: TObject);
begin
  LeftSpinEdit.Value := Screen.WorkAreaWidth div 8;
  TopSpinEdit.Value := Screen.WorkAreaHeight div 8;
  WidthSpinEdit.Value := (Screen.WorkAreaWidth div 4) * 3;
  HeightSpinEdit.Value := (Screen.WorkAreaHeight div 4) * 3;
end;

procedure TMainForm.a90PercentExecute(Sender: TObject);
begin
  LeftSpinEdit.Value := Screen.WorkAreaWidth div 20;
  TopSpinEdit.Value := Screen.WorkAreaHeight div 20;
  WidthSpinEdit.Value := Screen.WorkAreaWidth - (Screen.WorkAreaWidth div 10);
  HeightSpinEdit.Value := Screen.WorkAreaHeight - (Screen.WorkAreaHeight div 10);
end;

procedure TMainForm.a95PercentExecute(Sender: TObject);
begin
  LeftSpinEdit.Value := Screen.WorkAreaWidth div 40;
  TopSpinEdit.Value := Screen.WorkAreaHeight div 40;
  WidthSpinEdit.Value := Screen.WorkAreaWidth - (Screen.WorkAreaWidth div 20);
  HeightSpinEdit.Value := Screen.WorkAreaHeight - (Screen.WorkAreaHeight div 20);
end;

function GetPathFromPID(const PID: Cardinal): String;
var
  hProcess: THandle;
  TmpPath: array[0 .. MAX_PATH - 1] of char;
begin
  hProcess := OpenProcess(PROCESS_QUERY_INFORMATION or PROCESS_VM_READ, False, PID);
  if hProcess <> 0 then
    try
      if GetModuleFileNameEx(hProcess, 0, TmpPath, MAX_PATH) = 0 then RaiseLastOSError;
      Result := TmpPath;
    finally
      CloseHandle(hProcess)
    end
  else
    RaiseLastOSError;
end;

function EnumWindowsProc(AppHandle: HWND; lParam: LPARAM): BOOL; stdcall;
Const
  MAX_TEXT = MAX_PATH;
var
  AppTitleStr, AppClassStr: array[0 .. MAX_TEXT] of Char;
  AppPathStr: String;
  ProcId: Cardinal;
  IsVisible, IsOwned, IsAppWindow: Boolean;
  WindowRect: TRect;
begin
  Result := True;

  IsVisible := IsWindowVisible(AppHandle);
  if not IsVisible then exit;

  IsOwned := GetWindow(AppHandle, GW_OWNER) <> 0;
  if IsOwned then exit;

  IsAppWindow := GetWindowLongPtr(AppHandle, GWL_STYLE) and WS_EX_APPWINDOW <> 0;
  if not IsAppWindow then exit;

  GetWindowText(AppHandle, AppTitleStr, MAX_TEXT);
  GetClassName(AppHandle, AppClassStr, MAX_TEXT);
  GetWindowThreadProcessID(AppHandle, ProcId);

  try
    AppPathStr := GetPathFromPID(ProcId);
  except
    AppPathStr := '???';
  end;

  if AppClassStr <> 'ApplicationFrameWindow' then
  begin
//    AppLst.Append(IntToStr(ProcId) + ' | ' + AppClassStr + ' | ' + AppTitleStr + ' | ' + AppPathStr);
    GetWindowRect(AppHandle, WindowRect);
    AppLst.Append('"' + String(AppTitleStr) + '",' +
      IntToStr(WindowRect.Left) + ',' +
      IntToStr(WindowRect.Top) + ',' +
      IntToStr(WindowRect.Width) + ',' +
      IntToStr(WindowRect.Height) + ',');
  end;
end;

procedure TMainForm.aAllAppsToCSVExecute(Sender: TObject);
begin
  AppLst := TStringList.Create;
  AppLst.Clear;
  AppLst.Append('WindowName,Left,Top,Width,Height,Notes');
  EnumWindows(@EnumWindowsProc, 0);
  AppLst.SaveToFile(LstDir + 'AllApps.csv');
  AppLst.Free;
end;

procedure TMainForm.aCenterInScreenExecute(Sender: TObject);
var
  SelectedAppHandle: hwnd;
  WindowRect: TRect;
begin
  SelectedAppHandle := FindWindow(nil, PWideChar(WindowNameEdit.Text));
  if SelectedAppHandle <> 0 then
  begin
    GetWindowRect(SelectedAppHandle, WindowRect);
    LeftSpinEdit.Value := (Screen.WorkAreaWidth div 2) - (WindowRect.Width div 2);
    TopSpinEdit.Value :=  (Screen.WorkAreaHeight div 2) - (WindowRect.Height div 2);
    WidthSpinEdit.Value := WindowRect.Width;
    HeightSpinEdit.Value := WindowRect.Height;
  end;
end;

procedure TMainForm.aCloseDBExecute(Sender: TObject);
begin
  JvCsvDataSet.Close;
  aOpenDB.Enabled := True;
  aCloseDB.Enabled := False;
  aToDB.Enabled := False;
  aFromDB.Enabled := False;
end;

procedure TMainForm.aCopyDtaDirPathToClipboardExecute(Sender: TObject);
begin
  Clipboard.AsText := DtaDir;
end;

procedure TMainForm.aCopyLstDirPathToClipboardExecute(Sender: TObject);
begin
  Clipboard.AsText := LstDir;
end;

procedure TMainForm.aCopyTmpDirPathToClipboardExecute(Sender: TObject);
begin
  Clipboard.AsText := TmpDir;
end;

procedure TMainForm.aExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.aFromDBExecute(Sender: TObject);
begin
  WindowNameEdit.Text := JvCsvDataSet.FieldByName('WindowName').AsString;
  LeftSpinEdit.Value := JvCsvDataSet.FieldByName('Left').AsInteger;
  TopSpinEdit.Value := JvCsvDataSet.FieldByName('Top').AsInteger;
  WidthSpinEdit.Value := JvCsvDataSet.FieldByName('Width').AsInteger;
  HeightSpinEdit.Value := JvCsvDataSet.FieldByName('Height').AsInteger;
end;

procedure TMainForm.aFullMinus5Execute(Sender: TObject);
begin
  LeftSpinEdit.Value := Screen.WorkAreaLeft + 5;
  TopSpinEdit.Value := Screen.WorkAreaTop + 5;
  WidthSpinEdit.Value := Screen.WorkAreaWidth - 10;
  HeightSpinEdit.Value := Screen.WorkAreaHeight - 10;
end;

procedure TMainForm.aFullScreenExecute(Sender: TObject);
begin
  LeftSpinEdit.Value := Screen.WorkAreaLeft;
  TopSpinEdit.Value := Screen.WorkAreaTop;
  WidthSpinEdit.Value := Screen.WorkAreaWidth;
  HeightSpinEdit.Value := Screen.WorkAreaHeight;
end;

procedure TMainForm.aGetAppPosAndSizeExecute(Sender: TObject);
var
  SelectedAppHandle: hwnd;
  WindowRect: TRect;
begin
  SelectedAppHandle := FindWindow(nil, PWideChar(WindowNameEdit.Text));
  if SelectedAppHandle <> 0 then
  begin
    GetWindowRect(SelectedAppHandle, WindowRect);
    LeftSpinEdit.Value := WindowRect.Left;
    TopSpinEdit.Value := WindowRect.Top;
    WidthSpinEdit.Value := WindowRect.Width;
    HeightSpinEdit.Value := WindowRect.Height;
  end;
end;

procedure TMainForm.aOpenDBExecute(Sender: TObject);
var
  TmpStrLst: TStringList;
  TempFileName, TmpFileExt: String;
begin
  TempFileName := LstDir + FileNameEdit.Text;
  TmpFileExt := ExtractFileExt(TempFileName);
  if LowerCase(TmpFileExt) <> '.csv' then TempFileName := ChangeFileExt(TempFileName, '.csv');
  FileNameEdit.Text := ExtractFileName(TempFileName);
  if not FileExists(TempFileName) then
  begin
    TmpStrLst := TStringList.Create;
    TmpStrLst.Append('WindowName,Left,Top,Width,Height,Notes');
    TmpStrLst.SaveToFile(TempFileName);
    TmpStrLst.Free;
  end;
  JvCsvDataSet.FileName := TempFileName;
  JvCsvDataSet.Open;
  aOpenDB.Enabled := False;
  aCloseDB.Enabled := True;
  aToDB.Enabled := True;
  aFromDB.Enabled := True;
end;

procedure TMainForm.aOpenDtaDirInExplorerExecute(Sender: TObject);
begin
  OpenDirectory(DtaDir);
end;

procedure TMainForm.aOpenLstDirInExplorerExecute(Sender: TObject);
begin
  OpenDirectory(LstDir);
end;

procedure TMainForm.aOpenTmpDirInExplorerExecute(Sender: TObject);
begin
  OpenDirectory(TmpDir);
end;

procedure TMainForm.aRestartElevatedExecute(Sender: TObject);
begin
  ShellExecute(Handle, 'runas', PChar(Application.ExeName), nil, nil, SW_SHOWNORMAL);
  Close;
end;

function TMainForm.MatchingFileName(ListOfEditsText: String): String;
var
  SR: TSearchRec;
  StrLst: TStringList;
begin
  Result := '';
  if FindFirst(LstDir + '*.txt', faAnyFile, SR) = 0 then
  begin
    StrLst := TStringList.Create;
    repeat
      StrLst.LoadFromFile(LstDir + SR.Name);
      if StrLst.Text = ListOfEditsText then Result := SR.Name;
      Application.ProcessMessages;
    until FindNext(SR) <> 0;
    StrLst.Free;
  end;
  FindClose(SR);
end;

procedure TMainForm.LoadListFile(FileName: String);
begin
  if FileExists(FileName) then
  begin
    InfoMemo.Lines.LoadFromFile(FileName);
    MostRecentFiles.AddFile(FileName);
  end;
end;

procedure TMainForm.aSelectListFileExecute(Sender: TObject);
var
  TmpStr: String;
  TmpBool: Boolean;
begin
  TmpBool := SettingsForm.StayOnTopCheckBox.Checked;
  SettingsForm.StayOnTopCheckBox.Checked := False;
  SetStayOnTopStatus;
  SelectFileDlg.SelectFileFrame.SetFileListPath(LstDir);
  SelectFileDlg.SelectFileFrame.SetFileListMask('*.csv');
  SelectFileDlg.SelectFileFrame.LoadFileList;
  if SelectFileDlg.ShowModal = mrOk then
  begin
    if Pos('[L] ', SelectFileDlg.FileName) = 1 then
    begin
      TmpStr := Copy(SelectFileDlg.FileName, 5);
      FileNameEdit.Text := ExtractFileName(TmpStr);
      MostRecentFiles.AddFile(TmpStr);
    end;
    if Pos('[E] ', SelectFileDlg.FileName) = 1 then
    begin
      TmpStr := Copy(SelectFileDlg.FileName, 5);
      ShellExecute(Handle, 'open', PChar(TmpStr), nil, nil, SW_SHOWNORMAL); // Open file in default text editor
    end;
  end;
  SettingsForm.StayOnTopCheckBox.Checked := TmpBool;
  SetStayOnTopStatus;
end;

procedure TMainForm.aLoadListFileExecute(Sender: TObject);
begin
  OpenDialog.InitialDir := LstDir;
  OpenDialog.Filter := 'CSV Files (*.CSV)|*.CSV|All Files (*.*)|*.*';
  if OpenDialog.Execute then FileNameEdit.Text := ExtractFileName(OpenDialog.FileName);
end;

procedure TMainForm.aSaveListFileExecute(Sender: TObject);
var
  TempFileName: String;
begin
  SaveDialog.InitialDir := LstDir;
  SaveDialog.Filter := 'Text Files (*.TXT)|*.TXT|All Files (*.*)|*.*';
  if SaveDialog.Execute then
  begin
    TempFileName := SaveDialog.FileName;
    if ExtractFileExt(TempFileName) = '' then TempFileName := TempFileName + '.txt';
    InfoMemo.Lines.SaveToFile(TempFileName);
  end;
end;

procedure TMainForm.aSetAppPosAndSizeExecute(Sender: TObject);
var
  SelectedAppHandle: hwnd;
begin
  SelectedAppHandle := FindWindow(nil, PWideChar(WindowNameEdit.Text));
  if SelectedAppHandle <> 0 then
  begin
    SetWindowPos(SelectedAppHandle, HWND_TOP,
      LeftSpinEdit.Value,
      TopSpinEdit.Value,
      WidthSpinEdit.Value,
      HeightSpinEdit.Value, 0);
      // Put APS back on top
      SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NoMove or SWP_NoSize);
      SetWindowPos(Handle, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NoMove or SWP_NoSize);
  end;
end;

procedure TMainForm.aSettingsExecute(Sender: TObject);
begin
  SettingsForm.SavFrmSizChkBox.Checked := SaveFormSize;
  SettingsForm.SavFrmPosChkBox.Checked := SaveFormPosition;
  SettingsForm.EnableStylesSettingsCheckBox.Checked := StylesEnabled;
  SettingsForm.StylesListBox.Enabled := StylesEnabled;
  SettingsForm.StayOnTopCheckBox.Checked := StayOnTopB;
  SettingsForm.StylesMMCheckBox.Checked := StylesMM;
  SettingsForm.Top := MainForm.Top; SettingsForm.Left := MainForm.Left + MainForm.Width;
  if SettingsForm.MainFormSettingsListBox.Count > 0 then
    SettingsForm.MainFormSettingsListBox.ItemIndex := 0;
  SettingsForm.Show;
end;

procedure TMainForm.aToDBExecute(Sender: TObject);
begin
  JvCsvDataSet.Append;
  JvCsvDataSet.FieldByName('WindowName').AsString := WindowNameEdit.Text;
  JvCsvDataSet.FieldByName('Left').AsString := IntToStr(LeftSpinEdit.Value);
  JvCsvDataSet.FieldByName('Top').AsString := IntToStr(TopSpinEdit.Value);
  JvCsvDataSet.FieldByName('Width').AsString := IntToStr(WidthSpinEdit.Value);
  JvCsvDataSet.FieldByName('Height').AsString := IntToStr(HeightSpinEdit.Value);
  JvCsvDataSet.FieldByName('Notes').AsString := '';
  JvCsvDataSet.Post;
end;

procedure TMainForm.OpenDirectory(DirectoryName: String);
begin
  ShellExecute(Application.Handle,
    nil,
    'explorer.exe',
    PChar(DirectoryName), //wherever you want the window to open to
    nil,
    SW_NORMAL     //see other possibilities by ctrl+clicking on SW_NORMAL
    );
end;

// https://stackoverflow.com/questions/11594084/shift-in-the-right-of-last-item-of-the-menu
Procedure TMainForm.RightMenu(mmiMoveRight: TMenuItem); // Shift in the right of last item of the menu
var
  mii: TMenuItemInfo;
  MainMenu: hMenu;
  Buffer: array[0..79] of Char;
begin
  MainMenu := Self.Menu.Handle;
  mii.cbSize := SizeOf(mii);
  mii.fMask := MIIM_TYPE;
  mii.dwTypeData := Buffer;
  mii.cch := SizeOf(Buffer);
  GetMenuItemInfo(MainMenu, mmiMoveRight.Command, False, mii);
  mii.fType := mii.fType or MFT_RIGHTJUSTIFY;
  if SetMenuItemInfo(MainMenu, mmiMoveRight.Command, False, mii) then DrawMenuBar(Self.Menu.WindowHandle);
end;

procedure TMainForm.RestoreMainFormPositionAndSize;
begin
  //  Position is lost when the Style is changed
  if SaveFormPosition then
  begin
    MainForm.Left := MainFormRect.Left;
    MainForm.Top := MainFormRect.Top;
  end;
  if SaveFormSize then
  begin
    MainForm.Width := MainFormRect.Width;
    MainForm.Height := MainFormRect.Height;
  end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
{
  InfoMemo.Lines.Append('%MYDOCUMENTS%' + ' : ' + TPath.GetDocumentsPath);       // C:\Users\user\Documents       MyDocs
  InfoMemo.Lines.Append('%COMMONDOCUMENTS%' + ' : ' + GetCommonDocumentsFolder); // C:\Users\Public\Documents     PublicDocs
  InfoMemo.Lines.Append('%APPDATAROOT%' + ' : ' + GetAppdataFolder);             // C:\Users\user\AppData\Roaming AppDataRoaming
  InfoMemo.Lines.Append('%LOCALAPPDATAROOT%' + ' : ' + GetLocalAppData);         // C:\Users\user\AppData\Local   AppDataLocal
  InfoMemo.Lines.Append('%COMMONAPPDATAROOT%' + ' : ' + GetCommonAppdataFolder); // C:\ProgramData                AppDataCommon
}
  case StrIndex(DtaDirLoc, ['MyDocs', 'PublicDocs', 'AppDataRoaming', 'AppDataLocal', 'AppDataCommon']) of
    0: begin
         // DeployMaster - %MYDOCUMENTS%       C:\Users\user\Documents
         DtaDir := TPath.GetDocumentsPath + '\MWB\' + PgmName + '\';
         ForceDirectories(DtaDir);
       end;
    1: begin
         // DeployMaster - %COMMONDOCUMENTS%   C:\Users\Public\Documents
         DtaDir := GetCommonDocumentsFolder + '\MWB\' + PgmName + '\';
         ForceDirectories(DtaDir);
       end;
    2: begin
         // DeployMaster - %APPDATAROOT%       C:\Users\user\AppData\Roaming
         DtaDir := GetAppdataFolder + '\MWB\' + PgmName + '\';
         ForceDirectories(DtaDir);
       end;
    3: begin
         // DeployMaster - %LOCALAPPDATAROOT%  C:\Users\user\AppData\Local
         DtaDir := GetLocalAppData + '\MWB\' + PgmName + '\';
         ForceDirectories(DtaDir);
       end;
    4: begin
         // DeployMaster - %COMMONAPPDATAROOT% C:\ProgramData
         DtaDir := GetCommonAppdataFolder + '\MWB\' + PgmName + '\';
         ForceDirectories(DtaDir);
       end;
  end;
  LoadStyleSettings;
  TStyleManager.TrySetStyle(StyleStr);
  LoadSettingsFromFormCreate;
  if StylesMM then mmiStyles.Visible := True else mmiStyles.Visible := False;
  LoadSettingsFromFormCreate;
  RestoreMainFormPositionAndSize;
end;

procedure TMainForm.FromDBBtnClick(Sender: TObject);
begin
end;

// https://stackoverflow.com/questions/4618743/how-to-make-messagedlg-centered-on-owner-form
function MessageDlgCenter(const Msg: String; DlgType: TMsgDlgType; Buttons: TMsgDlgButtons): Integer;
var R: TRect;
begin
  if not Assigned(Screen.ActiveForm) then
  begin
    Result := MessageDlg(Msg, DlgType, Buttons, 0);
  end else
  begin
    with CreateMessageDialog(Msg, DlgType, Buttons) do
    try
      GetWindowRect(Screen.ActiveForm.Handle, R);
      Left := R.Left + ((R.Right - R.Left) div 2) - (Width div 2);
      Top := R.Top + ((R.Bottom - R.Top) div 2) - (Height div 2);
      Result := ShowModal;
    finally
      Free;
    end;
  end;
end;

procedure TMainForm.CheckStyle(Menu: TMenuItem; StyleStr: String);
var
  i: Integer;
begin
  for i := 0 to Menu.Count - 1 do
  begin
    if Menu.Items[i].Hint = StyleStr then
      Menu.Items[i].Checked := True;
  end;
end;

procedure TMainForm.UnCheckStyles(Menu: TMenuItem);
var
  i: Integer;
begin
  for i := 0 to Menu.Count - 1 do
  begin
    Menu.Items[i].Checked := False;
  end;
end;

procedure TMainForm.mmiStylesClick(Sender: TObject);
begin
  SettingsForm.Close; // Access violation if SettingsForm is open
  UnCheckStyles(MainMenu.Items.Find('Styles'));
  TStyleManager.TrySetStyle((Sender as TMenuItem).Hint);
  StyleStr := (Sender as TMenuItem).Hint;
  CheckStyle(MainMenu.Items.Find('Styles'), StyleStr);
  SettingsForm.StylesListBox.ItemIndex := SettingsForm.StylesListBox.Items.IndexOf(StyleStr);
end;

function TMainForm.FindMenuItemByHint(AMainMenu: TMainMenu; const Hint: String): TMenuItem;

  function FindItemInner(Item: TMenuItem; const Hint: String): TMenuItem;
  var
    i: Integer;
  begin
    Result := nil;
    if Item.Hint = Hint then
    begin
      Result := Item;
      Exit;
    end
    else
    begin
      for i := 0 to Item.Count - 1 do
      begin
        Result := FindItemInner(Item.Items[i], Hint);
        if Result <> nil then
          Break;
      end;
    end;
  end;

begin
  Result := FindItemInner(AMainMenu.Items, Hint);
end;

procedure TMainForm.AddStylesToMainMenu(StylesCaption: String);
var
  StyleStr: String;
  RootAccessItem, ItemToFind: TMenuItem;
  StylesStrLst: TStringList;
  i: Integer;
begin
  // Add Styles menu items to the MainMenu
  // ItemToFind := FindMenuItemByCaption(MainMenu, 'Styles'); // Does not work in the top
  ItemToFind := MainMenu.Items.Find(StylesCaption); // Searches top menu
  StylesStrLst := TStringList.Create;
  for StyleStr in TStyleManager.StyleNames do StylesStrLst.Append(StyleStr);
  StylesStrLst.Sort;
  for i := 0 to StylesStrLst.Count - 1 do
  begin
    RootAccessItem := TMenuItem.Create(Self);
    RootAccessItem.Caption := StylesStrLst[i];
    RootAccessItem.Hint := StylesStrLst[i];
    RootAccessItem.OnClick := mmiStylesClick;
    ItemToFind.Add(RootAccessItem);
  end;
  StylesStrLst.Free;
end;

procedure TMainForm.FormActivate(Sender: TObject);
var
  VerStr: String;
  Item: TMenuItem;
begin
  if not FInitialized then
  begin
    FInitialized := True;
    RestoreMainFormPositionAndSize;
    // DtaDir in FormCreate

    ExeDir := ExtractFilePath(Application.ExeName);
    TmpDir := GetTempDir + PgmName + '\TMP\'; ForceDirectories(TmpDir);
    LstDir := DtaDir + 'LST\'; ForceDirectories(LstDir);
    SettingsForm.DtaDirLbl.Caption := DtaDir;
    SettingsForm.LstDirLbl.Caption := LstDir;
    SettingsForm.TmpDirLbl.Caption := TmpDir;
    VerStr := PgmName + '-v' + GetVersionInfoStr(ParamStr(0));
    MostRecentFiles.IniFile := DtaDir + 'LoadFile-MRU.INI';

    LclExeDir := ExeDir;
    LclDtaDir := DtaDir;
    LclTmpDir := TmpDir;
    LclVerStr := VerStr;
    PgmUpdDir := TmpDir + 'PgmUpdates\'; ForceDirectories(PgmUpdDir);
    LclPgmUpdDir := PgmUpdDir;

    LoadSettingsFromFormActivate;

    MainMenu.Items.Find('About').Caption := VerStr;
    AddStylesToMainMenu('Styles');
    Item := FindMenuItemByHint(MainMenu, StyleStr);
    if Assigned(Item) then Item.Checked := True;
    RightMenu(mmiVersionAbout); // Run after change to MainMenu

    if IsAdministrator then
    begin
      mmiRestartElevated.Caption := 'Running as Admin';
    end
    else
    begin
      aRestartElevated.Enabled := True;
    end;

    SettingsForm.StayOnTopCheckBox.Checked := StayOnTopB;
    SetStayOnTopStatus;

    LoadSettingsLateFormActivate;

    AddStylesToListBox;
    SettingsForm.StylesListBox.ItemIndex := SettingsForm.StylesListBox.Items.IndexOf(StyleStr);
  end;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SaveSettings;
end;

procedure TMainForm.OnMoving(var Msg: TWMMoving);
begin
  inherited;
  UpdateScrPosEdits;
end;

procedure TMainForm.UpdateScrPosEdits;
begin
  SettingsForm.TScrPosFrame.SpinEditTop.Value := MainForm.Top;
  SettingsForm.TScrPosFrame.SpinEditLeft.Value := MainForm.Left;
  SettingsForm.TScrPosFrame.SpinEditHeight.Value := MainForm.Height;
  SettingsForm.TScrPosFrame.SpinEditWidth.Value := MainForm.Width;
end;

procedure TMainForm.WindowReticleWindowChange(Sender: TObject);
var
  Reticle: TWindowReticle;
begin
  Reticle := TWindowReticle(Sender);
  if Reticle.AncestorCaption = '' then
  begin
    WindowNameEdit.Text := Reticle.WindowCaption;
  end
  else
  begin
    WindowNameEdit.Text := Reticle.AncestorCaption;
  end;
end;

procedure TMainForm.LoadSettingsFromFormCreate;
var
  RegIniFile: TIniFile;
begin
  RegIniFile := TIniFile.Create(DtaDir + PgmIni);
  try
    MainFormDefaultRect.Top := RegIniFile.ReadInteger('Section-Window', 'DefaultTop', 75);
    MainFormDefaultRect.Left := RegIniFile.ReadInteger('Section-Window', 'DefaultLeft', 75);
    MainFormDefaultRect.Height := RegIniFile.ReadInteger('Section-Window', 'DefaultHeight', 500);
    MainFormDefaultRect.Width := RegIniFile.ReadInteger('Section-Window', 'DefaultWidth', 600);

    StayOnTopB := RegIniFile.ReadBool('Section-Options', 'StayOnTop', False);

    SaveFormSize := RegIniFile.ReadBool('Section-Window', 'SaveFormSize', False);
    SaveFormPosition := RegIniFile.ReadBool('Section-Window', 'SaveFormPosition', False);

    if SaveFormPosition then
    begin
      MainFormRect.Top := RegIniFile.ReadInteger('Section-Window', 'Top', MainFormDefaultRect.Top);
      MainFormRect.Left := RegIniFile.ReadInteger('Section-Window', 'Left', MainFormDefaultRect.Left);
    end;

    if SaveFormSize then
    begin
      MainFormRect.Height := RegIniFile.ReadInteger('Section-Window', 'Height', MainFormDefaultRect.Height);
      MainFormRect.Width := RegIniFile.ReadInteger('Section-Window', 'Width', MainFormDefaultRect.Width);
    end;

  finally
    RegIniFile.Free;
  end;
end;

procedure TMainForm.LoadSettingsFromFormActivate;
var
  RegIniFile: TIniFile;
  i, ItemCount: Integer;
begin
  RegIniFile := TIniFile.Create(DtaDir + PgmIni);
  try
    CFPUHostName := RegIniFile.ReadString('Section-Update', 'FtpHostName', 'ftp2.tmshealth.com');
    CFPUUserName := RegIniFile.ReadString('Section-Update', 'FtpUserName', 'TMSDelphiTools');
    CFPUPassWord := RegIniFile.ReadString('Section-Update', 'FtpPassWord', 'TDT');
    CFPUAppName := RegIniFile.ReadString('Section-Update', 'AppName', PgmName);

//    SelectFileDlg.Top := RegIniFile.ReadInteger('Section-Window', 'SelectFileTop', 100);
//    SelectFileDlg.Left := RegIniFile.ReadInteger('Section-Window', 'SelectFileLeft', 100);
    SelectFileDlg.Height := RegIniFile.ReadInteger('Section-Window', 'SelectFileHeight', 275);
    SelectFileDlg.Width := RegIniFile.ReadInteger('Section-Window', 'SelectFileWidth', 525);

    RegIniFile.ReadSection('MainFormSettingsListBox', SettingsForm.MainFormSettingsListBox.Items);
    ItemCount := SettingsForm.MainFormSettingsListBox.Items.Count;
    SettingsForm.MainFormSettingsListBox.Clear;
    for i := 0 to ItemCount - 1 do
      SettingsForm.MainFormSettingsListBox.Items.Append(RegIniFile.ReadString('MainFormSettingsListBox', IntToStr(i), ''));

  finally
    RegIniFile.Free;
  end;
end;

procedure TMainForm.LoadSettingsLateFormActivate;
var
  RegIniFile: TIniFile;
begin
  RegIniFile := TIniFile.Create(DtaDir + PgmIni);
  try
    WindowNameEdit.Text := RegIniFile.ReadString('Section-Bounds', 'WindowName', 'WindowName');
    LeftSpinEdit.Value := RegIniFile.ReadInteger('Section-Bounds', 'Left', 100);
    TopSpinEdit.Value := RegIniFile.ReadInteger('Section-Bounds', 'Top', 100);
    WidthSpinEdit.Value := RegIniFile.ReadInteger('Section-Bounds', 'Width', 500);
    HeightSpinEdit.Value := RegIniFile.ReadInteger('Section-Bounds', 'Height', 500);
  finally
    RegIniFile.Free;
  end;
end;

procedure TMainForm.LoadStyleSettings;
var
  RegIniFile: TIniFile;
begin
  RegIniFile := TIniFile.Create(DtaDir + PgmIni);
  try
    StyleStr := RegIniFile.ReadString('Section-Options', 'Style', 'Windows');
    StylesMM := RegIniFile.ReadBool('Section-Options', 'StylesMM', False);
    StylesEnabled := RegIniFile.ReadBool('Section-Options', 'StylesEnabled', False);
  finally
    RegIniFile.Free;
  end;
end;

procedure TMainForm.SaveSettings;
var
  RegIniFile: TIniFile;
  i: Integer;
begin
  RegIniFile := TIniFile.Create(DtaDir + PgmIni);
  try
    RegIniFile.WriteBool('Section-Window', 'SaveFormSize', SaveFormSize);
    RegIniFile.WriteBool('Section-Window', 'SaveFormPosition', SaveFormPosition);

    RegIniFile.WriteInteger('Section-Window', 'DefaultTop', MainFormDefaultRect.Top);
    RegIniFile.WriteInteger('Section-Window', 'DefaultLeft', MainFormDefaultRect.Left);
    RegIniFile.WriteInteger('Section-Window', 'DefaultHeight', MainFormDefaultRect.Height);
    RegIniFile.WriteInteger('Section-Window', 'DefaultWidth', MainFormDefaultRect.Width);

    RegIniFile.WriteInteger('Section-Window', 'Top', MainForm.Top);
    RegIniFile.WriteInteger('Section-Window', 'Left', MainForm.Left);
    RegIniFile.WriteInteger('Section-Window', 'Height', MainForm.Height);
    RegIniFile.WriteInteger('Section-Window', 'Width', MainForm.Width);

    RegIniFile.WriteString('Section-Update', 'FtpHostName', CFPUHostName);
    RegIniFile.WriteString('Section-Update', 'FtpUserName', CFPUUserName);
    RegIniFile.WriteString('Section-Update', 'FtpPassWord', CFPUPassWord);
    RegIniFile.WriteString('Section-Update', 'AppName', CFPUAppName);
{
    RegIniFile.WriteInteger('Section-Window', 'SelectFileTop', SelectFileDlg.Top);
    RegIniFile.WriteInteger('Section-Window', 'SelectFileLeft', SelectFileDlg.Left);
    RegIniFile.WriteInteger('Section-Window', 'SelectFileHeight', SelectFileDlg.Height);
    RegIniFile.WriteInteger('Section-Window', 'SelectFileWidth', SelectFileDlg.Width);
}
    RegIniFile.WriteBool('Section-Options', 'StayOnTop', StayOnTopB);
    RegIniFile.WriteString('Section-Options', 'Style', StyleStr);
    RegIniFile.WriteBool('Section-Options', 'StylesMM', StylesMM);
    RegIniFile.WriteBool('Section-Options', 'StylesEnabled', StylesEnabled);

    RegIniFile.EraseSection('MainFormSettingsListBox');
    for i := 0 to SettingsForm.MainFormSettingsListBox.Items.Count - 1 do
      RegIniFile.WriteString('MainFormSettingsListBox', IntToStr(i), SettingsForm.MainFormSettingsListBox.Items[i]);

    RegIniFile.WriteString('Section-Bounds', 'WindowName', WindowNameEdit.Text);
    RegIniFile.WriteInteger('Section-Bounds', 'Left', LeftSpinEdit.Value);
    RegIniFile.WriteInteger('Section-Bounds', 'Top', TopSpinEdit.Value);
    RegIniFile.WriteInteger('Section-Bounds', 'Width', WidthSpinEdit.Value);
    RegIniFile.WriteInteger('Section-Bounds', 'Height', HeightSpinEdit.Value);

  finally
    RegIniFile.Free;
  end;
end;

procedure TMainForm.AddStylesToListBox;
var
  StyleStr: String;
begin
  // Add Styles menu items to the ListBox
  SettingsForm.StylesListBox.Clear;
  for StyleStr in TStyleManager.StyleNames do SettingsForm.StylesListBox.Items.Append(StyleStr);
  SettingsForm.StylesListBox.Sorted := True;
end;

procedure TMainForm.SetStayOnTopStatus;
begin
  if SettingsForm.StayOnTopCheckBox.Checked then
  begin
    SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NoMove or SWP_NoSize);
  end
  else
  begin
    SetWindowPos(Handle, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NoMove or SWP_NoSize);
  end;
end;

end.
