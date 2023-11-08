unit RealtimeFrameUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, comp.reticle, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Samples.Spin, MWBButtons;

type
  TRealtimeFrame = class(TFrame)
    AppHandleLbl: TLabel;
    AppNameLbl: TLabel;
    GSGetPanel: TPanel;
    GSGetWindowReticle: TWindowReticle; // Left Increase Width
    PidLbl: TLabel; // Right Decrease Width
    RectLbl: TLabel;
    RefreshBtn: TButton;
    RefreshTimer: TTimer;
    StartBtn: TButton;
    StopBtn: TButton;
    IncSpinEdit: TSpinEdit;
    SpinButtonX5: TSpinButton;
    IncGroupBox: TGroupBox;
    SpinButtonX10: TSpinButton;
    MoveGroupBox: TGroupBox;
    TriangleButtonLU: TTriangleButton;
    TriangleButtonL: TTriangleButton;
    TriangleButtonU: TTriangleButton;
    TriangleButtonRU: TTriangleButton;
    TriangleButtonR: TTriangleButton;
    TriangleButtonRD: TTriangleButton;
    TriangleButtonD: TTriangleButton;
    TriangleButtonLD: TTriangleButton;
    ResizeGroupBox: TGroupBox;
    TriangleButtonIL: TTriangleButton;
    TriangleButtonDL: TTriangleButton;
    TriangleButtonIT: TTriangleButton;
    TriangleButtonDT: TTriangleButton;
    TriangleButtonDB: TTriangleButton;
    TriangleButtonIB: TTriangleButton;
    TriangleButtonDR: TTriangleButton;
    TriangleButtonIR: TTriangleButton;
    IncrementX5Lbl: TLabel;
    IncrementX10Lbl: TLabel;
    procedure GSGetWindowReticleDropSelect(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
    procedure RefreshTimerTimer(Sender: TObject);
    procedure StartBtnClick(Sender: TObject);
    procedure StopBtnClick(Sender: TObject);
    procedure SpinButtonX5DownClick(Sender: TObject);
    procedure SpinButtonX5UpClick(Sender: TObject);
    procedure SpinButtonX10DownClick(Sender: TObject);
    procedure SpinButtonX10UpClick(Sender: TObject);
    procedure TriangleButtonUClick(Sender: TObject);
    procedure TriangleButtonRClick(Sender: TObject);
    procedure TriangleButtonDClick(Sender: TObject);
    procedure TriangleButtonLClick(Sender: TObject);
    procedure TriangleButtonLUClick(Sender: TObject);
    procedure TriangleButtonRUClick(Sender: TObject);
    procedure TriangleButtonRDClick(Sender: TObject);
    procedure TriangleButtonLDClick(Sender: TObject);
    procedure TriangleButtonIRClick(Sender: TObject);
    procedure TriangleButtonDRClick(Sender: TObject);
    procedure TriangleButtonIBClick(Sender: TObject);
    procedure TriangleButtonDBClick(Sender: TObject);
    procedure TriangleButtonDLClick(Sender: TObject);
    procedure TriangleButtonILClick(Sender: TObject);
    procedure TriangleButtonDTClick(Sender: TObject);
    procedure TriangleButtonITClick(Sender: TObject);
  private
    procedure AdjustAppPosAndSize(AppHandle: Hwnd; What2Adjust: Char; Amount: Integer; Lbl, AppHandleLbl, AppNameLbl: TLabel);
    procedure UpdatePosAndSizeDisplay(AppHandle: HWND; RectLbl, AppHandleLbl, AppNameLbl: TLabel; PidLbl: TLabel);
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

var
  SelectedAppHandle: hwnd;

{$R *.dfm}

function GetWindowTitle(AppHandle: Hwnd): String;
var
  titleLength: Integer;
  title: String;
begin
  titleLength := GetWindowTextLength(AppHandle);
  SetLength(title, titleLength);
  GetWindowText(AppHandle, PChar(title), titleLength + 1);
  Result := PChar(title);
end;

function StripLeadingZeros(const InStr: String): String;
var
  i, Len: Integer;
begin
  Len := Length(InStr);
  for i := 1 to Len do
  begin
    if InStr[i] <> '0' then
    begin
      Result := Copy(InStr, i, Len);
      exit;
    end;
  end;
  Result := '0';
end;

function RectToStr(InRect: TRect): String;
begin
  Result := '(' +
  IntToStr(InRect.Left) + ',' +
  IntToStr(InRect.Top) + ',' +
  IntToStr(InRect.Width) + ',' +
  IntToStr(InRect.Height) + ')';
end;

procedure TRealtimeFrame.AdjustAppPosAndSize(AppHandle: Hwnd; What2Adjust: Char; Amount: Integer; Lbl, AppHandleLbl, AppNameLbl: TLabel);
var
  AppRect: TRect;
  la, ta, wa, ha: Integer;
begin
  la := 0; ta := 0; wa := 0; ha := 0;
  case What2Adjust of
    'L': la := Amount; //  -: Move Left        +: Move Right
    'T': ta := Amount; //  -: Move Up          +: Move Down
    'W': wa := Amount; //  -: Decrease Width   +: Increase Width
    'H': ha := Amount; //  -: Decrease Hieght  +: Increase Height
    'l': begin
           la := Amount;
           wa := -Amount;
         end;
    'r': begin
           la := Amount;
           wa := -Amount;
         end;
    'u': begin
           ta := Amount;
           ha := -Amount;
         end;
    'd': begin
           ta := Amount;
           ha := -Amount;
         end;
    '1': begin //  RU NE
           la := Amount;
           ta := -Amount;
         end;
    '3': begin //  RD SE
           la := Amount;
           ta := Amount;
         end;
    '5': begin //  LD SW
           la := -Amount;
           ta := Amount;
         end;
    '7': begin //  LU NW
           la := -Amount;
           ta := -Amount;
         end;
  end;
  GetWindowRect(AppHandle, AppRect);
  SetWindowPos(AppHandle, HWND_TOP,
    AppRect.Left + la,
    AppRect.Top + ta,
    AppRect.Width + wa,
    AppRect.Height + ha, 0);

  // Put APS back on top
  SetWindowPos(Application.Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NoMove or SWP_NoSize);
  SetWindowPos(Application.Handle, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NoMove or SWP_NoSize);

  UpdatePosAndSizeDisplay(AppHandle, Lbl, AppHandleLbl, AppNameLbl, PidLbl);
end;

procedure TRealtimeFrame.UpdatePosAndSizeDisplay(AppHandle: HWND; RectLbl: TLabel; AppHandleLbl: TLabel; AppNameLbl:TLabel; PidLbl: TLabel);
var
  AppRect: TRect;
  PID: DWord;
begin
  GetWindowThreadProcessId(AppHandle, @PID);
  Sleep(500);
  PidLbl.Caption := 'Pid: 0x' + StripLeadingZeros(IntToHex(PID)) + ' (' + IntToStr(PID) + ')';
  if PID = 0 then
  begin
    RefreshTimer.Enabled := False;
    RectLbl.Caption := '';
    AppHandleLbl.Caption := '';
    AppNameLbl.Caption := '';
    PidLbl.Caption := '';

    RefreshBtn.Enabled := False;
    StartBtn.Enabled := False;
    StopBtn.Enabled := False;

    TriangleButtonLU.Enabled := False;
    TriangleButtonL.Enabled := False;
    TriangleButtonU.Enabled := False;
    TriangleButtonRU.Enabled := False;
    TriangleButtonR.Enabled := False;
    TriangleButtonRD.Enabled := False;
    TriangleButtonD.Enabled := False;
    TriangleButtonLD.Enabled := False;

    TriangleButtonIL.Enabled := False;
    TriangleButtonDL.Enabled := False;
    TriangleButtonIT.Enabled := False;
    TriangleButtonDT.Enabled := False;
    TriangleButtonDB.Enabled := False;
    TriangleButtonIB.Enabled := False;
    TriangleButtonDR.Enabled := False;
    TriangleButtonIR.Enabled := False;

  end
  else
  begin
    GetWindowRect(AppHandle, AppRect);
    RectLbl.Caption := RectToStr(AppRect);
    AppHandleLbl.Caption := 'Handle: 0x' + StripLeadingZeros(IntToHex(AppHandle)) + ' (' + IntToStr(AppHandle) + ')';
    AppNameLbl.Caption := GetWindowTitle(AppHandle);
  end;
end;

procedure TRealtimeFrame.GSGetWindowReticleDropSelect(Sender: TObject);
var
  Reticle: TWindowReticle;
  WindowNameStr: String;
  AppRect: TRect;
begin
  Reticle := TWindowReticle(Sender);
  if Reticle.AncestorHandle = 0 then
  begin
    SelectedAppHandle := Reticle.WindowHandle;
    WindowNameStr := Reticle.WindowCaption;
  end
  else
  begin
    SelectedAppHandle := Reticle.AncestorHandle;
    WindowNameStr := Reticle.AncestorCaption;
  end;

  GetWindowRect(SelectedAppHandle, AppRect);
  UpdatePosAndSizeDisplay(SelectedAppHandle, RectLbl, AppHandleLbl, AppNameLbl, PidLbl);

  RefreshBtn.Enabled := True;
  StartBtn.Enabled := True;
  StopBtn.Enabled := True;

  TriangleButtonLU.Enabled := True;
  TriangleButtonL.Enabled := True;
  TriangleButtonU.Enabled := True;
  TriangleButtonRU.Enabled := True;
  TriangleButtonR.Enabled := True;
  TriangleButtonRD.Enabled := True;
  TriangleButtonD.Enabled := True;
  TriangleButtonLD.Enabled := True;

  TriangleButtonIL.Enabled := True;
  TriangleButtonDL.Enabled := True;
  TriangleButtonIT.Enabled := True;
  TriangleButtonDT.Enabled := True;
  TriangleButtonDB.Enabled := True;
  TriangleButtonIB.Enabled := True;
  TriangleButtonDR.Enabled := True;
  TriangleButtonIR.Enabled := True;

  RefreshTimer.Enabled := True;

end;

procedure TRealtimeFrame.RefreshBtnClick(Sender: TObject);
begin
  UpdatePosAndSizeDisplay(SelectedAppHandle, RectLbl, AppHandleLbl, AppNameLbl, PidLbl);
end;

procedure TRealtimeFrame.RefreshTimerTimer(Sender: TObject);
begin
  UpdatePosAndSizeDisplay(SelectedAppHandle, RectLbl, AppHandleLbl, AppNameLbl, PidLbl);
end;

procedure TRealtimeFrame.SpinButtonX10DownClick(Sender: TObject);
begin
  if IncSpinEdit.Value > 10 then
  begin
    IncSpinEdit.Value := IncSpinEdit.Value - 10;
  end
  else
  begin
    IncSpinEdit.Value := 1;
  end;
end;

procedure TRealtimeFrame.SpinButtonX10UpClick(Sender: TObject);
begin
  if IncSpinEdit.Value = 1 then
  begin
    IncSpinEdit.Value := 10;
  end
  else
  begin
    if IncSpinEdit.Value < IncSpinEdit.MaxValue - 10 then
    begin
      IncSpinEdit.Value := IncSpinEdit.Value + 10;
    end
    else
    begin
      IncSpinEdit.Value := IncSpinEdit.MaxValue;
    end;
  end;
end;

procedure TRealtimeFrame.SpinButtonX5DownClick(Sender: TObject);
begin
  if IncSpinEdit.Value > 5 then
  begin
    IncSpinEdit.Value := IncSpinEdit.Value - 5;
  end
  else
  begin
    IncSpinEdit.Value := 1;
  end;
end;

procedure TRealtimeFrame.SpinButtonX5UpClick(Sender: TObject);
begin
  if IncSpinEdit.Value = 1 then
  begin
    IncSpinEdit.Value := 5;
  end
  else
  begin
    if IncSpinEdit.Value < IncSpinEdit.MaxValue - 5 then
    begin
      IncSpinEdit.Value := IncSpinEdit.Value + 5;
    end
    else
    begin
      IncSpinEdit.Value := IncSpinEdit.MaxValue;
    end;
  end;
end;

procedure TRealtimeFrame.StartBtnClick(Sender: TObject);
begin
  RefreshTimer.Enabled := True;
end;

procedure TRealtimeFrame.StopBtnClick(Sender: TObject);
begin
  RefreshTimer.Enabled := False;
end;

procedure TRealtimeFrame.TriangleButtonDBClick(Sender: TObject);
begin
  AdjustAppPosAndSize(SelectedAppHandle, 'H', -IncSpinEdit.Value, RectLbl, AppHandleLbl, AppNameLbl);
end;

procedure TRealtimeFrame.TriangleButtonDClick(Sender: TObject);
begin
  AdjustAppPosAndSize(SelectedAppHandle, 'T', IncSpinEdit.Value, RectLbl, AppHandleLbl, AppNameLbl);
end;

procedure TRealtimeFrame.TriangleButtonDLClick(Sender: TObject);
begin
  AdjustAppPosAndSize(SelectedAppHandle, 'l', -IncSpinEdit.Value, RectLbl, AppHandleLbl, AppNameLbl);
end;

procedure TRealtimeFrame.TriangleButtonDRClick(Sender: TObject);
begin
  AdjustAppPosAndSize(SelectedAppHandle, 'W', -IncSpinEdit.Value, RectLbl, AppHandleLbl, AppNameLbl);
end;

procedure TRealtimeFrame.TriangleButtonDTClick(Sender: TObject);
begin
  AdjustAppPosAndSize(SelectedAppHandle, 'u', -IncSpinEdit.Value, RectLbl, AppHandleLbl, AppNameLbl);
end;

procedure TRealtimeFrame.TriangleButtonIBClick(Sender: TObject);
begin
  AdjustAppPosAndSize(SelectedAppHandle, 'H', IncSpinEdit.Value, RectLbl, AppHandleLbl, AppNameLbl);
end;

procedure TRealtimeFrame.TriangleButtonILClick(Sender: TObject);
begin
  AdjustAppPosAndSize(SelectedAppHandle, 'r', IncSpinEdit.Value, RectLbl, AppHandleLbl, AppNameLbl);
end;

procedure TRealtimeFrame.TriangleButtonIRClick(Sender: TObject);
begin
  AdjustAppPosAndSize(SelectedAppHandle, 'W', IncSpinEdit.Value, RectLbl, AppHandleLbl, AppNameLbl);
end;

procedure TRealtimeFrame.TriangleButtonITClick(Sender: TObject);
begin
  AdjustAppPosAndSize(SelectedAppHandle, 'd', IncSpinEdit.Value, RectLbl, AppHandleLbl, AppNameLbl);
end;

procedure TRealtimeFrame.TriangleButtonLClick(Sender: TObject);
begin
  AdjustAppPosAndSize(SelectedAppHandle, 'L', -IncSpinEdit.Value, RectLbl, AppHandleLbl, AppNameLbl);
end;

procedure TRealtimeFrame.TriangleButtonLDClick(Sender: TObject);
begin
  AdjustAppPosAndSize(SelectedAppHandle, '5', IncSpinEdit.Value, RectLbl, AppHandleLbl, AppNameLbl);
end;

procedure TRealtimeFrame.TriangleButtonLUClick(Sender: TObject);
begin
  AdjustAppPosAndSize(SelectedAppHandle, '7', IncSpinEdit.Value, RectLbl, AppHandleLbl, AppNameLbl);
end;

procedure TRealtimeFrame.TriangleButtonRClick(Sender: TObject);
begin
  AdjustAppPosAndSize(SelectedAppHandle, 'L', IncSpinEdit.Value, RectLbl, AppHandleLbl, AppNameLbl);
end;

procedure TRealtimeFrame.TriangleButtonRDClick(Sender: TObject);
begin
  AdjustAppPosAndSize(SelectedAppHandle, '3', IncSpinEdit.Value, RectLbl, AppHandleLbl, AppNameLbl);
end;

procedure TRealtimeFrame.TriangleButtonRUClick(Sender: TObject);
begin
  AdjustAppPosAndSize(SelectedAppHandle, '1', IncSpinEdit.Value, RectLbl, AppHandleLbl, AppNameLbl);
end;

procedure TRealtimeFrame.TriangleButtonUClick(Sender: TObject);
begin
  AdjustAppPosAndSize(SelectedAppHandle, 'T', -IncSpinEdit.Value, RectLbl, AppHandleLbl, AppNameLbl);
end;

end.
