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
    procedure fadeTimerTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private

    fFadeType: TFadeType;
    property FadeType: TFadeType read fFadeType write fFadeType;
  public
    class function Execute(): TModalResult;
  end;

implementation

{$R *.dfm}

uses UtlUnit;

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

