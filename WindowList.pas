//   Window List Component 1.5 by Jerry Ryle
//
//   Aaugh! I accidentally uploaded the wrong source
//   which had a nasty bug in the refresh procedure!
//   Thanks to Serge, who found my mistake and suggested
//   a few other improvements!
//
//   This component will enumerate windows and return
//   information about them in the Windows property.
//   The component currently returns a handle, caption text,
//   associated ProcessID, visibility, and dimensions.
//   For documentation, please read the accompanying
//   WindowList.txt
//
//   This component is completely free of course. If you find
//   it useful, and are compelled to send me cash, beer, or
//   dead things in envelopes, please feel free to do so.
//
//   email me if you make it better:  gryle@calpoly.edu

unit WindowList;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, PsAPI;

type

  TWindowObject = record
    WinHandle  : HWnd;    // Window Handle
    WinCaption : string;  // Window Caption Text (If any)
    ProcessID  : Integer; // Process the window belongs to
    IsVisible  : Boolean; // Is the window visible?
    IsEnabled  : Boolean; // Is the window enabled for mouse/keyboard input?
    IsIconic   : Boolean; // Is the window minimized?
    WindowRect : TRect;   // Window Dimensions
    WinClass   : string;
    ExePath    : string;
    ExeDesc    : string;

    // Add more properties here if you like,
    // then fill them in at the WindowCallback
    // function.
  end;
  PTWindowObject = ^TWindowObject;

  TWindowList = class(TComponent)
  private
    WindowLst: TList;
    FCount: integer;
  protected
    function GetAWindow(Index: integer) : TWindowObject;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure Refresh;
    property Windows[index: integer]: TWindowObject read GetAWindow;
    property Count: integer read FCount;
  published
    // Published declarations
  end;

procedure Register;

implementation

uses
  WLHelper;

// Note that this function is not a member of WindowList.
// Therefore, the list to be filled needs to be passed
// as a pointer. Note that this is passed as a VAR. if you
// don't do this, bad things happen in memory.

Function WindowCallback(WHandle: HWnd; var Parm: Pointer): boolean; stdcall;
// This function is called once for each window
const
  MAX_TEXT = 255;
var
  MyString: PChar;
  MyInt: integer;
  MyWindowPtr: ^TWindowObject;
  strClass: array [0 .. MAX_TEXT] of char;
  tmpEXEVersionData: TEXEVersionData;
  tmpProcID: cardinal;
begin
  New(MyWindowPtr);

  // Window Handle (Passed by the enumeration)
  MyWindowPtr.WinHandle := WHandle;

  // Window text
  MyString := Allocmem(255);
  GetWindowText(WHandle,MyString, 255);
  MyWindowPtr.WinCaption := string(MyString);
  FreeMem(MyString, 255);

  // Process ID
  MyInt := 0;
  MyWindowPtr.ProcessID := GetWindowThreadProcessId(WHandle, @MyInt);
  GetWindowThreadProcessId(WHandle, @tmpProcID);
  MyWindowPtr.ProcessID := tmpProcID;

  // Visiblity
  MyWindowPtr.IsVisible := IsWindowVisible(WHandle);

  // Enabled
  MyWindowPtr.IsEnabled := IsWindowEnabled(WHandle);

  // Iconic
  MyWindowPtr.IsIconic := IsIconic(WHandle);

  // Window Dimensions
  MyWindowPtr.WindowRect := Rect(0,0,0,0);
  GetWindowRect(WHandle,MyWindowPtr.WindowRect);

  // Window Class
  GetClassName(WHandle, strClass, MAX_TEXT);
  MyWindowPtr.WinClass := strClass;

  try
    MyWindowPtr.ExePath := GetPathFromPID(tmpProcID);
  except
    MyWindowPtr.ExePath := 'Path<???>';
  end;

  if MyWindowPtr.ExePath = 'Path<???>' then
  begin
    MyWindowPtr.ExeDesc := 'FileDesc<???>';
  end
  else
  begin
    tmpEXEVersionData := GetEXEVersionData(MyWindowPtr.ExePath);
    MyWindowPtr.ExeDesc := tmpEXEVersionData.FileDescription;
  end;

  // Add the structure to the list. Do not dereference Parm...
  // once again, bad things happen.
  TList(Parm).Add(MyWindowPtr);
  Result := true; // Everything's okay. Continue to enumerate windows
end;

constructor TWindowList.Create(AOwner: TComponent);
begin
  inherited;
  WindowLst := TList.Create;
  if not (csDesigning in ComponentState) then
    begin
      EnumWindows(@WindowCallback, longint(@WindowLst));
      FCount := WindowLst.Count;
    end
  else
    FCount := 0;
end;

destructor TWindowList.Destroy;
var
  i: integer;
begin
  if WindowLst.Count > 0 then
    begin
      for i := 0 to (WindowLst.Count - 1) do
        Dispose(PTWindowObject(WindowLst[i]));
    end;
  WindowLst.Free;
  inherited;
end;

procedure TWindowList.Refresh;
begin
  WindowLst.Clear; {Clear the list!}
  EnumWindows(@WindowCallback, longint(@WindowLst));
  FCount := WindowLst.Count;
end;

function TWindowList.GetAWindow(Index : Integer) : TWindowObject;
begin
  Result := PTWindowObject(WindowLst[Index])^;
end;

procedure Register;
begin
  RegisterComponents('System', [TWindowList]);
end;

end.