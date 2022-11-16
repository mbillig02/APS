unit ABFrameUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, comp.reticle, System.UITypes,
  Vcl.ExtCtrls, Vcl.StdCtrls, JvExControls, JvPageList, Vcl.Samples.Spin,
  System.Actions, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, JvExComCtrls,
  JvToolBar, JvSpin, System.ImageList, Vcl.ImgList, Vcl.Buttons, Vcl.Mask;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ABConfirmBefore: Boolean = True;
  ABConfirmAfter: Boolean = True;
  ABAppRect: TRect;

implementation

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
  OkToChg, ChangePending: Boolean;
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

      if (Sender as TWindowReticle).Name = 'CenterWindowReticle' then
      begin
        // Center
        WindowRect.Left := (Screen.WorkAreaWidth div 2) - (PreviousWindowRect.Width div 2);
        WindowRect.Top :=  (Screen.WorkAreaHeight div 2) - (PreviousWindowRect.Height div 2);
        WindowRect.Width := PreviousWindowRect.Width;
        WindowRect.Height := PreviousWindowRect.Height;
        ChangePending := True;
      end;
      if (Sender as TWindowReticle).Name = 'CenterPercentWindowReticle' then
      begin
        // Center Percent
        WindowRect.Left := Round((Screen.WorkAreaWidth / 2) - ((Screen.WorkAreaWidth / 2) * (CenterPercentSpinEdit.Value / 100)));
        WindowRect.Top := Round((Screen.WorkAreaHeight / 2) - ((Screen.WorkAreaHeight / 2) * (CenterPercentSpinEdit.Value / 100)));
        WindowRect.Width := Round(((Screen.WorkAreaWidth / 2) * (CenterPercentSpinEdit.Value / 100)) * 2);
        WindowRect.Height := Round(((Screen.WorkAreaHeight / 2) * (CenterPercentSpinEdit.Value / 100)) * 2);
        ChangePending := True;
      end;

      if (Sender as TWindowReticle).Name = 'SCBLWindowReticle' then
      begin
        // Bottom Left Corner
        WindowRect.Left := 0;
        WindowRect.Top := (Screen.WorkAreaHeight div 2) + 1;
        WindowRect.Width := Screen.WorkAreaWidth div 2;
        WindowRect.Height := Screen.WorkAreaHeight div 2;
        ChangePending := True;
      end;
      if (Sender as TWindowReticle).Name = 'SCBRWindowReticle' then
      begin
        // Bottom Right Corner
        WindowRect.Left := (Screen.WorkAreaWidth div 2) + 1;
        WindowRect.Top := (Screen.WorkAreaHeight div 2) + 1;
        WindowRect.Width := Screen.WorkAreaWidth div 2;
        WindowRect.Height := Screen.WorkAreaHeight div 2;
        ChangePending := True;
      end;
      if (Sender as TWindowReticle).Name = 'SCTLWindowReticle' then
      begin
        // Top Left Corner
        WindowRect.Left := 0;
        WindowRect.Top := 0;
        WindowRect.Width := Screen.WorkAreaWidth div 2;
        WindowRect.Height := Screen.WorkAreaHeight div 2;
        ChangePending := True;
      end;
      if (Sender as TWindowReticle).Name = 'SCTRWindowReticle' then
      begin
        // Top Right Corner
        WindowRect.Left := (Screen.WorkAreaWidth div 2) + 1;
        WindowRect.Top := 0;
        WindowRect.Width := Screen.WorkAreaWidth div 2;
        WindowRect.Height := Screen.WorkAreaHeight div 2;
        ChangePending := True;
      end;

      if (Sender as TWindowReticle).Name = 'SSLWindowReticle' then
      begin
        // Left Side
        WindowRect.Left := 0;
        WindowRect.Top := 0;
        WindowRect.Width := Screen.WorkAreaWidth div 2;
        WindowRect.Height := Screen.WorkAreaHeight;
        ChangePending := True;
      end;
      if (Sender as TWindowReticle).Name = 'SSRWindowReticle' then
      begin
        // Right Side
        WindowRect.Left := (Screen.WorkAreaWidth div 2) + 1;
        WindowRect.Top := 0;
        WindowRect.Width := Screen.WorkAreaWidth div 2;
        WindowRect.Height := Screen.WorkAreaHeight;
        ChangePending := True;
      end;

      if (Sender as TWindowReticle).Name = 'GSSetWindowReticle' then
      begin
        // GS Set
        WindowRect.Left := StrToInt(LeftLabeledEdit.Text);
        WindowRect.Top := StrToInt(TopLabeledEdit.Text);
        WindowRect.Width := StrToInt(WidthLabeledEdit.Text);
        WindowRect.Height := StrToInt(HeightLabeledEdit.Text);
        ChangePending := True;
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

procedure TApplicationBoundsFrame.WindowReticleDropSelectMove(Sender: TObject);
var
  Reticle: TWindowReticle;
  SelectedAppHandle: hwnd;
  WindowRect, PreviousWindowRect: TRect;
  WindowNameStr: String;
  OkToChg, ChangePending: Boolean;
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

      if (Sender as TWindowReticle).Name = 'WindowReticleMTL' then
      begin
        // Move Top Left
        WindowRect.Left := 0;
        WindowRect.Top := 0;
        WindowRect.Width := 0;
        WindowRect.Height := 0;
        ChangePending := True;
      end;

      if (Sender as TWindowReticle).Name = 'WindowReticleMTC' then
      begin
        // Move Top Center
        WindowRect.Left := (Screen.WorkAreaWidth div 2) - (PreviousWindowRect.Width div 2);
        WindowRect.Top := 0;
        WindowRect.Width := 0;
        WindowRect.Height := 0;
        ChangePending := True;
      end;

      if (Sender as TWindowReticle).Name = 'WindowReticleMTR' then
      begin
        // Move Top Right
        WindowRect.Left := Screen.WorkAreaWidth - PreviousWindowRect.Width;
        WindowRect.Top := 0;
        WindowRect.Width := 0;
        WindowRect.Height := 0;
        ChangePending := True;
      end;

      if (Sender as TWindowReticle).Name = 'WindowReticleMCL' then
      begin
        // Move Center Left
        WindowRect.Left := 0;
        WindowRect.Top := (Screen.WorkAreaHeight div 2) - (PreviousWindowRect.Height div 2);
        WindowRect.Width := 0;
        WindowRect.Height := 0;
        ChangePending := True;
      end;

      if (Sender as TWindowReticle).Name = 'WindowReticleMCC' then
      begin
        // Move Center Center
        WindowRect.Left := (Screen.WorkAreaWidth div 2) - (PreviousWindowRect.Width div 2);
        WindowRect.Top := (Screen.WorkAreaHeight div 2) - (PreviousWindowRect.Height div 2);
        WindowRect.Width := 0;
        WindowRect.Height := 0;
        ChangePending := True;
      end;

      if (Sender as TWindowReticle).Name = 'WindowReticleMCR' then
      begin
        // Move Center Right
        WindowRect.Left := Screen.WorkAreaWidth - PreviousWindowRect.Width;
        WindowRect.Top := (Screen.WorkAreaHeight div 2) - (PreviousWindowRect.Height div 2);
        WindowRect.Width := 0;
        WindowRect.Height := 0;
        ChangePending := True;
      end;

      if (Sender as TWindowReticle).Name = 'WindowReticleMBL' then
      begin
        // Move Bottom Left
        WindowRect.Left := 0;
        WindowRect.Top := Screen.WorkAreaHeight - PreviousWindowRect.Height;
        WindowRect.Width := 0;
        WindowRect.Height := 0;
        ChangePending := True;
      end;

      if (Sender as TWindowReticle).Name = 'WindowReticleMBC' then
      begin
        // Move Bottom Center
        WindowRect.Left := (Screen.WorkAreaWidth div 2) - (PreviousWindowRect.Width div 2);
        WindowRect.Top := Screen.WorkAreaHeight - PreviousWindowRect.Height;
        WindowRect.Width := 0;
        WindowRect.Height := 0;
        ChangePending := True;
      end;

      if (Sender as TWindowReticle).Name = 'WindowReticleMBR' then
      begin
        // Move Bottom Right
        WindowRect.Left := Screen.WorkAreaWidth - PreviousWindowRect.Width;
        WindowRect.Top := Screen.WorkAreaHeight - PreviousWindowRect.Height;
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
