unit comp.reticle;

interface
uses
  Winapi.Windows,
  System.SysUtils, System.Classes, System.Types, Vcl.Controls;

type
  TWindowReticle = class(TCustomControl)
  private
    fDragging: boolean;
    fWindowHandle: HWnd;
    fWindowCaption: string;
    fWindowClass: string;
    fAncestorHandle: Hwnd;
    fAncestorClass: string;
    fAncestorCaption: string;
    fOnWindowChange: TNotifyEvent;
    fOnDropSelect: TNotifyEvent;
  private
    procedure ClearWindowProperties;
    function GetWndFromClientPoint(Pt: TPoint): HWND;
  protected
    function CanResize(var NewWidth, NewHeight: Integer): Boolean; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
//    procedure ChangeScale(M, D: Integer); override;
  public
    procedure Paint; override;
    constructor Create( aOwner: TComponent ); override;
  published
    property OnWindowChange: TNotifyEvent read fOnWindowChange write fOnWindowChange;
    property OnDropSelect: TNotifyEvent read fOnDropSelect write fOnDropSelect;
    property WindowHandle: Hwnd read fWindowHandle;
    property WindowClass: string read fWindowClass;
    property WindowCaption: string read fWindowCaption;
    property AncestorClass: string read fAncestorClass;
    property AncestorCaption: string read fAncestorCaption;
    property AncestorHandle: Hwnd read fAncestorHandle;
  end;

procedure Register;

implementation
uses
  vcl.forms,
  vcl.graphics;

const
  cFixedSize = 32;
  cHalfSize = cFixedSize div 2;
  cQuaterSize = cHalfSize div 2;

//  standard DPI settings are 100% (96 DPI), 125% (120 DPI), and 150% (144 DPI).
//  DPIValue = 96; // 100%
//  DPIValue = 120; // 125%
  DPIValue = 144; // 150%
//  DPIValue = 192; // 200%

procedure Register;
begin
  RegisterComponents('Samples', [TWindowReticle]);
end;

{ TWindowReticle }
{
procedure TWindowReticle.ChangeScale(M, D: Integer);
begin
  inherited ChangeScale(M, D);
  Self.Height := MulDiv(Self.Height, M, D);
  Self.Width := MulDiv(Self.Width, M, D);
end;
}
function TWindowReticle.CanResize(var NewWidth, NewHeight: Integer): Boolean;
begin
  Result := True;
end;

constructor TWindowReticle.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);
  Width := cFixedSize;
  Height := cFixedSize;
//  Width := MulDiv(cFixedSize, Screen.PixelsPerInch, DPIValue);
//  Height := MulDiv(cFixedSize, Screen.PixelsPerInch, DPIValue);
  fOnWindowChange := nil;
  fOnDropSelect := nil;
  fDragging := False;
  ClearWindowProperties;
end;

procedure TWindowReticle.ClearWindowProperties;
begin
  fWindowHandle := 0;
  fWindowCaption := '';
  fWindowClass := '';
  fAncestorClass := '';
  fAncestorHandle := 0;
  fAncestorCaption := '';
end;

procedure TWindowReticle.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (Button = mbLeft) then begin
    ClearWindowProperties;
    fDragging := True;
    SetCapture(Handle);
    Screen.Cursor := crCross;
    Self.Repaint;
  end;
end;

function TWindowReticle.GetWndFromClientPoint(Pt: TPoint): HWND;
begin
  MapWindowPoints(Handle, GetDesktopWindow, Pt, 1);
  Result := WindowFromPoint(Pt);
end;

procedure TWindowReticle.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  wnd: HWnd;
  TextBuffer: array [0..255] of Char;
begin
  if not fDragging then begin
    exit;
  end;
  wnd := GetWndFromClientPoint(Point(X,Y));
  if wnd=fWindowHandle then begin
    exit;
  end;
  ClearWindowProperties;
  fWindowHandle := wnd;
  //- Get the window class name
  FillChar(TextBuffer,length(TextBuffer),0);
  GetClassName(fWindowHandle, TextBuffer, pred(length(TextBuffer)));
  fWindowClass := TextBuffer;
  //- Get window caption
  FillChar(TextBuffer,length(TextBuffer),0);
  GetWindowText(fWindowHandle,TextBuffer, pred(length(TextBuffer)));
  fWindowCaption := TextBuffer;
  if (GetWindowLong(fWindowHandle, GWL_STYLE) and WS_CHILD) = WS_CHILD then begin
      //- Get Ancestor window handle
      fAncestorHandle := GetAncestor(fWindowHandle, GA_ROOT);
      //- Get ancestor class name
      FillChar(TextBuffer,length(TextBuffer),0);
      GetClassName(fAncestorHandle, TextBuffer, pred(length(TextBuffer)));
      fAncestorClass := TextBuffer;
      //- Get ancestor caption
      FillChar(TextBuffer,length(TextBuffer),0);
      GetWindowText(fAncestorHandle,TextBuffer,pred(length(TextBuffer)));
      fAncestorCaption := TextBuffer;
  end;
  //- Call UI event handler
  if assigned(fOnWindowChange) then
  begin
    fOnWindowChange(Self);
  end;
end;

procedure TWindowReticle.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if not fDragging then
  begin
    exit;
  end;
  fDragging := False;
  ReleaseCapture;
  Screen.Cursor := crDefault;
  Self.Repaint;

  //- Call DropSelect
  if assigned(fOnDropSelect) then
  begin
    fOnDropSelect(Self);
  end;

end;

procedure TWindowReticle.Paint;
begin
  // Set brush and pen properties.
  Canvas.Brush.Style := bsClear;
  Canvas.Pen.Style := psSolid;
  Canvas.Pen.Color := clRed;
  Canvas.Pen.Width := 2;

  // Draw circle

//  Canvas.Ellipse(0, 0, Width, Height); // Outside ring
  Canvas.Ellipse(Width div 6, Height div 6, Width - (Width div 6), Height - (Height div 6)); // Middle ring
  Canvas.Ellipse(Width div 3, Height div 3, Width - (Width div 3), Height - (Height div 3)); // Inside ring
{
  Canvas.Ellipse(cFixedSize, cFixedSize, Width - cFixedSize, Height - cFixedSize);
  Canvas.Ellipse(cQuaterSize, cQuaterSize, Width - cQuaterSize, Height - cQuaterSize);
  Canvas.Ellipse(cHalfSize, cHalfSize, Width - cHalfSize, Height - cHalfSize);
}
{
  Canvas.Ellipse(
    MulDiv(cFixedSize, Screen.PixelsPerInch, DPIValue),
    MulDiv(cFixedSize, Screen.PixelsPerInch, DPIValue),
    MulDiv(Width - cFixedSize, Screen.PixelsPerInch, DPIValue),
    MulDiv(Height - cFixedSize, Screen.PixelsPerInch, DPIValue));
  Canvas.Ellipse(
    MulDiv(cQuaterSize, Screen.PixelsPerInch, DPIValue),
    MulDiv(cQuaterSize, Screen.PixelsPerInch, DPIValue),
    MulDiv(Width - cQuaterSize, Screen.PixelsPerInch, DPIValue),
    MulDiv(Height - cQuaterSize, Screen.PixelsPerInch, DPIValue));
  Canvas.Ellipse(
    MulDiv(cHalfSize, Screen.PixelsPerInch, DPIValue),
    MulDiv(cHalfSize, Screen.PixelsPerInch, DPIValue),
    MulDiv(Width - cHalfSize, Screen.PixelsPerInch, DPIValue),
    MulDiv(Height - cHalfSize, Screen.PixelsPerInch, DPIValue));
}
  if not fDragging then
  begin
    Canvas.Pen.Color := clBlack;
{
    // Draw vertical line
    Canvas.MoveTo(MulDiv(cHalfSize, Screen.PixelsPerInch, DPIValue), 0);
    Canvas.LineTo(MulDiv(cHalfSize, Screen.PixelsPerInch, DPIValue), MulDiv(Height, Screen.PixelsPerInch, DPIValue));
    // Draw Horizontal line
    Canvas.MoveTo(0, MulDiv(cHalfSize, Screen.PixelsPerInch, DPIValue));
    Canvas.LineTo(MulDiv(Width, Screen.PixelsPerInch, DPIValue), MulDiv(cHalfSize, Screen.PixelsPerInch, DPIValue));
}
    // Draw vertical line
    Canvas.MoveTo(Width div 2, 0);
    Canvas.LineTo(Width div 2, Height);
    // Draw Horizontal line
    Canvas.MoveTo(0, Height div 2);
    Canvas.LineTo(Width, Height div 2);

  end;
end;

end.
