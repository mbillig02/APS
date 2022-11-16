unit RunAsFrameUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.CheckLst;

type
  TRunAsFrame = class(TFrame)
    RunAsCheckListBox: TCheckListBox;
    RunAsListBox: TListBox;
    procedure RunAsCheckListBoxClickCheck(Sender: TObject);
  private
    function GetRunAsSetting(LnkPath: String): Boolean;
    procedure SetRunAsSetting(LnkPath: String; RunAsAdmin: Boolean);
    { Private declarations }
  public
    procedure CheckExist;
    procedure LoadRunAsInfo(IniFileName: String);
    { Public declarations }
  end;

var
  ShowMissingLinks: Boolean = False;

implementation

uses
  IniFiles, JclSysInfo, StrUtils, ActiveX, ComObj, ShlObj, JclSecurity, System.IOUtils, System.Types;

{$R *.dfm}

function TRunAsFrame.GetRunAsSetting(LnkPath: String): Boolean;
var
  MyObject: IUnknown;
  MySLink: IShellLink;
  MyPFile: IPersistFile;
  sldl: IShellLinkDataList;
  Flags: Cardinal;
begin
  Result := False;
  MyObject := CreateComObject(CLSID_ShellLink);
  MySLink := MyObject as IShellLink;
  MyPFile := MyObject as IPersistFile;
  if Succeeded(MyPFile.Load(PChar(WideString(LnkPath)), STGM_READ)) then
  begin
    sldl := MySLink as IShellLinkDataList;
    sldl.GetFlags(Flags);
    Result := (Flags and SLDF_RUNAS_USER) = SLDF_RUNAS_USER;
  end;
end;

procedure TRunAsFrame.SetRunAsSetting(LnkPath: String; RunAsAdmin: Boolean);
var
  MyObject: IUnknown;
  MySLink: IShellLink;
  MyPFile: IPersistFile;
  sldl: IShellLinkDataList;
  Flags, NewFlags: Cardinal;
begin
  MyObject := CreateComObject(CLSID_ShellLink);
  MySLink := MyObject as IShellLink;
  MyPFile := MyObject as IPersistFile;
  if Succeeded(MyPFile.Load(PChar(WideString(LnkPath)), STGM_READ)) then
  begin
    sldl := MySLink as IShellLinkDataList;
    sldl.GetFlags(Flags);
    if RunAsAdmin then
    begin
      NewFlags := Flags or SLDF_RUNAS_USER;
    end
    else
    begin
      NewFlags := Flags xor SLDF_RUNAS_USER;
    end;
    sldl.SetFlags(NewFlags);

    MyPFile.Save(PWChar(WideString(LnkPath)), False);
    SHChangeNotify(SHCNE_UPDATEITEM, SHCNF_PATH, PWideChar(LnkPath), nil);
  end;
end;

procedure TRunAsFrame.CheckExist;
var
  i: Integer;
begin
  RunAsCheckListBox.Enabled := True;
  if RunAsCheckListBox.Count = RunAsListBox.Count then
  begin
    for i := RunAsCheckListBox.Count - 1 downto 0  do
    begin
      RunAsCheckListBox.ItemEnabled[i] := FileExists(RunAsListBox.Items[i]);
      if FileExists(RunAsListBox.Items[i]) then
      begin
        RunAsCheckListBox.Checked[i] := GetRunAsSetting(RunAsListBox.Items[i]);
      end
      else
      begin
        if not ShowMissingLinks then
        begin
          RunAsCheckListBox.ItemIndex := i;
          RunAsCheckListBox.DeleteSelected;
          RunAsListBox.ItemIndex := i;
          RunAsListBox.DeleteSelected;
        end;
      end;
    end;
  end;
//  RunAsCheckListBox.SetFocus; // set focus in parent when parent has focus
  RunAsCheckListBox.Enabled := IsAdministrator;
end;

procedure TRunAsFrame.LoadRunAsInfo(IniFileName: String);
var
  RegIniFile: TIniFile;
  Sections, Section: TStringList;
  i, j: Integer;
  ValueStr, BinsDirStr, LnkStr: String;
  Files: TStringDynArray;
begin
  RunAsCheckListBox.Enabled := True;
  RunAsCheckListBox.Clear;
  RunAsListBox.Clear;
  RegIniFile := TIniFile.Create(IniFileName);
  try
    Sections := TStringList.Create;
    Section := TStringList.Create;
    RegIniFile.ReadSections(Sections);
    for i := 0 to Sections.Count - 1 do
    begin
      RegIniFile.ReadSection(Sections[i], Section);
      for j := 0 to Section.Count - 1 do
      begin
        RunAsCheckListBox.Items.Append(Sections[i] + ':' + Section[j]);
        ValueStr := RegIniFile.ReadString(Sections[i], Section[j], '');
        case IndexStr(Section[j], ['PublicDesktop', 'PublicStartMenu', 'UserDesktop', 'UserTaskbar', 'UserTaskbarBins']) of
          2: RunAsListBox.Items.Append(GetDesktopDirectoryFolder + ValueStr);
          3: begin
               if Sections[i] = 'CONEMU' then
               begin
                 if FileExists(GetAppdataFolder + ExtractFilePath(ValueStr) + 'CONEMU.lnk') then
                 begin
                   RunAsListBox.Items.Append(GetAppdataFolder + ExtractFilePath(ValueStr) + 'CONEMU.lnk');
                 end
                 else
                 begin
                   RunAsListBox.Items.Append(GetAppdataFolder + ExtractFilePath(ValueStr) + 'Console Emulator (x86).lnk');
                 end;
               end
               else
               begin
                 RunAsListBox.Items.Append(GetAppdataFolder + ValueStr);
               end;
             end;
          4: begin
               BinsDirStr := ExtractFilePath(ValueStr);
               LnkStr := ExtractFileName(ValueStr); // Home: Console Emulator (x86).lnk  |  Work: CONEMU.lnk
               if DirectoryExists(GetAppdataFolder + BinsDirStr) then
               begin
                 if Sections[i] = 'CONEMU' then
                 begin
                   Files := TDirectory.GetFiles(GetAppdataFolder + BinsDirStr, 'CONEMU.lnk', TSearchOption.soAllDirectories);
                   if Length(Files) = 0 then
                   begin
                     Files := TDirectory.GetFiles(GetAppdataFolder + BinsDirStr, 'Console Emulator (x86).lnk', TSearchOption.soAllDirectories);
                   end;
                 end
                 else
                 begin
                   Files := TDirectory.GetFiles(GetAppdataFolder + BinsDirStr, LnkStr, TSearchOption.soAllDirectories);
                 end;
                 if Length(Files) > 0 then
                 begin
                   RunAsListBox.Items.Append(Files[0]);
                 end
                 else
                 begin
                   RunAsListBox.Items.Append(GetAppdataFolder + '\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\DummyFile.lnk');
                 end;
               end
               else
               begin
                 RunAsListBox.Items.Append(GetAppdataFolder + '\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\DummyFile.lnk');
               end;
             end;
        else  
          RunAsListBox.Items.Append(ValueStr);
        end;
      end;
    end;
    Section.Free;
    Sections.Free;
  finally
    RegIniFile.Free;
  end;
end;

procedure TRunAsFrame.RunAsCheckListBoxClickCheck(Sender: TObject);
var
  i: Integer;
begin
  i := RunAsCheckListBox.ItemIndex;
  SetRunAsSetting(RunAsListBox.Items[i], RunAsCheckListBox.Checked[i]);
end;

end.
