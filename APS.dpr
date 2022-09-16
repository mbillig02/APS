program APS;

uses
  Forms,
  MFUnit in 'MFUnit.pas' {MainForm},
  UtlUnit in '..\UTL\UtlUnit.pas',
  About in 'About.pas' {AboutBox},
  SelectFileUnit in 'SelectFileUnit.pas' {SelectFileDlg},
  SelectFileFrameUnit in 'SelectFileFrameUnit.pas' {SelectFileFrame: TFrame},
  ScrPosF in 'ScrPosF.pas' {ScrPosFrame: TFrame},
  SetUnit in 'SetUnit.pas' {SettingsForm},
  Vcl.Themes,
  Vcl.Styles,
  InitAppUnit in 'InitAppUnit.pas' {Form1},
  ABFrameUnit in 'ABFrameUnit.pas' {ApplicationBoundsFrame: TFrame},
  GSFrameUnit in 'GSFrameUnit.pas' {GetSetFrame: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10');
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TSelectFileDlg, SelectFileDlg);
  Application.CreateForm(TSettingsForm, SettingsForm);
  Application.Run;
end.
