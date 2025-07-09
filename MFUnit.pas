unit MFUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, VirtualTrees, System.Types,
  JvComponentBase, JvBalloonHint, UtlUnit, Menus, About, ActnList,
  System.Actions, System.UITypes, Themes, MruUnit, comp.reticle,
  Vcl.Samples.Spin, Data.DB, Vcl.Grids, Vcl.DBGrids, JvDataSource, JvCsvData,
  Vcl.DBCtrls, JvPageList, JvExControls, InitAppUnit, ABFrameUnit, GSFrameUnit, JclAppInst,
  JvCaptionButton, RealtimeFrameUnit, WindowList, VirtualTrees.Header,
  Vcl.Buttons;

type
  TTopLeftHeightWidth = record
    Top: Integer;
    Left: Integer;
    Height: Integer;
    Width: Integer;
  end;
  PTreeData = ^TTreeData;
  TTreeData = record
    FFileDescription: String[80];
    FLeft: Integer;
    FTop: Integer;
    FWidth: Integer;
    FHeight: Integer;
    WindowListNo: Integer;
  end;
  TAPSMainForm = class(TForm)
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
    JvPageList: TJvPageList;
    JvStandardPage1: TJvStandardPage;
    aPage1: TAction;
    aPage2: TAction;
    JvStandardPage2: TJvStandardPage;
    aListProcs: TAction;
    P2LeftPanel: TPanel;
    mmiAutoStartElevated: TMenuItem;
    mmiPages: TMenuItem;
    mmiPage1: TMenuItem;
    mmiPage2: TMenuItem;
    VST: TVirtualStringTree;
    P2RightPanel: TPanel;
    JvStandardPage3: TJvStandardPage;
    ApplicationBoundsFrame: TApplicationBoundsFrame;
    aPage3: TAction;
    mmiPage3: TMenuItem;
    FrameScrollBox: TScrollBox;
    aClearGetSetFrames: TAction;
    aAddFrame: TAction;
    GSFramePopupMenu: TPopupMenu;
    pmiGSRemoveFrame: TMenuItem;
    aSaveAsFrameList: TAction;
    aSelectFrameList: TAction;
    mmiFrames: TMenuItem;
    mmiAddFrame: TMenuItem;
    pmiGSClearFrames: TMenuItem;
    mmiClearGetSetFrames: TMenuItem;
    N8: TMenuItem;
    mmiSaveAsFrameList: TMenuItem;
    mmiSelectFrameListFile: TMenuItem;
    ConfirmSetGroupBox: TGroupBox;
    pmiGSAddFrame: TMenuItem;
    N11: TMenuItem;
    Panel1: TPanel;
    FrameScrollPopupMenu: TPopupMenu;
    TrayIcon: TTrayIcon;
    TrayIconPopupMenu: TPopupMenu;
    pmiQuit: TMenuItem;
    pmiRestore: TMenuItem;
    aMoveToSystemTray: TAction;
    mmiHideForm: TMenuItem;
    pmiAbout: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    aInfoMemo: TAction;
    mmiInfoMemo: TMenuItem;
    JvStandardPage4: TJvStandardPage;
    mmiPage4: TMenuItem;
    aPage4: TAction;
    RealtimeFrame: TRealtimeFrame;
    mmiDirectories: TMenuItem;
    mmiMisc: TMenuItem;
    mmiDebug: TMenuItem;
    aContents: TAction;
    mmiContents: TMenuItem;
    aOIFormExecute: TAction;
    mmiObjectInspector: TMenuItem;
    WindowList: TWindowList;
    BottomPnl: TPanel;
    ALHeightLbl: TLabel;
    ALHeightSpinEdit: TSpinEdit;
    ALLeftLbl: TLabel;
    ALLeftSpinEdit: TSpinEdit;
    ALTopLbl: TLabel;
    ALTopSpinEdit: TSpinEdit;
    ALWidthLbl: TLabel;
    ALWidthSpinEdit: TSpinEdit;
    ApplyBtn: TButton;
    ALCenterBtn: TButton;
    ALHorizontalCenterBtn: TButton;
    ALVerticleCenterBtn: TButton;
    WLRTimer: TTimer;
    ALButtonPanel: TPanel;
    ALCenterSpeedButton: TSpeedButton;
    ALCornersSpeedButton: TSpeedButton;
    ALSidesSpeedButton: TSpeedButton;
    ALPageControl: TPageControl;
    ALCenterTabSheet: TTabSheet;
    ALCornersTabSheet: TTabSheet;
    ALSidesTabSheet: TTabSheet;
    ALTopLeftBtn: TButton;
    ALBottomLeftBtn: TButton;
    ALTopRightBtn: TButton;
    ALBottomRightBtn: TButton;
    ALMoveSpeedButton: TSpeedButton;
    ALMoveTabSheet: TTabSheet;
    ALLeftSideBtn: TButton;
    ALRightSideBtn: TButton;
    ALMTopLeftBtn: TButton;
    ALMCenterLeftBtn: TButton;
    ALMBottomLeftBtn: TButton;
    ALMTopCenterBtn: TButton;
    ALMCenterBtn: TButton;
    ALMBottomCenterBtn: TButton;
    ALMTopRightBtn: TButton;
    ALMCenterRightBtn: TButton;
    ALMBottomRightBtn: TButton;
    RefreshApplicationListPnl: TPanel;
    RefreshApplicationListSpdBtn: TSpeedButton;
    ALCenterPercentBtn: TButton;
    ALCenterPercentSpinEdit: TSpinEdit;
    MsgPnl: TPanel;
    aWhatsNew: TAction;
    mmiWhatsNew: TMenuItem;
    mmiHelp: TMenuItem;
    mmiResetLastVerNum: TMenuItem;
    aResetLastVerNum: TAction;
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
    procedure aPage1Execute(Sender: TObject);
    procedure aPage2Execute(Sender: TObject);
    procedure VSTGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
    procedure VSTMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure aPage3Execute(Sender: TObject);
    procedure aClearGetSetFramesExecute(Sender: TObject);
    procedure aAddFrameExecute(Sender: TObject);
    procedure pmiGSRemoveFrameClick(Sender: TObject);
    procedure aSaveAsFrameListExecute(Sender: TObject);
    procedure aSelectFrameListExecute(Sender: TObject);
    procedure JvStandardPage1Hide(Sender: TObject);
    procedure JvStandardPage1Show(Sender: TObject);
    procedure JvStandardPage3Show(Sender: TObject);
    procedure JvStandardPage3Hide(Sender: TObject);
    procedure pmiQuitClick(Sender: TObject);
    procedure pmiRestoreClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SetHotKey;
    procedure UnsetHotKey;
    procedure TrayIconDblClick(Sender: TObject);
    procedure aMoveToSystemTrayExecute(Sender: TObject);
    procedure pmiAboutClick(Sender: TObject);
    procedure mmiMoveToSystemTrayClick(Sender: TObject);
    procedure aInfoMemoExecute(Sender: TObject);
    procedure aPage4Execute(Sender: TObject);
    procedure JvStandardPage4Show(Sender: TObject);
    procedure SetStayOnTopB(LocalStayOnTopB: Boolean);
    procedure aContentsExecute(Sender: TObject);
    procedure aOIFormExecuteExecute(Sender: TObject);
    procedure VSTClick(Sender: TObject);
    procedure JvStandardPage2Show(Sender: TObject);
    procedure ApplyBtnClick(Sender: TObject);
    procedure ALCenterBtnClick(Sender: TObject);
    procedure ALHorizontalCenterBtnClick(Sender: TObject);
    procedure ALVerticleCenterBtnClick(Sender: TObject);
    procedure WLRTimerTimer(Sender: TObject);
    procedure ALCenterSpeedButtonClick(Sender: TObject);
    procedure ALCornersSpeedButtonClick(Sender: TObject);
    procedure ALSidesSpeedButtonClick(Sender: TObject);
    procedure ALTopLeftBtnClick(Sender: TObject);
    procedure ALTopRightBtnClick(Sender: TObject);
    procedure ALBottomLeftBtnClick(Sender: TObject);
    procedure ALBottomRightBtnClick(Sender: TObject);
    procedure ALLeftSideBtnClick(Sender: TObject);
    procedure ALRightSideBtnClick(Sender: TObject);
    procedure ALMTopLeftBtnClick(Sender: TObject);
    procedure ALMCenterLeftBtnClick(Sender: TObject);
    procedure ALMBottomLeftBtnClick(Sender: TObject);
    procedure ALMTopCenterBtnClick(Sender: TObject);
    procedure ALMCenterBtnClick(Sender: TObject);
    procedure ALMBottomCenterBtnClick(Sender: TObject);
    procedure ALMoveSpeedButtonClick(Sender: TObject);
    procedure ALMTopRightBtnClick(Sender: TObject);
    procedure ALMCenterRightBtnClick(Sender: TObject);
    procedure ALMBottomRightBtnClick(Sender: TObject);
    procedure RefreshApplicationListSpdBtnClick(Sender: TObject);
    procedure VSTGetHint(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; var LineBreakStyle: TVTTooltipLineBreakStyle;
      var HintText: string);
    procedure ALCenterPercentBtnClick(Sender: TObject);
    procedure aWhatsNewExecute(Sender: TObject);
    procedure aResetLastVerNumExecute(Sender: TObject);
  private
    HotKey1: NativeUInt;
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
    function GetDataByColumn(Data: TTreeData; Column: Integer): String;
    procedure ClearGetSetFrames;
    function ExtractValue(SearchString, SubjectString: String): String;
    procedure LoadFrameList(TempFileName: String);
    procedure SaveFramesToFile(TempFileName: string);
    procedure AddGetSetFrame;
    procedure HideForm;
    procedure RestoreForm;
    procedure WMHotKey(var Msg: TWMHotKey); message WM_HOTKEY;
    procedure OpenAboutBox;
    procedure RefreshApplicationList;
    procedure LoadApplicationList;
    procedure ShowWhatsNewForm;
    function VToV3(InStr: String): String;
    { Private declarations }
  public
    procedure SetConfirmBefore(Checked: Boolean);
    procedure SetConfirmAfter(Checked: Boolean);
    procedure WndProc(var Message: TMessage); override;
    { Public declarations }
  end;

var
  APSMainForm: TAPSMainForm;
  ExeDir, TmpDir, LstDir, KeyDir, StyleStr, VerNum, LastVerNum: String;
  MainFormDefaultRect, MainFormRect: TTopLeftHeightWidth;
  SaveFormSize, SaveFormPosition, StylesMM, StylesEnabled, StayOnTopB, PagesMM, Page1, Page2, Page3, Page4: Boolean;
  HotKey1AltB, HotKey1CtrlB,HotKey1ShftB: Boolean;
  HotKey1Key: String;

implementation

uses
  JclSecurity, ShellApi, ClipBrd, JclSysInfo, IniFiles, JclFileUtils,
  SelectFileUnit, SetUnit, JclAnsiStrings, System.IOUtils, Winapi.PsAPI,
  System.RegularExpressions, System.RegularExpressionsCore, IMUnit, OIUnit,
  WNUnit;

var
  FInitialized, AutoElevateDoNotSave: Boolean;
  FServiceListFileName: String;
  AppLst, AppLst2, AppLst3: TStringList;
  GetSetFrameA: array of TGetSetFrame;

{$R *.dfm}
//{$R administrator.res}

procedure TAPSMainForm.WMHotKey(var Msg: TWMHotKey);
begin
  // This procedure is called when a window message WM_HOTKEY
  inherited;  // We give the form to process the message,
              // if she already has its handler
  if Msg.HotKey = HotKey1 then
  begin
    if TrayIcon.Visible then RestoreForm else HideForm;
  end;
end;

procedure TAPSMainForm.UnsetHotKey;
begin
  UnRegisterHotKey(Handle, HotKey1);
end;

procedure TAPSMainForm.SetHotKey;
var
  TmpCrd: Cardinal;
begin
  HotKey1 := GlobalAddAtom('HotKey1');
  TmpCrd := 0;
  if HotKey1AltB then TmpCrd := TmpCrd + 1;
  if HotKey1CtrlB then TmpCrd := TmpCrd + 2;
  if HotKey1ShftB then TmpCrd := TmpCrd + 4;
  RegisterHotKey(Handle, HotKey1, TmpCrd, Ord(HotKey1Key[1]));
end;

procedure TAPSMainForm.mmiVersionAboutClick(Sender: TObject);
begin
  OpenAboutBox;
end;

procedure TAPSMainForm.MostRecentFilesMenuClick(Sender: TObject;
  const Filename: String);
begin
  if ExtractFileExt(Filename) = '.csv' then FileNameEdit.Text := ExtractFileName(FileName);
  if ExtractFileExt(Filename) = '.txt' then LoadFrameList(FileName);
end;

function TAPSMainForm.GetServiceListFileName: String;
begin
  Result := FServiceListFileName;
end;

procedure TAPSMainForm.SetServiceListFileName(ServiceListFileName: String);
begin
  FServiceListFileName := ServiceListFileName;
end;

function TAPSMainForm.GetDtaDir: String;
begin
  Result := DtaDir;
end;

function TAPSMainForm.GetLstDir: String;
begin
  Result := LstDir;
end;

function TAPSMainForm.GetTmpDir: String;
begin
  Result := TmpDir;
end;

procedure TAPSMainForm.InfoMemoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ^A then
  begin
    (Sender as TMemo).SelectAll;
    Key := #0;
  end;
end;

procedure TAPSMainForm.JvStandardPage1Hide(Sender: TObject);
begin
  mmiBounds.Visible := False;
  RightMenu(mmiVersionAbout); // Run after change to MainMenu
end;

procedure TAPSMainForm.JvStandardPage1Show(Sender: TObject);
begin
  mmiBounds.Visible := True;
  RightMenu(mmiVersionAbout); // Run after change to MainMenu
end;

procedure TAPSMainForm.JvStandardPage2Show(Sender: TObject);
begin
  WLRTimer.Enabled := True;
end;

procedure TAPSMainForm.JvStandardPage3Hide(Sender: TObject);
begin
  mmiFrames.Visible := False;
  RightMenu(mmiVersionAbout); // Run after change to MainMenu
end;

procedure TAPSMainForm.JvStandardPage3Show(Sender: TObject);
begin
  mmiFrames.Visible := True;
  RightMenu(mmiVersionAbout); // Run after change to MainMenu
end;

procedure TAPSMainForm.JvStandardPage4Show(Sender: TObject);
begin
  mmiFrames.Visible := False;
  RightMenu(mmiVersionAbout); // Run after change to MainMenu
end;

procedure TAPSMainForm.a1of4Execute(Sender: TObject);
begin
  LeftSpinEdit.Value := 0;
  TopSpinEdit.Value := 0;
  WidthSpinEdit.Value := Screen.WorkAreaWidth div 2;
  HeightSpinEdit.Value := Screen.WorkAreaHeight div 2;
end;

procedure TAPSMainForm.a2of4Execute(Sender: TObject);
begin
  LeftSpinEdit.Value := (Screen.WorkAreaWidth div 2) + 1;
  TopSpinEdit.Value := 0;
  WidthSpinEdit.Value := Screen.WorkAreaWidth div 2;
  HeightSpinEdit.Value := Screen.WorkAreaHeight div 2;
end;

procedure TAPSMainForm.a3of4Execute(Sender: TObject);
begin
  LeftSpinEdit.Value := 0;
  TopSpinEdit.Value := (Screen.WorkAreaHeight div 2) + 1;
  WidthSpinEdit.Value := Screen.WorkAreaWidth div 2;
  HeightSpinEdit.Value := Screen.WorkAreaHeight div 2;
end;

procedure TAPSMainForm.a4of4Execute(Sender: TObject);
begin
  LeftSpinEdit.Value := (Screen.WorkAreaWidth div 2) + 1;
  TopSpinEdit.Value := (Screen.WorkAreaHeight div 2) + 1;
  WidthSpinEdit.Value := Screen.WorkAreaWidth div 2;
  HeightSpinEdit.Value := Screen.WorkAreaHeight div 2;
end;

procedure TAPSMainForm.a75PercentExecute(Sender: TObject);
begin
  LeftSpinEdit.Value := Screen.WorkAreaWidth div 8;
  TopSpinEdit.Value := Screen.WorkAreaHeight div 8;
  WidthSpinEdit.Value := (Screen.WorkAreaWidth div 4) * 3;
  HeightSpinEdit.Value := (Screen.WorkAreaHeight div 4) * 3;
end;

procedure TAPSMainForm.a90PercentExecute(Sender: TObject);
begin
  LeftSpinEdit.Value := Screen.WorkAreaWidth div 20;
  TopSpinEdit.Value := Screen.WorkAreaHeight div 20;
  WidthSpinEdit.Value := Screen.WorkAreaWidth - (Screen.WorkAreaWidth div 10);
  HeightSpinEdit.Value := Screen.WorkAreaHeight - (Screen.WorkAreaHeight div 10);
end;

procedure TAPSMainForm.a95PercentExecute(Sender: TObject);
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
  AppPathStr, AppFDStr: String;
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

    if VersionResourceAvailable(AppPathStr) then
      with TJclFileVersionInfo.Create(AppPathStr) do
      try
        AppFDStr := FileDescription;
      finally
        Free;
      end;

  except
    AppPathStr := '???';
    AppFDStr := '---';
  end;

  if AppClassStr <> 'ApplicationFrameWindow' then
  begin
    if Assigned(AppLst2) then
    begin
      AppLst2.Append(IntToStr(ProcId) + ' | ' + AppClassStr + ' | ' + AppTitleStr + ' | ' + AppPathStr);
    end;
    if Assigned(AppLst) then
    begin
      GetWindowRect(AppHandle, WindowRect);
      AppLst.Append('"' + String(AppTitleStr) + '",' +
        IntToStr(WindowRect.Left) + ',' +
        IntToStr(WindowRect.Top) + ',' +
        IntToStr(WindowRect.Width) + ',' +
        IntToStr(WindowRect.Height) + ',');
    end;
    if Assigned(AppLst3) then
    begin
      GetWindowRect(AppHandle, WindowRect);
      AppLst3.Append(String(AppFDStr) + '|' +
        IntToStr(WindowRect.Left) + '|' +
        IntToStr(WindowRect.Top) + '|' +
        IntToStr(WindowRect.Width) + '|' +
        IntToStr(WindowRect.Height) + '|' +
        IntToStr(AppHandle) + '|' +
        String(AppTitleStr));
    end;
  end;
end;

procedure TAPSMainForm.aAddFrameExecute(Sender: TObject);
begin
  AddGetSetFrame;
end;

procedure TAPSMainForm.aAllAppsToCSVExecute(Sender: TObject);
begin
  AppLst := TStringList.Create;
  AppLst.Clear;
  AppLst.Append('WindowName,Left,Top,Width,Height,Notes');
  EnumWindows(@EnumWindowsProc, 0);
  AppLst.SaveToFile(LstDir + 'AllApps.csv');
  AppLst.Free;
end;

procedure TAPSMainForm.aCenterInScreenExecute(Sender: TObject);
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

procedure TAPSMainForm.aClearGetSetFramesExecute(Sender: TObject);
begin
  ClearGetSetFrames;
end;

procedure TAPSMainForm.aCloseDBExecute(Sender: TObject);
begin
  JvCsvDataSet.Close;
  aOpenDB.Enabled := True;
  aCloseDB.Enabled := False;
  aToDB.Enabled := False;
  aFromDB.Enabled := False;
end;

procedure TAPSMainForm.aCopyDtaDirPathToClipboardExecute(Sender: TObject);
begin
  Clipboard.AsText := DtaDir;
end;

procedure TAPSMainForm.aCopyLstDirPathToClipboardExecute(Sender: TObject);
begin
  Clipboard.AsText := LstDir;
end;

procedure TAPSMainForm.aCopyTmpDirPathToClipboardExecute(Sender: TObject);
begin
  Clipboard.AsText := TmpDir;
end;

procedure TAPSMainForm.aExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TAPSMainForm.aFromDBExecute(Sender: TObject);
begin
  WindowNameEdit.Text := JvCsvDataSet.FieldByName('WindowName').AsString;
  LeftSpinEdit.Value := JvCsvDataSet.FieldByName('Left').AsInteger;
  TopSpinEdit.Value := JvCsvDataSet.FieldByName('Top').AsInteger;
  WidthSpinEdit.Value := JvCsvDataSet.FieldByName('Width').AsInteger;
  HeightSpinEdit.Value := JvCsvDataSet.FieldByName('Height').AsInteger;
end;

procedure TAPSMainForm.SetConfirmAfter(Checked: Boolean);
begin
  ABConfirmAfter := Checked;
  GSConfirmAfter := Checked;
end;

procedure TAPSMainForm.aFullMinus5Execute(Sender: TObject);
begin
  LeftSpinEdit.Value := Screen.WorkAreaLeft + 5;
  TopSpinEdit.Value := Screen.WorkAreaTop + 5;
  WidthSpinEdit.Value := Screen.WorkAreaWidth - 10;
  HeightSpinEdit.Value := Screen.WorkAreaHeight - 10;
end;

procedure TAPSMainForm.aFullScreenExecute(Sender: TObject);
begin
  LeftSpinEdit.Value := Screen.WorkAreaLeft;
  TopSpinEdit.Value := Screen.WorkAreaTop;
  WidthSpinEdit.Value := Screen.WorkAreaWidth;
  HeightSpinEdit.Value := Screen.WorkAreaHeight;
end;

procedure TAPSMainForm.aGetAppPosAndSizeExecute(Sender: TObject);
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

procedure TAPSMainForm.aContentsExecute(Sender: TObject);
begin
  ShellExecute(Handle, 'open', PChar(ExeDir + 'APS.chm'), nil, nil, SW_SHOWNORMAL);
end;

procedure TAPSMainForm.aInfoMemoExecute(Sender: TObject);
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

procedure TAPSMainForm.aOIFormExecuteExecute(Sender: TObject);
begin
  OIForm.Top := APSMainForm.Top; OIForm.Left := APSMainForm.Left + APSMainForm.Width;

  if APSMainForm.Left + APSMainForm.Width + OIForm.Width < Screen.WorkAreaWidth then
  begin
    OIForm.Position := poDesigned;
    OIForm.Top := APSMainForm.Top;
    OIForm.Left := APSMainForm.Left + APSMainForm.Width;
  end
  else
  begin
    if APSMainForm.Top + APSMainForm.Height + OIForm.Height < Screen.WorkAreaHeight then
    begin
      OIForm.Position := poDesigned;
      OIForm.Top := APSMainForm.Top + APSMainForm.Height;
      OIForm.Left := APSMainForm.Left;
    end
    else
    begin
      OIForm.Position := poDesktopCenter;
    end;
  end;

  OIForm.Show;
end;

procedure TAPSMainForm.aOpenDBExecute(Sender: TObject);
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

procedure TAPSMainForm.aOpenDtaDirInExplorerExecute(Sender: TObject);
begin
  OpenDirectory(DtaDir);
end;

procedure TAPSMainForm.aOpenLstDirInExplorerExecute(Sender: TObject);
begin
  OpenDirectory(LstDir);
end;

procedure TAPSMainForm.aOpenTmpDirInExplorerExecute(Sender: TObject);
begin
  OpenDirectory(TmpDir);
end;

procedure TAPSMainForm.aPage1Execute(Sender: TObject);
begin
  JvPageList.ActivePage := JvStandardPage1;
end;

procedure TAPSMainForm.aPage2Execute(Sender: TObject);
begin
  JvPageList.ActivePage := JvStandardPage2;
end;

procedure TAPSMainForm.aPage3Execute(Sender: TObject);
begin
  JvPageList.ActivePage := JvStandardPage3;
end;

procedure TAPSMainForm.aPage4Execute(Sender: TObject);
begin
  JvPageList.ActivePage := JvStandardPage4;
end;

procedure TAPSMainForm.aResetLastVerNumExecute(Sender: TObject);
begin
  LastVerNum := '0.0.0.0';
end;

procedure TAPSMainForm.aRestartElevatedExecute(Sender: TObject);
var
  WinTmp: String;
  APSRestartSemaphoreStrLst: TStringList;
begin
  WinTmp := GetWindowsTempFolder;
  InfoMemoForm.InfoMemo.Lines.Append('WinTmp: ' + WinTmp);
  APSRestartSemaphoreStrLst := TStringList.Create;
  APSRestartSemaphoreStrLst.Append('APS Restart Elevated');
  APSRestartSemaphoreStrLst.SaveToFile(WinTmp + '\APSRestart.Semaphore');
  APSRestartSemaphoreStrLst.Free;
  ShellExecute(Handle, 'runas', PChar(Application.ExeName), nil, nil, SW_SHOWNORMAL);
  Close;
end;

function TAPSMainForm.MatchingFileName(ListOfEditsText: String): String;
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

function TAPSMainForm.ExtractValue(SearchString, SubjectString: String): String;
var
  UsMatch: TMatch;
  RegExPattern: String;
begin
  Result := '';
  try
    // Bounds - Name
    // First check for Bounds & Name
    RegExPattern := '^\((?<Left>-?\d+),(?<Top>-?\d+),(?<Width>[0-9]+),(?<Height>[0-9]+)\) (?<Name>[]\w\t !"#$%&''()*+,./:;<=>?@[\\`{|}~^-]+)$';
  	UsMatch := TRegEx.Match(SubjectString, RegExPattern, [roMultiLine]);
    if UsMatch.Success then
    begin
      // if Bounds & Name
    	Result := TRegEx.Match(SubjectString, '^\((?<Left>-?\d+),(?<Top>-?\d+),(?<Width>[0-9]+),(?<Height>[0-9]+)\) (?<Name>[]\w\t !"#$%&''()*+,./:;<=>?@[\\`{|}~^-]+)$', [roMultiLine]).Groups[SearchString].Value;
    end
    else
    begin
      // if Bounds with no Name
    	Result := TRegEx.Match(SubjectString, '^\((?<Left>-?\d+),(?<Top>-?\d+),(?<Width>[0-9]+),(?<Height>[0-9]+)\) (?:(?<Name>[]\w\t !"#$%&''()*+,./:;<=>?@[\\`{|}~^-]+)|[]\w\t !"#$%&''()*+,./:;<=>?@[\\`{|}~^-]?)+$', [roMultiLine]).Groups[SearchString].Value;
    end;
  except
  // Syntax error in the regular expression
  end;
end;

procedure TAPSMainForm.LoadFrameList(TempFileName: String);
var
  FrmStrLst: TStringList;
  i: Integer;
begin
  if FileExists(TempFileName) then
  begin
    ClearGetSetFrames;
    FrmStrLst := TStringList.Create;
    FrmStrLst.LoadFromFile(TempFileName);
    for i := 0 to FrmStrLst.Count - 1 do
    begin
      AddGetSetFrame;
      GetSetFrameA[High(GetSetFrameA)].NameEdit.Text := ExtractValue('Name', FrmStrLst[i]);
      GetSetFrameA[High(GetSetFrameA)].LeftSpinEdit.Value := StrToInt(ExtractValue('Left', FrmStrLst[i]));
      GetSetFrameA[High(GetSetFrameA)].TopSpinEdit.Value := StrToInt(ExtractValue('Top', FrmStrLst[i]));
      GetSetFrameA[High(GetSetFrameA)].WidthSpinEdit.Value := StrToInt(ExtractValue('Width', FrmStrLst[i]));
      GetSetFrameA[High(GetSetFrameA)].HeightSpinEdit.Value := StrToInt(ExtractValue('Height', FrmStrLst[i]));
    end;
    FrmStrLst.Free;
  end;
end;

procedure TAPSMainForm.SaveFramesToFile(TempFileName: String);
var
  FrmStrLst: TStringList;
  i: Integer;
  RectStr: String;
begin
  FrmStrLst := TStringList.Create;
  for i := 0 to High(GetSetFrameA) do
  begin
    RectStr := '(' + IntToStr(GetSetFrameA[i].LeftSpinEdit.Value) + ',' + IntToStr(GetSetFrameA[i].TopSpinEdit.Value) + ',' + IntToStr(GetSetFrameA[i].WidthSpinEdit.Value) + ',' + IntToStr(GetSetFrameA[i].HeightSpinEdit.Value) + ') ';
    FrmStrLst.Append(RectStr + GetSetFrameA[i].NameEdit.Text);
  end;
  FrmStrLst.SaveToFile(TempFileName);
  FrmStrLst.Free;
end;

procedure TAPSMainForm.AddGetSetFrame;
var
  TmpDPI: Integer;
begin
  TmpDPI := 96;
  SetLength(GetSetFrameA, Length(GetSetFrameA) + 1);
  GetSetFrameA[High(GetSetFrameA)] := TGetSetFrame.Create(FrameScrollBox);
  with GetSetFrameA[High(GetSetFrameA)] do
  begin
    Parent := FrameScrollBox;
    Top := High(GetSetFrameA) * Height + 5;
    Align := alTop;
    Name := 'GetSetFrame_' + IntToStr(High(GetSetFrameA));
    Tag := High(GetSetFrameA);
    PopupMenu := GSFramePopupMenu;

    // Get
    GetSetFrameA[High(GetSetFrameA)].GSGetWindowReticle.Left :=
      MulDiv(GetSetFrameA[High(GetSetFrameA)].GSGetWindowReticle.Left, Screen.PixelsPerInch, TmpDPI);
    GetSetFrameA[High(GetSetFrameA)].GSGetWindowReticle.Top :=
      MulDiv(GetSetFrameA[High(GetSetFrameA)].GSGetWindowReticle.Top, Screen.PixelsPerInch, TmpDPI);
    GetSetFrameA[High(GetSetFrameA)].GSGetWindowReticle.Width :=
      MulDiv(GetSetFrameA[High(GetSetFrameA)].GSGetWindowReticle.Width, Screen.PixelsPerInch, TmpDPI);
    GetSetFrameA[High(GetSetFrameA)].GSGetWindowReticle.Height :=
      MulDiv(GetSetFrameA[High(GetSetFrameA)].GSGetWindowReticle.Height, Screen.PixelsPerInch, TmpDPI);
    GetSetFrameA[High(GetSetFrameA)].GSGetWindowReticle.ScaleForPPI(TmpDPI);

    // Set
    GetSetFrameA[High(GetSetFrameA)].GSSetWindowReticle.Left :=
      MulDiv(GetSetFrameA[High(GetSetFrameA)].GSSetWindowReticle.Left, Screen.PixelsPerInch, TmpDPI);
    GetSetFrameA[High(GetSetFrameA)].GSSetWindowReticle.Top :=
      MulDiv(GetSetFrameA[High(GetSetFrameA)].GSSetWindowReticle.Top, Screen.PixelsPerInch, TmpDPI);
    GetSetFrameA[High(GetSetFrameA)].GSSetWindowReticle.Width :=
      MulDiv(GetSetFrameA[High(GetSetFrameA)].GSSetWindowReticle.Width, Screen.PixelsPerInch, TmpDPI);
    GetSetFrameA[High(GetSetFrameA)].GSSetWindowReticle.Height :=
      MulDiv(GetSetFrameA[High(GetSetFrameA)].GSSetWindowReticle.Height, Screen.PixelsPerInch, TmpDPI);
    GetSetFrameA[High(GetSetFrameA)].GSSetWindowReticle.ScaleForPPI(TmpDPI);
  end;
end;

procedure TAPSMainForm.LoadListFile(FileName: String);
begin
  if FileExists(FileName) then
  begin
    InfoMemo.Lines.LoadFromFile(FileName);
    MostRecentFiles.AddFile(FileName);
  end;
end;

procedure TAPSMainForm.aSelectFrameListExecute(Sender: TObject);
var
  TmpStr: String;
  TmpBool: Boolean;
begin
  TmpBool := SettingsForm.StayOnTopCheckBox.Checked;
  SettingsForm.StayOnTopCheckBox.Checked := False;
  SetStayOnTopStatus;
  SelectFileDlg.SelectFileFrame.SetFileListPath(LstDir);
  SelectFileDlg.SelectFileFrame.SetFileListMask('*.txt');
  SelectFileDlg.SelectFileFrame.LoadFileList;
  if SelectFileDlg.ShowModal = mrOk then
  begin
    if Pos('[L] ', SelectFileDlg.FileName) = 1 then
    begin
      TmpStr := Copy(SelectFileDlg.FileName, 5);
      LoadFrameList(TmpStr);
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

procedure TAPSMainForm.aSelectListFileExecute(Sender: TObject);
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

procedure TAPSMainForm.aLoadListFileExecute(Sender: TObject);
begin
  OpenDialog.InitialDir := LstDir;
  OpenDialog.Filter := 'CSV Files (*.CSV)|*.CSV|All Files (*.*)|*.*';
  if OpenDialog.Execute then FileNameEdit.Text := ExtractFileName(OpenDialog.FileName);
end;

procedure TAPSMainForm.aMoveToSystemTrayExecute(Sender: TObject);
begin
  HideForm;
end;

procedure TAPSMainForm.aSaveAsFrameListExecute(Sender: TObject);
var
  TempFileName: String;
  OkToSave: Boolean;
begin
  SaveDialog.InitialDir := LstDir;
  SaveDialog.Filter := 'Text Files (*.TXT)|*.TXT|All Files (*.*)|*.*';
  if SaveDialog.Execute then
  begin
    TempFileName := SaveDialog.FileName;
    if ExtractFileExt(TempFileName) = '' then TempFileName := TempFileName + '.txt';
    OkToSave := True;
    if FileExists(TempFileName) then
    begin
      OkToSave := (MessageDlg('Okay to overwrite: ' + ExtractFileName(TempFileName) + '?', mtConfirmation, [mbYes,mbNo], 0, mbNo) = mrYes);
    end;
    if OkToSave then
    begin
      SaveFramesToFile(TempFileName);
    end;
  end;
end;

procedure TAPSMainForm.aSaveListFileExecute(Sender: TObject);
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

procedure TAPSMainForm.aSetAppPosAndSizeExecute(Sender: TObject);
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
      SetWindowPos(Application.MainForm.Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NoMove or SWP_NoSize);
      SetWindowPos(Application.MainForm.Handle, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NoMove or SWP_NoSize);
  end;
end;

procedure TAPSMainForm.aSettingsExecute(Sender: TObject);
begin
  SettingsForm.SavFrmSizChkBox.Checked := SaveFormSize;
  SettingsForm.SavFrmPosChkBox.Checked := SaveFormPosition;
  SettingsForm.EnableStylesSettingsCheckBox.Checked := StylesEnabled;
  SettingsForm.StylesListBox.Enabled := StylesEnabled;
  SettingsForm.StayOnTopCheckBox.Checked := StayOnTopB;
  SettingsForm.StylesMMCheckBox.Checked := StylesMM;
  SettingsForm.Top := APSMainForm.Top; SettingsForm.Left := APSMainForm.Left + APSMainForm.Width;
  if SettingsForm.MainFormSettingsListBox.Count > 0 then
    SettingsForm.MainFormSettingsListBox.ItemIndex := 0;
  SettingsForm.UpdateSettingsAdminStatus;
  SettingsForm.AltCheckBox.Checked := HotKey1AltB;
  SettingsForm.CtrlCheckBox.Checked := HotKey1CtrlB;
  SettingsForm.ShftCheckBox.Checked := HotKey1ShftB;
  SettingsForm.KeyComboBox.Text := HotKey1Key;
  SettingsForm.PagesCheckBox.Checked := PagesMM;
  SettingsForm.Page1CheckBox.Checked := Page1;
  SettingsForm.Page2CheckBox.Checked := Page2;
  SettingsForm.Page3CheckBox.Checked := Page3;
  SettingsForm.Page4CheckBox.Checked := Page4;
  SettingsForm.Show;
end;

procedure TAPSMainForm.TrayIconDblClick(Sender: TObject);
begin
  RestoreForm;
end;

function InSkipList(Str2Chk: String): Boolean;
begin
  Result := False;
  if Str2Chk = 'ApplicationFrameWindow' then Result := True;
  if Str2Chk = 'Windows.UI.Core.CoreWindow' then Result := True;
end;

procedure TAPSMainForm.aToDBExecute(Sender: TObject);
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

procedure TAPSMainForm.aWhatsNewExecute(Sender: TObject);
begin
  ShowWhatsNewForm;
end;

procedure TAPSMainForm.ALCenterPercentBtnClick(Sender: TObject);
begin
  // Center Percent
  ALLeftSpinEdit.Value := Monitor.Left + (Round((Monitor.WorkareaRect.Width / 2) - ((Monitor.WorkareaRect.Width / 2) * (ALCenterPercentSpinEdit.Value / 100))));
  ALTopSpinEdit.Value := Monitor.Top + (Round((Monitor.WorkareaRect.Height / 2) - ((Monitor.WorkareaRect.Height / 2) * (ALCenterPercentSpinEdit.Value / 100))));
  ALWidthSpinEdit.Value := Round(((Monitor.WorkareaRect.Width / 2) * (ALCenterPercentSpinEdit.Value / 100)) * 2);
  ALHeightSpinEdit.Value := Round(((Monitor.WorkareaRect.Height / 2) * (ALCenterPercentSpinEdit.Value / 100)) * 2);
end;

procedure TAPSMainForm.ALBottomLeftBtnClick(Sender: TObject);
begin
  // Bottom Left Corner
  ALLeftSpinEdit.Value := Monitor.WorkareaRect.Left;
  ALTopSpinEdit.Value := Monitor.Top + ((Monitor.WorkareaRect.Height div 2) + 1);
  ALWidthSpinEdit.Value := Monitor.WorkareaRect.Width div 2;
  ALHeightSpinEdit.Value := Monitor.WorkareaRect.Height div 2;
end;

procedure TAPSMainForm.ALBottomRightBtnClick(Sender: TObject);
begin
  // Bottom Right Corner
  ALLeftSpinEdit.Value := Monitor.Left + ((Monitor.WorkareaRect.Width div 2) + 1);
  ALTopSpinEdit.Value := Monitor.Top + ((Monitor.WorkareaRect.Height div 2) + 1);
  ALWidthSpinEdit.Value := Monitor.WorkareaRect.Width div 2;
  ALHeightSpinEdit.Value := Monitor.WorkareaRect.Height div 2;
end;

procedure TAPSMainForm.SetConfirmBefore(Checked: Boolean);
begin
  ABConfirmBefore := Checked;
  GSConfirmBefore := Checked;
end;

procedure TAPSMainForm.ALCenterBtnClick(Sender: TObject);
var
  SelectedNode: PVirtualNode;
  NodeData: PTreeData;
begin
  SelectedNode := VST.GetFirstSelected(False);
  if Assigned(SelectedNode) then
  begin
    NodeData := VST.GetNodeData(SelectedNode);
    ALLeftSpinEdit.Value := Monitor.Left + ((Monitor.WorkareaRect.Width div 2) - (WindowList.Windows[NodeData^.WindowListNo].WindowRect.Width div 2));
    ALTopSpinEdit.Value :=  Monitor.Top + ((Monitor.WorkareaRect.Height div 2) - (WindowList.Windows[NodeData^.WindowListNo].WindowRect.Height div 2));
    ALWidthSpinEdit.Value := WindowList.Windows[NodeData^.WindowListNo].WindowRect.Width;
    ALHeightSpinEdit.Value := WindowList.Windows[NodeData^.WindowListNo].WindowRect.Height;
  end;
end;

procedure TAPSMainForm.ALCenterSpeedButtonClick(Sender: TObject);
begin
  ALPageControl.ActivePageIndex := 0;
end;

procedure TAPSMainForm.ALCornersSpeedButtonClick(Sender: TObject);
begin
  ALPageControl.ActivePageIndex := 1;
end;

function MyMessageDlg(const Msg: String; DlgType: TMsgDlgType; Button: TMsgDlgButtons;
  Caption: array of String; DlgCaption: String; DefaultButton: TMsgDlgBtn;
  const AppRect: TRect): Integer;
var
  aMsgDlg: TForm;
  i: Integer;
  DlgButton: TButton;
  CaptionIndex: Integer;
begin
  aMsgdlg := CreateMessageDialog(Msg, DlgType, Button, DefaultButton);
  aMsgdlg.Caption := DlgCaption;
  aMsgdlg.BorderIcons := aMsgdlg.BorderIcons - [biSystemMenu];
  aMsgdlg.BorderStyle := bsSingle;

  aMsgdlg.Left := AppRect.Left + (AppRect.Width - aMsgdlg.Width) div 2;
  aMsgdlg.Top := AppRect.Top + (AppRect.Height - aMsgdlg.Height) div 2;

  CaptionIndex := 0;
  for i := 0 to aMsgDlg.ComponentCount - 1 Do
  begin
    if (aMsgDlg.Components[i] is TButton) then
    begin
      DlgButton := TButton(aMsgDlg.Components[i]);
      if CaptionIndex <= High(Caption) then
        DlgButton.Caption := Caption[CaptionIndex];
      inc(CaptionIndex);
    end;
  end;
  Result := aMsgdlg.ShowModal;
end;

procedure TAPSMainForm.ApplyBtnClick(Sender: TObject);
var
  SelectedNode: PVirtualNode;
  NodeData: PTreeData;
  SelectedAppHandle: hwnd;
  WindowRect, PreviousWindowRect: TRect;
  WindowNameStr: String;
  OkToChg, AcceptOrRevert: Integer;
  ChangePending: Boolean;
begin
  SelectedNode := VST.GetFirstSelected(False);
  if Assigned(SelectedNode) then
  begin
    NodeData := VST.GetNodeData(SelectedNode);
    SelectedAppHandle := WindowList.Windows[NodeData^.WindowListNo].WinHandle;
    if IsWindow(SelectedAppHandle) then
    begin
      WindowNameStr := WindowList.Windows[NodeData^.WindowListNo].WinCaption;
      if GSConfirmBefore then
      begin
        if GSStayOnTopB then SetWindowPos(Application.MainForm.Handle, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NoMove or SWP_NoSize);
        OkToChg := MyMessageDlg('What do you want to do with' + #10#13 + '"' + WindowNameStr + '" ?', mtConfirmation, [mbYes, mbOk, mbRetry, mbNo], ['Position/Size', 'Position', 'Size', 'Cancel'], 'Confirmation', mbRetry, GSAppRect);
        if GSStayOnTopB then SetWindowPos(Application.MainForm.Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NoMove or SWP_NoSize);
      end
      else
      begin
        OkToChg := 6;
      end;

    // 6	mbYes		Position/Size
    // 7	mbOk		Position
    // 1	mbRetry		Size
    // 4	mbNo		Cancel

      if OkToChg in [6, 7, 1] then
      begin
        if SelectedAppHandle <> 0 then
        begin
          GetWindowRect(SelectedAppHandle, PreviousWindowRect);
          ChangePending := False;

          case OkToChg of
            6: begin
                 WindowRect.Left := ALLeftSpinEdit.Value;
                 WindowRect.Top := ALTopSpinEdit.Value;
                 WindowRect.Width := ALWidthSpinEdit.Value;
                 WindowRect.Height := ALHeightSpinEdit.Value;
                 ChangePending := True;
               end;
            7: begin
                 WindowRect.Left := ALLeftSpinEdit.Value;
                 WindowRect.Top := ALTopSpinEdit.Value;
                 WindowRect.Width := PreviousWindowRect.Width;
                 WindowRect.Height := PreviousWindowRect.Height;
                 ChangePending := True;
               end;
            1: begin
                 WindowRect.Left := PreviousWindowRect.Left;
                 WindowRect.Top := PreviousWindowRect.Top;
                 WindowRect.Width := ALWidthSpinEdit.Value;
                 WindowRect.Height := ALHeightSpinEdit.Value;
                 ChangePending := True;
               end;
          end;
        end;

        if ChangePending then
        begin
          if SetWindowPos(SelectedAppHandle, HWND_TOP,
              WindowRect.Left,
              WindowRect.Top,
              WindowRect.Width,
              WindowRect.Height, 0) then
          begin
            // Put APS back on top
            SetWindowPos(Application.MainForm.Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NoMove or SWP_NoSize);
            SetWindowPos(Application.MainForm.Handle, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NoMove or SWP_NoSize);
            if GSConfirmAfter then
            begin
              if GSStayOnTopB then SetWindowPos(Application.MainForm.Handle, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NoMove or SWP_NoSize);
              AcceptOrRevert := MyMessageDlg('Accept or Revert', mtConfirmation, [mbYes, mbNo], ['Accept','Revert'], 'Confirmation', mbNo, GSAppRect);
              if GSStayOnTopB then SetWindowPos(Application.MainForm.Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NoMove or SWP_NoSize);
              if AcceptOrRevert = 7 then
              begin
                SetWindowPos(SelectedAppHandle, HWND_TOP,
                  PreviousWindowRect.Left,
                  PreviousWindowRect.Top,
                  PreviousWindowRect.Width,
                  PreviousWindowRect.Height, 0);
                  // Put APS back on top
                  SetWindowPos(Application.MainForm.Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NoMove or SWP_NoSize);
                  SetWindowPos(Application.MainForm.Handle, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NoMove or SWP_NoSize);
              end;
            end;
            LoadApplicationList;
          end
          else
          begin
            MyMessageDlg('Failed to adjust!' + #13#10 + 'APS may need to be elevated', mtWarning, [mbOk], ['Ok'], 'Warning', mbOk, GSAppRect);
          end;
        end;
      end;
    end
    else
    begin
      MyMessageDlg('Application not found!' + #13#10 + 'Please refresh application list.', mtWarning, [mbOk], ['Ok'], 'Warning', mbOk, GSAppRect);
    end;
  end;
end;

procedure TAPSMainForm.OpenDirectory(DirectoryName: String);
begin
  ShellExecute(Application.Handle,
    nil,
    'explorer.exe',
    PChar(DirectoryName), //wherever you want the window to open to
    nil,
    SW_NORMAL     //see other possibilities by ctrl+clicking on SW_NORMAL
    );
end;

procedure TAPSMainForm.pmiAboutClick(Sender: TObject);
begin
  OpenAboutBox;
end;

procedure TAPSMainForm.pmiGSRemoveFrameClick(Sender: TObject);
var
  Caller: TObject;
  i, SelectedFrame, TopFrame: Integer;
begin
  Caller := ((Sender as TMenuItem).GetParentMenu as TPopupMenu).PopupComponent;
  SelectedFrame := (Caller as TControl).Tag;
  TopFrame := GetSetFrameA[High(GetSetFrameA)].Tag;
  if SelectedFrame = TopFrame then
  begin
    GetSetFrameA[(Caller as TControl).Tag].Free;
    GetSetFrameA[(Caller as TControl).Tag] := nil;
    SetLength(GetSetFrameA, Length(GetSetFrameA) - 1);
  end
  else
  begin
    for i := SelectedFrame to TopFrame - 1 do
    begin
      GetSetFrameA[i].NameEdit.Text := GetSetFrameA[i + 1].NameEdit.Text;
      GetSetFrameA[i].LeftSpinEdit.Value := GetSetFrameA[i + 1].LeftSpinEdit.Value;
      GetSetFrameA[i].TopSpinEdit.Value := GetSetFrameA[i + 1].TopSpinEdit.Value;
      GetSetFrameA[i].WidthSpinEdit.Value := GetSetFrameA[i + 1].WidthSpinEdit.Value;
      GetSetFrameA[i].HeightSpinEdit.Value := GetSetFrameA[i + 1].HeightSpinEdit.Value;
    end;
    GetSetFrameA[High(GetSetFrameA)].Free;
    GetSetFrameA[High(GetSetFrameA)] := nil;
    SetLength(GetSetFrameA, Length(GetSetFrameA) - 1);
  end;
end;

procedure TAPSMainForm.RestoreForm;
begin
  { Hide the tray icon and show the window,
  setting its state property to wsNormal. }
  TrayIcon.Visible := False;
  Show;
  WindowState := wsNormal;
  Application.BringToFront;
end;

procedure TAPSMainForm.HideForm;
begin
  { Hide the window and set its state variable to wsMinimized. }
  SettingsForm.Close;
  Hide;
  WindowState := wsMinimized;
  { Show the animated tray icon and also a hint balloon. }
  TrayIcon.Visible := True;
end;

procedure TAPSMainForm.ALHorizontalCenterBtnClick(Sender: TObject);
var
  SelectedNode: PVirtualNode;
  NodeData: PTreeData;
begin
  //  Horizontal Center
  SelectedNode := VST.GetFirstSelected(False);
  if Assigned(SelectedNode) then
  begin
    NodeData := VST.GetNodeData(SelectedNode);
    ALLeftSpinEdit.Value := Monitor.Left + ((Monitor.WorkareaRect.Width div 2) - (WindowList.Windows[NodeData^.WindowListNo].WindowRect.Width div 2));
    ALTopSpinEdit.Value :=  WindowList.Windows[NodeData^.WindowListNo].WindowRect.Top;
    ALWidthSpinEdit.Value := WindowList.Windows[NodeData^.WindowListNo].WindowRect.Width;
    ALHeightSpinEdit.Value := WindowList.Windows[NodeData^.WindowListNo].WindowRect.Height;
  end;
end;

procedure TAPSMainForm.ALLeftSideBtnClick(Sender: TObject);
begin
  // Left Side
  ALLeftSpinEdit.Value := Monitor.WorkareaRect.Left;
  ALTopSpinEdit.Value := Monitor.WorkareaRect.Top;
  ALWidthSpinEdit.Value := Monitor.WorkareaRect.Width div 2;
  ALHeightSpinEdit.Value := Monitor.WorkareaRect.Height;
end;

procedure TAPSMainForm.ALMBottomCenterBtnClick(Sender: TObject);
var
  SelectedNode: PVirtualNode;
  NodeData: PTreeData;
begin
  // Move Bottom Center
  SelectedNode := VST.GetFirstSelected(False);
  if Assigned(SelectedNode) then
  begin
    NodeData := VST.GetNodeData(SelectedNode);
    ALLeftSpinEdit.Value := Monitor.Left + ((Monitor.WorkareaRect.Width div 2) - (WindowList.Windows[NodeData^.WindowListNo].WindowRect.Width div 2));
    ALTopSpinEdit.Value := Monitor.Top + (Monitor.WorkareaRect.Height - WindowList.Windows[NodeData^.WindowListNo].WindowRect.Height);
    ALWidthSpinEdit.Value := WindowList.Windows[NodeData^.WindowListNo].WindowRect.Width;
    ALHeightSpinEdit.Value := WindowList.Windows[NodeData^.WindowListNo].WindowRect.Height;
  end;
end;

procedure TAPSMainForm.ALMBottomLeftBtnClick(Sender: TObject);
var
  SelectedNode: PVirtualNode;
  NodeData: PTreeData;
begin
  // Move Bottom Left
  SelectedNode := VST.GetFirstSelected(False);
  if Assigned(SelectedNode) then
  begin
    NodeData := VST.GetNodeData(SelectedNode);
    ALLeftSpinEdit.Value := Monitor.WorkareaRect.Left;
    ALTopSpinEdit.Value := Monitor.Top + (Monitor.WorkareaRect.Height - WindowList.Windows[NodeData^.WindowListNo].WindowRect.Height);
    ALWidthSpinEdit.Value := WindowList.Windows[NodeData^.WindowListNo].WindowRect.Width;
    ALHeightSpinEdit.Value := WindowList.Windows[NodeData^.WindowListNo].WindowRect.Height;
  end;
end;

procedure TAPSMainForm.ALMBottomRightBtnClick(Sender: TObject);
var
  SelectedNode: PVirtualNode;
  NodeData: PTreeData;
begin
  // Move Bottom Right
  SelectedNode := VST.GetFirstSelected(False);
  if Assigned(SelectedNode) then
  begin
    NodeData := VST.GetNodeData(SelectedNode);
    ALLeftSpinEdit.Value := Monitor.Left + (Monitor.WorkareaRect.Width - WindowList.Windows[NodeData^.WindowListNo].WindowRect.Width);
    ALTopSpinEdit.Value := Monitor.Top + (Monitor.WorkareaRect.Height - WindowList.Windows[NodeData^.WindowListNo].WindowRect.Height);
    ALWidthSpinEdit.Value := WindowList.Windows[NodeData^.WindowListNo].WindowRect.Width;
    ALHeightSpinEdit.Value := WindowList.Windows[NodeData^.WindowListNo].WindowRect.Height;
  end;
end;

procedure TAPSMainForm.ALMCenterBtnClick(Sender: TObject);
var
  SelectedNode: PVirtualNode;
  NodeData: PTreeData;
begin
  // Move Center
  SelectedNode := VST.GetFirstSelected(False);
  if Assigned(SelectedNode) then
  begin
    NodeData := VST.GetNodeData(SelectedNode);
    ALLeftSpinEdit.Value := Monitor.Left + ((Monitor.WorkareaRect.Width div 2) - (WindowList.Windows[NodeData^.WindowListNo].WindowRect.Width div 2));
    ALTopSpinEdit.Value := Monitor.Top + ((Monitor.WorkareaRect.Height div 2) - (WindowList.Windows[NodeData^.WindowListNo].WindowRect.Height div 2));
    ALWidthSpinEdit.Value := WindowList.Windows[NodeData^.WindowListNo].WindowRect.Width;
    ALHeightSpinEdit.Value := WindowList.Windows[NodeData^.WindowListNo].WindowRect.Height;
  end;
end;

procedure TAPSMainForm.ALMCenterLeftBtnClick(Sender: TObject);
var
  SelectedNode: PVirtualNode;
  NodeData: PTreeData;
begin
  // Move Center Left
  SelectedNode := VST.GetFirstSelected(False);
  if Assigned(SelectedNode) then
  begin
    NodeData := VST.GetNodeData(SelectedNode);
    ALLeftSpinEdit.Value := Monitor.WorkareaRect.Left;
    ALTopSpinEdit.Value := Monitor.Top + ((Monitor.WorkareaRect.Height div 2) - (WindowList.Windows[NodeData^.WindowListNo].WindowRect.Height div 2));
    ALWidthSpinEdit.Value := WindowList.Windows[NodeData^.WindowListNo].WindowRect.Width;
    ALHeightSpinEdit.Value := WindowList.Windows[NodeData^.WindowListNo].WindowRect.Height;
  end;
end;

procedure TAPSMainForm.ALMCenterRightBtnClick(Sender: TObject);
var
  SelectedNode: PVirtualNode;
  NodeData: PTreeData;
begin
  // Move Center Right
  SelectedNode := VST.GetFirstSelected(False);
  if Assigned(SelectedNode) then
  begin
    NodeData := VST.GetNodeData(SelectedNode);
    ALLeftSpinEdit.Value := Monitor.Left + (Monitor.WorkareaRect.Width - WindowList.Windows[NodeData^.WindowListNo].WindowRect.Width);
    ALTopSpinEdit.Value := Monitor.Top + ((Monitor.WorkareaRect.Height div 2) - (WindowList.Windows[NodeData^.WindowListNo].WindowRect.Height div 2));
    ALWidthSpinEdit.Value := WindowList.Windows[NodeData^.WindowListNo].WindowRect.Width;
    ALHeightSpinEdit.Value := WindowList.Windows[NodeData^.WindowListNo].WindowRect.Height;
  end;
end;

procedure TAPSMainForm.ALMoveSpeedButtonClick(Sender: TObject);
begin
  ALPageControl.ActivePageIndex := 3;
end;

procedure TAPSMainForm.ALMTopCenterBtnClick(Sender: TObject);
var
  SelectedNode: PVirtualNode;
  NodeData: PTreeData;
begin
  SelectedNode := VST.GetFirstSelected(False);
  if Assigned(SelectedNode) then
  begin
    // Move Top Center
    NodeData := VST.GetNodeData(SelectedNode);
    ALLeftSpinEdit.Value := Monitor.Left + ((Monitor.WorkareaRect.Width div 2) - (WindowList.Windows[NodeData^.WindowListNo].WindowRect.Width div 2));
    ALTopSpinEdit.Value := Monitor.WorkareaRect.Top;
    ALWidthSpinEdit.Value := WindowList.Windows[NodeData^.WindowListNo].WindowRect.Width;
    ALHeightSpinEdit.Value := WindowList.Windows[NodeData^.WindowListNo].WindowRect.Height;
  end;
end;

procedure TAPSMainForm.ALMTopLeftBtnClick(Sender: TObject);
var
  SelectedNode: PVirtualNode;
  NodeData: PTreeData;
begin
  // Move Top Left
  SelectedNode := VST.GetFirstSelected(False);
  if Assigned(SelectedNode) then
  begin
    NodeData := VST.GetNodeData(SelectedNode);
    ALLeftSpinEdit.Value := Monitor.WorkareaRect.Left;
    ALTopSpinEdit.Value := Monitor.WorkareaRect.Top;
    ALWidthSpinEdit.Value := WindowList.Windows[NodeData^.WindowListNo].WindowRect.Width;
    ALHeightSpinEdit.Value := WindowList.Windows[NodeData^.WindowListNo].WindowRect.Height;
  end;
end;

procedure TAPSMainForm.ALMTopRightBtnClick(Sender: TObject);
var
  SelectedNode: PVirtualNode;
  NodeData: PTreeData;
begin
  // Move Top Right
  SelectedNode := VST.GetFirstSelected(False);
  if Assigned(SelectedNode) then
  begin
    NodeData := VST.GetNodeData(SelectedNode);
    ALLeftSpinEdit.Value := Monitor.Left + (Monitor.WorkareaRect.Width - WindowList.Windows[NodeData^.WindowListNo].WindowRect.Width);
    ALTopSpinEdit.Value := Monitor.WorkareaRect.Top;
    ALWidthSpinEdit.Value := WindowList.Windows[NodeData^.WindowListNo].WindowRect.Width;
    ALHeightSpinEdit.Value := WindowList.Windows[NodeData^.WindowListNo].WindowRect.Height;
  end;
end;

procedure TAPSMainForm.pmiQuitClick(Sender: TObject);
begin
  Close;
end;

procedure TAPSMainForm.pmiRestoreClick(Sender: TObject);
begin
  RestoreForm;
end;

procedure TAPSMainForm.WndProc(var Message: TMessage);
var
  S: String;
begin
  // Interprocess communication handler.
  // First check whether we can safely read TForm.Handle property ...
  if HandleAllocated and not (csDestroying in ComponentState) then
  begin
    // ... then whether it is our message. The last paramter tells to ignore the
    // message sent from window of this instance
    case ReadMessageCheck(Message, Handle) of
      1: // It is our data
      begin
        try
          // Read TStrings from the message
          ReadMessageString(Message, S);
          if S = 'RestoreForm' then RestoreForm;
        finally
        end;
      end;
    else
      inherited;
    end;
  end
  else
    inherited;
end;

procedure TAPSMainForm.ShowWhatsNewForm;
begin
  // Center WhatsNewForm to 75 Percent
  WhatsNewForm.Left := Monitor.Left + (Round((Monitor.WorkareaRect.Width / 2) - ((Monitor.WorkareaRect.Width / 2) * (75 / 100))));
  WhatsNewForm.Top := Monitor.Top + (Round((Monitor.WorkareaRect.Height / 2) - ((Monitor.WorkareaRect.Height / 2) * (75 / 100))));
//  WhatsNewForm.Width := Round(((Monitor.WorkareaRect.Width / 2) * (50 / 100)) * 2);
  WhatsNewForm.Width := 900;
  WhatsNewForm.Height := Round(((Monitor.WorkareaRect.Height / 2) * (65 / 100)) * 2);
  WhatsNewForm.Show;
end;

procedure TAPSMainForm.LoadApplicationList;
begin
  if JvPageList.ActivePage = JvStandardPage2 then
  begin
    MsgPnl.Visible := True;
    RefreshApplicationList;
    VST.BeginUpdate;
    VST.Header.AutoFitColumns(False);
    VST.EndUpdate;
    MsgPnl.Visible := False;
  end;
end;

procedure TAPSMainForm.RefreshApplicationList;
var
  i: Integer;
  IsAppMainWin: Boolean;
  Node: PVirtualNode;
  Data: PTreeData;
begin
  VST.Header.SortColumn := NoColumn;
  VST.NodeDataSize := SizeOf(TTreeData);
  VST.BeginUpdate;
  VST.Clear;
  Application.ProcessMessages;
  WindowList.Refresh;
  for i := 0 to WindowList.Count - 1 do
  begin
    // Check if the window is a visible application main window.
    IsAppMainWin := IsWindowVisible(WindowList.Windows[i].WinHandle) and // Visible
    (GetWindow(WindowList.Windows[i].WinHandle, GW_OWNER) = 0) and // Not owned by other windows
    (GetParent(WindowList.Windows[i].WinHandle) = 0) and // Does not have any parent
    (GetWindowLong(WindowList.Windows[i].WinHandle, GWL_EXSTYLE) and WS_EX_TOOLWINDOW = 0);
    // Not a tool window
    if IsAppMainWin and (not InSkipList(WindowList.Windows[i].WinClass)) then
    begin
      Node := VST.AddChild(nil);
      Data := VST.GetNodeData(Node);
      VST.ValidateNode(Node, False);
      Data^.FFileDescription := WindowList.Windows[i].ExeDesc;
      Data^.FLeft := WindowList.Windows[i].WindowRect.Left;
      Data^.FTop := WindowList.Windows[i].WindowRect.Top;
      Data^.FWidth := WindowList.Windows[i].WindowRect.Width;
      Data^.FHeight := WindowList.Windows[i].WindowRect.Height;
      Data^.WindowListNo := i;
    end;
  end;
  VST.EndUpdate;
end;

procedure TAPSMainForm.RefreshApplicationListSpdBtnClick(Sender: TObject);
begin
  RefreshApplicationListSpdBtn.Enabled := False;
  LoadApplicationList;
  RefreshApplicationListSpdBtn.Enabled := True;
end;

procedure TAPSMainForm.OpenAboutBox;
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

// https://stackoverflow.com/questions/11594084/shift-in-the-right-of-last-item-of-the-menu
Procedure TAPSMainForm.RightMenu(mmiMoveRight: TMenuItem); // Shift in the right of last item of the menu
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

procedure TAPSMainForm.RestoreMainFormPositionAndSize;
begin
  //  Position is lost when the Style is changed
  if SaveFormPosition then
  begin
    APSMainForm.Left := MainFormRect.Left;
    APSMainForm.Top := MainFormRect.Top;
  end;
  if SaveFormSize then
  begin
    APSMainForm.Width := MainFormRect.Width;
    APSMainForm.Height := MainFormRect.Height;
  end;
end;

procedure TAPSMainForm.FormCreate(Sender: TObject);
begin
  Application.HintHidePause := 5000; // hint disappears after 5 secs
  InitDtaDir;
  LoadStyleSettings;
  TStyleManager.TrySetStyle(StyleStr);
  LoadSettingsFromFormCreate;
  if mmiAutoStartElevated.Checked then
    if not IsAdministrator then
    begin
      ShellExecute(Handle, 'runas', PChar(Application.ExeName), nil, nil, SW_SHOWNORMAL);
    end;
  if StylesMM then mmiStyles.Visible := True else mmiStyles.Visible := False;
  if PagesMM then mmiPages.Visible := True else mmiPages.Visible := False;
  if Page1 then mmiPage1.Visible := True else mmiPage1.Visible := False;
  if Page2 then mmiPage2.Visible := True else mmiPage2.Visible := False;
  if Page3 then mmiPage3.Visible := True else mmiPage3.Visible := False;
  if Page4 then mmiPage4.Visible := True else mmiPage4.Visible := False;

  LoadSettingsFromFormCreate;
  RestoreMainFormPositionAndSize;
  SetHotKey;
end;

procedure TAPSMainForm.FormDestroy(Sender: TObject);
begin
  UnsetHotKey;
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

procedure TAPSMainForm.CheckStyle(Menu: TMenuItem; StyleStr: String);
var
  i: Integer;
begin
  for i := 0 to Menu.Count - 1 do
  begin
    if Menu.Items[i].Hint = StyleStr then
      Menu.Items[i].Checked := True;
  end;
end;

procedure TAPSMainForm.UnCheckStyles(Menu: TMenuItem);
var
  i: Integer;
begin
  for i := 0 to Menu.Count - 1 do
  begin
    Menu.Items[i].Checked := False;
  end;
end;

procedure TAPSMainForm.mmiMoveToSystemTrayClick(Sender: TObject);
begin
  HideForm;
end;

procedure TAPSMainForm.mmiStylesClick(Sender: TObject);
begin
  SettingsForm.Close; // Access violation if SettingsForm is open
  UnCheckStyles(MainMenu.Items.Find('Styles'));
  TStyleManager.TrySetStyle((Sender as TMenuItem).Hint);
  StyleStr := (Sender as TMenuItem).Hint;
  CheckStyle(MainMenu.Items.Find('Styles'), StyleStr);
  SettingsForm.StylesListBox.ItemIndex := SettingsForm.StylesListBox.Items.IndexOf(StyleStr);
end;

function TAPSMainForm.FindMenuItemByHint(AMainMenu: TMainMenu; const Hint: String): TMenuItem;

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

procedure TAPSMainForm.AddStylesToMainMenu(StylesCaption: String);
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

procedure TAPSMainForm.FormActivate(Sender: TObject);
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
    KeyDir := DtaDir + 'KEY\'; ForceDirectories(KeyDir);
    VerNum := GetVersionInfoStr(ParamStr(0));
    VerStr := PgmName + '-v' + VerNum;
    MostRecentFiles.IniFile := DtaDir + 'LoadFile-MRU.INI';

    LoadSettingsFromFormActivate;

    MainMenu.Items.Find('About').Caption := VerStr;
    AddStylesToMainMenu('Styles');
    Item := FindMenuItemByHint(MainMenu, StyleStr);
    if Assigned(Item) then Item.Checked := True;
    if FileExists(ExeDir + 'APS.chm') then aContents.Visible := True;
    RightMenu(mmiVersionAbout); // Run after change to MainMenu

    if mmiAutoStartElevated.Checked then
      if not IsAdministrator then
      begin
        AutoElevateDoNotSave := True;
        Close;
      end;
    AutoElevateDoNotSave := False;

    if IsAdministrator then
    begin
      mmiRestartElevated.Caption := 'Running as Admin';
      RightMenu(mmiVersionAbout); // Run after change to MainMenu
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

    if FileExists(LstDir + 'FrameList.txt') then LoadFrameList(LstDir + 'FrameList.txt');
    if FileExists(LstDir + 'ButtonList.txt') then ApplicationBoundsFrame.LoadButtonList(LstDir + 'ButtonList.txt');

    ABAppRect.Top := APSMainForm.Top;
    ABAppRect.Left := APSMainForm.Left;
    ABAppRect.Height := APSMainForm.Height;
    ABAppRect.Width := APSMainForm.Width;

    GSAppRect.Top := APSMainForm.Top;
    GSAppRect.Left := APSMainForm.Left;
    GSAppRect.Height := APSMainForm.Height;
    GSAppRect.Width := APSMainForm.Width;

    if VToV3(LastVerNum) < VToV3(VerNum) then
    begin
      LastVerNum := VerNum;
      ShowWhatsNewForm;
    end;

  end;
end;

function TAPSMainForm.VToV3(InStr: String): String;
var
  Words: TStringList;
begin
  Words := TStringList.Create;
  Parse(Utf8ToAnsi(InStr), '.', Words);
  Result := LPad(Words[0], 3, '0') + LPad(Words[1], 3, '0') + LPad(Words[2], 3, '0') + LPad(Words[3], 3, '0');
  Words.Free;
end;

procedure TAPSMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if not AutoElevateDoNotSave then SaveSettings;
  SaveFramesToFile(LstDir + 'FrameList.txt');
  ApplicationBoundsFrame.SaveButtonList(LstDir + 'ButtonList.txt');
end;

procedure TAPSMainForm.OnMoving(var Msg: TWMMoving);
begin
  inherited;
  UpdateScrPosEdits;
end;

procedure TAPSMainForm.UpdateScrPosEdits;
begin
  SettingsForm.TScrPosFrame.SpinEditTop.Value := APSMainForm.Top;
  SettingsForm.TScrPosFrame.SpinEditLeft.Value := APSMainForm.Left;
  SettingsForm.TScrPosFrame.SpinEditHeight.Value := APSMainForm.Height;
  SettingsForm.TScrPosFrame.SpinEditWidth.Value := APSMainForm.Width;

  ABAppRect.Top := APSMainForm.Top;
  ABAppRect.Left := APSMainForm.Left;
  ABAppRect.Height := APSMainForm.Height;
  ABAppRect.Width := APSMainForm.Width;

  GSAppRect.Top := APSMainForm.Top;
  GSAppRect.Left := APSMainForm.Left;
  GSAppRect.Height := APSMainForm.Height;
  GSAppRect.Width := APSMainForm.Width;

end;

procedure TAPSMainForm.ALTopLeftBtnClick(Sender: TObject);
begin
  // Top Left Corner
  ALLeftSpinEdit.Value := Monitor.WorkareaRect.Left;
  ALTopSpinEdit.Value := Monitor.WorkareaRect.Top;
  ALWidthSpinEdit.Value := Monitor.WorkareaRect.Width div 2;
  ALHeightSpinEdit.Value := Monitor.WorkareaRect.Height div 2;
end;

procedure TAPSMainForm.ALTopRightBtnClick(Sender: TObject);
begin
  // Top Right Corner
  ALLeftSpinEdit.Value := Monitor.Left + ((Monitor.WorkareaRect.Width div 2) + 1);
  ALTopSpinEdit.Value := Monitor.WorkareaRect.Top;
  ALWidthSpinEdit.Value := Monitor.WorkareaRect.Width div 2;
  ALHeightSpinEdit.Value := Monitor.WorkareaRect.Height div 2;
end;

function TAPSMainForm.GetDataByColumn(Data: TTreeData; Column: Integer): String;
begin
  case Column of
    0: Result := Data.FFileDescription;
    1: Result := IntToStr(Data.FLeft);
    2: Result := IntToStr(Data.FTop);
    3: Result := IntToStr(Data.FWidth);
    4: Result := IntToStr(Data.FHeight);
  else
    Result := '';
  end;
end;

procedure TAPSMainForm.ClearGetSetFrames;
var
  i: Integer;
begin
  for i := 0 to High(GetSetFrameA) do
  begin
    GetSetFrameA[i].Free;
    GetSetFrameA[i] := nil;
  end;
  SetLength(GetSetFrameA, 0);
end;

procedure TAPSMainForm.ALRightSideBtnClick(Sender: TObject);
begin
  // Right Side
  ALLeftSpinEdit.Value := Monitor.Left + ((Monitor.WorkareaRect.Width div 2) + 1);
  ALTopSpinEdit.Value := Monitor.WorkareaRect.Top;
  ALWidthSpinEdit.Value := Monitor.WorkareaRect.Width div 2;
  ALHeightSpinEdit.Value := Monitor.WorkareaRect.Height;
end;

procedure TAPSMainForm.ALSidesSpeedButtonClick(Sender: TObject);
begin
  ALPageControl.ActivePageIndex := 2;
end;

procedure TAPSMainForm.ALVerticleCenterBtnClick(Sender: TObject);
var
  SelectedNode: PVirtualNode;
  NodeData: PTreeData;
begin
  // Vertical Center
  SelectedNode := VST.GetFirstSelected(False);
  if Assigned(SelectedNode) then
  begin
    NodeData := VST.GetNodeData(SelectedNode);
    ALLeftSpinEdit.Value := WindowList.Windows[NodeData^.WindowListNo].WindowRect.Left;
    ALTopSpinEdit.Value :=  Monitor.Top + ((Monitor.WorkareaRect.Height div 2) - (WindowList.Windows[NodeData^.WindowListNo].WindowRect.Height div 2));
    ALWidthSpinEdit.Value := WindowList.Windows[NodeData^.WindowListNo].WindowRect.Width;
    ALHeightSpinEdit.Value := WindowList.Windows[NodeData^.WindowListNo].WindowRect.Height;
  end;
end;

procedure TAPSMainForm.VSTClick(Sender: TObject);
var
  SelectedNode: PVirtualNode;
  NodeData: PTreeData;
begin
  SelectedNode := VST.GetFirstSelected(False);
  if Assigned(SelectedNode) then
  begin
    NodeData := VST.GetNodeData(SelectedNode);
    ALLeftSpinEdit.Value := NodeData^.FLeft;
    ALTopSpinEdit.Value := NodeData^.FTop;
    ALWidthSpinEdit.Value := NodeData^.FWidth;
    ALHeightSpinEdit.Value := NodeData^.FHeight;
  end;
end;

procedure TAPSMainForm.VSTGetHint(Sender: TBaseVirtualTree; Node: PVirtualNode;
  Column: TColumnIndex; var LineBreakStyle: TVTTooltipLineBreakStyle;
  var HintText: string);
var
  NodeData: PTreeData;
begin
  NodeData := Sender.GetNodeData(Node);
  HintText := WindowList.Windows[NodeData^.WindowListNo].WinCaption;
end;

procedure TAPSMainForm.VSTGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
  Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
var
  Data: PTreeData;
begin
  Data := (Sender as TBaseVirtualTree).GetNodeData(Node);
  CellText := GetDataByColumn(Data^, Column);
end;

procedure TAPSMainForm.VSTMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  VST.Selected[VST.GetNodeAt(Point(X, Y))] := True;
end;

procedure TAPSMainForm.WindowReticleWindowChange(Sender: TObject);
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

procedure TAPSMainForm.WLRTimerTimer(Sender: TObject);
begin
  WLRTimer.Enabled := False;
  if SettingsForm.AutoLoadApplicationListChkBox.Checked then LoadApplicationList;
end;

procedure TAPSMainForm.LoadSettingsFromFormCreate;
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
    GSStayOnTopB := StayOnTopB;

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

    mmiAutoStartElevated.Checked := RegIniFile.ReadBool('Section-Elevated', 'StartElevated', False);

    HotKey1AltB := RegIniFile.ReadBool('Section-HotKey', 'HotKey1Alt', True);
    HotKey1CtrlB := RegIniFile.ReadBool('Section-HotKey', 'HotKey1Ctrl', False);
    HotKey1ShftB := RegIniFile.ReadBool('Section-HotKey', 'HotKey1Shft', False);
    HotKey1Key := RegIniFile.ReadString('Section-HotKey', 'HotKey1Key', 'Z');

    PagesMM := RegIniFile.ReadBool('Section-Page', 'PagesMM', True);
    Page1 := RegIniFile.ReadBool('Section-Page', 'Page1', False);
    Page2 := RegIniFile.ReadBool('Section-Page', 'Page2', True);
    Page3 := RegIniFile.ReadBool('Section-Page', 'Page3', True);
    Page4 := RegIniFile.ReadBool('Section-Page', 'Page4', True);

  finally
    RegIniFile.Free;
  end;
end;

procedure TAPSMainForm.LoadSettingsFromFormActivate;
var
  RegIniFile: TIniFile;
  i, ItemCount: Integer;
begin
  RegIniFile := TIniFile.Create(DtaDir + PgmIni);
  try
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

procedure TAPSMainForm.LoadSettingsLateFormActivate;
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

    JvPageList.ActivePageIndex := RegIniFile.ReadInteger('Section-Page', 'CurrentPage', 1);

    SettingsForm.JvPageList.ActivePageIndex := RegIniFile.ReadInteger('Section-Settings', 'CurrentPage', 0);

    SettingsForm.ConfirmBeforeCheckBox.Checked := RegIniFile.ReadBool('Section-Options', 'ConfirmBefore', True);
    ABConfirmBefore := SettingsForm.ConfirmBeforeCheckBox.Checked;
    GSConfirmBefore := SettingsForm.ConfirmBeforeCheckBox.Checked;

    SettingsForm.ConfirmAfterCheckBox.Checked := RegIniFile.ReadBool('Section-Options', 'ConfirmAfter', True);
    ABConfirmAfter := SettingsForm.ConfirmAfterCheckBox.Checked;
    GSConfirmAfter := SettingsForm.ConfirmAfterCheckBox.Checked;

    SettingsForm.AutoLoadApplicationListChkBox.Checked := RegIniFile.ReadBool('Section-Options', 'AutoLoadApplicationList', True);

    ApplicationBoundsFrame.ApplicationBounsJvPageList.ActivePageIndex := RegIniFile.ReadInteger('Section-ABPage', 'CurrentPage', 3);

    SettingsForm.SaveCenterPercentCheckBox.Checked := RegIniFile.ReadBool('Section-Options', 'SaveCenterPercent', True);
    if SettingsForm.SaveCenterPercentCheckBox.Checked then RegIniFile.ReadBool('Section-Options', 'SaveCenterPercent', True);
    ApplicationBoundsFrame.CenterPercentSpinEdit.Value := RegIniFile.ReadInteger('Section-Options', 'SaveCenterPercentValue', 85);
    ALCenterPercentSpinEdit.Value := RegIniFile.ReadInteger('Section-Options', 'ALSaveCenterPercentValue', 85);

    LastVerNum := RegIniFile.ReadString('Section-Misc', 'LastVerNum', '0.0.0.0');

  finally
    RegIniFile.Free;
  end;
end;

procedure TAPSMainForm.LoadStyleSettings;
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

procedure TAPSMainForm.SaveSettings;
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

    RegIniFile.WriteInteger('Section-Window', 'Top', APSMainForm.Top);
    RegIniFile.WriteInteger('Section-Window', 'Left', APSMainForm.Left);
    RegIniFile.WriteInteger('Section-Window', 'Height', APSMainForm.Height);
    RegIniFile.WriteInteger('Section-Window', 'Width', APSMainForm.Width);
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
    RegIniFile.WriteInteger('Section-Settings', 'CurrentPage', SettingsForm.JvPageList.ActivePageIndex);

    RegIniFile.WriteString('Section-Bounds', 'WindowName', WindowNameEdit.Text);
    RegIniFile.WriteInteger('Section-Bounds', 'Left', LeftSpinEdit.Value);
    RegIniFile.WriteInteger('Section-Bounds', 'Top', TopSpinEdit.Value);
    RegIniFile.WriteInteger('Section-Bounds', 'Width', WidthSpinEdit.Value);
    RegIniFile.WriteInteger('Section-Bounds', 'Height', HeightSpinEdit.Value);

    RegIniFile.WriteBool('Section-Elevated', 'StartElevated', mmiAutoStartElevated.Checked);

    RegIniFile.WriteInteger('Section-Page', 'CurrentPage', JvPageList.ActivePageIndex);
    RegIniFile.WriteBool('Section-Page', 'PagesMM', PagesMM);
    RegIniFile.WriteBool('Section-Page', 'Page1', Page1);
    RegIniFile.WriteBool('Section-Page', 'Page2', Page2);
    RegIniFile.WriteBool('Section-Page', 'Page3', Page3);
    RegIniFile.WriteBool('Section-Page', 'Page4', Page4);

    RegIniFile.WriteBool('Section-Options', 'ConfirmBefore', SettingsForm.ConfirmBeforeCheckBox.Checked);
    RegIniFile.WriteBool('Section-Options', 'ConfirmAfter', SettingsForm.ConfirmAfterCheckBox.Checked);

    RegIniFile.WriteBool('Section-Options', 'AutoLoadApplicationList', SettingsForm.AutoLoadApplicationListChkBox.Checked);

    RegIniFile.WriteInteger('Section-ABPage', 'CurrentPage', ApplicationBoundsFrame.ApplicationBounsJvPageList.ActivePageIndex);

    RegIniFile.WriteBool('Section-HotKey', 'HotKey1Alt', HotKey1AltB);
    RegIniFile.WriteBool('Section-HotKey', 'HotKey1Ctrl', HotKey1CtrlB);
    RegIniFile.WriteBool('Section-HotKey', 'HotKey1Shft', HotKey1ShftB);
    RegIniFile.WriteString('Section-HotKey', 'HotKey1Key', HotKey1Key);

    RegIniFile.WriteBool('Section-Options', 'SaveCenterPercent', SettingsForm.SaveCenterPercentCheckBox.Checked);
    if SettingsForm.SaveCenterPercentCheckBox.Checked then
    begin
      RegIniFile.WriteInteger('Section-Options', 'SaveCenterPercentValue', ApplicationBoundsFrame.CenterPercentSpinEdit.Value);
      RegIniFile.WriteInteger('Section-Options', 'ALSaveCenterPercentValue', ALCenterPercentSpinEdit.Value);
    end;

    RegIniFile.WriteString('Section-Misc', 'LastVerNum', LastVerNum);

  finally
    RegIniFile.Free;
  end;

end;

procedure TAPSMainForm.AddStylesToListBox;
var
  StyleStr: String;
begin
  // Add Styles menu items to the ListBox
  SettingsForm.StylesListBox.Clear;
  for StyleStr in TStyleManager.StyleNames do SettingsForm.StylesListBox.Items.Append(StyleStr);
  SettingsForm.StylesListBox.Sorted := True;
end;

procedure TAPSMainForm.SetStayOnTopStatus;
begin
  if SettingsForm.StayOnTopCheckBox.Checked then
  begin
    SetWindowPos(Application.MainForm.Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NoMove or SWP_NoSize);
  end
  else
  begin
    SetWindowPos(Application.MainForm.Handle, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NoMove or SWP_NoSize);
  end;
end;

procedure TAPSMainForm.SetStayOnTopB(LocalStayOnTopB: Boolean);
begin
  ABStayOnTopB := LocalStayOnTopB;
  GSStayOnTopB := LocalStayOnTopB;
end;

end.
