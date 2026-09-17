unit Fluent.ToggleSwitch.Design;

interface

uses
  System.Classes,

  Vcl.Controls,
  Vcl.StdCtrls,

  DesignIntf,
  VCLEditors,

  Fluent.ToggleSwitch;

type
  TFluentToggleSwitchGuidelines = class(TWinControlGuidelines)
  protected
    function GetCount: Integer; override;
    function GetDesignerGuideType(Index: Integer): TDesignerGuideType; override;
    function GetDesignerGuideOffset(Index: Integer): Integer; override;
  end;

procedure Register;

implementation

{$R ..\resources\FluentToggleSwitchIcons.dcr}

{ TFluentToggleSwitchGuidelines }

// The baseline is published even with the label hidden, the way a check box publishes
// one without a caption, so a bare switch still lines up with the text beside it
function TFluentToggleSwitchGuidelines.GetCount: Integer;
begin
  Result := inherited GetCount + 1;
end;

function TFluentToggleSwitchGuidelines.GetDesignerGuideType(Index: Integer): TDesignerGuideType;
begin
  if Index >= inherited GetCount then
    Result := gtBaseline
  else
    Result := inherited GetDesignerGuideType(Index);
end;

function TFluentToggleSwitchGuidelines.GetDesignerGuideOffset(Index: Integer): Integer;
begin
  if Index >= inherited GetCount then
    Result := TFluentToggleSwitch(Component).TextTop + GetTextBaseline(TControl(Component), tlTop)
  else
    Result := inherited GetDesignerGuideOffset(Index);
end;

procedure Register;
begin
  RegisterComponents('Fluent', [TFluentToggleSwitch]);
  RegisterComponentGuidelines(TFluentToggleSwitch, TFluentToggleSwitchGuidelines);
end;

end.
