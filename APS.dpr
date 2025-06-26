program APS;

{$I jcl.inc}

uses
  JclAppInst,
  JclSysInfo,
  JclFileUtils,
  SysUtils,
  Forms,
  MFUnit in 'MFUnit.pas' {APSMainForm},
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
  GSFrameUnit in 'GSFrameUnit.pas' {GetSetFrame: TFrame},
  RunAsFrameUnit in 'RunAsFrameUnit.pas' {RunAsFrame: TFrame},
  FileViewForm in 'FileViewForm.pas' {fmFileView},
  NewNameForm in 'NewNameForm.pas' {fmNewName},
  IMUnit in 'IMUnit.pas' {InfoMemoForm},
  RealtimeFrameUnit in 'RealtimeFrameUnit.pas' {RealtimeFrame: TFrame},
  OIUnit in 'OIUnit.pas' {OIForm},
  WNUnit in 'WNUnit.pas' {WhatsNewForm};

{$R *.res}

begin
  // Send message to ask APS to show itself
  JclAppInstances.SendString('TAPSMainForm', 1, 'RestoreForm', JclAppInstances.AppWnds[0]);
  if FileExists(GetWindowsTempFolder + '\APSRestart.Semaphore') then
  begin
    DeleteFile(GetWindowsTempFolder + '\APSRestart.Semaphore');
  end
  else
  begin
    JclAppInstances.CheckSingleInstance; // Added instance checking
  end;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10');
  Application.CreateForm(TAPSMainForm, APSMainForm);
  Application.CreateForm(TSelectFileDlg, SelectFileDlg);
  Application.CreateForm(TSettingsForm, SettingsForm);
  Application.CreateForm(TfmFileView, fmFileView);
  Application.CreateForm(TfmNewName, fmNewName);
  Application.CreateForm(TInfoMemoForm, InfoMemoForm);
  Application.CreateForm(TOIForm, OIForm);
  Application.CreateForm(TWhatsNewForm, WhatsNewForm);
  Application.Run;
end.
