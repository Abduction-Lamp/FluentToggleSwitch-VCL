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

function TFluentToggleSwitchGuidelines.GetCount: Integer;
begin
  Result := inherited GetCount;
  if TFluentToggleSwitch(Component).ShowText then
    Inc(Result);
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
    Result := GetTextBaseline(TControl(Component), tlCenter)
  else
    Result := inherited GetDesignerGuideOffset(Index);
end;

procedure Register;
begin
  RegisterComponents('Fluent', [TFluentToggleSwitch]);
  RegisterComponentGuidelines(TFluentToggleSwitch, TFluentToggleSwitchGuidelines);
end;

end.
