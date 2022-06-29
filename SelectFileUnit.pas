unit SelectFileUnit;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, SelectFileFrameUnit;

type
  TSelectFileDlg = class(TForm)
    SelectFileFrame: TSelectFileFrame;
    procedure FormCreate(Sender: TObject);
  protected
    FFileName: String;
  private
    procedure SelectFileLoadFile(Sender: TObject; FileName: String);
    { Private declarations }
  public
    { Public declarations }
    property FileName: String Read FFileName;
  end;

var
  SelectFileDlg: TSelectFileDlg;

implementation

{$R *.dfm}

procedure TSelectFileDlg.FormCreate(Sender: TObject);
begin
  SelectFileFrame.OnSelectFile := Self.SelectFileLoadFile;
end;

procedure TSelectFileDlg.SelectFileLoadFile(Sender: TObject; FileName: String);
begin
  FFileName := FileName;
  ModalResult := mrOk;
  CloseModal;
end;

end.
