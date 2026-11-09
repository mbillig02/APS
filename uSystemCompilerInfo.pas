unit uSystemCompilerInfo;

interface

function GetDelphiCompilerName: string;

implementation

{$I jedi.inc}   // JEDI compiler/version defines

uses
  System.SysUtils;

function GetDelphiCompilerName: string;
begin
  //
  // ───────────────────────────────────────────────────────────────
  //  LAYER 1 — RTLVersion POINT RELEASES (must come first!)
  // ───────────────────────────────────────────────────────────────
  //
  // Delphi 11.x — Alexandria
  {$IF DECLARED(RTLVersion113)} Exit('Delphi 11.3 Alexandria'); {$IFEND}
  {$IF DECLARED(RTLVersion112)} Exit('Delphi 11.2 Alexandria'); {$IFEND}
  {$IF DECLARED(RTLVersion111)} Exit('Delphi 11.1 Alexandria'); {$IFEND}
  // Delphi 12.x — Athens
  {$IF DECLARED(RTLVersion123)} Exit('Delphi 12.3 Athens'); {$IFEND}
  {$IF DECLARED(RTLVersion122)} Exit('Delphi 12.2 Athens'); {$IFEND}
  {$IF DECLARED(RTLVersion121)} Exit('Delphi 12.1 Athens'); {$IFEND}
  // Delphi 13.x — Florence
  {$IF DECLARED(RTLVersion132)} Exit('Delphi 13.2 Florence'); {$IFEND}
  {$IF DECLARED(RTLVersion131)} Exit('Delphi 13.1 Florence'); {$IFEND}
  {$IF DECLARED(RTLVersion130)} Exit('Delphi 13.0 Florence'); {$IFEND}
  //
  // ───────────────────────────────────────────────────────────────
  //  LAYER 2 — JEDI DEFINES (major version fallback)
  // ───────────────────────────────────────────────────────────────
  //
  {$IFDEF DELPHI1}    Exit('Delphi 1'); {$ENDIF}
  {$IFDEF DELPHI2}    Exit('Delphi 2'); {$ENDIF}
  {$IFDEF DELPHI3}    Exit('Delphi 3'); {$ENDIF}
  {$IFDEF DELPHI4}    Exit('Delphi 4'); {$ENDIF}
  {$IFDEF DELPHI5}    Exit('Delphi 5'); {$ENDIF}
  {$IFDEF DELPHI6}    Exit('Delphi 6'); {$ENDIF}
  {$IFDEF DELPHI7}    Exit('Delphi 7'); {$ENDIF}
  {$IFDEF DELPHI8}    Exit('Delphi 8 .NET'); {$ENDIF}
  {$IFDEF DELPHI2005} Exit('Delphi 2005'); {$ENDIF}
  {$IFDEF DELPHI2006} Exit('Delphi 2006'); {$ENDIF}
  {$IFDEF DELPHI2007} Exit('Delphi 2007'); {$ENDIF}
  {$IFDEF DELPHI2009} Exit('Delphi 2009'); {$ENDIF}
  {$IFDEF DELPHI2010} Exit('Delphi 2010'); {$ENDIF}
  {$IFDEF DELPHIXE}   Exit('Delphi XE'); {$ENDIF}
  {$IFDEF DELPHIXE2}  Exit('Delphi XE2'); {$ENDIF}
  {$IFDEF DELPHIXE3}  Exit('Delphi XE3'); {$ENDIF}
  {$IFDEF DELPHIXE4}  Exit('Delphi XE4'); {$ENDIF}
  {$IFDEF DELPHIXE5}  Exit('Delphi XE5'); {$ENDIF}
  {$IFDEF DELPHIXE6}  Exit('Delphi XE6'); {$ENDIF}
  {$IFDEF DELPHIXE7}  Exit('Delphi XE7'); {$ENDIF}
  {$IFDEF DELPHIXE8}  Exit('Delphi XE8'); {$ENDIF}
  {$IFDEF DELPHIX_SEATTLE}   Exit('Delphi 10 Seattle'); {$ENDIF}
  {$IFDEF DELPHIX_BERLIN}    Exit('Delphi 10.1 Berlin'); {$ENDIF}
  {$IFDEF DELPHIX_TOKYO}     Exit('Delphi 10.2 Tokyo'); {$ENDIF}
  {$IFDEF DELPHIX_RIO}       Exit('Delphi 10.3 Rio'); {$ENDIF}
  {$IFDEF DELPHIX_SYDNEY}    Exit('Delphi 10.4 Sydney'); {$ENDIF}
  // Delphi 11 major fallback (point releases already handled above)
  {$IFDEF DELPHIX_ALEXANDRIA}
    Exit('Delphi 11.0 Alexandria');
  {$ENDIF}
  // Delphi 12 major fallback
  {$IFDEF DELPHI_ATHENS}
    Exit('Delphi 12.0 Athens');
  {$ENDIF}
  // Delphi 13 major fallback
  {$IFDEF DELPHI_FLORENCE}
    Exit('Delphi 13.x Florence');
  {$ENDIF}
  //
  // ───────────────────────────────────────────────────────────────
  //  LAYER 3 — SAFE FALLBACK USING declared(GetCompilerVersion)
  // ───────────────────────────────────────────────────────────────
  //
  {$IF declared(GetCompilerVersion)}
    case Trunc(GetCompilerVersion) of
      35: Exit('Delphi 11 Alexandria');
      36: Exit('Delphi 12 Athens');
      37: Exit('Delphi 13 Florence');
    end;
  {$IFEND}
  Result := 'Unknown Delphi Version';
end;

end.
