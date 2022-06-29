unit SetUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, JvExControls, JvPageList, Vcl.ComCtrls,
  JvExComCtrls, JvPageListTreeView, Vcl.StdCtrls, ScrPosF, JvComponentBase,
  JvBalloonHint, Vcl.ExtCtrls;

type
  TSettingsForm = class(TForm)
    JvSettingsTreeView: TJvSettingsTreeView;
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
    procedure LstDirCopyToClpBrdBtnContextPopup(Sender: TObject;
      MousePos: TPoint; var Handled: Boolean);
    procedure LstDirOpenInExplorerBtnClick(Sender: TObject);
    procedure StayOnTopCheckBoxClick(Sender: TObject);
  private
    procedure OpenDirectory(DirectoryName: String);
    procedure ListToForm(PositionB, SizeB: Boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SettingsForm: TSettingsForm;

implementation

{$R *.dfm}

uses MFUnit, ClipBrd, ShellApi, Themes, PerlRegex;

procedure TSettingsForm.SetDefaultScreenBtnClick(Sender: TObject);
begin
  MainForm.Top := MainFormDefaultRect.Top;
  MainForm.Left := MainFormDefaultRect.Left;
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

procedure TSettingsForm.LstDirCopyToClpBrdBtnContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
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
