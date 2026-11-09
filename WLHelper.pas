unit WLHelper;

interface

uses
  Windows, PsAPI, SysUtils;

type
  TEXEVersionData = record
    CompanyName,
    FileDescription,
    FileVersion,
    InternalName,
    LegalCopyright,
    LegalTrademarks,
    OriginalFileName,
    ProductName,
    ProductVersion,
    Comments,
    PrivateBuild,
    SpecialBuild: string;
  end;

  function GetPathFromPID(const PID: Cardinal): string;
  function GetEXEVersionData(const FileName: string): TEXEVersionData;
  function GetProcessFileDescription(PID: Cardinal): string;

implementation

// -----------------------------------------------------------------------------
// Delphi 10.3 does NOT have StartsText, so we define it.
// -----------------------------------------------------------------------------
function StartsText(const SubStr, S: string): Boolean;
begin
  Result := SameText(Copy(S, 1, Length(SubStr)), SubStr);
end;

// -----------------------------------------------------------------------------
// Convert \Device\HarddiskVolumeX\Windows\... to C:\Windows\...
// -----------------------------------------------------------------------------
function DevicePathToDosPath(const DevicePath: string): string;
var
  drives: array[0..1023] of Char;
  i: Integer;
  drive: string;
  target: array[0..MAX_PATH] of Char;
begin
  Result := DevicePath;

  if QueryDosDevice(nil, drives, SizeOf(drives)) = 0 then
    Exit;

  i := 0;
  while drives[i] <> #0 do
  begin
    drive := drives[i] + drives[i+1] + drives[i+2]; // "C:\"
    if QueryDosDevice(PChar(drive[1]), target, MAX_PATH) <> 0 then
    begin
      if StartsText(target, DevicePath) then
      begin
        Result := drive + Copy(DevicePath, Length(target)+1, MaxInt);
        Exit;
      end;
    end;
    Inc(i, 4);
  end;
end;

// -----------------------------------------------------------------------------
// Windows 7 → Windows 11 safe process path resolver
// -----------------------------------------------------------------------------
function GetPathFromPID(const PID: Cardinal): string;
const
  PROCESS_QUERY_LIMITED_INFORMATION = $00001000;
var
  hProcess: THandle;
  Path: array[0..MAX_PATH - 1] of Char;
begin
  Result := '';

  // Limited-information access works on Win7+ for many processes
  hProcess := OpenProcess(PROCESS_QUERY_LIMITED_INFORMATION, False, PID);
  if hProcess = 0 then
    Exit; // cannot open at all (privileged process)

  try
    if GetModuleFileNameEx(hProcess, 0, Path, MAX_PATH) > 0 then
      Result := Path;
  finally
    CloseHandle(hProcess);
  end;

  // Convert device paths if needed
  if (Result <> '') and StartsText('\Device\', Result) then
    Result := DevicePathToDosPath(Result);
end;

// -----------------------------------------------------------------------------
// Version info reader (works only when EXE file is readable)
// -----------------------------------------------------------------------------
function GetEXEVersionData(const FileName: string): TEXEVersionData;
type
  PLandCodepage = ^TLandCodepage;
  TLandCodepage = record
    wLanguage,
    wCodePage: word;
  end;
var
  dummy, len: cardinal;
  buf, pntr: Pointer;
  lang: string;
begin
  FillChar(Result, SizeOf(Result), 0);

  len := GetFileVersionInfoSize(PChar(FileName), dummy);
  if len = 0 then
    Exit;

  GetMem(buf, len);
  try
    if not GetFileVersionInfo(PChar(FileName), 0, len, buf) then
      Exit;

    if not VerQueryValue(buf, '\VarFileInfo\Translation\', pntr, len) then
      Exit;

    lang := Format('%.4x%.4x',
      [PLandCodepage(pntr)^.wLanguage, PLandCodepage(pntr)^.wCodePage]);

    if VerQueryValue(buf, PChar('\StringFileInfo\' + lang + '\CompanyName'), pntr, len) then
      Result.CompanyName := PChar(pntr);

    if VerQueryValue(buf, PChar('\StringFileInfo\' + lang + '\FileDescription'), pntr, len) then
      Result.FileDescription := PChar(pntr);

    if VerQueryValue(buf, PChar('\StringFileInfo\' + lang + '\FileVersion'), pntr, len) then
      Result.FileVersion := PChar(pntr);

    if VerQueryValue(buf, PChar('\StringFileInfo\' + lang + '\InternalName'), pntr, len) then
      Result.InternalName := PChar(pntr);

    if VerQueryValue(buf, PChar('\StringFileInfo\' + lang + '\LegalCopyright'), pntr, len) then
      Result.LegalCopyright := PChar(pntr);

    if VerQueryValue(buf, PChar('\StringFileInfo\' + lang + '\LegalTrademarks'), pntr, len) then
      Result.LegalTrademarks := PChar(pntr);

    if VerQueryValue(buf, PChar('\StringFileInfo\' + lang + '\OriginalFileName'), pntr, len) then
      Result.OriginalFileName := PChar(pntr);

    if VerQueryValue(buf, PChar('\StringFileInfo\' + lang + '\ProductName'), pntr, len) then
      Result.ProductName := PChar(pntr);

    if VerQueryValue(buf, PChar('\StringFileInfo\' + lang + '\ProductVersion'), pntr, len) then
      Result.ProductVersion := PChar(pntr);

    if VerQueryValue(buf, PChar('\StringFileInfo\' + lang + '\Comments'), pntr, len) then
      Result.Comments := PChar(pntr);

    if VerQueryValue(buf, PChar('\StringFileInfo\' + lang + '\PrivateBuild'), pntr, len) then
      Result.PrivateBuild := PChar(pntr);

    if VerQueryValue(buf, PChar('\StringFileInfo\' + lang + '\SpecialBuild'), pntr, len) then
      Result.SpecialBuild := PChar(pntr);

  finally
    FreeMem(buf);
  end;
end;

function GetProcessFileDescription(PID: Cardinal): string;
var
  hProc: THandle;
  hMods: array[0..0] of HMODULE;
  needed: DWORD;
  buf: array[0..MAX_PATH] of Char;
  size: DWORD;
  ver: TEXEVersionData;
begin
  Result := '';

  // Try to open the process with enough rights to read its modules
  hProc := OpenProcess(PROCESS_QUERY_INFORMATION or PROCESS_VM_READ, False, PID);
  if hProc = 0 then
    Exit;

  try
    // Get the first module (the main EXE)
    if EnumProcessModules(hProc, @hMods[0], SizeOf(hMods), needed) then
    begin
      size := GetModuleFileNameEx(hProc, hMods[0], buf, MAX_PATH);
      if size > 0 then
      begin
        ver := GetEXEVersionData(buf);
        Result := ver.FileDescription;
      end;
    end;
  finally
    CloseHandle(hProc);
  end;
end;

end.

