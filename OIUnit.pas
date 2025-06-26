unit OIUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, zBase, zObjInspector,
  comp.reticle, Vcl.StdCtrls;

type
  TOIForm = class(TForm)
    LeftPanel: TPanel;
    WindowReticle: TWindowReticle;
    zObjectInspector: TzObjectInspector;
    IncludeEventsCheckBox: TCheckBox;
    ListBox1: TListBox;
    ListBox2: TListBox;
    BottomLeftPanel: TPanel;
    Splitter: TSplitter;
    TopLeftPanel: TPanel;
    procedure WindowReticleDropSelect(Sender: TObject);
    function zObjectInspectorBeforeAddItem(Sender: TControl; PItem: PPropItem): Boolean;
    procedure FormActivate(Sender: TObject);
    procedure IncludeEventsCheckBoxClick(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure ListBox2Click(Sender: TObject);
  private
    FIncludeEvent: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OIForm: TOIForm;

implementation

uses MFUnit;

var
  FInitialized: Boolean;

{$R *.dfm}

procedure TOIForm.FormActivate(Sender: TObject);
begin
  if not FInitialized then
  begin
    FInitialized := True;
    zObjectInspector.ReadOnly := False;
    FIncludeEvent := False;
    IncludeEventsCheckBox.Checked := FIncludeEvent;
  end;
end;

procedure TOIForm.IncludeEventsCheckBoxClick(Sender: TObject);
begin
  FIncludeEvent := IncludeEventsCheckBox.Checked;
end;

procedure TOIForm.ListBox1Click(Sender: TObject);
var
  i: Integer;
  TmpObj: TComponent;
begin
  ListBox2.Clear;
  if ListBox1.Count > 0 then
  begin
    TmpObj := TComponent(ListBox1.Items.Objects[ListBox1.ItemIndex]);
    zObjectInspector.Component := TmpObj;
    with TmpObj do
      for i := 0 to ComponentCount - 1 do
        ListBox2.Items.AddObject(Components[i].Name, Components[i]);
  end;
end;

procedure TOIForm.ListBox2Click(Sender: TObject);
var
  TmpObj: TComponent;
begin
  if ListBox2.Count > 0 then
  begin
    TmpObj := TComponent(ListBox2.Items.Objects[ListBox2.ItemIndex]);
    zObjectInspector.Component := TmpObj;
  end;
end;

procedure TOIForm.WindowReticleDropSelect(Sender: TObject);
var
  ComponentName, ParentComponentName: TComponent;
begin
//  zObjectInspector.Component := FindControl(WindowReticle.WindowHandle);
  ListBox1.Clear;
  ComponentName := FindControl(WindowReticle.WindowHandle);
  if ComponentName <> nil then
  begin
    ListBox1.Items.AddObject(ComponentName.Name, ComponentName);
    while ComponentName.HasParent do
    begin
      ParentComponentName := ComponentName.GetParentComponent;
      ListBox1.Items.AddObject(ParentComponentName.Name, ParentComponentName);
      ComponentName := ParentComponentName;
    end;
  end;
end;

function TOIForm.zObjectInspectorBeforeAddItem(Sender: TControl; PItem: PPropItem): Boolean;
begin
  Result := True;
  if not FIncludeEvent then Result := PItem.Prop.PropertyType.TypeKind <> tkMethod;
end;

end.
