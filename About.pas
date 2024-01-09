unit About;

interface

{
Fade In / Out an About Box or any Modal Delphi Form
http://delphi.about.com/od/formsdialogs/a/fadeinmodalform.htm
~Zarko Gajic
}

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, pngimage, OverbyteIcsWndControl, OverbyteIcsFtpCli,
  JvExStdCtrls, JvButton, JvCtrls, ImgList, JvComponentBase, JvBalloonHint,
  System.ImageList, System.UITypes;

type
  TFadeType = (ftIn, ftOut);
  TAboutBox = class(TForm)
    Panel: TPanel;
    ProgramIcon: TImage;
    Version: TLabel;
    fadeTimer: TTimer;
    ProgramLabel: TLabel;
    VersionLbl: TLabel;
    ProgrammerLbl: TLabel;
    EmailLbl: TLabel;
    CompilerLbl: TLabel;
    OKBtn: TButton;
    ImageList: TImageList;
    JvBalloonHint: TJvBalloonHint;
    MajorGeeksLbl: TLabel;
    SourceForgeLbl: TLabel;
    procedure fadeTimerTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure MajorGeeksLblMouseEnter(Sender: TObject);
    procedure MajorGeeksLblMouseLeave(Sender: TObject);
    procedure SourceForgeLblMouseEnter(Sender: TObject);
    procedure SourceForgeLblMouseLeave(Sender: TObject);
    procedure MajorGeeksLblDblClick(Sender: TObject);
    procedure SourceForgeLblDblClick(Sender: TObject);
  private

    fFadeType: TFadeType;
    property FadeType: TFadeType read fFadeType write fFadeType;
  public
    class function Execute(): TModalResult;
  end;

implementation

{$R *.dfm}

uses ShellAPI, UtlUnit;

class function TAboutBox.Execute: TModalResult;
begin
  with TAboutBox.Create(nil) do
  begin
    try
      Result := ShowModal;
    finally
      Release;
    end;
  end;
end;

procedure TAboutBox.fadeTimerTimer(Sender: TObject);
const
  FADE_IN_SPEED = 5;
  FADE_OUT_SPEED = 20;
var
  newBlendValue: Integer;
begin
  case FadeType of
    ftIn:
      begin
        if AlphaBlendValue < 255 then
          AlphaBlendValue := FADE_IN_SPEED + AlphaBlendValue
        else
          fadeTimer.Enabled := False;
      end;
    ftOut:
      begin
        if AlphaBlendValue > 0 then
        begin
          newBlendValue := -1 * FADE_OUT_SPEED + AlphaBlendValue;
          if newBlendValue >  0 then
            AlphaBlendValue := newBlendValue
          else
            AlphaBlendValue := 0;
        end
        else
        begin
          fadeTimer.Enabled := False;
          Close;
        end;
      end;
  end;
end;

procedure TAboutBox.FormCreate(Sender: TObject);
begin
  AlphaBlend := True;
  AlphaBlendValue := 0;
  fFadeType := ftIn;
  fadeTimer.Enabled := True;
  VersionLbl.Caption := GetVersionInfoStr(ParamStr(0));
  CompilerLbl.Caption := 'Application compiled with: ' + GetCompilerName(CompilerVersion);
end;

procedure TAboutBox.MajorGeeksLblDblClick(Sender: TObject);
var
  URL: string;
begin
  URL := 'https://www.majorgeeks.com/files/details/aps.html';
  ShellExecute(0, 'open', PChar(URL), nil, nil, SW_SHOWNORMAL);
end;

procedure TAboutBox.MajorGeeksLblMouseEnter(Sender: TObject);
begin
  MajorGeeksLbl.Font.Style := [fsUnderline];
end;

procedure TAboutBox.MajorGeeksLblMouseLeave(Sender: TObject);
begin
  MajorGeeksLbl.Font.Style := [];
end;

procedure TAboutBox.SourceForgeLblDblClick(Sender: TObject);
var
  URL: string;
begin
  URL := 'https://sourceforge.net/projects/mwb-aps/files/';
  ShellExecute(0, 'open', PChar(URL), nil, nil, SW_SHOWNORMAL);
end;

procedure TAboutBox.SourceForgeLblMouseEnter(Sender: TObject);
begin
  SourceForgeLbl.Font.Style := [fsUnderline];
end;

procedure TAboutBox.SourceForgeLblMouseLeave(Sender: TObject);
begin
  SourceForgeLbl.Font.Style := [];
end;

procedure TAboutBox.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  //cancel hint before closing form
  JvBalloonHint.CancelHint;
  //no close before we fade away
  if FadeType = ftIn then
  begin
    fFadeType := ftOut;
    AlphaBlendValue := 255;
    fadeTimer.Enabled := True;
    CanClose := False;
  end
  else
  begin
    CanClose := True;
  end;
end;

end.

