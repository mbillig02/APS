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

  function GetPathFromPID( const PID: cardinal ): string;
  function GetEXEVersionData(const FileName: string): TEXEVersionData;

implementation

function GetPathFromPID( const PID: cardinal ): string;
const
  PROCESS_QUERY_LIMITED_INFORMATION = $00001000;
var
  hProcess: THandle;
  Path: array [0 .. MAX_PATH - 1] of char;
begin
  hProcess := OpenProcess(PROCESS_QUERY_LIMITED_INFORMATION, False, PID);
  if hProcess <> 0
  then
    try
      if GetModuleFileNameEx(hProcess, 0, Path, MAX_PATH) = 0 then RaiseLastOSError;
      Result := Path;
    finally
      CloseHandle(hProcess)
    end
  else
    RaiseLastOSError;
end;

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
  len := GetFileVersionInfoSize(PChar(FileName), dummy);
  if len > 0 then
  begin
    GetMem(buf, len);
    try
      if not GetFileVersionInfo(PChar(FileName), 0, len, buf) then RaiseLastOSError;
      if not VerQueryValue(buf, '\VarFileInfo\Translation\', pntr, len) then RaiseLastOSError;
      lang := Format('%.4x%.4x', [PLandCodepage(pntr)^.wLanguage, PLandCodepage(pntr)^.wCodePage]);

      if VerQueryValue(buf, PChar('\StringFileInfo\' + lang + '\CompanyName'), pntr, len){ and (@len <> nil)} then
        result.CompanyName := PChar(pntr);
      if VerQueryValue(buf, PChar('\StringFileInfo\' + lang + '\FileDescription'), pntr, len){ and (@len <> nil)} then
        result.FileDescription := PChar(pntr);
      if VerQueryValue(buf, PChar('\StringFileInfo\' + lang + '\FileVersion'), pntr, len){ and (@len <> nil)} then
        result.FileVersion := PChar(pntr);
      if VerQueryValue(buf, PChar('\StringFileInfo\' + lang + '\InternalName'), pntr, len){ and (@len <> nil)} then
        result.InternalName := PChar(pntr);
      if VerQueryValue(buf, PChar('\StringFileInfo\' + lang + '\LegalCopyright'), pntr, len){ and (@len <> nil)} then
        result.LegalCopyright := PChar(pntr);
      if VerQueryValue(buf, PChar('\StringFileInfo\' + lang + '\LegalTrademarks'), pntr, len){ and (@len <> nil)} then
        result.LegalTrademarks := PChar(pntr);
      if VerQueryValue(buf, PChar('\StringFileInfo\' + lang + '\OriginalFileName'), pntr, len){ and (@len <> nil)} then
        result.OriginalFileName := PChar(pntr);
      if VerQueryValue(buf, PChar('\StringFileInfo\' + lang + '\ProductName'), pntr, len){ and (@len <> nil)} then
        result.ProductName := PChar(pntr);
      if VerQueryValue(buf, PChar('\StringFileInfo\' + lang + '\ProductVersion'), pntr, len){ and (@len <> nil)} then
        result.ProductVersion := PChar(pntr);
      if VerQueryValue(buf, PChar('\StringFileInfo\' + lang + '\Comments'), pntr, len){ and (@len <> nil)} then
        result.Comments := PChar(pntr);
      if VerQueryValue(buf, PChar('\StringFileInfo\' + lang + '\PrivateBuild'), pntr, len){ and (@len <> nil)} then
        result.PrivateBuild := PChar(pntr);
      if VerQueryValue(buf, PChar('\StringFileInfo\' + lang + '\SpecialBuild'), pntr, len){ and (@len <> nil)} then
        result.SpecialBuild := PChar(pntr);

    finally
      FreeMem(buf);
    end;
  end
  else
  begin
    result.FileDescription := 'bad';
  end;
end;

end.
