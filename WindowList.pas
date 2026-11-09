unit WindowList;

interface

uses
  Windows, Messages, SysUtils, Classes, PsAPI, WLHelper;

type
  TWindowObject = record
    WinHandle  : HWND;
    WinCaption : string;
    ProcessID  : Cardinal;
    IsVisible  : Boolean;
    IsEnabled  : Boolean;
    IsIconic   : Boolean;
    WindowRect : TRect;
    WinClass   : string;
    ExePath    : string;
    ExeDesc    : string;
  end;
  PTWindowObject = ^TWindowObject;

  TWindowList = class(TComponent)
  private
    FList: TList;
    FCount: Integer;
    function GetAWindow(Index: Integer): TWindowObject;
    function IsWindows7: Boolean;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure Refresh;

    property Windows[Index: Integer]: TWindowObject read GetAWindow;
    property Count: Integer read FCount;
  end;

procedure Register;

implementation

// ============================================================================
// OS DETECTION
// ============================================================================
function TWindowList.IsWindows7: Boolean;
var
  vi: TOSVersionInfo;
begin
  ZeroMemory(@vi, SizeOf(vi));
  vi.dwOSVersionInfoSize := SizeOf(vi);
  GetVersionEx(vi);
  Result := (vi.dwMajorVersion = 6) and (vi.dwMinorVersion = 1);
end;

function IsProcessElevated_W7(PID: Cardinal): Boolean;
var
  hProcess: THandle;
begin
  // Windows 7 rule:
  // If PROCESS_QUERY_INFORMATION fails → process is elevated
  hProcess := OpenProcess(PROCESS_QUERY_INFORMATION, False, PID);
  Result := (hProcess = 0);
  if hProcess <> 0 then
    CloseHandle(hProcess);
end;

// ============================================================================
// WINDOWS 7 CALLBACK (exact original)
// ============================================================================
function WindowCallback_W7(WHandle: HWND; lParam: LPARAM): BOOL; stdcall;
const
  MAX_TEXT = 255;
var
  Obj: PTWindowObject;
  tmpPID: Cardinal;
  ClassBuf: array[0..MAX_TEXT] of Char;
  TextBuf: array[0..MAX_TEXT] of Char;
begin
  New(Obj);

  Obj^.WinHandle := WHandle;

  if GetWindowText(WHandle, TextBuf, MAX_TEXT) > 0 then
    Obj^.WinCaption := TextBuf
  else
    Obj^.WinCaption := '';

  GetWindowThreadProcessId(WHandle, @tmpPID);
  Obj^.ProcessID := tmpPID;

  Obj^.IsVisible := IsWindowVisible(WHandle);
  Obj^.IsEnabled := IsWindowEnabled(WHandle);
  Obj^.IsIconic  := IsIconic(WHandle);

  GetWindowRect(WHandle, Obj^.WindowRect);

  if GetClassName(WHandle, ClassBuf, MAX_TEXT) > 0 then
    Obj^.WinClass := ClassBuf
  else
    Obj^.WinClass := '';

  Obj^.ExePath := GetPathFromPID(tmpPID);
  Obj^.ExeDesc := GetProcessFileDescription(tmpPID);

  // If description is blank AND process is elevated → say so
  if (Obj^.ExeDesc = '') and IsProcessElevated_W7(tmpPID) then
    Obj^.ExeDesc := '[Elevated] <restricted>';

  TList(lParam).Add(Obj);
  Result := True;
end;

// ============================================================================
// WINDOWS 11 CALLBACK (exact original)
// ============================================================================
function WindowCallback_W11(WHandle: HWND; lParam: LPARAM): BOOL; stdcall;
const
  MAX_TEXT = 255;
var
  MyString: PChar;
  MyWindowPtr: PTWindowObject;
  strClass: array[0..MAX_TEXT] of Char;
  tmpEXEVersionData: TEXEVersionData;
  tmpProcID: Cardinal;
begin
  New(MyWindowPtr);

  MyString := AllocMem(255);
  GetWindowText(WHandle, MyString, 255);
  MyWindowPtr^.WinCaption := string(MyString);
  FreeMem(MyString, 255);

  GetWindowThreadProcessId(WHandle, @tmpProcID);
  MyWindowPtr^.ProcessID := tmpProcID;

  MyWindowPtr^.WinHandle := WHandle;
  MyWindowPtr^.IsVisible := IsWindowVisible(WHandle);
  MyWindowPtr^.IsEnabled := IsWindowEnabled(WHandle);
  MyWindowPtr^.IsIconic  := IsIconic(WHandle);

  GetWindowRect(WHandle, MyWindowPtr^.WindowRect);

  GetClassName(WHandle, strClass, MAX_TEXT);
  MyWindowPtr^.WinClass := strClass;

  try
    MyWindowPtr^.ExePath := GetPathFromPID(tmpProcID);
  except
    MyWindowPtr^.ExePath := 'Path<???>';
  end;

  if MyWindowPtr^.ExePath = 'Path<???>' then
    MyWindowPtr^.ExeDesc := 'FileDesc<???>'
  else
  begin
    tmpEXEVersionData := GetEXEVersionData(MyWindowPtr^.ExePath);
    MyWindowPtr^.ExeDesc := tmpEXEVersionData.FileDescription;
  end;

  TList(lParam).Add(MyWindowPtr);
  Result := True;
end;

// ============================================================================
// COMPONENT IMPLEMENTATION
// ============================================================================
constructor TWindowList.Create(AOwner: TComponent);
begin
  inherited;
  FList := TList.Create;

  if not (csDesigning in ComponentState) then
  begin
    if IsWindows7 then
      EnumWindows(@WindowCallback_W7, LPARAM(FList))
    else
      EnumWindows(@WindowCallback_W11, LPARAM(FList));

    FCount := FList.Count;
  end
  else
    FCount := 0;
end;

destructor TWindowList.Destroy;
var
  i: Integer;
begin
  for i := 0 to FList.Count - 1 do
    Dispose(PTWindowObject(FList[i]));

  FList.Free;
  inherited;
end;

procedure TWindowList.Refresh;
var
  i: Integer;
begin
  for i := 0 to FList.Count - 1 do
    Dispose(PTWindowObject(FList[i]));

  FList.Clear;

  if IsWindows7 then
    EnumWindows(@WindowCallback_W7, LPARAM(FList))
  else
    EnumWindows(@WindowCallback_W11, LPARAM(FList));

  FCount := FList.Count;
end;

function TWindowList.GetAWindow(Index: Integer): TWindowObject;
begin
  Result := PTWindowObject(FList[Index])^;
end;

procedure Register;
begin
  RegisterComponents('System', [TWindowList]);
end;

end.

