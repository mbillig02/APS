unit SetUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, JvExControls, JvPageList, Vcl.ComCtrls,
  JvExComCtrls, JvPageListTreeView, Vcl.StdCtrls, ScrPosF, JvComponentBase,
  JvBalloonHint, Vcl.ExtCtrls;

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
  private
    procedure OpenDirectory(DirectoryName: String);
    procedure ListToForm(PositionB, SizeB: Boolean);
    function GetRunAsSetting(LnkPath: String): Boolean;
    procedure SetRunAsSetting(LnkPath: String; RunAsAdmin: Boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SettingsForm: TSettingsForm;

implementation

{$R *.dfm}

uses
  MFUnit, ClipBrd, ShellApi, Themes, PerlRegex, ActiveX, ComObj, ShlObj, JclSysInfo;

procedure TSettingsForm.SetDefaultPosBtnClick(Sender: TObject);
begin
  MainForm.Top := MainFormDefaultRect.Top;
  MainForm.Left := MainFormDefaultRect.Left;
  MainForm.UpdateScrPosEdits;
end;

procedure TSettingsForm.SetDefaultScreenBtnClick(Sender: TObject);
begin
  MainForm.Top := MainFormDefaultRect.Top;
  MainForm.Left := MainFormDefaultRect.Left;
  MainForm.Height := MainFormDefaultRect.Height;
  MainForm.Width := MainFormDefaultRect.Width;
  MainForm.UpdateScrPosEdits;
end;

procedure TSettingsForm.SetDefaultSizeBtnClick(Sender: TObject);
begin
  MainForm.Height := MainFormDefaultRect.Height;
  MainForm.Width := MainFormDefaultRect.Width;
  MainForm.UpdateScrPosEdits;
end;

procedure TSettingsForm.StayOnTopCheckBoxClick(Sender: TObject);
begin
  StayOnTopB := StayOnTopCheckBox.Checked;
  MainForm.SetStayOnTopStatus;
end;

procedure TSettingsForm.StylesListBoxClick(Sender: TObject);
begin
  StyleStr := StylesListBox.Items[StylesListBox.ItemIndex];
  TStyleManager.TrySetStyle(StyleStr);
end;

procedure TSettingsForm.StylesMMCheckBoxClick(Sender: TObject);
begin
  StylesMM := StylesMMCheckBox.Checked;
  MainForm.mmiStyles.Visible := StylesMM;
  MainForm.RightMenu(MainForm.mmiVersionAbout);
end;

procedure TSettingsForm.SetAlomstFullScreenBtnClick(Sender: TObject);
begin
  MainForm.Top := 30;
  MainForm.Left := 30;
  MainForm.Height := Screen.WorkAreaHeight - 60;
  MainForm.Width := Screen.WorkAreaWidth - 60;
  MainForm.UpdateScrPosEdits;
end;

procedure TSettingsForm.TmpDirCopyToClpBrdBtnClick(Sender: TObject);
begin
  TmpDirCopyToClpBrdBtn.Hint := '';
  Clipboard.AsText := MainForm.GetTmpDir;
  TmpDirJvBalloonHint.ActivateHint(TmpDirCopyToClpBrdBtn, '(Copied to clipboard)', MainForm.GetTmpDir, 4000);
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
  Clipboard.AsText := MainForm.GetLstDir;
  LstDirJvBalloonHint.ActivateHint(LstDirCopyToClpBrdBtn, '(Copied to clipboard)', MainForm.GetLstDir, 4000);
end;

procedure TSettingsForm.LstDirOpenInExplorerBtnClick(Sender: TObject);
begin
  OpenDirectory(MainForm.GetLstDir);
end;

procedure TSettingsForm.MainFormSizeSettingsToFormBtnClick(Sender: TObject);
begin
  ListToForm(False, True);
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

procedure TSettingsForm.UpdateSettingsAdminStatus;
begin
  if FileExists(PublicDesktopGroupBox.Hint) then
    PublicDesktopRunAsCheckBox.Checked := GetRunAsSetting(PublicDesktopGroupBox.Hint);
  if FileExists(PublicDesktopGroupBox.Hint) and (not MainForm.aRestartElevated.Enabled) then
  begin
    PublicDesktopRunAsCheckBox.Enabled := True;
  end
  else
  begin
    PublicDesktopRunAsCheckBox.Enabled := False;
  end;

  if FileExists(PublicStartMenuGroupBox.Hint) then
    PublicStartMenuRunAsCheckBox.Checked := GetRunAsSetting(PublicStartMenuGroupBox.Hint);
  if FileExists(PublicStartMenuGroupBox.Hint) and (not MainForm.aRestartElevated.Enabled) then
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
  if FileExists(UserTaskbarGroupBox.Hint) and (not MainForm.aRestartElevated.Enabled) then
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
  if FileExists(UserDesktopGroupBox.Hint) and (not MainForm.aRestartElevated.Enabled) then
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

procedure TSettingsForm.StylesBtnClick(Sender: TObject);
begin
  JvPageList.ActivePageIndex := 3;
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
  OpenDirectory(MainForm.GetDtaDir);
end;

procedure TSettingsForm.EnableStylesSettingsCheckBoxClick(Sender: TObject);
begin
  StylesListBox.Enabled := EnableStylesSettingsCheckBox.Checked;
  StylesEnabled := EnableStylesSettingsCheckBox.Checked;
end;

procedure TSettingsForm.TmpDirOpenInExplorerBtnClick(Sender: TObject);
begin
  OpenDirectory(MainForm.GetTmpDir);
end;

procedure TSettingsForm.DtaDirCopyToClpBrdBtnClick(Sender: TObject);
begin
  DtaDirCopyToClpBrdBtn.Hint := '';
  Clipboard.AsText := MainForm.GetDtaDir;
  DtaDirJvBalloonHint.ActivateHint(DtaDirCopyToClpBrdBtn, '(Copied to clipboard)', MainForm.GetDtaDir, 4000);
end;

procedure TSettingsForm.FormActivate(Sender: TObject);
begin
  TScrPosFrame.SpinEditTop.Value := MainForm.Top;
  TScrPosFrame.SpinEditLeft.Value := MainForm.Left;
  TScrPosFrame.SpinEditHeight.Value := MainForm.Height;
  TScrPosFrame.SpinEditWidth.Value := MainForm.Width;
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
  MainForm.Height := TScrPosFrame.SpinEditHeight.Value;
end;

procedure TSettingsForm.TScrPosFrameSpinEditLeftChange(Sender: TObject);
begin
  MainForm.Left := TScrPosFrame.SpinEditLeft.Value;
end;

procedure TSettingsForm.TScrPosFrameSpinEditTopChange(Sender: TObject);
begin
  MainForm.Top := TScrPosFrame.SpinEditTop.Value;
end;

procedure TSettingsForm.TScrPosFrameSpinEditWidthChange(Sender: TObject);
begin
  MainForm.Width := TScrPosFrame.SpinEditWidth.Value;
end;

end.
