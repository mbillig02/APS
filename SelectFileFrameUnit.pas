unit SelectFileFrameUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, System.Types;

type
  // https://stackoverflow.com/questions/5786595/delphi-event-handling-how-to-create-own-event
  TOnSelectFile = procedure(Sender: TObject; FileName: String) of object;
  TSelectFileFrame = class(TFrame)
    FileListBox: TListBox;
    FilterEdit: TEdit;
    procedure FrameResize(Sender: TObject);
    procedure FileListBoxClick(Sender: TObject);
    procedure FilterEditChange(Sender: TObject);
    procedure FileListBoxMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    FOnSelectFile: TOnSelectFile;
    FFileListPath: String;
    FFileListMask: String;
    { Private declarations }
  public
    procedure SetFileListPath(FileListPath: String);
    procedure SetFileListMask(FileListMask: String);
    procedure LoadFileList;
    { Public declarations }
  published
    property OnSelectFile: TOnSelectFile read FOnSelectFile write FOnSelectFile;
  end;

implementation

{$R *.dfm}

procedure TSelectFileFrame.SetFileListPath(FileListPath: String);
begin
  FFileListPath := FileListPath;
end;

procedure TSelectFileFrame.SetFileListMask(FileListMask: String);
begin
  FFileListMask := FileListMask;
end;

procedure TSelectFileFrame.FileListBoxClick(Sender: TObject);
begin
//  if Assigned(FOnSelectFile) then FOnSelectFile(Self, FFileListPath + FileListBox.Items[FileListBox.ItemIndex]);
end;

procedure TSelectFileFrame.FileListBoxMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if ssShift in Shift then
  begin
    case Button of
      mbRight:
      begin
        // Shift-Right-Click
      end;
    end;
  end
  else
  begin
    case Button of
      mbLeft:
      begin
        // Left-Click
        if Assigned(FOnSelectFile) then FOnSelectFile(Self, '[L] ' + FFileListPath + FileListBox.Items[FileListBox.ItemIndex]);
      end;
      mbRight:
      begin
        // Right-Click
        FileListBox.ItemIndex := FileListBox.ItemAtPos(Point(X, Y), True);
        if Assigned(FOnSelectFile) then FOnSelectFile(Self, '[E] ' + FFileListPath + FileListBox.Items[FileListBox.ItemIndex]);
      end;
    end;
  end;
end;

procedure TSelectFileFrame.FilterEditChange(Sender: TObject);
var
  SR: TSearchRec;
begin
  FileListBox.Clear;
  if Length(Trim(FilterEdit.Text)) > 0 then
  begin
    if FindFirst(FFileListPath + FFileListMask, faAnyFile, SR) = 0 then
    begin
      repeat
        if Pos(UpperCase(FilterEdit.Text), UpperCase(SR.Name)) > 0 then FileListBox.Items.Append(SR.Name);
      until FindNext(SR) <> 0;
    end;
    FindClose(SR);
    FileListBox.Columns := FileListBox.Items.Count div (FileListBox.Height div FileListBox.ItemHeight) + 1;
  end
  else
  begin
    if FindFirst(FFileListPath + FFileListMask, faAnyFile, SR) = 0 then
    begin
      repeat
        FileListBox.Items.Append(SR.Name);
      until FindNext(SR) <> 0;
    end;
    FindClose(SR);
    FileListBox.Columns := FileListBox.Items.Count div (FileListBox.Height div FileListBox.ItemHeight) + 1;
  end;
end;

procedure TSelectFileFrame.FrameResize(Sender: TObject);
begin
  FileListBox.Columns := FileListBox.Items.Count div (FileListBox.Height div FileListBox.ItemHeight) + 1;
end;

procedure TSelectFileFrame.LoadFileList;
var
  SR: TSearchRec;
begin
  FileListBox.Clear;
  if FindFirst(FFileListPath + FFileListMask, faAnyFile, SR) = 0 then
  begin
    repeat
      FileListBox.Items.Append(SR.Name);
    until FindNext(SR) <> 0;
  end;
  FindClose(SR);
  FileListBox.Columns := FileListBox.Items.Count div (FileListBox.Height div FileListBox.ItemHeight) + 1;
//  FilterEdit.SetFocus;
end;

end.
