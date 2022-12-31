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
  GSConfirmBefore: Boolean = True;
  GSConfirmAfter: Boolean = True;
  GSAppRect: TRect;

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
  OkToChg: Integer;
  ChangePending: Boolean;
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

  if GSConfirmBefore then
  begin
    OkToChg := MyMessageDlg('What do you want to do with' + #10#13 + '"' + WindowNameStr + '" ?', mtConfirmation, [mbYes, mbOk, mbRetry, mbNo], ['Position/Size', 'Position', 'Size', 'Cancel'], 'Confirmation', mbRetry, GSAppRect);
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
    SelectedAppHandle := FindWindow(nil, PWideChar(WindowNameStr));
    if SelectedAppHandle <> 0 then
    begin
      GetWindowRect(SelectedAppHandle, PreviousWindowRect);
      ChangePending := False;

      if (Sender as TWindowReticle).Name = 'GSSetWindowReticle' then
      begin
        // GS Set
        case OkToChg of
          6: begin
               WindowRect.Left := LeftSpinEdit.Value;
               WindowRect.Top := TopSpinEdit.Value;
               WindowRect.Width := WidthSpinEdit.Value;
               WindowRect.Height := HeightSpinEdit.Value;
               ChangePending := True;
             end;
          7: begin
               WindowRect.Left := LeftSpinEdit.Value;
               WindowRect.Top := TopSpinEdit.Value;
               WindowRect.Width := PreviousWindowRect.Width;
               WindowRect.Height := PreviousWindowRect.Height;
               ChangePending := True;
             end;
          1: begin
               WindowRect.Left := PreviousWindowRect.Left;
               WindowRect.Top := PreviousWindowRect.Top;
               WindowRect.Width := WidthSpinEdit.Value;
               WindowRect.Height := HeightSpinEdit.Value;
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

      if GSConfirmAfter then
      begin
        if MyMessageDlg('Accept or Revert', mtConfirmation, [mbYes, mbNo], ['Accept','Revert'], 'Confirmation', mbNo, GSAppRect) = 7 then
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
