unit Fluent.ToggleSwitch;

interface

uses
  System.Classes,
  System.Math,

  Vcl.ExtCtrls,
  Vcl.Controls,
  Vcl.Graphics,

  Winapi.Windows,
  Winapi.Messages,
  Winapi.GDIPAPI,
  Winapi.GDIPOBJ;

type
  TFluentTextPosition     = (tpLeft, tpRight);
  TFluentHeaderPosition   = (hpTop, hpBottom);
  TFluentInteractionState = (isNormal, isHover, isPressed, isDisabled);

  TFluentVisualState = record
    ThumbW   : Single;
    ThumbH   : Single;
    ThumbOffX: Single;
    ThumbOnX : Single;

    TrackOff : ARGB;
    StrokeOff: ARGB;
    TrackOn  : ARGB;
    ThumbOff : ARGB;
    ThumbOn  : ARGB;
  end;

  TFluentToggleSwitch = class(TCustomControl)
  private
    FChecked: Boolean;

    FAnimated: Boolean;
    FAnimationDuration: Integer;
    FHovered: Boolean;
    FPressed: Boolean;
    FKeyPressed: Boolean;
    FShowFocus: Boolean;
    FTopBand: Integer;
    FUserScale: Single;
    FGone: PBoolean;
    FReportingClick: Boolean;
    FLeftIndent: Integer;
    FFocusVisible: Boolean;
    FKeyboardToggle: Boolean;
    FDragStartX: Integer;
    FDragDelta: Single;
    FDragged: Boolean;
    FAnimTimer: TTimer;
    FAnimProgress: Single;
    FFadeValue: Single;
    FFadeFrom: Single;
    FFadeT: Single;
    FFadeStart: Int64;
    FAnimStartProgress: Single;
    FAnimTarget: Single;
    FAnimStartTime: Int64;
    FAnimFrequency: Int64;
    FSliding: Boolean;
    FState: TFluentInteractionState;
    FStateFrom: TFluentVisualState;
    FStateT: Single;
    FStateStartTime: Int64;
    FStateDuration: Integer;
    FOnChange: TNotifyEvent;
    FTrackFrameColor: TColor;
    FTrackColorOff: TColor;
    FTrackColorOn: TColor;
    FThumbColorOff: TColor;
    FThumbColorOn: TColor;
    FKnownAccent: ARGB;
    FTextOn: string;
    FTextOff: string;
    FShowText: Boolean;
    FTextPosition: TFluentTextPosition;
    FTextSpacing: Integer;
    FTextWidth: Integer;
    FTextHeight: Integer;
    FShowHeader: Boolean;
    FHeaderText: string;
    FHeaderPosition: TFluentHeaderPosition;
    FHeaderAlignment: TAlignment;
    FHeaderSpacing: Integer;
    FHeaderFont: TFont;
    FHeaderFontCustom: Boolean;
    FHeaderWidth: Integer;
    FHeaderHeight: Integer;

    procedure SetChecked(Value: Boolean);
    procedure SetAnimationDuration(Value: Integer);
    procedure StartTimer;
    procedure StartAnimation;
    procedure StartFade;
    procedure SettleThumb;
    procedure HandleAnimTimer(Sender: TObject);
    function DragTravel: Single;
    procedure DragThumb(X: Integer);
    procedure CancelPress;
    function GetInteractionState: TFluentInteractionState;
    function CurrentScale: Single;
    function TextGap: Integer;
    function HeaderGap: Integer;
    function HeaderBand: Integer;
    function StateVisual(S: TFluentInteractionState): TFluentVisualState;
    function CurrentVisual: TFluentVisualState;
    procedure UpdateVisualState;
    procedure Toggle;
    procedure SetTrackFrameColor(Value: TColor);
    procedure SetTrackColorOff(Value: TColor);
    procedure SetTrackColorOn(Value: TColor);
    procedure SetThumbColorOff(Value: TColor);
    procedure SetThumbColorOn(Value: TColor);
    procedure SetTextOn(const Value: string);
    procedure SetTextOff(const Value: string);
    function IsTextOnStored: Boolean;
    function IsTextOffStored: Boolean;
    procedure SetShowText(Value: Boolean);
    procedure SetShowFocus(Value: Boolean);
    procedure UpdateFocusVisibility;
    procedure SetTextPosition(Value: TFluentTextPosition);
    procedure SetTextSpacing(Value: Integer);
    procedure SetShowHeader(Value: Boolean);
    procedure SetHeaderText(const Value: string);
    procedure SetHeaderPosition(Value: TFluentHeaderPosition);
    procedure SetHeaderAlignment(Value: TAlignment);
    procedure SetHeaderSpacing(Value: Integer);
    procedure SetHeaderFont(Value: TFont);
    procedure HeaderFontChanged(Sender: TObject);
    procedure Measure;
    procedure LayoutChanged(MoveWithTheHeader: Boolean = False);
    function TopBand: Integer;
    function BlockWidth: Integer;
    function SwitchIndent: Integer;
    function SwitchArea: TRect;
    procedure RereadAccent;

    procedure CMFontChanged(var Msg: TMessage);    message CM_FONTCHANGED;
    procedure CMMouseEnter(var Msg: TMessage);     message CM_MOUSEENTER;
    procedure CMMouseLeave(var Msg: TMessage);     message CM_MOUSELEAVE;
    procedure CMEnabledChanged(var Msg: TMessage); message CM_ENABLEDCHANGED;
    procedure WMSetFocus(var Msg: TWMSetFocus);    message WM_SETFOCUS;
    procedure WMKillFocus(var Msg: TWMKillFocus);  message WM_KILLFOCUS;
    procedure WMUpdateUIState(var Msg: TMessage);  message WM_UPDATEUISTATE;
    procedure CMSysColorChange(var Msg: TMessage); message CM_SYSCOLORCHANGE;
    procedure CMWinIniChange(var Msg: TMessage);   message CM_WININICHANGE;

  protected
    procedure Paint; override;
    function CanAutoSize(var NewWidth, NewHeight: Integer): Boolean; override;
    procedure AdjustSize; override;
    procedure Loaded; override;
    procedure Change; virtual;
    procedure Click; override;
    procedure SetName(const Value: TComponentName); override;
    procedure CreateWnd; override;
    procedure ChangeScale(M, D: Integer; isDpiChange: Boolean); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyUp(var Key: Word; Shift: TShiftState); override;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

  published
    property Align;
    property AlignWithMargins;
    property Anchors;
    property AutoSize default True;
    property BiDiMode;
    property Constraints;
    property Cursor;
    property DoubleBuffered;
    property Hint;
    property Margins;
    property ParentBiDiMode;
    property ParentDoubleBuffered;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property Visible;
    property Checked: Boolean read FChecked write SetChecked default False;
    property Animated: Boolean read FAnimated write FAnimated default True;
    property AnimationDuration: Integer read FAnimationDuration write SetAnimationDuration default 367;
    property Enabled;
    property TabStop default True;
    property TabOrder;
    property ShowFocus: Boolean read FShowFocus write SetShowFocus default True;
    property KeyboardToggle: Boolean read FKeyboardToggle write FKeyboardToggle default True;
    property Color;
    property ParentColor;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property OnClick;
    property TrackFrameColor: TColor read FTrackFrameColor write SetTrackFrameColor default clDefault;
    property TrackColorOff: TColor read FTrackColorOff write SetTrackColorOff default clDefault;
    property TrackColorOn: TColor read FTrackColorOn write SetTrackColorOn default clDefault;
    property ThumbColorOff: TColor read FThumbColorOff write SetThumbColorOff default clDefault;
    property ThumbColorOn: TColor read FThumbColorOn write SetThumbColorOn default clDefault;
    property Font;
    property ShowText: Boolean read FShowText write SetShowText default False;
    property TextOn: string read FTextOn write SetTextOn stored IsTextOnStored;
    property TextOff: string read FTextOff write SetTextOff stored IsTextOffStored;
    property TextPosition: TFluentTextPosition read FTextPosition write SetTextPosition default tpRight;
    property TextSpacing: Integer read FTextSpacing write SetTextSpacing default 12;
    property ShowHeader: Boolean read FShowHeader write SetShowHeader default False;
    property HeaderText: string read FHeaderText write SetHeaderText;
    property HeaderPosition: TFluentHeaderPosition read FHeaderPosition write SetHeaderPosition default hpTop;
    property HeaderAlignment: TAlignment read FHeaderAlignment write SetHeaderAlignment default taCenter;
    property HeaderSpacing: Integer read FHeaderSpacing write SetHeaderSpacing default 6;
    property HeaderFont: TFont read FHeaderFont write SetHeaderFont stored FHeaderFontCustom;
    property OnContextPopup;
    property OnDblClick;
    property OnEnter;
    property OnExit;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnMouseWheel;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnResize;
  end;

implementation

const
  TrackAreaWidth        = 42;
  TrackAreaHeight       = 22;
  TrackWidth            = 40;
  TrackHeight           = 20;
  DragThreshold         = 4;

  DefaultTextOn         = 'On';
  DefaultTextOff        = 'Off';

  ThumbSlideDelay       = 33;
  StateDuration         = 83;
  DisabledStateDuration = 250;

  ///  Geometry                                 (Normal, Hover, Pressed, Disabled)
  ///
  ThumbWidths    : array[TFluentInteractionState] of Integer = (12, 14, 17,   12);
  ThumbHeights   : array[TFluentInteractionState] of Integer = (12, 14, 14,   12);
  ThumbCenterOffX: array[TFluentInteractionState] of Single  = (10, 10, 11.5, 10);
  ThumbCenterOnX : array[TFluentInteractionState] of Single  = (30, 30, 28.5, 30);

  ///  Colors are ARGB ($AARRGGBB)                         (Normal,    Hover,     Pressed,   Disabled)
  ///
  OffTrackFill  : array[TFluentInteractionState] of ARGB = ($06000000, $0F000000, $18000000, $00000000);
  OffTrackStroke: array[TFluentInteractionState] of ARGB = ($72000000, $72000000, $72000000, $37000000);
  OffThumbFill  : array[TFluentInteractionState] of ARGB = ($9E000000, $9E000000, $9E000000, $5C000000);
  OnThumbFill   : array[TFluentInteractionState] of ARGB = ($FFFFFFFF, $FFFFFFFF, $FFFFFFFF, $FFFFFFFF);

  DefaultAccentDark1 = $FF0067C0; // Windows 11 default accent shade, used when the system palette is unreadable


var
  OnTrackFill   : array[TFluentInteractionState] of ARGB;


// Cubic Bezier from (0,0) to (1,1) with the two control points on one axis
function BezierAxis(T, C1, C2: Single): Single; inline;
var
  U: Single;
begin
  U := 1.0 - T;
  Result := 3.0 * U * U * T * C1 + 3.0 * U * T * T * C2 + T * T * T;
end;

// Value of the curve at time X, the easing XAML expresses as a KeySpline
function BezierEase(X, X1, Y1, X2, Y2: Single): Single;
var
  Lo, Hi, T: Single;
  I: Integer;
begin
  if X <= 0 then
    Exit(0);
  if X >= 1 then
    Exit(1);
  Lo := 0;
  Hi := 1;
  for I := 1 to 12 do
  begin
    T := (Lo + Hi) / 2;
    if BezierAxis(T, X1, X2) < X then
      Lo := T
    else
      Hi := T;
  end;
  Result := BezierAxis((Lo + Hi) / 2, Y1, Y2);
end;

function LerpARGB(A, B: ARGB; T: Single): ARGB;
begin
  Result := MakeColor(
    Round(GetAlpha(A) + (GetAlpha(B) - GetAlpha(A)) * T),
    Round(GetRed(A) + (GetRed(B) - GetRed(A)) * T),
    Round(GetGreen(A) + (GetGreen(B) - GetGreen(A)) * T),
    Round(GetBlue(A) + (GetBlue(B) - GetBlue(A)) * T)
  );
end;

function LerpVisual(const A, B: TFluentVisualState; T: Single): TFluentVisualState;
begin
  Result.ThumbW    := A.ThumbW + (B.ThumbW - A.ThumbW) * T;
  Result.ThumbH    := A.ThumbH + (B.ThumbH - A.ThumbH) * T;
  Result.ThumbOffX := A.ThumbOffX + (B.ThumbOffX - A.ThumbOffX) * T;
  Result.ThumbOnX  := A.ThumbOnX + (B.ThumbOnX - A.ThumbOnX) * T;
  Result.TrackOff  := LerpARGB(A.TrackOff, B.TrackOff, T);
  Result.StrokeOff := LerpARGB(A.StrokeOff, B.StrokeOff, T);
  Result.TrackOn   := LerpARGB(A.TrackOn, B.TrackOn, T);
  Result.ThumbOff  := LerpARGB(A.ThumbOff, B.ThumbOff, T);
  Result.ThumbOn   := LerpARGB(A.ThumbOn, B.ThumbOn, T);
end;

function ScaleAlpha(C: ARGB; Opacity: Single): ARGB;
begin
  Result := MakeColor(Round(GetAlpha(C) * Opacity), GetRed(C), GetGreen(C), GetBlue(C));
end;

function SystemAccentDark1: ARGB;
const
  AccentKey = 'Software\Microsoft\Windows\CurrentVersion\Explorer\Accent';
  Dark1 = 16;
var
  Key: HKEY;
  Palette: array[0..31] of Byte;
  Size, ValueType: DWORD;
  RegResult : Integer;
begin
  Result := DefaultAccentDark1;
  if RegOpenKeyEx(HKEY_CURRENT_USER, AccentKey, 0, KEY_READ, Key) <> ERROR_SUCCESS then
    Exit;

  try
    Size := SizeOf(Palette);
    RegResult := RegQueryValueEx(Key, 'AccentPalette', nil, @ValueType, @Palette[0], @Size);
    if (RegResult = ERROR_SUCCESS) and (ValueType = REG_BINARY) and (Size >= Dark1 + 3) then
      Result := MakeColor(255, Palette[Dark1], Palette[Dark1 + 1], Palette[Dark1 + 2]);
  finally
    RegCloseKey(Key);
  end;
end;

procedure InitAccentColors;
var
  Accent: ARGB;
begin
  Accent := SystemAccentDark1;
  OnTrackFill[isNormal] := Accent;
  OnTrackFill[isHover] := ScaleAlpha(Accent, 0.9);
  OnTrackFill[isPressed] := ScaleAlpha(Accent, 0.8);
  OnTrackFill[isDisabled] := $37000000;
end;

function SystemAnimationsOn: Boolean;
var
  Allowed: BOOL;
begin
  if not SystemParametersInfo(SPI_GETCLIENTAREAANIMATION, 0, @Allowed, 0) then
    Allowed := True;
  Result := Allowed;
end;

function TColorToARGB(C: TColor): ARGB;
var
  R, G, B: Byte;
begin
  C := ColorToRGB(C);
  R := C and $FF;
  G := (C shr 8) and $FF;
  B := (C shr 16) and $FF;
  Result := MakeColor(255, R, G, B);
end;

procedure AddPillPath(Path: TGPGraphicsPath; X, Y, W, H: Single);
var
  R: Single;
begin
  R := H / 2;
  Path.StartFigure;
  Path.AddArc(X, Y, R * 2, H, 90, 180);
  Path.AddArc(X + W - R * 2, Y, R * 2, H, 270, 180);
  Path.CloseFigure;
end;


{ TFluentToggleSwitch }

constructor TFluentToggleSwitch.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle + [csOpaque];
  ParentColor := True;
  FChecked := False;
  FUserScale := 1;
  TabStop := True;
  FShowFocus := True;
  FKeyboardToggle := True;
  FAnimated := True;
  FAnimationDuration := 367;
  FAnimProgress := 0.0;
  FFadeT := 1.0;
  FFadeValue := 0.0;
  FAnimTarget := 0.0;
  FState := isNormal;
  FStateT := 1.0;
  FStateDuration := StateDuration;
  QueryPerformanceFrequency(FAnimFrequency);
  DoubleBuffered := True;
  FTrackFrameColor := clDefault;
  FTrackColorOff := clDefault;
  FTrackColorOn := clDefault;
  FThumbColorOff := clDefault;
  FThumbColorOn := clDefault;
  FKnownAccent := OnTrackFill[isNormal];
  FTextOn := DefaultTextOn;
  FTextOff := DefaultTextOff;
  FShowText := False;
  FTextPosition := tpRight;
  FTextSpacing := 12;
  FShowHeader := False;
  FHeaderPosition := hpTop;
  FHeaderAlignment := taCenter;
  FHeaderSpacing := 6;
  FHeaderFont := TFont.Create;
  FHeaderFont.Assign(Font);
  FHeaderFont.OnChange := HeaderFontChanged;
  AutoSize := True;
  LayoutChanged;
end;

procedure TFluentToggleSwitch.SetTrackFrameColor(Value: TColor);
begin
  if FTrackFrameColor <> Value then
  begin
    FTrackFrameColor := Value;
    Invalidate;
  end;
end;

procedure TFluentToggleSwitch.SetTrackColorOff(Value: TColor);
begin
  if FTrackColorOff <> Value then
  begin
    FTrackColorOff := Value;
    Invalidate;
  end;
end;

procedure TFluentToggleSwitch.SetTrackColorOn(Value: TColor);
begin
  if FTrackColorOn <> Value then
  begin
    FTrackColorOn := Value;
    Invalidate;
  end;
end;

procedure TFluentToggleSwitch.SetThumbColorOff(Value: TColor);
begin
  if FThumbColorOff <> Value then
  begin
    FThumbColorOff := Value;
    Invalidate;
  end;
end;

procedure TFluentToggleSwitch.SetThumbColorOn(Value: TColor);
begin
  if FThumbColorOn <> Value then
  begin
    FThumbColorOn := Value;
    Invalidate;
  end;
end;

procedure TFluentToggleSwitch.SetTextOn(const Value: string);
begin
  if FTextOn <> Value then
  begin
    FTextOn := Value;
    LayoutChanged(True);
  end;
end;

procedure TFluentToggleSwitch.SetTextOff(const Value: string);
begin
  if FTextOff <> Value then
  begin
    FTextOff := Value;
    LayoutChanged(True);
  end;
end;

function TFluentToggleSwitch.IsTextOnStored: Boolean;
begin
  Result := FTextOn <> DefaultTextOn;
end;

function TFluentToggleSwitch.IsTextOffStored: Boolean;
begin
  Result := FTextOff <> DefaultTextOff;
end;

procedure TFluentToggleSwitch.SetShowFocus(Value: Boolean);
begin
  if FShowFocus <> Value then
  begin
    FShowFocus := Value;
    if Focused then
      Invalidate;
  end;
end;

procedure TFluentToggleSwitch.UpdateFocusVisibility;
var
  Visible: Boolean;
begin
  Visible := HandleAllocated and (Perform(WM_QUERYUISTATE, 0, 0) and UISF_HIDEFOCUS = 0);
  if Visible <> FFocusVisible then
  begin
    FFocusVisible := Visible;
    if Focused then
      Invalidate;
  end;
end;

procedure TFluentToggleSwitch.SetShowText(Value: Boolean);
begin
  if FShowText <> Value then
  begin
    FShowText := Value;
    LayoutChanged(True);
  end;
end;

procedure TFluentToggleSwitch.SetTextPosition(Value: TFluentTextPosition);
begin
  if FTextPosition <> Value then
  begin
    FTextPosition := Value;
    LayoutChanged(True);
  end;
end;

procedure TFluentToggleSwitch.SetTextSpacing(Value: Integer);
begin
  if Value < 0 then
    Value := 0;
  if FTextSpacing <> Value then
  begin
    FTextSpacing := Value;
    LayoutChanged(True);
  end;
end;

procedure TFluentToggleSwitch.SetShowHeader(Value: Boolean);
begin
  if FShowHeader <> Value then
  begin
    FShowHeader := Value;
    LayoutChanged(True);
  end;
end;

procedure TFluentToggleSwitch.SetHeaderText(const Value: string);
begin
  if FHeaderText <> Value then
  begin
    FHeaderText := Value;
    LayoutChanged(True);
  end;
end;

procedure TFluentToggleSwitch.SetHeaderPosition(Value: TFluentHeaderPosition);
begin
  if FHeaderPosition <> Value then
  begin
    FHeaderPosition := Value;
    LayoutChanged(True);
  end;
end;

procedure TFluentToggleSwitch.SetHeaderAlignment(Value: TAlignment);
begin
  if FHeaderAlignment <> Value then
  begin
    FHeaderAlignment := Value;
    LayoutChanged(True);
  end;
end;

procedure TFluentToggleSwitch.SetHeaderFont(Value: TFont);
begin
  FHeaderFont.Assign(Value);
end;

procedure TFluentToggleSwitch.HeaderFontChanged(Sender: TObject);
begin
  FHeaderFontCustom := True;
  LayoutChanged;
end;

procedure TFluentToggleSwitch.SetHeaderSpacing(Value: Integer);
begin
  if Value < 0 then
    Value := 0;

  if FHeaderSpacing <> Value then
  begin
    FHeaderSpacing := Value;
    LayoutChanged(True);
  end;
end;

function TFluentToggleSwitch.CurrentScale: Single;
var
  PPI: Integer;
  Above: TWinControl;
begin
  PPI := CurrentPPI;
  Above := Parent;

  while (PPI <= 0) and (Above <> nil) do
  begin
    PPI := Above.CurrentPPI;
    Above := Above.Parent;
  end;

  if PPI <= 0 then
    PPI := USER_DEFAULT_SCREEN_DPI;

  Result := PPI / USER_DEFAULT_SCREEN_DPI * FUserScale;
end;

function TFluentToggleSwitch.TextGap: Integer;
begin
  Result := Round((FTextSpacing - (TrackAreaWidth - TrackWidth) / 2) * CurrentScale);
  if Result < 0 then
    Result := 0;
end;

function TFluentToggleSwitch.HeaderGap: Integer;
begin
  Result := Round(FHeaderSpacing * CurrentScale);
end;

function TFluentToggleSwitch.HeaderBand: Integer;
begin
  Result := FHeaderHeight + HeaderGap;
end;

procedure TFluentToggleSwitch.Measure;
var
  DC: HDC;
  SaveFont: HFONT;
  TM: TTextMetric;
  SizeOn, SizeOff, SizeHeader: TSize;
begin
  FTextWidth := 0;
  FTextHeight := 0;
  FHeaderWidth := 0;
  FHeaderHeight := 0;

  if not (FShowText or FShowHeader) then
    Exit;

  DC := GetDC(0);
  try
    SaveFont := SelectObject(DC, Font.Handle);

    if FShowText then
    begin
      GetTextMetrics(DC, TM);
      GetTextExtentPoint32(DC, PChar(FTextOn), Length(FTextOn), SizeOn);
      GetTextExtentPoint32(DC, PChar(FTextOff), Length(FTextOff), SizeOff);
      FTextWidth := Max(SizeOn.cx, SizeOff.cx);
      FTextHeight := TM.tmHeight;
    end;

    if FShowHeader then
    begin
      SelectObject(DC, FHeaderFont.Handle);
      GetTextMetrics(DC, TM);
      GetTextExtentPoint32(DC, PChar(FHeaderText), Length(FHeaderText), SizeHeader);
      FHeaderWidth := SizeHeader.cx;
      FHeaderHeight := TM.tmHeight;
    end;

    SelectObject(DC, SaveFont);
  finally
    ReleaseDC(0, DC);
  end;
end;

function TFluentToggleSwitch.CanAutoSize(var NewWidth, NewHeight: Integer): Boolean;
begin
  Result := True;
  NewWidth := Round(TrackAreaWidth * CurrentScale);
  NewHeight := Round(TrackAreaHeight * CurrentScale);

  if FShowText then
  begin
    Inc(NewWidth, TextGap + FTextWidth);
    NewHeight := Max(NewHeight, FTextHeight);
  end;

  if FShowHeader then
  begin
    NewWidth := Max(NewWidth, FHeaderWidth);
    Inc(NewHeight, HeaderBand);
  end;
end;

procedure TFluentToggleSwitch.AdjustSize;
var
  W, H: Integer;
begin
  if HandleAllocated then
    inherited
  else
    if AutoSize and not (csLoading in ComponentState) then
    begin
      W := Width;
      H := Height;
      if CanAutoSize(W, H) then
        SetBounds(Left, Top, W, H);
    end;
end;

function TFluentToggleSwitch.TopBand: Integer;
begin
  if FShowHeader and (FHeaderPosition = hpTop) then
    Result := HeaderBand
  else
    Result := 0;
end;

function TFluentToggleSwitch.BlockWidth: Integer;
begin
  Result := Round(TrackAreaWidth * CurrentScale);
  if FShowText then
    Inc(Result, TextGap + FTextWidth);
end;

function TFluentToggleSwitch.SwitchIndent: Integer;
var
  Extra: Integer;
begin
  Result := 0;
  if not FShowHeader then
    Exit;

  Extra := Width - BlockWidth;
  if Extra <= 0 then
    Exit;

  case FHeaderAlignment of
    taLeftJustify : Result := 0;
    taRightJustify: Result := Extra;
  else
    Result := Extra div 2;
  end;
end;

function TFluentToggleSwitch.SwitchArea: TRect;
var
  Band: Integer;
begin
  Result := ClientRect;
  if FShowHeader then
  begin
    Band := Min(HeaderBand, Height);
    if FHeaderPosition = hpTop then
      Result.Top := Band
    else
      Result.Bottom := Height - Band;
  end;
  Result.Left := SwitchIndent;
  Result.Right := Result.Left + BlockWidth;
end;

procedure TFluentToggleSwitch.LayoutChanged(MoveWithTheHeader: Boolean = False);
var
  Band, Indent: Integer;
begin
  Measure;
  AdjustSize;

  Band := TopBand;
  Indent := SwitchIndent;

  if MoveWithTheHeader and AutoSize and (Align = alNone) and not (csLoading in ComponentState) then
  begin
    if Band <> FTopBand then
      Top := Top - (Band - FTopBand);

    if Indent <> FLeftIndent then
      Left := Left - (Indent - FLeftIndent);
  end;

  FTopBand := Band;
  FLeftIndent := Indent;
  Invalidate;
end;

procedure TFluentToggleSwitch.SetName(const Value: TComponentName);
var
  Seed: Boolean;
begin
  Seed := not (csLoading in ComponentState) and (FHeaderText = Name);

  inherited SetName(Value);

  if Seed then
    HeaderText := Value;
end;

procedure TFluentToggleSwitch.CMFontChanged(var Msg: TMessage);
begin
  inherited;
  if not FHeaderFontCustom then
  begin
    FHeaderFont.OnChange := nil;
    try
      FHeaderFont.Assign(Font);
    finally
      FHeaderFont.OnChange := HeaderFontChanged;
    end;
  end;
  LayoutChanged;
end;

procedure TFluentToggleSwitch.ChangeScale(M, D: Integer; isDpiChange: Boolean);
begin
  inherited;
  if not isDpiChange and not (csLoading in ComponentState) then
    FUserScale := FUserScale * M / D;

  if FHeaderFontCustom then
    FHeaderFont.Height := MulDiv(FHeaderFont.Height, M, D);

  FStateT := 1.0;
  LayoutChanged;
end;

procedure TFluentToggleSwitch.Loaded;
begin
  inherited;
  LayoutChanged;
end;

procedure TFluentToggleSwitch.CreateWnd;
begin
  inherited;
  LayoutChanged;
end;

destructor TFluentToggleSwitch.Destroy;
begin
  if FGone <> nil then
    FGone^ := True;
  FAnimTimer.Free;
  FHeaderFont.Free;
  inherited;
end;

procedure TFluentToggleSwitch.SetChecked(Value: Boolean);
begin
  if FChecked = Value then
    Exit;

  FChecked := Value;
  SettleThumb;
  Invalidate;

  if not (csLoading in ComponentState) then
    Change;
end;

procedure TFluentToggleSwitch.Click;
begin
  if FReportingClick then
    inherited;
end;

procedure TFluentToggleSwitch.Change;
begin
  if Assigned(FOnChange) then
    FOnChange(Self);
end;

procedure TFluentToggleSwitch.StartTimer;
begin
  if FAnimTimer = nil then
  begin
    FAnimTimer := TTimer.Create(Self);
    FAnimTimer.Interval := 16;
    FAnimTimer.OnTimer := HandleAnimTimer;
  end;
  FAnimTimer.Enabled := True;
end;

procedure TFluentToggleSwitch.StartAnimation;
begin
  FAnimStartProgress := FAnimProgress;
  FAnimTarget := Ord(FChecked);
  FSliding := True;
  QueryPerformanceCounter(FAnimStartTime);
  StartTimer;
end;

procedure TFluentToggleSwitch.StartFade;
begin
  FFadeFrom := FFadeValue;
  FFadeT := 0;
  QueryPerformanceCounter(FFadeStart);
  StartTimer;
end;

procedure TFluentToggleSwitch.SettleThumb;
begin
  if FAnimated and SystemAnimationsOn and HandleAllocated and Showing then
  begin
    StartFade;
    StartAnimation;
  end else begin
    FSliding := False;
    FAnimProgress := Ord(FChecked);
    FAnimTarget := FAnimProgress;
    FFadeT := 1.0;
    FFadeValue := Ord(FChecked);
  end;
end;

procedure TFluentToggleSwitch.HandleAnimTimer(Sender: TObject);
var
  Counter: Int64;
  T: Single;
  Busy: Boolean;
begin
  QueryPerformanceCounter(Counter);
  Busy := False;

  if FSliding then
  begin
    T := ((Counter - FAnimStartTime) / FAnimFrequency * 1000 - ThumbSlideDelay) / FAnimationDuration;
    if T >= 1.0 then
    begin
      T := 1.0;
      FSliding := False;
    end else begin
      Busy := True;
      if T < 0 then
        T := 0;
    end;
    FAnimProgress := FAnimStartProgress
      + (FAnimTarget - FAnimStartProgress) * BezierEase(T, 0.1, 0.9, 0.2, 1.0);
  end;

  if FFadeT < 1.0 then
  begin
    T := (Counter - FFadeStart) / FAnimFrequency * 1000 / StateDuration;
    if T >= 1.0 then
      FFadeT := 1.0
    else
    begin
      Busy := True;
      FFadeT := T;
    end;
    FFadeValue := FFadeFrom + (Ord(FChecked) - FFadeFrom) * FFadeT;
  end;

  if FStateT < 1.0 then
  begin
    T := (Counter - FStateStartTime) / FAnimFrequency * 1000 / FStateDuration;
    if T >= 1.0 then
      FStateT := 1.0
    else begin
      Busy := True;
      FStateT := BezierEase(T, 0, 0, 0, 1);
    end;
  end;

  FAnimTimer.Enabled := Busy;
  Invalidate;
end;

procedure TFluentToggleSwitch.SetAnimationDuration(Value: Integer);
begin
  if Value < 1 then
    Value := 1;
  FAnimationDuration := Value;
end;

procedure TFluentToggleSwitch.Toggle;
var
  Gone: Boolean;
  Outer: PBoolean;
begin
  Gone := False;
  Outer := FGone;
  FGone := @Gone;
  Checked := not FChecked;

  if not Gone then
  begin
    FReportingClick := True;
    Click;
  end;

  if Gone then
  begin
    if Outer <> nil then
      Outer^ := True;
    Exit;
  end;

  FReportingClick := False;
  FGone := Outer;
end;


procedure TFluentToggleSwitch.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if (Button = mbLeft) and Enabled and PtInRect(SwitchArea, Point(X, Y)) then
  begin
    FSliding := False;

    if TabStop and not (csDesigning in ComponentState) then
      Winapi.Windows.SetFocus(Handle);

    FPressed := True;
    FDragStartX := X;
    FDragDelta := 0;
    FDragged := False;

    UpdateVisualState;
  end;
end;

procedure TFluentToggleSwitch.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Gone: Boolean;
begin
  if (Button = mbLeft) and FPressed then
  begin
    Gone := False;
    FGone := @Gone;
    try
      FPressed := False;
      UpdateVisualState;
      if FDragged then
      begin
        FAnimProgress := FAnimProgress + FDragDelta / DragTravel;
        FDragDelta := 0;
        if (FAnimProgress >= 0.5) <> FChecked then
          Toggle
        else
          SettleThumb;
      end else begin
        FDragDelta := 0;
        if PtInRect(SwitchArea, Point(X, Y)) then
          Toggle
        else
          SettleThumb;
      end;
    finally
      if not Gone then
        FGone := nil;
    end;

    if Gone then
      Exit;

    Invalidate;
  end;
  inherited;
end;

procedure TFluentToggleSwitch.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  IsOver: Boolean;
begin
  inherited;

  IsOver := PtInRect(SwitchArea, Point(X, Y));

  if IsOver <> FHovered then
  begin
    FHovered := IsOver;
    UpdateVisualState;
  end;

  if FPressed then
    DragThumb(X);
end;

procedure TFluentToggleSwitch.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;

  if FKeyboardToggle and Enabled and (Key = VK_SPACE) and (Shift = []) then
  begin
    Key := 0;
    if not FKeyPressed then
    begin
      FKeyPressed := True;
      UpdateVisualState;
    end;
  end;
end;

procedure TFluentToggleSwitch.KeyUp(var Key: Word; Shift: TShiftState);
begin
  inherited;

  if FKeyPressed and (Key = VK_SPACE) then
  begin
    Key := 0;
    FKeyPressed := False;
    UpdateVisualState;
    Toggle;
  end;
end;

function TFluentToggleSwitch.DragTravel: Single;
begin
  Result := (ThumbCenterOnX[isPressed] - ThumbCenterOffX[isPressed]) * CurrentScale;
end;

procedure TFluentToggleSwitch.DragThumb(X: Integer);
var
  Delta: Single;
begin
  Delta := X - FDragStartX;

  if Abs(Delta) >= DragThreshold * CurrentScale then
    FDragged := True;

  if Delta < -FAnimProgress * DragTravel then
    Delta := -FAnimProgress * DragTravel

  else
    if Delta > (1 - FAnimProgress) * DragTravel then
      Delta := (1 - FAnimProgress) * DragTravel;

  if Delta <> FDragDelta then
  begin
    FDragDelta := Delta;
    FFadeValue := FAnimProgress + Delta / DragTravel;
    FFadeT := 1.0;
    Invalidate;
  end;
end;

procedure TFluentToggleSwitch.CMMouseEnter(var Msg: TMessage);
begin
  inherited;
  FHovered := True;
  UpdateVisualState;
end;

procedure TFluentToggleSwitch.CancelPress;
begin
  FPressed := False;
  FDragged := False;
  FDragDelta := 0;
  FFadeValue := Ord(FChecked);
  FFadeT := 1.0;
end;

procedure TFluentToggleSwitch.CMMouseLeave(var Msg: TMessage);
begin
  inherited;
  FHovered := False;
  if not MouseCapture then
    CancelPress;
  UpdateVisualState;
end;

procedure TFluentToggleSwitch.WMSetFocus(var Msg: TWMSetFocus);
begin
  inherited;
  UpdateFocusVisibility;
  Invalidate;
end;

procedure TFluentToggleSwitch.WMKillFocus(var Msg: TWMKillFocus);
begin
  inherited;
  if FKeyPressed then
  begin
    FKeyPressed := False;
    UpdateVisualState;
  end;
  Invalidate;
end;

procedure TFluentToggleSwitch.WMUpdateUIState(var Msg: TMessage);
begin
  inherited;
  UpdateFocusVisibility;
end;

// Each instance keeps its own baseline, because OnTrackFill is shared and a sibling may have refreshed it first
procedure TFluentToggleSwitch.RereadAccent;
var
  Before: ARGB;
begin
  Before := FKnownAccent;
  InitAccentColors;
  FKnownAccent := OnTrackFill[isNormal];
  if FKnownAccent <> Before then
    Invalidate;
end;

procedure TFluentToggleSwitch.CMSysColorChange(var Msg: TMessage);
begin
  inherited;
  RereadAccent;
end;

procedure TFluentToggleSwitch.CMWinIniChange(var Msg: TMessage);
begin
  inherited;
  RereadAccent;
end;

procedure TFluentToggleSwitch.CMEnabledChanged(var Msg: TMessage);
begin
  inherited;
  if not Enabled then
  begin
    CancelPress;
    FKeyPressed := False;
    FHovered := False;
  end;
  UpdateVisualState;
end;

function TFluentToggleSwitch.GetInteractionState: TFluentInteractionState;
begin
  if not Enabled then
    Result := isDisabled
  else
    if FPressed or FKeyPressed then
      Result := isPressed
    else
      if FHovered then
        Result := isHover
      else
        Result := isNormal;
end;

function TFluentToggleSwitch.StateVisual(S: TFluentInteractionState): TFluentVisualState;
var
  K: Single;
begin
  K := CurrentScale;
  Result.ThumbW    := ThumbWidths[S] * K;
  Result.ThumbH    := ThumbHeights[S] * K;
  Result.ThumbOffX := ThumbCenterOffX[S] * K;
  Result.ThumbOnX  := ThumbCenterOnX[S] * K;
  Result.TrackOff  := OffTrackFill[S];
  Result.StrokeOff := OffTrackStroke[S];
  Result.TrackOn   := OnTrackFill[S];
  Result.ThumbOff  := OffThumbFill[S];
  Result.ThumbOn   := OnThumbFill[S];
end;

function TFluentToggleSwitch.CurrentVisual: TFluentVisualState;
var
  Target: TFluentVisualState;
begin
  Target := StateVisual(FState);

  if FStateT < 1.0 then
    Result := LerpVisual(FStateFrom, Target, FStateT)
  else
    Result := Target;
end;

procedure TFluentToggleSwitch.UpdateVisualState;
var
  NewState: TFluentInteractionState;
begin
  NewState := GetInteractionState;
  if NewState = FState then
    Exit;

  FStateFrom := CurrentVisual;
  FState := NewState;
  if NewState = isDisabled then
    FStateDuration := DisabledStateDuration
  else
    FStateDuration := StateDuration;

  if FAnimated and SystemAnimationsOn and HandleAllocated and Showing then
  begin
    FStateT := 0;
    QueryPerformanceCounter(FStateStartTime);
    StartTimer;
  end else
    FStateT := 1.0;

  Invalidate;
end;

procedure TFluentToggleSwitch.Paint;
var
  G: TGPGraphics;
  Path: TGPGraphicsPath;
  Brush: TGPSolidBrush;
  Pen: TGPPen;
  TrackX, TrackY, TrackOffsetX: Single;
  TrackW, TrackH, PenW, K: Single;
  VS: TFluentVisualState;
  OffFill, OffStroke, OnFill: ARGB;
  OffThumb, OnThumb: ARGB;
  OffOpacity, Fade: Single;
  ThumbCX, ThumbCY: Single;
  ThumbW, ThumbH: Single;
  TextX, TextY: Integer;
  HeaderX, HeaderY: Integer;
  RowTop, RowHeight, Indent: Integer;
  Area: TRect;
  LabelText: string;

  procedure FillShape(Color: ARGB);
  begin
    if GetAlpha(Color) = 0 then
      Exit;
    Brush.SetColor(Color);
    G.FillPath(Brush, Path);
  end;

  procedure StrokeShape(Color: ARGB);
  begin
    if GetAlpha(Color) = 0 then
      Exit;
    Pen.SetColor(Color);
    G.DrawPath(Pen, Path);
  end;

begin
  Area := SwitchArea;
  Indent := Area.Left;
  RowTop := Area.Top;
  RowHeight := Area.Height;
  TrackOffsetX := Indent;
  K := CurrentScale;
  TrackW := TrackWidth * K;
  TrackH := TrackHeight * K;
  PenW := K;
  TextX := 0;
  TextY := 0;
  HeaderX := 0;
  HeaderY := 0;

  Canvas.Brush.Style := bsSolid;
  Canvas.Brush.Color := Color;
  Canvas.FillRect(ClientRect);

  if FShowHeader then
  begin
    if FHeaderPosition = hpTop then
      HeaderY := 0
    else
      HeaderY := Height - FHeaderHeight;

    case FHeaderAlignment of
      taCenter      : HeaderX := (Width - FHeaderWidth) div 2;
      taRightJustify: HeaderX := Width - FHeaderWidth;
    end;
  end;

  if FShowText then
  begin
    if FTextPosition = tpLeft then
    begin
      TextX := Round(TrackOffsetX);
      TrackOffsetX := TrackOffsetX + FTextWidth + TextGap;
    end else
      TextX := Round(TrackOffsetX) + Round(TrackAreaWidth * K) + TextGap;

    TextY := RowTop + (RowHeight - FTextHeight) div 2;
  end;

  TrackX := TrackOffsetX + Round((TrackAreaWidth - TrackWidth) * K / 2);
  TrackY := RowTop + Round((RowHeight - TrackH) / 2);

  VS := CurrentVisual;
  Fade := FFadeValue;
  OffOpacity := 1 - Fade;

  if FTrackColorOff <> clDefault then
    OffFill := TColorToARGB(FTrackColorOff)
  else
    OffFill := VS.TrackOff;

  if FTrackFrameColor <> clDefault then
    OffStroke := TColorToARGB(FTrackFrameColor)
  else
    OffStroke := VS.StrokeOff;

  if FTrackColorOn <> clDefault then
    OnFill := TColorToARGB(FTrackColorOn)
  else
    OnFill := VS.TrackOn;

  if FThumbColorOff <> clDefault then
    OffThumb := TColorToARGB(FThumbColorOff)
  else
    OffThumb := VS.ThumbOff;

  if FThumbColorOn <> clDefault then
    OnThumb := TColorToARGB(FThumbColorOn)
  else
    OnThumb := VS.ThumbOn;

  ThumbW  := VS.ThumbW;
  ThumbH  := VS.ThumbH;
  ThumbCY := TrackY + TrackH / 2;
  ThumbCX := TrackX + VS.ThumbOffX + (VS.ThumbOnX - VS.ThumbOffX) * FAnimProgress + FDragDelta;

  G := nil;
  Path := nil;
  Brush := nil;
  Pen := nil;

  try
    G := TGPGraphics.Create(Canvas.Handle);
    G.SetSmoothingMode(SmoothingModeAntiAlias);

    Path := TGPGraphicsPath.Create;
    Brush := TGPSolidBrush.Create(0);
    Pen := TGPPen.Create(0, PenW);

    AddPillPath(Path, TrackX + PenW / 2, TrackY + PenW / 2, TrackW - PenW, TrackH - PenW);

    if OffOpacity > 0 then
    begin
      FillShape(ScaleAlpha(OffFill, OffOpacity));
      StrokeShape(ScaleAlpha(OffStroke, OffOpacity));
    end;

    if Fade > 0 then
      if FTrackFrameColor <> clDefault then
      begin
        FillShape(ScaleAlpha(OnFill, Fade));
        StrokeShape(ScaleAlpha(OffStroke, Fade));
      end else begin
        Path.Reset;
        AddPillPath(Path, TrackX, TrackY, TrackW, TrackH);
        FillShape(ScaleAlpha(OnFill, Fade));
        Path.Reset;
        AddPillPath(Path, TrackX + PenW / 2, TrackY + PenW / 2, TrackW - PenW, TrackH - PenW);
      end;

    Path.Reset;
    AddPillPath(Path, ThumbCX - ThumbW / 2, ThumbCY - ThumbH / 2, ThumbW, ThumbH);

    if OffOpacity > 0 then
      FillShape(ScaleAlpha(OffThumb, OffOpacity));
    if Fade > 0 then
      FillShape(ScaleAlpha(OnThumb, Fade));
  finally
    Pen.Free;
    Brush.Free;
    Path.Free;
    G.Free;
  end;

  // Labels
  if FShowText or FShowHeader then
  begin
    Canvas.Brush.Style := bsClear;

    if FShowText then
    begin
      Canvas.Font.Assign(Font);
      if not Enabled then
        Canvas.Font.Color := clGrayText;
      if FChecked then
        LabelText := FTextOn
      else
        LabelText := FTextOff;
      Canvas.TextOut(TextX, TextY, LabelText);
    end;

    if FShowHeader then
    begin
      Canvas.Font.Assign(FHeaderFont);
      if not Enabled then
        Canvas.Font.Color := clGrayText;
      Canvas.TextOut(HeaderX, HeaderY, FHeaderText);
    end;
  end;

  if FShowFocus and FFocusVisible and Focused then
  begin
    Canvas.Brush.Style := bsSolid;
    Canvas.DrawFocusRect(Area);
  end;
end;

initialization
  InitAccentColors;

end.
