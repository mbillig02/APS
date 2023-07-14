unit AboutFtpUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FTPFrameUnit;

type
  TAboutFtpForm = class(TForm)
    FTPAboutFrame: TFTPFrame;
  private
    { Private declarations }
  public
    class function Execute(): TModalResult;
    { Public declarations }
  end;

var
  AboutFtpForm: TAboutFtpForm;

implementation

var
  lclKeyDir: String;

{$R *.dfm}

class function TAboutFtpForm.Execute: TModalResult;
begin
  with TAboutFtpForm.Create(nil) do
  begin
    try
      Result := ShowModal;
    finally
      Release;
    end;
  end;
end;

end.
