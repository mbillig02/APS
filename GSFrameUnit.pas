unit GSFrameUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.Samples.Spin, comp.reticle, Vcl.ExtCtrls, System.UITypes;

type
  TGetSetFrame = class(TFrame)
    HeightSpinEdit: TSpinEdit;
    LeftSpinEdit: TSpinEdit;
    TopSpinEdit: TSpinEdit;
    WidthSpinEdit: TSpinEdit;
    NameEdit: TEdit;
    GSGetPanel: TPanel;
    GSGetWindowReticle: TWindowReticle;
    GSSetPanel: TPanel;
    GSSetWindowReticle: TWindowReticle;
    procedure GSGetWindowReticleDropSelect(Sender: TObject);
    procedure GSSetWindowReticleDropSelect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ConfirmBefore: Boolean = True;
  ConfirmAfter: Boolean = True;

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

procedure TGetSetFrame.GSGetWindowReticleDropSelect(Sender: TObject);
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
    NameEdit.Text := WindowNameStr;
    LeftSpinEdit.Value := WindowRect.Left;
    TopSpinEdit.Value := WindowRect.Top;
    WidthSpinEdit.Value := WindowRect.Width;
    HeightSpinEdit.Value := WindowRect.Height;
  end;
end;

procedure TGetSetFrame.GSSetWindowReticleDropSelect(Sender: TObject);
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

  if ConfirmBefore then
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

      if (Sender as TWindowReticle).Name = 'GSSetWindowReticle' then
      begin
        // GS Set
        WindowRect.Left := LeftSpinEdit.Value;
        WindowRect.Top := TopSpinEdit.Value;
        WindowRect.Width := WidthSpinEdit.Value;
        WindowRect.Height := HeightSpinEdit.Value;
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

      if ConfirmAfter then
      begin
        if MyMessageDlg('Accept or Revert', mtConfirmation, [mbYes, mbNo], ['Accept','Revert'], 'Confirmation', mbNo) = 7 then
//        if MessageDlg('Keep (Yes) or Revert (No)', mtConfirmation, [mbYes,mbNo], 0, mbNo) = mrNo then
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

end.
