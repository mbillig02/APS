unit ABFrameUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, comp.reticle, System.UITypes,
  Vcl.ExtCtrls, Vcl.StdCtrls, JvExControls, JvPageList, Vcl.Samples.Spin,
  System.Actions, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, JvExComCtrls,
  JvToolBar;

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
    JvToolBar: TJvToolBar;
    CenterToolButton: TToolButton;
    ABFActionList: TActionList;
    aCenterPage: TAction;
    aCornersPage: TAction;
    CornersToolButton: TToolButton;
    aSidesPage: TAction;
    SidesToolButton: TToolButton;
    aGetSetPage: TAction;
    GetSetToolButton: TToolButton;
    procedure GSGetWindowReticleDropSelect(Sender: TObject);
    procedure WindowReticleDropSelect(Sender: TObject);
    procedure aCenterPageExecute(Sender: TObject);
    procedure aCornersPageExecute(Sender: TObject);
    procedure aSidesPageExecute(Sender: TObject);
    procedure aGetSetPageExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ABConfirmBefore: Boolean = True;
  ABConfirmAfter: Boolean = True;

implementation

{$R *.dfm}

function MyMessageDlg(CONST Msg: string; DlgTypt: TmsgDlgType; button: TMsgDlgButtons;
  Caption: ARRAY OF string; dlgcaption: string; DefaultButton: TMsgDlgBtn): Integer;
var
  aMsgdlg: TForm;
  i: Integer;
  Dlgbutton: Tbutton;
  Captionindex: Integer;
begin
  aMsgdlg := createMessageDialog(Msg, DlgTypt, button, DefaultButton);
  aMsgdlg.Caption := dlgcaption;
  aMsgdlg.BiDiMode := bdRightToLeft;
  aMsgdlg.BorderIcons := aMsgdlg.BorderIcons - [biSystemMenu];
  aMsgdlg.BorderStyle := bsSingle;

  Captionindex := 0;
  for i := 0 to aMsgdlg.componentcount - 1 Do
  begin
    if (aMsgdlg.components[i] is Tbutton) then
    Begin
      Dlgbutton := Tbutton(aMsgdlg.components[i]);
      if Captionindex <= High(Caption) then
        Dlgbutton.Caption := Caption[Captionindex];
      inc(Captionindex);
    end;
  end;
  Result := aMsgdlg.Showmodal;
end;

procedure TApplicationBoundsFrame.aCenterPageExecute(Sender: TObject);
begin
  ApplicationBounsJvPageList.ActivePageIndex := 0;
end;

procedure TApplicationBoundsFrame.WindowReticleDropSelect(
  Sender: TObject);
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
    OkToChg := (MessageDlg('Do you want to reposition and/or resize' + #10#13 + '"' + WindowNameStr + '"', mtConfirmation, [mbYes,mbNo], 0, mbNo) = mrYes);
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
        if MyMessageDlg('Accept or Revert', mtConfirmation, [mbYes, mbNo], ['Accept','Revert'], 'Confirmation', mbNo) = 7 then
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

end.
