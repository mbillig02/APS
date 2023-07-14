unit ABFrameUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, comp.reticle, System.UITypes,
  Vcl.ExtCtrls, Vcl.StdCtrls, JvExControls, JvPageList, Vcl.Samples.Spin,
  System.Actions, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, JvExComCtrls,
  JvToolBar, JvSpin, System.ImageList, Vcl.ImgList, Vcl.Buttons, Vcl.Mask,
  Vcl.Menus;

type
  TApplicationBoundsFrame = class(TFrame)
    ApplicationBounsJvPageList: TJvPageList;
    ScreenCornersGroupBox: TGroupBox;
    SCTLPanel: TPanel;
    SCTLWindowReticle: TWindowReticle;
    SCTRPanel: TPanel;
    SCTRWindowReticle: TWindowReticle;
    SCBLPanel: TPanel;
    SCBLWindowReticle: TWindowReticle;
    SCBRPanel: TPanel;
    SCBRWindowReticle: TWindowReticle;
    CenterPercentJvStandardPage: TJvStandardPage;
    CenterPercentPanel: TPanel;
    CenterPercentWindowReticle: TWindowReticle;
    CenterPercentSpinEdit: TSpinEdit;
    ScreenCornersJvStandardPage: TJvStandardPage;
    CenterPercentGroupBox: TGroupBox;
    ScreenSidesJvStandardPage: TJvStandardPage;
    ScreenSidesGroupBox: TGroupBox;
    SSLPanel: TPanel;
    SSLWindowReticle: TWindowReticle;
    SSRPanel: TPanel;
    SSRWindowReticle: TWindowReticle;
    GetSetJvStandardPage: TJvStandardPage;
    GetSetGroupBox: TGroupBox;
    GSGetPanel: TPanel;
    GSGetWindowReticle: TWindowReticle;
    GSSetPanel: TPanel;
    GSSetWindowReticle: TWindowReticle;
    LeftLabeledEdit: TLabeledEdit;
    TopLabeledEdit: TLabeledEdit;
    WidthLabeledEdit: TLabeledEdit;
    HeightLabeledEdit: TLabeledEdit;
    CenterPanel: TPanel;
    CenterWindowReticle: TWindowReticle;
    ABFActionList: TActionList;
    aCenterPage: TAction;
    aCornersPage: TAction;
    aSidesPage: TAction;
    aGetSetPage: TAction;
    LeftJvSpinButton: TJvSpinButton;
    TopJvSpinButton: TJvSpinButton;
    WidthJvSpinButton: TJvSpinButton;
    HeightJvSpinButton: TJvSpinButton;
    MoveJvStandardPage: TJvStandardPage;
    aMovePage: TAction;
    WindowReticleMTL: TWindowReticle;
    WindowReticleMTC: TWindowReticle;
    WindowReticleMTR: TWindowReticle;
    WindowReticleMCL: TWindowReticle;
    WindowReticleMBL: TWindowReticle;
    WindowReticleMCC: TWindowReticle;
    WindowReticleMCR: TWindowReticle;
    WindowReticleMBC: TWindowReticle;
    WindowReticleMBR: TWindowReticle;
    MoveGroupBox: TGroupBox;
    ButtonPanel: TPanel;
    CornersSpeedButton: TSpeedButton;
    ImageList24: TImageList;
    CenterSpeedButton: TSpeedButton;
    SidesSpeedButton: TSpeedButton;
    MoveSpeedButton: TSpeedButton;
    GetSetSpeedButton: TSpeedButton;
    SizeJvStandardPage: TJvStandardPage;
    aSizePage: TAction;
    SpeedButton1: TSpeedButton;
    SizeScrollBox: TScrollBox;
    SizeRightPanel: TPanel;
    SizeGetPanel: TPanel;
    SizeGetWindowReticle: TWindowReticle;
    SizeSetPanel: TPanel;
    SizeSetWindowReticle: TWindowReticle;
    aClearSizeBtns: TAction;
    aAddSizeBtn: TAction;
    ScrollBoxPopupMenu: TPopupMenu;
    pmiScrollBoxClearSizeBtns: TMenuItem;
    pmiScrollBoxAddSizeBtn: TMenuItem;
    SizeBtnPopupMenu: TPopupMenu;
    pmiDelSizeBtn: TMenuItem;
    SizeGroupBox: TGroupBox;
    pmiAddSizeBtn: TMenuItem;
    procedure GSGetWindowReticleDropSelect(Sender: TObject);
    procedure DropSelect(Sender: TObject);
    procedure WindowReticleDropSelectMove(Sender: TObject);
    procedure aCenterPageExecute(Sender: TObject);
    procedure aCornersPageExecute(Sender: TObject);
    procedure aSidesPageExecute(Sender: TObject);
    procedure aGetSetPageExecute(Sender: TObject);
    procedure LeftJvSpinButtonTopClick(Sender: TObject);
    procedure LeftJvSpinButtonBottomClick(Sender: TObject);
    procedure TopJvSpinButtonBottomClick(Sender: TObject);
    procedure TopJvSpinButtonTopClick(Sender: TObject);
    procedure WidthJvSpinButtonBottomClick(Sender: TObject);
    procedure WidthJvSpinButtonTopClick(Sender: TObject);
    procedure HeightJvSpinButtonBottomClick(Sender: TObject);
    procedure HeightJvSpinButtonTopClick(Sender: TObject);
    procedure aMovePageExecute(Sender: TObject);
    procedure aSizePageExecute(Sender: TObject);
    procedure SizeGetWindowReticleDropSelect(Sender: TObject);
    procedure aClearSizeBtnsExecute(Sender: TObject);
    procedure aAddSizeBtnExecute(Sender: TObject);
    procedure LoadButtonList(TempFileName: String);
    procedure SaveButtonList(TempFileName: String);
    procedure pmiDelSizeBtnClick(Sender: TObject);
    procedure SizeSetWindowReticleDropSelect(Sender: TObject);
  private
    procedure AddSizeBtn;
    procedure ClearSizeBtns;
    procedure SizeBtnClick(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ABConfirmBefore: Boolean = True;
  ABConfirmAfter: Boolean = True;
  ABAppRect: TRect;

implementation

var
  SizeBtnA: array of TSpeedButton;

{$R *.dfm}

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

procedure TApplicationBoundsFrame.ClearSizeBtns;
var
  i: Integer;
begin
  for i := 0 to High(SizeBtnA) do
  begin
    SizeBtnA[i].Free;
    SizeBtnA[i] := nil;
  end;
  SetLength(SizeBtnA, 0);
end;

procedure TApplicationBoundsFrame.SizeBtnClick(Sender: TObject);
begin
  SizeRightPanel.Enabled := True;
end;

procedure TApplicationBoundsFrame.AddSizeBtn;
begin
  SetLength(SizeBtnA, Length(SizeBtnA) + 1);
  SizeBtnA[High(SizeBtnA)] := TSpeedButton.Create(SizeScrollBox);
  with SizeBtnA[High(SizeBtnA)] do
  begin
    Parent := SizeScrollBox;
    Top := High(SizeBtnA) * Height + 5;
    Align := alTop;
    Name := 'SizeBtn_' + IntToStr(High(SizeBtnA));
    Caption := Name;
    Tag := High(SizeBtnA);
    GroupIndex := 1;
    PopupMenu := SizeBtnPopupMenu;
    OnClick := SizeBtnClick;
  end;
end;

procedure TApplicationBoundsFrame.pmiDelSizeBtnClick(Sender: TObject);
var
  Caller: TObject;
  i, SelectedBtn, TopBtn: Integer;
begin
  Caller := ((Sender as TMenuItem).GetParentMenu as TPopupMenu).PopupComponent;
  SelectedBtn := (Caller as TControl).Tag;
  TopBtn := SizeBtnA[High(SizeBtnA)].Tag;
  if SelectedBtn = TopBtn then
  begin
    SizeBtnA[(Caller as TControl).Tag].Free;
    SizeBtnA[(Caller as TControl).Tag] := nil;
    SetLength(SizeBtnA, Length(SizeBtnA) - 1);
  end
  else
  begin
    for i := SelectedBtn to TopBtn - 1 do
    begin
      SizeBtnA[i].Caption := SizeBtnA[i + 1].Caption;
    end;
    SizeBtnA[High(SizeBtnA)].Free;
    SizeBtnA[High(SizeBtnA)] := nil;
    SetLength(SizeBtnA, Length(SizeBtnA) - 1);
  end;
end;

procedure TApplicationBoundsFrame.LoadButtonList(TempFileName: String);
var
  FrmStrLst: TStringList;
  i: Integer;
begin
  if FileExists(TempFileName) then
  begin
    ClearSizeBtns;
    FrmStrLst := TStringList.Create;
    FrmStrLst.LoadFromFile(TempFileName);
    for i := 0 to FrmStrLst.Count - 1 do
    begin
      AddSizeBtn;
      SizeBtnA[High(SizeBtnA)].Caption := FrmStrLst[i];
    end;
    FrmStrLst.Free;
  end;
end;

procedure TApplicationBoundsFrame.SaveButtonList(TempFileName: String);
var
  FrmStrLst: TStringList;
  i: Integer;
begin
  FrmStrLst := TStringList.Create;
  for i := 0 to High(SizeBtnA) do
  begin
    FrmStrLst.Append(SizeBtnA[i].Caption);
  end;
  FrmStrLst.SaveToFile(TempFileName);
  FrmStrLst.Free;
end;

procedure TApplicationBoundsFrame.aAddSizeBtnExecute(Sender: TObject);
begin
  AddSizeBtn;
end;

procedure TApplicationBoundsFrame.aCenterPageExecute(Sender: TObject);
begin
  ApplicationBounsJvPageList.ActivePageIndex := 0;
end;

procedure TApplicationBoundsFrame.WidthJvSpinButtonBottomClick(Sender: TObject);
begin
  WidthLabeledEdit.Text := IntToStr(StrToInt(WidthLabeledEdit.Text) - 1);
  WidthLabeledEdit.SetFocus;
  WidthLabeledEdit.SelStart := Length(WidthLabeledEdit.Text)
end;

procedure TApplicationBoundsFrame.WidthJvSpinButtonTopClick(Sender: TObject);
begin
  WidthLabeledEdit.Text := IntToStr(StrToInt(WidthLabeledEdit.Text) + 1);
  WidthLabeledEdit.SetFocus;
  WidthLabeledEdit.SelStart := Length(WidthLabeledEdit.Text)
end;

procedure TApplicationBoundsFrame.DropSelect(Sender: TObject);
var
  Reticle: TWindowReticle;
  SelectedAppHandle: hwnd;
  WindowRect, PreviousWindowRect: TRect;
  WindowNameStr: String;
  OkToChg: Integer;
  ChangePending: Boolean;
  AppCenterPoint: TPoint;
  Monitor: TMonitor;
begin
  Reticle := TWindowReticle(Sender);
  if Reticle.AncestorCaption = '' then
  begin
    WindowNameStr := Reticle.WindowCaption;
  end
  else
  begin
    WindowNameStr := Reticle.AncestorCaption;
  end;

  if ABConfirmBefore then
  begin
    if (Sender as TWindowReticle).Name = 'GSSetWindowReticle' then
    begin
      // GS Set
      OkToChg := MyMessageDlg('What do you want to do with' + #10#13 + '"' + WindowNameStr + '" ?', mtConfirmation, [mbYes, mbOk, mbRetry, mbNo], ['Position/Size', 'Position', 'Size', 'Cancel'], 'Confirmation', mbRetry, ABAppRect);
    end
    else
    begin
      OkToChg := MyMessageDlg('Do you want to reposition and/or resize' + #10#13 + '"' + WindowNameStr + '"', mtConfirmation, [mbYes, mbNo], ['Yes','No'], 'Confirmation', mbNo, ABAppRect);
    end;
  end
  else
  begin
    OkToChg := 6;
  end;

  if OkToChg in [6, 7, 1] then
  begin
    SelectedAppHandle := FindWindow(nil, PWideChar(WindowNameStr));
    if SelectedAppHandle <> 0 then
    begin
      GetWindowRect(SelectedAppHandle, PreviousWindowRect);
      ChangePending := False;

      AppCenterPoint.X := PreviousWindowRect.Left + (PreviousWindowRect.Width div 2);
      AppCenterPoint.Y := PreviousWindowRect.Top + (PreviousWindowRect.Height div 2);
      Monitor := Screen.MonitorFromPoint(AppCenterPoint);

      if (Sender as TWindowReticle).Name = 'CenterWindowReticle' then
      begin
        // Center
        WindowRect.Left := Monitor.Left + ((Monitor.WorkareaRect.Width div 2) - (PreviousWindowRect.Width div 2));
        WindowRect.Top :=  Monitor.Top + ((Monitor.WorkareaRect.Height div 2) - (PreviousWindowRect.Height div 2));
        WindowRect.Width := PreviousWindowRect.Width;
        WindowRect.Height := PreviousWindowRect.Height;
        ChangePending := True;
      end;
      if (Sender as TWindowReticle).Name = 'CenterPercentWindowReticle' then
      begin
        // Center Percent
        WindowRect.Left := Monitor.Left + (Round((Monitor.WorkareaRect.Width / 2) - ((Monitor.WorkareaRect.Width / 2) * (CenterPercentSpinEdit.Value / 100))));
        WindowRect.Top := Monitor.Top + (Round((Monitor.WorkareaRect.Height / 2) - ((Monitor.WorkareaRect.Height / 2) * (CenterPercentSpinEdit.Value / 100))));
        WindowRect.Width := Round(((Monitor.WorkareaRect.Width / 2) * (CenterPercentSpinEdit.Value / 100)) * 2);
        WindowRect.Height := Round(((Monitor.WorkareaRect.Height / 2) * (CenterPercentSpinEdit.Value / 100)) * 2);
        ChangePending := True;
      end;

      if (Sender as TWindowReticle).Name = 'SCBLWindowReticle' then
      begin
        // Bottom Left Corner
        WindowRect.Left := Monitor.WorkareaRect.Left;
        WindowRect.Top := Monitor.Top + ((Monitor.WorkareaRect.Height div 2) + 1);
        WindowRect.Width := Monitor.WorkareaRect.Width div 2;
        WindowRect.Height := Monitor.WorkareaRect.Height div 2;
        ChangePending := True;
      end;
      if (Sender as TWindowReticle).Name = 'SCBRWindowReticle' then
      begin
        // Bottom Right Corner
        WindowRect.Left := Monitor.Left + ((Monitor.WorkareaRect.Width div 2) + 1);
        WindowRect.Top := Monitor.Top + ((Monitor.WorkareaRect.Height div 2) + 1);
        WindowRect.Width := Monitor.WorkareaRect.Width div 2;
        WindowRect.Height := Monitor.WorkareaRect.Height div 2;
        ChangePending := True;
      end;
      if (Sender as TWindowReticle).Name = 'SCTLWindowReticle' then
      begin
        // Top Left Corner
        WindowRect.Left := Monitor.WorkareaRect.Left;
        WindowRect.Top := Monitor.WorkareaRect.Top;
        WindowRect.Width := Monitor.WorkareaRect.Width div 2;
        WindowRect.Height := Monitor.WorkareaRect.Height div 2;
        ChangePending := True;
      end;
      if (Sender as TWindowReticle).Name = 'SCTRWindowReticle' then
      begin
        // Top Right Corner
        WindowRect.Left := Monitor.Left + ((Monitor.WorkareaRect.Width div 2) + 1);
        WindowRect.Top := Monitor.WorkareaRect.Top;
        WindowRect.Width := Monitor.WorkareaRect.Width div 2;
        WindowRect.Height := Monitor.WorkareaRect.Height div 2;
        ChangePending := True;
      end;

      if (Sender as TWindowReticle).Name = 'SSLWindowReticle' then
      begin
        // Left Side
        WindowRect.Left := Monitor.WorkareaRect.Left;
        WindowRect.Top := Monitor.WorkareaRect.Top;
        WindowRect.Width := Monitor.WorkareaRect.Width div 2;
        WindowRect.Height := Monitor.WorkareaRect.Height;
        ChangePending := True;
      end;
      if (Sender as TWindowReticle).Name = 'SSRWindowReticle' then
      begin
        // Right Side
        WindowRect.Left := Monitor.Left + ((Monitor.WorkareaRect.Width div 2) + 1);
        WindowRect.Top := Monitor.WorkareaRect.Top;
        WindowRect.Width := Monitor.WorkareaRect.Width div 2;
        WindowRect.Height := Monitor.WorkareaRect.Height;
        ChangePending := True;
      end;

      if (Sender as TWindowReticle).Name = 'GSSetWindowReticle' then
      begin
        // GS Set
        case OkToChg of
          6: begin
               WindowRect.Left := StrToInt(LeftLabeledEdit.Text);
               WindowRect.Top := StrToInt(TopLabeledEdit.Text);
               WindowRect.Width := StrToInt(WidthLabeledEdit.Text);
               WindowRect.Height := StrToInt(HeightLabeledEdit.Text);
               ChangePending := True;
             end;
          7: begin
               WindowRect.Left := StrToInt(LeftLabeledEdit.Text);
               WindowRect.Top := StrToInt(TopLabeledEdit.Text);
               WindowRect.Width := PreviousWindowRect.Width;
               WindowRect.Height := PreviousWindowRect.Height;
               ChangePending := True;
             end;
          1: begin
               WindowRect.Left := PreviousWindowRect.Left;
               WindowRect.Top := PreviousWindowRect.Top;
               WindowRect.Width := StrToInt(WidthLabeledEdit.Text);
               WindowRect.Height := StrToInt(HeightLabeledEdit.Text);
               ChangePending := True;
             end;
        end;
      end;

      if ChangePending then
      begin
        SetWindowPos(SelectedAppHandle, HWND_TOP,
          WindowRect.Left,
          WindowRect.Top,
          WindowRect.Width,
          WindowRect.Height, 0);
          // Put APS back on top
          SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NoMove or SWP_NoSize);
          SetWindowPos(Handle, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NoMove or SWP_NoSize);
      end;

      if ABConfirmBefore then
      begin
        if MyMessageDlg('Accept or Revert', mtConfirmation, [mbYes, mbNo], ['Accept','Revert'], 'Confirmation', mbNo, ABAppRect) = 7 then
        begin
          SetWindowPos(SelectedAppHandle, HWND_TOP,
            PreviousWindowRect.Left,
            PreviousWindowRect.Top,
            PreviousWindowRect.Width,
            PreviousWindowRect.Height, 0);
            // Put APS back on top
            SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NoMove or SWP_NoSize);
            SetWindowPos(Handle, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NoMove or SWP_NoSize);
        end;
      end;
    end;
  end;
end;

procedure TApplicationBoundsFrame.SizeGetWindowReticleDropSelect(Sender: TObject);
var
  Reticle: TWindowReticle;
  SelectedAppHandle: hwnd;
  WindowRect: TRect;
  WindowNameStr: String;
  i: Integer;
begin
  Reticle := TWindowReticle(Sender);
  if Reticle.AncestorCaption = '' then
  begin
    WindowNameStr := Reticle.WindowCaption;
  end
  else
  begin
    WindowNameStr := Reticle.AncestorCaption;
  end;

  SelectedAppHandle := FindWindow(nil, PWideChar(WindowNameStr));
  if SelectedAppHandle <> 0 then
  begin
    GetWindowRect(SelectedAppHandle, WindowRect);
    for i := 0 to SizeScrollBox.ControlCount - 1 do
    begin
      if (SizeScrollBox.Controls[i] as TSpeedButton).Down then
        if Length((SizeScrollBox.Controls[i] as TSpeedButton).Caption) = 0 then
        begin
          (SizeScrollBox.Controls[i] as TSpeedButton).Caption := IntToStr(WindowRect.Width) + ' x ' + IntToStr(WindowRect.Height);
        end
        else
        begin
          if MyMessageDlg('Replace or Keep', mtConfirmation, [mbYes, mbNo], ['Replace','Keep'], 'Confirmation', mbNo, ABAppRect) = 6 then
          begin // 6 Replace mbYes
            (SizeScrollBox.Controls[i] as TSpeedButton).Caption := IntToStr(WindowRect.Width) + ' x ' + IntToStr(WindowRect.Height);
          end;
        end;
    end;

  end;

end;

procedure TApplicationBoundsFrame.SizeSetWindowReticleDropSelect(Sender: TObject);
var
  Reticle: TWindowReticle;
  SelectedAppHandle: hwnd;
  WindowRect, PreviousWindowRect: TRect;
  WindowNameStr, SizeBtnCaption: String;
  OkToChg: Boolean;
  AppCenterPoint: TPoint;
  Monitor: TMonitor;
  i, MmdResult: Integer;
begin
  for i := 0 to SizeScrollBox.ControlCount - 1 do
  begin
    if (SizeScrollBox.Controls[i] as TSpeedButton).Down then
    begin
      SizeBtnCaption := (SizeScrollBox.Controls[i] as TSpeedButton).Caption;
      Reticle := TWindowReticle(Sender);
      if Reticle.AncestorCaption = '' then
      begin
        WindowNameStr := Reticle.WindowCaption;
      end
      else
      begin
        WindowNameStr := Reticle.AncestorCaption;
      end;

      if ABConfirmBefore then
      begin
        MmdResult := MyMessageDlg('Do you want to resize' + #10#13 + '"' + WindowNameStr + '"', mtConfirmation, [mbYes, mbNo], ['Yes','No'], 'Confirmation', mbNo, ABAppRect);
        OkToChg := MmdResult = 6;
      end
      else
      begin
        OkToChg := True;
      end;

      if OkToChg then
      begin
        SelectedAppHandle := FindWindow(nil, PWideChar(WindowNameStr));
        if SelectedAppHandle <> 0 then
        begin
          GetWindowRect(SelectedAppHandle, PreviousWindowRect);

          // Size Set
          WindowRect.Left := PreviousWindowRect.Left;
          WindowRect.Top := PreviousWindowRect.Top;
          WindowRect.Width := StrToInt(Copy(SizeBtnCaption, 1, Pos(' x ', SizeBtnCaption) - 1 ));
          WindowRect.Height := StrToInt(Copy(SizeBtnCaption, Pos(' x ', SizeBtnCaption) + 3 ));

          SetWindowPos(SelectedAppHandle, HWND_TOP,
            WindowRect.Left,
            WindowRect.Top,
            WindowRect.Width,
            WindowRect.Height, 0);
            // Put APS back on top
            SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NoMove or SWP_NoSize);
            SetWindowPos(Handle, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NoMove or SWP_NoSize);

          if ABConfirmBefore then
          begin
            if MyMessageDlg('Accept or Revert', mtConfirmation, [mbYes, mbNo], ['Accept','Revert'], 'Confirmation', mbNo, ABAppRect) = 7 then
            begin
              SetWindowPos(SelectedAppHandle, HWND_TOP,
                PreviousWindowRect.Left,
                PreviousWindowRect.Top,
                PreviousWindowRect.Width,
                PreviousWindowRect.Height, 0);
                // Put APS back on top
                SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NoMove or SWP_NoSize);
                SetWindowPos(Handle, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NoMove or SWP_NoSize);
            end;
          end;
        end;
      end;
    end;
  end;
end;

procedure TApplicationBoundsFrame.WindowReticleDropSelectMove(Sender: TObject);
var
  Reticle: TWindowReticle;
  SelectedAppHandle: hwnd;
  WindowRect, PreviousWindowRect: TRect;
  WindowNameStr: String;
  OkToChg, ChangePending: Boolean;
  AppCenterPoint: TPoint;
  Monitor: TMonitor;
begin
  Reticle := TWindowReticle(Sender);
  if Reticle.AncestorCaption = '' then
  begin
    WindowNameStr := Reticle.WindowCaption;
  end
  else
  begin
    WindowNameStr := Reticle.AncestorCaption;
  end;

  if ABConfirmBefore then
  begin
    OkToChg := (MyMessageDlg('Do you want to reposition and/or resize' + #10#13 + '"' + WindowNameStr + '"', mtConfirmation, [mbYes, mbNo], ['Yes','No'], 'Confirmation', mbNo, ABAppRect) = 6);
  end
  else
  begin
    OkToChg := True;
  end;

  if OkToChg then
  begin
    SelectedAppHandle := FindWindow(nil, PWideChar(WindowNameStr));
    if SelectedAppHandle <> 0 then
    begin
      GetWindowRect(SelectedAppHandle, PreviousWindowRect);
      ChangePending := False;

      AppCenterPoint.X := PreviousWindowRect.Left + (PreviousWindowRect.Width div 2);
      AppCenterPoint.Y := PreviousWindowRect.Top + (PreviousWindowRect.Height div 2);
      Monitor := Screen.MonitorFromPoint(AppCenterPoint);

      if (Sender as TWindowReticle).Name = 'WindowReticleMTL' then
      begin
        // Move Top Left
        WindowRect.Left := Monitor.WorkareaRect.Left;
        WindowRect.Top := Monitor.WorkareaRect.Top;
        WindowRect.Width := 0;
        WindowRect.Height := 0;
        ChangePending := True;
      end;

      if (Sender as TWindowReticle).Name = 'WindowReticleMTC' then
      begin
        // Move Top Center
        WindowRect.Left := Monitor.Left + ((Monitor.WorkareaRect.Width div 2) - (PreviousWindowRect.Width div 2));
        WindowRect.Top := Monitor.WorkareaRect.Top;
        WindowRect.Width := 0;
        WindowRect.Height := 0;
        ChangePending := True;
      end;

      if (Sender as TWindowReticle).Name = 'WindowReticleMTR' then
      begin
        // Move Top Right
        WindowRect.Left := Monitor.Left + (Monitor.WorkareaRect.Width - PreviousWindowRect.Width);
        WindowRect.Top := Monitor.WorkareaRect.Top;
        WindowRect.Width := 0;
        WindowRect.Height := 0;
        ChangePending := True;
      end;

      if (Sender as TWindowReticle).Name = 'WindowReticleMCL' then
      begin
        // Move Center Left
        WindowRect.Left := Monitor.WorkareaRect.Left;
        WindowRect.Top := Monitor.Top + ((Monitor.WorkareaRect.Height div 2) - (PreviousWindowRect.Height div 2));
        WindowRect.Width := 0;
        WindowRect.Height := 0;
        ChangePending := True;
      end;

      if (Sender as TWindowReticle).Name = 'WindowReticleMCC' then
      begin
        // Move Center Center
        WindowRect.Left := Monitor.Left + ((Monitor.WorkareaRect.Width div 2) - (PreviousWindowRect.Width div 2));
        WindowRect.Top := Monitor.Top + ((Monitor.WorkareaRect.Height div 2) - (PreviousWindowRect.Height div 2));
        WindowRect.Width := 0;
        WindowRect.Height := 0;
        ChangePending := True;
      end;

      if (Sender as TWindowReticle).Name = 'WindowReticleMCR' then
      begin
        // Move Center Right
        WindowRect.Left := Monitor.Left + (Monitor.WorkareaRect.Width - PreviousWindowRect.Width);
        WindowRect.Top := Monitor.Top + ((Monitor.WorkareaRect.Height div 2) - (PreviousWindowRect.Height div 2));
        WindowRect.Width := 0;
        WindowRect.Height := 0;
        ChangePending := True;
      end;

      if (Sender as TWindowReticle).Name = 'WindowReticleMBL' then
      begin
        // Move Bottom Left
        WindowRect.Left := Monitor.WorkareaRect.Left;
        WindowRect.Top := Monitor.Top + (Monitor.WorkareaRect.Height - PreviousWindowRect.Height);
        WindowRect.Width := 0;
        WindowRect.Height := 0;
        ChangePending := True;
      end;

      if (Sender as TWindowReticle).Name = 'WindowReticleMBC' then
      begin
        // Move Bottom Center
        WindowRect.Left := Monitor.Left + ((Monitor.WorkareaRect.Width div 2) - (PreviousWindowRect.Width div 2));
        WindowRect.Top := Monitor.Top + (Monitor.WorkareaRect.Height - PreviousWindowRect.Height);
        WindowRect.Width := 0;
        WindowRect.Height := 0;
        ChangePending := True;
      end;

      if (Sender as TWindowReticle).Name = 'WindowReticleMBR' then
      begin
        // Move Bottom Right
        WindowRect.Left := Monitor.Left + (Monitor.WorkareaRect.Width - PreviousWindowRect.Width);
        WindowRect.Top := Monitor.Top + (Monitor.WorkareaRect.Height - PreviousWindowRect.Height);
        WindowRect.Width := 0;
        WindowRect.Height := 0;
        ChangePending := True;
      end;

      if ChangePending then
      begin
        SetWindowPos(SelectedAppHandle, HWND_TOP,
          WindowRect.Left,
          WindowRect.Top,
          0,
          0, SWP_NoSize);
          // Put APS back on top
          SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NoMove or SWP_NoSize);
          SetWindowPos(Handle, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NoMove or SWP_NoSize);
      end;

      if ABConfirmBefore then
      begin
        if MyMessageDlg('Accept or Revert', mtConfirmation, [mbYes, mbNo], ['Accept','Revert'], 'Confirmation', mbNo, ABAppRect) = 7 then
        begin
          SetWindowPos(SelectedAppHandle, HWND_TOP,
            PreviousWindowRect.Left,
            PreviousWindowRect.Top,
            PreviousWindowRect.Width,
            PreviousWindowRect.Height, 0);
            // Put APS back on top
            SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NoMove or SWP_NoSize);
            SetWindowPos(Handle, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NoMove or SWP_NoSize);
        end;
      end;
    end;
  end;
end;

procedure TApplicationBoundsFrame.aClearSizeBtnsExecute(Sender: TObject);
begin
  ClearSizeBtns;
end;

procedure TApplicationBoundsFrame.aCornersPageExecute(Sender: TObject);
begin
  ApplicationBounsJvPageList.ActivePageIndex := 1;
end;

procedure TApplicationBoundsFrame.aGetSetPageExecute(Sender: TObject);
begin
  ApplicationBounsJvPageList.ActivePageIndex := 3;
end;

procedure TApplicationBoundsFrame.aMovePageExecute(Sender: TObject);
begin
  ApplicationBounsJvPageList.ActivePageIndex := 4;
end;

procedure TApplicationBoundsFrame.aSidesPageExecute(Sender: TObject);
begin
  ApplicationBounsJvPageList.ActivePageIndex := 2;
end;

procedure TApplicationBoundsFrame.aSizePageExecute(Sender: TObject);
begin
  ApplicationBounsJvPageList.ActivePageIndex := 5;
end;

procedure TApplicationBoundsFrame.GSGetWindowReticleDropSelect(Sender: TObject);
var
  Reticle: TWindowReticle;
  SelectedAppHandle: hwnd;
  WindowRect: TRect;
  WindowNameStr: String;
begin
  Reticle := TWindowReticle(Sender);
  if Reticle.AncestorCaption = '' then
  begin
    WindowNameStr := Reticle.WindowCaption;
  end
  else
  begin
    WindowNameStr := Reticle.AncestorCaption;
  end;

  SelectedAppHandle := FindWindow(nil, PWideChar(WindowNameStr));
  if SelectedAppHandle <> 0 then
  begin
    GetWindowRect(SelectedAppHandle, WindowRect);
    LeftLabeledEdit.Text := IntToStr(WindowRect.Left);
    TopLabeledEdit.Text := IntToStr(WindowRect.Top);
    WidthLabeledEdit.Text := IntToStr(WindowRect.Width);
    HeightLabeledEdit.Text := IntToStr(WindowRect.Height);
  end;
end;

procedure TApplicationBoundsFrame.HeightJvSpinButtonBottomClick(Sender: TObject);
begin
  HeightLabeledEdit.Text := IntToStr(StrToInt(HeightLabeledEdit.Text) - 1);
  HeightLabeledEdit.SetFocus;
  HeightLabeledEdit.SelStart := Length(HeightLabeledEdit.Text)
end;

procedure TApplicationBoundsFrame.HeightJvSpinButtonTopClick(Sender: TObject);
begin
  HeightLabeledEdit.Text := IntToStr(StrToInt(HeightLabeledEdit.Text) + 1);
  HeightLabeledEdit.SetFocus;
  HeightLabeledEdit.SelStart := Length(HeightLabeledEdit.Text)
end;

procedure TApplicationBoundsFrame.LeftJvSpinButtonBottomClick(Sender: TObject);
begin
  LeftLabeledEdit.Text := IntToStr(StrToInt(LeftLabeledEdit.Text) - 1);
  LeftLabeledEdit.SetFocus;
  LeftLabeledEdit.SelStart := Length(LeftLabeledEdit.Text)
end;

procedure TApplicationBoundsFrame.LeftJvSpinButtonTopClick(Sender: TObject);
begin
  LeftLabeledEdit.Text := IntToStr(StrToInt(LeftLabeledEdit.Text) + 1);
  LeftLabeledEdit.SetFocus;
  LeftLabeledEdit.SelStart := Length(LeftLabeledEdit.Text)
end;

procedure TApplicationBoundsFrame.TopJvSpinButtonBottomClick(Sender: TObject);
begin
  TopLabeledEdit.Text := IntToStr(StrToInt(TopLabeledEdit.Text) - 1);
  TopLabeledEdit.SetFocus;
  TopLabeledEdit.SelStart := Length(TopLabeledEdit.Text)
end;

procedure TApplicationBoundsFrame.TopJvSpinButtonTopClick(Sender: TObject);
begin
  TopLabeledEdit.Text := IntToStr(StrToInt(TopLabeledEdit.Text) + 1);
  TopLabeledEdit.SetFocus;
  TopLabeledEdit.SelStart := Length(TopLabeledEdit.Text)
end;

end.
