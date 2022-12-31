unit AboutSftpUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, SFTPFrameUnit;

type
  TAboutSftpForm = class(TForm)
    SFTPAboutFrame: TSFTPFrame;
    procedure SetSFTPFrameKeyPath(Path: String);
  private
    { Private declarations }
  public
    class function Execute(): TModalResult;
    { Public declarations }
  end;

var
  AboutSftpForm: TAboutSftpForm;

implementation

var
  lclKeyDir: String;

{$R *.dfm}

class function TAboutSftpForm.Execute: TModalResult;
begin
  with TAboutSftpForm.Create(nil) do
  begin
    try
      SFTPAboutFrame.SetKeyDir(lclKeyDir);
      SFTPAboutFrame.SetScFileStorageFPath(lclKeyDir);
      Result := ShowModal;
    finally
      Release;
    end;
  end;
end;

procedure TAboutSftpForm.SetSFTPFrameKeyPath(Path: String);
begin
  lclKeyDir := Path;
end;

end.
