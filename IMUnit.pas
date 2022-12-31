unit IMUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, MFUnit;

type
  TInfoMemoForm = class(TForm)
    InfoMemo: TMemo;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  InfoMemoForm: TInfoMemoForm;

implementation

{$R *.dfm}

procedure TInfoMemoForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
//  CanClose := not Assigned(MainForm.PageControl);
//  ManualDock(MainForm.PageControl);
end;

end.
