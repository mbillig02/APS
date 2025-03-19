unit SetUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, JvExControls, JvPageList, Vcl.ComCtrls,
  JvExComCtrls, JvPageListTreeView, Vcl.StdCtrls, ScrPosF, JvComponentBase,
  JvBalloonHint, Vcl.ExtCtrls, RunAsFrameUnit;

type
  TSettingsForm = class(TForm)
    JvPageList: TJvPageList;
    JvStandardPageForm: TJvStandardPage;
    SetDefaultScreenBtn: TButton;
    SetAlomstFullScreenBtn: TButton;
    SavFrmSizChkBox: TCheckBox;
    SavFrmPosChkBox: TCheckBox;
    TScrPosFrame: TScrPosFrame;
    JvStandardPageDirectories: TJvStandardPage;
    DtaDirGrpBox: TGroupBox;
    DtaDirLbl: TLabel;
    DtaDirCopyToClpBrdBtn: TButton;
    DtaDirOpenInExplorerBtn: TButton;
    DtaDirJvBalloonHint: TJvBalloonHint;
    TmpDirGrpBox: TGroupBox;
    TmpDirLbl: TLabel;
    TmpDirCopyToClpBrdBtn: TButton;
    TmpDirOpenInExplorerBtn: TButton;
    TmpDirJvBalloonHint: TJvBalloonHint;
    JvStandardPageStyles: TJvStandardPage;
    StylesListBox: TListBox;
    MainFormSettingsListBox: TListBox;
    MainFormSettingsToListBoxBtn: TButton;
    MainFormSettingsToFormBtn: TButton;
    DeleteListBoxItemBtn: TButton;
    ListToFormGroupBox: TGroupBox;
    MainFormPosSettingsToFormBtn: TButton;
    MainFormSizeSettingsToFormBtn: TButton;
    StylesMMCheckBox: TCheckBox;
    EnableStylesSettingsCheckBox: TCheckBox;
    LstDirJvBalloonHint: TJvBalloonHint;
    LstDirGrpBox: TGroupBox;
    LstDirLbl: TLabel;
    LstDirCopyToClpBrdBtn: TButton;
    LstDirOpenInExplorerBtn: TButton;
    StayOnTopCheckBox: TCheckBox;
    JvStandardPageAdmin: TJvStandardPage;
    PublicDesktopRunAsCheckBox: TCheckBox;
    PublicDesktopGroupBox: TGroupBox;
    PublicStartMenuGroupBox: TGroupBox;
    PublicStartMenuRunAsCheckBox: TCheckBox;
    UserTaskbarGroupBox: TGroupBox;
    UserTaskbarRunAsCheckBox: TCheckBox;
    SetLeftPanel: TPanel;
    AdminBtn: TButton;
    DirBtn: TButton;
    FormBtn: TButton;
    StylesBtn: TButton;
    UserDesktopGroupBox: TGroupBox;
    UserDesktopRunAsCheckBox: TCheckBox;
    SetDefaultPosBtn: TButton;
    SetDefaultSizeBtn: TButton;
    SetAdmBtmPanel: TPanel;
    SetAdmBtmRPanel: TPanel;
    RunAsFrame: TRunAsFrame;
    CreateIniBtn: TButton;
    EditIniBtn: TButton;
    LoadAndCheckBtn: TButton;
    ShowMissingLinksCheckBox: TCheckBox;
    JvStandardPageHotKeys: TJvStandardPage;
    AltCheckBox: TCheckBox;
    CtrlCheckBox: TCheckBox;
    ShftCheckBox: TCheckBox;
    KeyComboBox: TComboBox;
    HotKeysBtn: TButton;
    AppHideShowGroupBox: TGroupBox;
    SetHotKeyBtn: TButton;
    JvStandardPagePages: TJvStandardPage;
    PagesBtn: TButton;
    MiscMainMenuGroupBox: TGroupBox;
    PagesCheckBox: TCheckBox;
    Page1CheckBox: TCheckBox;
    Page2CheckBox: TCheckBox;
    Page3CheckBox: TCheckBox;
    Page4CheckBox: TCheckBox;
    JvStandardPageMisc: TJvStandardPage;
    MiscBtn: TButton;
    SaveCenterPercentCheckBox: TCheckBox;
    procedure SetDefaultScreenBtnClick(Sender: TObject);
    procedure SetAlomstFullScreenBtnClick(Sender: TObject);
    procedure SavFrmSizChkBoxClick(Sender: TObject);
    procedure SavFrmPosChkBoxClick(Sender: TObject);
    procedure TScrPosFrameSpinEditTopChange(Sender: TObject);
    procedure TScrPosFrameSpinEditLeftChange(Sender: TObject);
    procedure TScrPosFrameSpinEditHeightChange(Sender: TObject);
    procedure TScrPosFrameSpinEditWidthChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DtaDirCopyToClpBrdBtnClick(Sender: TObject);
    procedure DtaDirOpenInExplorerBtnClick(Sender: TObject);
    procedure TmpDirCopyToClpBrdBtnClick(Sender: TObject);
    procedure TmpDirOpenInExplorerBtnClick(Sender: TObject);
    procedure StylesListBoxClick(Sender: TObject);
    procedure MainFormSettingsToListBoxBtnClick(Sender: TObject);
    procedure MainFormSettingsToFormBtnClick(Sender: TObject);
    procedure DeleteListBoxItemBtnClick(Sender: TObject);
    procedure MainFormPosSettingsToFormBtnClick(Sender: TObject);
    procedure MainFormSizeSettingsToFormBtnClick(Sender: TObject);
    procedure StylesMMCheckBoxClick(Sender: TObject);
    procedure EnableStylesSettingsCheckBoxClick(Sender: TObject);
    procedure LstDirOpenInExplorerBtnClick(Sender: TObject);
    procedure StayOnTopCheckBoxClick(Sender: TObject);
    procedure RunAsAdminCheckBoxClick(Sender: TObject);
    procedure UpdateSettingsAdminStatus;
    procedure AdminBtnClick(Sender: TObject);
    procedure DirBtnClick(Sender: TObject);
    procedure FormBtnClick(Sender: TObject);
    procedure StylesBtnClick(Sender: TObject);
    procedure LstDirCopyToClpBrdBtnClick(Sender: TObject);
    procedure SetDefaultPosBtnClick(Sender: TObject);
    procedure SetDefaultSizeBtnClick(Sender: TObject);
    procedure CreateIniBtnClick(Sender: TObject);
    procedure EditIniBtnClick(Sender: TObject);
    procedure LoadAndCheckBtnClick(Sender: TObject);
    procedure LoadAndCheck(IniFileName: String);
    procedure FormShow(Sender: TObject);
    procedure JvStandardPageAdminShow(Sender: TObject);
    procedure ShowMissingLinksCheckBoxClick(Sender: TObject);
    procedure HotKeysBtnClick(Sender: TObject);
    procedure SetHotKeyBtnClick(Sender: TObject);
    procedure PagesBtnClick(Sender: TObject);
    procedure PagesCheckBoxClick(Sender: TObject);
    procedure Page1CheckBoxClick(Sender: TObject);
    procedure Page2CheckBoxClick(Sender: TObject);
    procedure Page3CheckBoxClick(Sender: TObject);
    procedure Page4CheckBoxClick(Sender: TObject);
    procedure MiscBtnClick(Sender: TObject);
  private
    procedure OpenDirectory(DirectoryName: String);
    procedure ListToForm(PositionB, SizeB: Boolean);
    function GetRunAsSetting(LnkPath: String): Boolean;
    procedure SetRunAsSetting(LnkPath: String; RunAsAdmin: Boolean);
    procedure CreateIniFile(IniFileName: String);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SettingsForm: TSettingsForm;

implementation

{$R *.dfm}

uses
  MFUnit, ClipBrd, ShellApi, Themes, PerlRegex, ActiveX, ComObj, ShlObj, JclSysInfo, IniFiles;

var
  IniFileName: String;

procedure OpenAsTextFile(const FileName: String);
var
  sei: TShellExecuteInfo;
begin
  ZeroMemory(@sei, SizeOf(sei));
  sei.cbSize := SizeOf(sei);
  sei.fMask := SEE_MASK_CLASSNAME;
  sei.lpFile := PChar(FileName);
  sei.lpClass := '.txt';
  sei.nShow := SW_SHOWNORMAL;
  ShellExecuteEx(@sei);
end;

procedure TSettingsForm.SetDefaultPosBtnClick(Sender: TObject);
begin
  APSMainForm.Top := MainFormDefaultRect.Top;
  APSMainForm.Left := MainFormDefaultRect.Left;
  APSMainForm.UpdateScrPosEdits;
end;

procedure TSettingsForm.SetDefaultScreenBtnClick(Sender: TObject);
begin
  APSMainForm.Top := MainFormDefaultRect.Top;
  APSMainForm.Left := MainFormDefaultRect.Left;
  APSMainForm.Height := MainFormDefaultRect.Height;
  APSMainForm.Width := MainFormDefaultRect.Width;
  APSMainForm.UpdateScrPosEdits;
end;

procedure TSettingsForm.SetDefaultSizeBtnClick(Sender: TObject);
begin
  APSMainForm.Height := MainFormDefaultRect.Height;
  APSMainForm.Width := MainFormDefaultRect.Width;
  APSMainForm.UpdateScrPosEdits;
end;

procedure TSettingsForm.SetHotKeyBtnClick(Sender: TObject);
begin
  APSMainForm.UnsetHotKey;
  HotKey1AltB := AltCheckBox.Checked;
  HotKey1CtrlB := CtrlCheckBox.Checked;
  HotKey1ShftB := ShftCheckBox.Checked;
  HotKey1Key := KeyComboBox.Text;
  APSMainForm.SetHotKey;
end;

procedure TSettingsForm.StayOnTopCheckBoxClick(Sender: TObject);
begin
  StayOnTopB := StayOnTopCheckBox.Checked;
  APSMainForm.SetStayOnTopStatus;
  APSMainForm.SetStayOnTopB(StayOnTopB);
end;

procedure TSettingsForm.StylesListBoxClick(Sender: TObject);
begin
  StyleStr := StylesListBox.Items[StylesListBox.ItemIndex];
  TStyleManager.TrySetStyle(StyleStr);
end;

procedure TSettingsForm.StylesMMCheckBoxClick(Sender: TObject);
begin
  StylesMM := StylesMMCheckBox.Checked;
  APSMainForm.mmiStyles.Visible := StylesMM;
  APSMainForm.RightMenu(APSMainForm.mmiVersionAbout);
end;

procedure TSettingsForm.SetAlomstFullScreenBtnClick(Sender: TObject);
begin
  APSMainForm.Top := 30;
  APSMainForm.Left := 30;
  APSMainForm.Height := Screen.WorkAreaHeight - 60;
  APSMainForm.Width := Screen.WorkAreaWidth - 60;
  APSMainForm.UpdateScrPosEdits;
end;

procedure TSettingsForm.TmpDirCopyToClpBrdBtnClick(Sender: TObject);
begin
  TmpDirCopyToClpBrdBtn.Hint := '';
  Clipboard.AsText := APSMainForm.GetTmpDir;
  TmpDirJvBalloonHint.ActivateHint(TmpDirCopyToClpBrdBtn, '(Copied to clipboard)', APSMainForm.GetTmpDir, 4000);
end;

procedure TSettingsForm.MainFormSettingsToListBoxBtnClick(Sender: TObject);
var
  TmpStr: String;
begin
//  MainFormSettingsListBox.Items.Add('T:1234 | L:1234 | H:1234 | W:1234');
  TmpStr := 'T:' + IntToStr(TScrPosFrame.SpinEditTop.Value) + ' | ' +
            'L:' + IntToStr(TScrPosFrame.SpinEditLeft.Value) + ' | ' +
            'H:' + IntToStr(TScrPosFrame.SpinEditHeight.Value) + ' | ' +
            'W:' + IntToStr(TScrPosFrame.SpinEditWidth.Value);
  if MainFormSettingsListBox.Items.IndexOf(TmpStr) = -1 then
    MainFormSettingsListBox.Items.Add(TmpStr);
end;

procedure TSettingsForm.ListToForm(PositionB: Boolean; SizeB: Boolean);
var
  Regex: TPerlRegEx;
begin
  if MainFormSettingsListBox.ItemIndex <> -1 then
  begin
    Regex := TPerlRegEx.Create;
    try
      Regex.RegEx := 'T:(?<Top>[0-9]+) \| L:(?<Left>[0-9]+) \| H:(?<Height>[0-9]+) \| W:(?<Width>[0-9]+)';
      Regex.Options := [];
      Regex.State := [];
      Regex.Subject := AnsiToUTF8(MainFormSettingsListBox.Items[MainFormSettingsListBox.ItemIndex]);
      if Regex.Match then
      begin
        if PositionB then
        begin
          TScrPosFrame.SpinEditTop.Value := StrToInt(Utf8ToAnsi(Regex.Groups[1]));
          TScrPosFrame.SpinEditLeft.Value := StrToInt(Utf8ToAnsi(Regex.Groups[2]));
        end;
        if SizeB then
        begin
          TScrPosFrame.SpinEditHeight.Value := StrToInt(Utf8ToAnsi(Regex.Groups[3]));
          TScrPosFrame.SpinEditWidth.Value := StrToInt(Utf8ToAnsi(Regex.Groups[4]));
        end;
      end;
    finally
      Regex.Free;
    end;
  end;
end;

procedure TSettingsForm.LstDirCopyToClpBrdBtnClick(Sender: TObject);
begin
  LstDirCopyToClpBrdBtn.Hint := '';
  Clipboard.AsText := APSMainForm.GetLstDir;
  LstDirJvBalloonHint.ActivateHint(LstDirCopyToClpBrdBtn, '(Copied to clipboard)', APSMainForm.GetLstDir, 4000);
end;

procedure TSettingsForm.LstDirOpenInExplorerBtnClick(Sender: TObject);
begin
  OpenDirectory(APSMainForm.GetLstDir);
end;

procedure TSettingsForm.MainFormSizeSettingsToFormBtnClick(Sender: TObject);
begin
  ListToForm(False, True);
end;

procedure TSettingsForm.MiscBtnClick(Sender: TObject);
begin
  JvPageList.ActivePageIndex := 6;
end;

procedure TSettingsForm.PagesBtnClick(Sender: TObject);
begin
  JvPageList.ActivePageIndex := 5;
end;

procedure TSettingsForm.MainFormPosSettingsToFormBtnClick(Sender: TObject);
begin
  ListToForm(True, False);
end;

procedure TSettingsForm.MainFormSettingsToFormBtnClick(Sender: TObject);
begin
  ListToForm(True, True);
end;

function TSettingsForm.GetRunAsSetting(LnkPath: String): Boolean;
var
  MyObject: IUnknown;
  MySLink: IShellLink;
  MyPFile: IPersistFile;
  sldl: IShellLinkDataList;
  Flags: Cardinal;
begin
  Result := False;
  MyObject := CreateComObject(CLSID_ShellLink);
  MySLink := MyObject as IShellLink;
  MyPFile := MyObject as IPersistFile;
  if Succeeded(MyPFile.Load(PChar(WideString(LnkPath)), STGM_READ)) then
  begin
    sldl := MySLink as IShellLinkDataList;
    sldl.GetFlags(Flags);
    Result := (Flags and SLDF_RUNAS_USER) = SLDF_RUNAS_USER;
  end;
end;

procedure TSettingsForm.HotKeysBtnClick(Sender: TObject);
begin
  JvPageList.ActivePageIndex := 4;
end;

procedure TSettingsForm.JvStandardPageAdminShow(Sender: TObject);
begin
  if RunAsFrame.RunAsCheckListBox.Enabled then RunAsFrame.RunAsCheckListBox.SetFocus;
end;

procedure TSettingsForm.SetRunAsSetting(LnkPath: String; RunAsAdmin: Boolean);
var
  MyObject: IUnknown;
  MySLink: IShellLink;
  MyPFile: IPersistFile;
  sldl: IShellLinkDataList;
  Flags, NewFlags: Cardinal;
begin
  MyObject := CreateComObject(CLSID_ShellLink);
  MySLink := MyObject as IShellLink;
  MyPFile := MyObject as IPersistFile;
  if Succeeded(MyPFile.Load(PChar(WideString(LnkPath)), STGM_READ)) then
  begin
    sldl := MySLink as IShellLinkDataList;
    sldl.GetFlags(Flags);
    if RunAsAdmin then
    begin
      NewFlags := Flags or SLDF_RUNAS_USER;
    end
    else
    begin
      NewFlags := Flags xor SLDF_RUNAS_USER;
    end;
    sldl.SetFlags(NewFlags);

    MyPFile.Save(PWChar(WideString(LnkPath)), False);
    SHChangeNotify(SHCNE_UPDATEITEM, SHCNF_PATH, PWideChar(LnkPath), nil);
  end;
end;

procedure TSettingsForm.ShowMissingLinksCheckBoxClick(Sender: TObject);
begin
  ShowMissingLinks := ShowMissingLinksCheckBox.Checked;
end;

procedure TSettingsForm.CreateIniFile(IniFileName: String);
var
  RegIniFile: TIniFile;
begin
  RegIniFile := TIniFile.Create(IniFileName);
  try
    RegIniFile.WriteString('APS', 'PublicDesktop', 'C:\Users\Public\Desktop\APS.lnk');
    RegIniFile.WriteString('APS', 'PublicStartMenu', 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\APS\APS.lnk');
    RegIniFile.WriteString('APS', 'UserDesktop', '\APS.lnk');
    RegIniFile.WriteString('APS', 'UserTaskbar', '\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\APS.lnk');
    RegIniFile.WriteString('APS', 'UserTaskbarBins', '\Microsoft\Internet Explorer\Quick Launch\User Pinned\Bins\APS.lnk');
    // Home: Console Emulator (x86).lnk
    //    RegIniFile.WriteString('CONEMU', 'UserTaskbar', '\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\Console Emulator (x86).lnk');
    //    RegIniFile.WriteString('CONEMU', 'UserTaskbarBins', '\Microsoft\Internet Explorer\Quick Launch\User Pinned\Bins\Console Emulator (x86).lnk');
    // Work: CONEMU
    RegIniFile.WriteString('CONEMU', 'UserTaskbar', '\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\CONEMU.lnk');
    RegIniFile.WriteString('CONEMU', 'UserTaskbarBins', '\Microsoft\Internet Explorer\Quick Launch\User Pinned\Bins\CONEMU.lnk');
    RegIniFile.WriteString('DCM', 'PublicDesktop', 'C:\Users\Public\Desktop\DCM.lnk');
    RegIniFile.WriteString('DCM', 'PublicStartMenu', 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\DCM\DCM.lnk');
    RegIniFile.WriteString('DCM', 'UserDesktop', '\DCM.lnk');
    RegIniFile.WriteString('DCM', 'UserTaskbar', '\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\DCM.lnk');
    RegIniFile.WriteString('DCM', 'UserTaskbarBins', '\Microsoft\Internet Explorer\Quick Launch\User Pinned\Bins\DCM.lnk');
    RegIniFile.WriteString('DSM', 'PublicDesktop', 'C:\Users\Public\Desktop\DSM.lnk');
    RegIniFile.WriteString('DSM', 'PublicStartMenu', 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\DSM\DSM.lnk');
    RegIniFile.WriteString('DSM', 'UserDesktop', '\DSM.lnk');
    RegIniFile.WriteString('DSM', 'UserTaskbar', '\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\DSM.lnk');
    RegIniFile.WriteString('DSM', 'UserTaskbarBins', '\Microsoft\Internet Explorer\Quick Launch\User Pinned\Bins\DSM.lnk');
    RegIniFile.WriteString('ProxyEnable', 'PublicDesktop', 'C:\Users\Public\Desktop\ProxyEnable.lnk');
    RegIniFile.WriteString('ProxyEnable', 'PublicStartMenu', 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\ProxyEnable\ProxyEnable.lnk');
    RegIniFile.WriteString('ProxyEnable', 'UserDesktop', '\ProxyEnable.lnk');
    RegIniFile.WriteString('ProxyEnable', 'UserTaskbar', '\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\ProxyEnable.lnk');
    RegIniFile.WriteString('ProxyEnable', 'UserTaskbarBins', '\Microsoft\Internet Explorer\Quick Launch\User Pinned\Bins\ProxyEnable.lnk');
    RegIniFile.WriteString('TotalCmd', 'PublicDesktop', 'C:\Users\Public\Desktop\TotalCmd.lnk');
    RegIniFile.WriteString('TotalCmd', 'PublicStartMenu', 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\ProxyEnable\TotalCmd.lnk');
    RegIniFile.WriteString('TotalCmd', 'UserDesktop', '\TotalCmd.lnk');
    RegIniFile.WriteString('TotalCmd', 'UserTaskbar', '\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\TotalCmd.lnk');
    RegIniFile.WriteString('TotalCmd', 'UserTaskbarBins', '\Microsoft\Internet Explorer\Quick Launch\User Pinned\Bins\TotalCmd.lnk');
  finally
    RegIniFile.Free;
  end;
end;

procedure TSettingsForm.LoadAndCheck(IniFileName: String);
begin
  if not FileExists(IniFileName) then CreateIniFile(IniFileName);
  if FileExists(IniFileName) then
  begin
    RunAsFrame.LoadRunAsInfo(IniFileName);
    RunAsFrame.CheckExist;
  end;
end;

procedure TSettingsForm.UpdateSettingsAdminStatus;
begin
  if FileExists(PublicDesktopGroupBox.Hint) then
    PublicDesktopRunAsCheckBox.Checked := GetRunAsSetting(PublicDesktopGroupBox.Hint);
  if FileExists(PublicDesktopGroupBox.Hint) and (not APSMainForm.aRestartElevated.Enabled) then
  begin
    PublicDesktopRunAsCheckBox.Enabled := True;
  end
  else
  begin
    PublicDesktopRunAsCheckBox.Enabled := False;
  end;

  if FileExists(PublicStartMenuGroupBox.Hint) then
    PublicStartMenuRunAsCheckBox.Checked := GetRunAsSetting(PublicStartMenuGroupBox.Hint);
  if FileExists(PublicStartMenuGroupBox.Hint) and (not APSMainForm.aRestartElevated.Enabled) then
  begin
    PublicStartMenuRunAsCheckBox.Enabled := True;
  end
  else
  begin
    PublicStartMenuRunAsCheckBox.Enabled := False;
  end;

  UserTaskbarGroupBox.Hint := GetAppdataFolder + '\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\APS.lnk';
  if FileExists(UserTaskbarGroupBox.Hint) then
    UserTaskbarRunAsCheckBox.Checked := GetRunAsSetting(UserTaskbarGroupBox.Hint);
  if FileExists(UserTaskbarGroupBox.Hint) and (not APSMainForm.aRestartElevated.Enabled) then
  begin
    UserTaskbarRunAsCheckBox.Enabled := True;
  end
  else
  begin
    UserTaskbarRunAsCheckBox.Enabled := False;
  end;

  UserDesktopGroupBox.Hint := GetDesktopDirectoryFolder + '\APS.lnk';
  if FileExists(UserDesktopGroupBox.Hint) then
    UserDesktopRunAsCheckBox.Checked := GetRunAsSetting(UserDesktopGroupBox.Hint);
  if FileExists(UserDesktopGroupBox.Hint) and (not APSMainForm.aRestartElevated.Enabled) then
  begin
    UserDesktopRunAsCheckBox.Enabled := True;
  end
  else
  begin
    UserDesktopRunAsCheckBox.Enabled := False;
  end;
end;

procedure TSettingsForm.RunAsAdminCheckBoxClick(Sender: TObject);
begin
  SetRunAsSetting(((Sender as TCheckBox).Parent as TGroupBox).Hint, (Sender as TCheckBox).Checked);
end;

procedure TSettingsForm.AdminBtnClick(Sender: TObject);
begin
  JvPageList.ActivePageIndex := 0;
end;

procedure TSettingsForm.DirBtnClick(Sender: TObject);
begin
  JvPageList.ActivePageIndex := 1;
end;

procedure TSettingsForm.FormBtnClick(Sender: TObject);
begin
  JvPageList.ActivePageIndex := 2;
end;

procedure TSettingsForm.FormShow(Sender: TObject);
begin
  LoadAndCheck(APSMainForm.GetDtaDir + 'RunAsLst.ini');
end;

procedure TSettingsForm.StylesBtnClick(Sender: TObject);
begin
  JvPageList.ActivePageIndex := 3;
end;

procedure TSettingsForm.LoadAndCheckBtnClick(Sender: TObject);
begin
  LoadAndCheck(APSMainForm.GetDtaDir + 'RunAsLst.ini');
end;

procedure TSettingsForm.Page1CheckBoxClick(Sender: TObject);
begin
  Page1 := Page1CheckBox.Checked;
  APSMainForm.mmiPage1.Visible := Page1;
end;

procedure TSettingsForm.Page2CheckBoxClick(Sender: TObject);
begin
  Page2 := Page2CheckBox.Checked;
  APSMainForm.mmiPage2.Visible := Page2;
end;

procedure TSettingsForm.Page3CheckBoxClick(Sender: TObject);
begin
  Page3 := Page3CheckBox.Checked;
  APSMainForm.mmiPage3.Visible := Page3;
end;

procedure TSettingsForm.Page4CheckBoxClick(Sender: TObject);
begin
  Page4 := Page4CheckBox.Checked;
  APSMainForm.mmiPage4.Visible := Page4;
end;

procedure TSettingsForm.CreateIniBtnClick(Sender: TObject);
begin
  CreateIniFile(APSMainForm.GetDtaDir + 'RunAsLst.ini');
end;

procedure TSettingsForm.DeleteListBoxItemBtnClick(Sender: TObject);
var
  OldIndx: Integer;
begin
  if MainFormSettingsListBox.ItemIndex <> -1 then
  begin
    OldIndx := MainFormSettingsListBox.ItemIndex;
    MainFormSettingsListBox.DeleteSelected;
    if MainFormSettingsListBox.Items.Count > 0 then    // set listbox position to old position - 1
    begin
      if OldIndx > 0 then
      begin
        if OldIndx > MainFormSettingsListBox.Count - 1 then
        begin
          MainFormSettingsListBox.ItemIndex := MainFormSettingsListBox.Count - 1;
        end
        else
        begin
          MainFormSettingsListBox.ItemIndex := OldIndx;
        end;
      end
      else
      begin
        MainFormSettingsListBox.ItemIndex := 0;
      end;
    end
  end;
end;

procedure TSettingsForm.DtaDirOpenInExplorerBtnClick(Sender: TObject);
begin
  OpenDirectory(APSMainForm.GetDtaDir);
end;

procedure TSettingsForm.EditIniBtnClick(Sender: TObject);
begin
  IniFileName := APSMainForm.GetDtaDir + 'RunAsLst.ini';
  OpenAsTextFile(IniFileName);
end;

procedure TSettingsForm.EnableStylesSettingsCheckBoxClick(Sender: TObject);
begin
  StylesListBox.Enabled := EnableStylesSettingsCheckBox.Checked;
  StylesEnabled := EnableStylesSettingsCheckBox.Checked;
end;

procedure TSettingsForm.TmpDirOpenInExplorerBtnClick(Sender: TObject);
begin
  OpenDirectory(APSMainForm.GetTmpDir);
end;

procedure TSettingsForm.DtaDirCopyToClpBrdBtnClick(Sender: TObject);
begin
  DtaDirCopyToClpBrdBtn.Hint := '';
  Clipboard.AsText := APSMainForm.GetDtaDir;
  DtaDirJvBalloonHint.ActivateHint(DtaDirCopyToClpBrdBtn, '(Copied to clipboard)', APSMainForm.GetDtaDir, 4000);
end;

procedure TSettingsForm.FormActivate(Sender: TObject);
begin
  TScrPosFrame.SpinEditTop.Value := APSMainForm.Top;
  TScrPosFrame.SpinEditLeft.Value := APSMainForm.Left;
  TScrPosFrame.SpinEditHeight.Value := APSMainForm.Height;
  TScrPosFrame.SpinEditWidth.Value := APSMainForm.Width;
end;

procedure TSettingsForm.OpenDirectory(DirectoryName: String);
begin
  ShellExecute(Application.Handle,
    nil,
    'explorer.exe',
    PChar(DirectoryName), //wherever you want the window to open to
    nil,
    SW_NORMAL     //see other possibilities by ctrl+clicking on SW_NORMAL
    );
end;

procedure TSettingsForm.PagesCheckBoxClick(Sender: TObject);
begin
  PagesMM := PagesCheckBox.Checked;
  APSMainForm.mmiPages.Visible := PagesMM;
  APSMainForm.RightMenu(APSMainForm.mmiVersionAbout);
end;

procedure TSettingsForm.SavFrmPosChkBoxClick(Sender: TObject);
begin
  SaveFormPosition := SavFrmPosChkBox.Checked;
end;

procedure TSettingsForm.SavFrmSizChkBoxClick(Sender: TObject);
begin
  SaveFormSize := SavFrmSizChkBox.Checked;
end;

procedure TSettingsForm.TScrPosFrameSpinEditHeightChange(Sender: TObject);
begin
  APSMainForm.Height := TScrPosFrame.SpinEditHeight.Value;
end;

procedure TSettingsForm.TScrPosFrameSpinEditLeftChange(Sender: TObject);
begin
  APSMainForm.Left := TScrPosFrame.SpinEditLeft.Value;
end;

procedure TSettingsForm.TScrPosFrameSpinEditTopChange(Sender: TObject);
begin
  APSMainForm.Top := TScrPosFrame.SpinEditTop.Value;
end;

procedure TSettingsForm.TScrPosFrameSpinEditWidthChange(Sender: TObject);
begin
  APSMainForm.Width := TScrPosFrame.SpinEditWidth.Value;
end;

end.
