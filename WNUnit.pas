unit WNUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  JvExStdCtrls, JvRichEdit;

type
  TWhatsNewForm = class(TForm)
    RichEdit: TRichEdit;
    BottomPanel: TPanel;
    CloseBtn: TButton;
    procedure FormActivate(Sender: TObject);
    procedure CloseBtnClick(Sender: TObject);
  private
    procedure LoadRichText;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WhatsNewForm: TWhatsNewForm;

implementation

{$R *.dfm}
{$R WhatsNew.res}

procedure TWhatsNewForm.CloseBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TWhatsNewForm.FormActivate(Sender: TObject);
begin
  LoadRichText;
end;

procedure TWhatsNewForm.LoadRichText;
var
  LRes: TResourceStream;
begin
  LRes := TResourceStream.Create(HInstance, 'WhatsNew', RT_RCDATA);
  try
    RichEdit.PlainText := False;
    // Ensure RTF parsing
    RichEdit.Lines.LoadFromStream(LRes);
  finally
    LRes.Free;
  end;
end;

end.
