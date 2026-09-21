unit Fluent.ToggleSwitch;

interface

uses
  System.Classes,
  System.Math,
  System.Types,

  Vcl.Controls,
  Vcl.Forms,
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
  end;

  TCustomFluentToggleSwitch = class(TCustomControl)
  private
    FChecked: Boolean;
    FReadOnly: Boolean;

    FAnimated: Boolean;
    FAnimationDuration: Integer;
    FHovered: Boolean;
    FPressed: Boolean;
    FKeyPressed: Boolean;
    FShowFocus: Boolean;
    FTopBand: Integer;
    FUserScale: Single;
    FScaling: Boolean;
    FGone: PBoolean;
    FReportingClick: Boolean;
    FLeftIndent: Integer;
    FKeyboardToggle: Boolean;
    FDragStartX: Integer;
    FDragDelta: Single;
    FDragged: Boolean;
    FAnimating: Boolean;
    FAnimProgress: Single;
    FFadeValue: Single;
    FFadeFrom: Single;
    FFadeT: Single;
    FFadeStart: Int64;
    FAnimStartProgress: Single;
    FAnimStartTime: Int64;
    FAnimFrequency: Int64;
    FSliding: Boolean;
    FState: TFluentInteractionState;
    FStateFrom: TFluentVisualState;
    FStateT: Single;
    FStateStartTime: Int64;
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
    FParentHeaderFont: Boolean;
    FHeaderWidth: Integer;
    FHeaderHeight: Integer;

    procedure SetChecked(Value: Boolean);
    procedure SetReadOnly(Value: Boolean);
    procedure SetAnimationDuration(Value: Integer);
    function CanAnimate: Boolean;
    procedure StartTimer;
    procedure StopTimer;
    procedure StartAnimation;
    procedure StartFade;
    procedure SettleThumb;
    procedure AdvanceAnimation;
    function DragTravel: Single;
    procedure DragThumb(X: Integer);
    procedure CancelPress;
    function GetInteractionState: TFluentInteractionState;
    function CurrentScale: Single;
    function TextGap: Integer;
    function HeaderGap: Integer;
    function HeaderBand: Integer;
    function HeaderFormat: TTextFormat;
    function StateVisual(S: TFluentInteractionState): TFluentVisualState;
    function CurrentVisual: TFluentVisualState;
    procedure UpdateVisualState;
    function Toggle: Boolean;
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
    function FocusRingWanted: Boolean;
    procedure SetTextPosition(Value: TFluentTextPosition);
    procedure SetTextSpacing(Value: Integer);
    procedure SetShowHeader(Value: Boolean);
    procedure SetHeaderText(const Value: string);
    procedure SetHeaderPosition(Value: TFluentHeaderPosition);
    procedure SetHeaderAlignment(Value: TAlignment);
    procedure SetHeaderSpacing(Value: Integer);
    procedure SetHeaderFont(Value: TFont);
    function IsHeaderFontStored: Boolean;
    procedure HeaderFontChanged(Sender: TObject);
    procedure SetParentHeaderFont(Value: Boolean);
    procedure CopyFontToHeader;
    procedure Measure;
    procedure LayoutChanged(MoveWithTheHeader: Boolean = False);
    function TopBand: Integer;
    function BlockWidth: Integer;
    function SwitchIndent: Integer;
    function SwitchArea: TRect;
    procedure RereadAccent;

    procedure CMFontChanged(var Msg: TMessage);    message CM_FONTCHANGED;
    procedure CMMouseLeave(var Msg: TMessage);     message CM_MOUSELEAVE;
    procedure WMCancelMode(var Msg: TMessage);     message WM_CANCELMODE;
    procedure CMEnabledChanged(var Msg: TMessage); message CM_ENABLEDCHANGED;
    procedure WMSetFocus(var Msg: TWMSetFocus);    message WM_SETFOCUS;
    procedure WMKillFocus(var Msg: TWMKillFocus);  message WM_KILLFOCUS;
    procedure WMUpdateUIState(var Msg: TMessage);  message WM_UPDATEUISTATE;
    procedure WMTimer(var Msg: TWMTimer);          message WM_TIMER;
    procedure CMSysColorChange(var Msg: TMessage); message CM_SYSCOLORCHANGE;
    procedure CMWinIniChange(var Msg: TMessage);   message CM_WININICHANGE;
    procedure CMDialogChar(var Msg: TCMDialogChar); message CM_DIALOGCHAR;

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

    property Checked: Boolean read FChecked write SetChecked default False;
    property ReadOnly: Boolean read FReadOnly write SetReadOnly default False;
    property Animated: Boolean read FAnimated write FAnimated default True;
    property AnimationDuration: Integer read FAnimationDuration write SetAnimationDuration default 367;
    property ShowFocus: Boolean read FShowFocus write SetShowFocus default True;
    property KeyboardToggle: Boolean read FKeyboardToggle write FKeyboardToggle default True;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property TrackFrameColor: TColor read FTrackFrameColor write SetTrackFrameColor default clDefault;
    property TrackColorOff: TColor read FTrackColorOff write SetTrackColorOff default clDefault;
    property TrackColorOn: TColor read FTrackColorOn write SetTrackColorOn default clDefault;
    property ThumbColorOff: TColor read FThumbColorOff write SetThumbColorOff default clDefault;
    property ThumbColorOn: TColor read FThumbColorOn write SetThumbColorOn default clDefault;
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
    property HeaderFont: TFont read FHeaderFont write SetHeaderFont stored IsHeaderFontStored;
    property ParentHeaderFont: Boolean read FParentHeaderFont write SetParentHeaderFont default True;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function TextTop: Integer;
  end;

  TFluentToggleSwitch = class(TCustomFluentToggleSwitch)
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
    property Checked;
    property ReadOnly;
    property Animated;
    property AnimationDuration;
    property Enabled;
    property TabStop default True;
    property TabOrder;
    property ShowFocus;
    property KeyboardToggle;
    property Color;
    property ParentColor;
    property OnChange;
    property OnClick;
    property TrackFrameColor;
    property TrackColorOff;
    property TrackColorOn;
    property ThumbColorOff;
    property ThumbColorOn;
    property Font;
    property ShowText;
    property TextOn;
    property TextOff;
    property TextPosition;
    property TextSpacing;
    property ShowHeader;
    property HeaderText;
    property HeaderPosition;
    property HeaderAlignment;
    property HeaderSpacing;
    property HeaderFont;
    property ParentHeaderFont;
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

  AnimationTimerId      = 1;
  AnimationInterval     = 16;

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

  OnThumbFill        = $FFFFFFFF; // The On thumb is this white in every state
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
  RegResult: Integer;
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
begin
  C := ColorToRGB(C);
  Result := MakeColor(255, GetRValue(C), GetGValue(C), GetBValue(C));
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

{ TCustomFluentToggleSwitch }

constructor TCustomFluentToggleSwitch.Create(AOwner: TComponent);
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
  FState := isNormal;
  FStateT := 1.0;
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
  FParentHeaderFont := True;
  FHeaderFont := TFont.Create;
  FHeaderFont.Assign(Font);
  FHeaderFont.OnChange := HeaderFontChanged;
  AutoSize := True;
  LayoutChanged;
end;

procedure TCustomFluentToggleSwitch.SetTrackFrameColor(Value: TColor);
begin
  if FTrackFrameColor <> Value then
  begin
    FTrackFrameColor := Value;
    Invalidate;
  end;
end;

procedure TCustomFluentToggleSwitch.SetTrackColorOff(Value: TColor);
begin
  if FTrackColorOff <> Value then
  begin
    FTrackColorOff := Value;
    Invalidate;
  end;
end;

procedure TCustomFluentToggleSwitch.SetTrackColorOn(Value: TColor);
begin
  if FTrackColorOn <> Value then
  begin
    FTrackColorOn := Value;
    Invalidate;
  end;
end;

procedure TCustomFluentToggleSwitch.SetThumbColorOff(Value: TColor);
begin
  if FThumbColorOff <> Value then
  begin
    FThumbColorOff := Value;
    Invalidate;
  end;
end;

procedure TCustomFluentToggleSwitch.SetThumbColorOn(Value: TColor);
begin
  if FThumbColorOn <> Value then
  begin
    FThumbColorOn := Value;
    Invalidate;
  end;
end;

procedure TCustomFluentToggleSwitch.SetTextOn(const Value: string);
begin
  if FTextOn <> Value then
  begin
    FTextOn := Value;
    LayoutChanged(True);
  end;
end;

procedure TCustomFluentToggleSwitch.SetTextOff(const Value: string);
begin
  if FTextOff <> Value then
  begin
    FTextOff := Value;
    LayoutChanged(True);
  end;
end;

function TCustomFluentToggleSwitch.IsTextOnStored: Boolean;
begin
  Result := FTextOn <> DefaultTextOn;
end;

function TCustomFluentToggleSwitch.IsTextOffStored: Boolean;
begin
  Result := FTextOff <> DefaultTextOff;
end;

procedure TCustomFluentToggleSwitch.SetShowFocus(Value: Boolean);
begin
  if FShowFocus <> Value then
  begin
    FShowFocus := Value;
    if Focused then
      Invalidate;
  end;
end;

// Windows hides focus rings until someone reaches for the keyboard, and says so
// through the UI state of the window
function TCustomFluentToggleSwitch.FocusRingWanted: Boolean;
begin
  Result := FShowFocus and Focused and (Perform(WM_QUERYUISTATE, 0, 0) and UISF_HIDEFOCUS = 0);
end;

procedure TCustomFluentToggleSwitch.SetShowText(Value: Boolean);
begin
  if FShowText <> Value then
  begin
    FShowText := Value;
    LayoutChanged(True);
  end;
end;

procedure TCustomFluentToggleSwitch.SetTextPosition(Value: TFluentTextPosition);
begin
  if FTextPosition <> Value then
  begin
    FTextPosition := Value;
    LayoutChanged(True);
  end;
end;

procedure TCustomFluentToggleSwitch.SetTextSpacing(Value: Integer);
begin
  if Value < 0 then
    Value := 0;
  if FTextSpacing <> Value then
  begin
    FTextSpacing := Value;
    LayoutChanged(True);
  end;
end;

procedure TCustomFluentToggleSwitch.SetShowHeader(Value: Boolean);
begin
  if FShowHeader <> Value then
  begin
    FShowHeader := Value;
    LayoutChanged(True);
  end;
end;

procedure TCustomFluentToggleSwitch.SetHeaderText(const Value: string);
begin
  if FHeaderText <> Value then
  begin
    FHeaderText := Value;
    LayoutChanged(True);
  end;
end;

procedure TCustomFluentToggleSwitch.SetHeaderPosition(Value: TFluentHeaderPosition);
begin
  if FHeaderPosition <> Value then
  begin
    FHeaderPosition := Value;
    LayoutChanged(True);
  end;
end;

procedure TCustomFluentToggleSwitch.SetHeaderAlignment(Value: TAlignment);
begin
  if FHeaderAlignment <> Value then
  begin
    FHeaderAlignment := Value;
    LayoutChanged(True);
  end;
end;

procedure TCustomFluentToggleSwitch.SetHeaderFont(Value: TFont);
begin
  FHeaderFont.Assign(Value);
end;

function TCustomFluentToggleSwitch.IsHeaderFontStored: Boolean;
begin
  Result := not FParentHeaderFont;
end;

procedure TCustomFluentToggleSwitch.HeaderFontChanged(Sender: TObject);
begin
  FParentHeaderFont := False;
  LayoutChanged;
end;

procedure TCustomFluentToggleSwitch.SetParentHeaderFont(Value: Boolean);
begin
  if FParentHeaderFont = Value then
    Exit;

  FParentHeaderFont := Value;
  if FParentHeaderFont then
  begin
    CopyFontToHeader;
    LayoutChanged;
  end;
end;

// The assignment must not look like a font the user picked, or it would clear
// the very flag that asked for it
procedure TCustomFluentToggleSwitch.CopyFontToHeader;
begin
  FHeaderFont.OnChange := nil;
  try
    FHeaderFont.Assign(Font);
  finally
    FHeaderFont.OnChange := HeaderFontChanged;
  end;
end;

procedure TCustomFluentToggleSwitch.SetHeaderSpacing(Value: Integer);
begin
  if Value < 0 then
    Value := 0;
  if FHeaderSpacing <> Value then
  begin
    FHeaderSpacing := Value;
    LayoutChanged(True);
  end;
end;

function TCustomFluentToggleSwitch.CurrentScale: Single;
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

function TCustomFluentToggleSwitch.TextGap: Integer;
begin
  Result := Round((FTextSpacing - (TrackAreaWidth - TrackWidth) / 2) * CurrentScale);
  if Result < 0 then
    Result := 0;
end;

function TCustomFluentToggleSwitch.HeaderGap: Integer;
begin
  Result := Round(FHeaderSpacing * CurrentScale);
end;

// Windows keeps the underline of an accelerator hidden until Alt is pressed,
// the same way it hides the focus ring
function TCustomFluentToggleSwitch.HeaderFormat: TTextFormat;
begin
  Result := [tfSingleLine, tfNoClip];
  if Perform(WM_QUERYUISTATE, 0, 0) and UISF_HIDEACCEL <> 0 then
    Include(Result, tfHidePrefix);
end;

function TCustomFluentToggleSwitch.HeaderBand: Integer;
begin
  Result := FHeaderHeight + HeaderGap;
end;

procedure TCustomFluentToggleSwitch.Measure;
var
  DC: HDC;
  SaveFont: HFONT;
  TM: TTextMetric;
  SizeOn, SizeOff: TSize;
  HeaderRect: TRect;
begin
  FTextWidth := 0;
  FHeaderWidth := 0;
  FHeaderHeight := 0;

  DC := GetDC(0);
  try
    SaveFont := SelectObject(DC, Font.Handle);

    // Taken whether or not the label is shown, because the baseline is where it would sit
    GetTextMetrics(DC, TM);
    FTextHeight := TM.tmHeight;

    if FShowText then
    begin
      GetTextExtentPoint32(DC, PChar(FTextOn), Length(FTextOn), SizeOn);
      GetTextExtentPoint32(DC, PChar(FTextOff), Length(FTextOff), SizeOff);
      FTextWidth := Max(SizeOn.cx, SizeOff.cx);
    end;

    if FShowHeader then
    begin
      SelectObject(DC, FHeaderFont.Handle);
      GetTextMetrics(DC, TM);
      HeaderRect := TRect.Empty;
      DrawText(DC, PChar(FHeaderText), Length(FHeaderText), HeaderRect,
        DT_SINGLELINE or DT_CALCRECT);
      FHeaderWidth := HeaderRect.Width;
      FHeaderHeight := TM.tmHeight;
    end;

    SelectObject(DC, SaveFont);
  finally
    ReleaseDC(0, DC);
  end;
end;

function TCustomFluentToggleSwitch.CanAutoSize(var NewWidth, NewHeight: Integer): Boolean;
begin
  Result := True;
  NewWidth := BlockWidth;
  NewHeight := Round(TrackAreaHeight * CurrentScale);

  if FShowText then
    NewHeight := Max(NewHeight, FTextHeight);

  if FShowHeader then
  begin
    NewWidth := Max(NewWidth, FHeaderWidth);
    Inc(NewHeight, HeaderBand);
  end;
end;

procedure TCustomFluentToggleSwitch.AdjustSize;
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

// Not taken from SwitchArea: that reads ClientRect, and reading it creates the window,
// which the constructor must not do before there is a parent to create it in
function TCustomFluentToggleSwitch.TopBand: Integer;
begin
  if FShowHeader and (FHeaderPosition = hpTop) then
    Result := HeaderBand
  else
    Result := 0;
end;

function TCustomFluentToggleSwitch.BlockWidth: Integer;
begin
  Result := Round(TrackAreaWidth * CurrentScale);
  if FShowText then
    Inc(Result, TextGap + FTextWidth);
end;

function TCustomFluentToggleSwitch.SwitchIndent: Integer;
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

function TCustomFluentToggleSwitch.SwitchArea: TRect;
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

// Where Paint puts the top of the label. The designer wants a baseline, and turns this into one
// with the ascent of its own reckoning, which sits a row below the one GDI draws on
function TCustomFluentToggleSwitch.TextTop: Integer;
var
  Area: TRect;
begin
  Area := SwitchArea;
  Result := Area.Top + (Area.Height - FTextHeight) div 2;
end;

procedure TCustomFluentToggleSwitch.LayoutChanged(MoveWithTheHeader: Boolean = False);
var
  Band, Indent: Integer;
begin
  // Loading measures against half-read properties and scaling against a scale not yet updated.
  // Loaded and ChangeScale each end with a pass of their own
  if FScaling or (csLoading in ComponentState) then
    Exit;

  Measure;
  AdjustSize;

  Band := TopBand;
  Indent := SwitchIndent;

  if MoveWithTheHeader and AutoSize and (Align = alNone) then
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

procedure TCustomFluentToggleSwitch.SetName(const Value: TComponentName);
var
  Seed: Boolean;
begin
  Seed := not (csLoading in ComponentState) and (FHeaderText = Name);

  inherited SetName(Value);

  if Seed then
    HeaderText := Value;
end;

procedure TCustomFluentToggleSwitch.CMFontChanged(var Msg: TMessage);
begin
  inherited;
  if FParentHeaderFont then
    CopyFontToHeader;
  LayoutChanged;
end;

procedure TCustomFluentToggleSwitch.ChangeScale(M, D: Integer; isDpiChange: Boolean);
begin
  FScaling := True;
  try
    inherited;
    if not isDpiChange and not (csLoading in ComponentState) then
      FUserScale := FUserScale * M / D;

    if not FParentHeaderFont then
      FHeaderFont.Height := MulDiv(FHeaderFont.Height, M, D);

    FStateT := 1.0;
  finally
    FScaling := False;
  end;

  LayoutChanged;
end;

procedure TCustomFluentToggleSwitch.Loaded;
begin
  inherited;
  LayoutChanged;
end;

procedure TCustomFluentToggleSwitch.CreateWnd;
begin
  inherited;
  LayoutChanged;

  // The timer belonged to the window that went, and an animation in flight still wants one
  if FAnimating then
  begin
    FAnimating := False;
    StartTimer;
  end;
end;

destructor TCustomFluentToggleSwitch.Destroy;
begin
  if FGone <> nil then
    FGone^ := True;
  FHeaderFont.Free;
  inherited;
end;

procedure TCustomFluentToggleSwitch.SetChecked(Value: Boolean);
begin
  if FChecked = Value then
    Exit;

  FChecked := Value;
  SettleThumb;
  Invalidate;

  if not (csLoading in ComponentState) then
    Change;
end;

procedure TCustomFluentToggleSwitch.SetReadOnly(Value: Boolean);
begin
  if FReadOnly = Value then
    Exit;

  FReadOnly := Value;

  // A gesture already under way would otherwise finish on the release
  if FReadOnly then
  begin
    CancelPress;
    FKeyPressed := False;
    FHovered := False;
  end;

  UpdateVisualState;
end;

procedure TCustomFluentToggleSwitch.Click;
begin
  if FReportingClick then
    inherited;
end;

procedure TCustomFluentToggleSwitch.Change;
begin
  if Assigned(FOnChange) then
    FOnChange(Self);
end;

// The system call goes last, behind the checks that cost a tick
function TCustomFluentToggleSwitch.CanAnimate: Boolean;
begin
  Result := FAnimated and HandleAllocated and Showing and SystemAnimationsOn;
end;

procedure TCustomFluentToggleSwitch.StartTimer;
begin
  if FAnimating or not HandleAllocated then
    Exit;

  FAnimating := True;
  SetTimer(Handle, AnimationTimerId, AnimationInterval, nil);
end;

procedure TCustomFluentToggleSwitch.StopTimer;
begin
  if not FAnimating then
    Exit;

  FAnimating := False;
  if HandleAllocated then
    KillTimer(Handle, AnimationTimerId);
end;

procedure TCustomFluentToggleSwitch.StartAnimation;
begin
  FAnimStartProgress := FAnimProgress;
  FSliding := True;
  QueryPerformanceCounter(FAnimStartTime);
  StartTimer;
end;

procedure TCustomFluentToggleSwitch.StartFade;
begin
  FFadeFrom := FFadeValue;
  FFadeT := 0;
  QueryPerformanceCounter(FFadeStart);
  StartTimer;
end;

procedure TCustomFluentToggleSwitch.SettleThumb;
begin
  if CanAnimate then
  begin
    StartFade;
    StartAnimation;
  end else begin
    FSliding := False;
    FAnimProgress := Ord(FChecked);
    FFadeT := 1.0;
    FFadeValue := Ord(FChecked);
  end;
end;

procedure TCustomFluentToggleSwitch.AdvanceAnimation;
var
  Counter: Int64;
  T: Single;
  Span: Integer;
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
      + (Ord(FChecked) - FAnimStartProgress) * BezierEase(T, 0.1, 0.9, 0.2, 1.0);
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
    if FState = isDisabled then
      Span := DisabledStateDuration
    else
      Span := StateDuration;

    T := (Counter - FStateStartTime) / FAnimFrequency * 1000 / Span;
    if T >= 1.0 then
      FStateT := 1.0
    else begin
      Busy := True;
      FStateT := BezierEase(T, 0, 0, 0, 1);
    end;
  end;

  if not Busy then
    StopTimer;
  Invalidate;
end;

procedure TCustomFluentToggleSwitch.SetAnimationDuration(Value: Integer);
begin
  if Value < 1 then
    Value := 1;
  FAnimationDuration := Value;
end;

// Either event may free the switch, so a local on this stack frame keeps watch.
// False says there is no switch left to come back to, and whoever nested us hears it too
function TCustomFluentToggleSwitch.Toggle: Boolean;
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

  Result := not Gone;
  if Gone then
  begin
    if Outer <> nil then
      Outer^ := True;
    Exit;
  end;

  FReportingClick := False;
  FGone := Outer;
end;

procedure TCustomFluentToggleSwitch.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if (Button = mbLeft) and Enabled and PtInRect(SwitchArea, Point(X, Y)) then
  begin
    if not FReadOnly then
    begin
      FSliding := False;

      FPressed := True;
      FDragStartX := X;
      FDragDelta := 0;
      FDragged := False;

      UpdateVisualState;
    end;

    // Taking the focus can run an OnExit that opens a dialog, and that cancels the press just made
    if TabStop and not (csDesigning in ComponentState) then
      Winapi.Windows.SetFocus(Handle);
  end;
end;

procedure TCustomFluentToggleSwitch.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Flip: Boolean;
begin
  if (Button = mbLeft) and FPressed then
  begin
    FPressed := False;
    UpdateVisualState;

    if FDragged then
    begin
      // The thumb settles into the state on its side of the track
      FAnimProgress := FAnimProgress + FDragDelta / DragTravel;
      Flip := (FAnimProgress >= 0.5) <> FChecked;
    end
    else
      Flip := PtInRect(SwitchArea, Point(X, Y));

    // A click can nudge the thumb without reaching the drag threshold
    FDragDelta := 0;

    if Flip then
    begin
      if not Toggle then
        Exit;
    end
    else
      SettleThumb;

    Invalidate;
  end;
  inherited;
end;

procedure TCustomFluentToggleSwitch.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  IsOver: Boolean;
begin
  inherited;

  // Another window may take the capture without the system cancelling the gesture
  if FPressed and not MouseCapture then
  begin
    CancelPress;
    UpdateVisualState;
  end;

  IsOver := not FReadOnly and PtInRect(SwitchArea, Point(X, Y));

  if IsOver <> FHovered then
  begin
    FHovered := IsOver;
    UpdateVisualState;
  end;

  if FPressed then
    DragThumb(X);
end;

procedure TCustomFluentToggleSwitch.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;

  if FKeyboardToggle and Enabled and not FReadOnly and (Key = VK_SPACE) and (Shift = []) then
  begin
    Key := 0;
    if not FKeyPressed then
    begin
      FKeyPressed := True;
      UpdateVisualState;
    end;
  end;
end;

procedure TCustomFluentToggleSwitch.KeyUp(var Key: Word; Shift: TShiftState);
begin
  inherited;

  if FKeyPressed and (Key = VK_SPACE) then
  begin
    Key := 0;
    FKeyPressed := False;
    UpdateVisualState;
    // Last statement on purpose: a handler is free to free the switch
    Toggle;
  end;
end;

function TCustomFluentToggleSwitch.DragTravel: Single;
begin
  Result := (ThumbCenterOnX[isPressed] - ThumbCenterOffX[isPressed]) * CurrentScale;
end;

procedure TCustomFluentToggleSwitch.DragThumb(X: Integer);
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

// No press in flight means nothing to drop, and MouseUp has already settled the ones the system cancels
procedure TCustomFluentToggleSwitch.CancelPress;
begin
  if not FPressed then
    Exit;

  FPressed := False;
  FDragged := False;
  FDragDelta := 0;
  SettleThumb;
end;

// The system takes the gesture back, so the button up TControl synthesises next finds nothing to act on
procedure TCustomFluentToggleSwitch.WMCancelMode(var Msg: TMessage);
begin
  CancelPress;
  UpdateVisualState;
  inherited;
end;

// MouseMove raises the hover, by the area the pointer answers for; once the pointer is gone
// no move will come, so dropping it is left to here
procedure TCustomFluentToggleSwitch.CMMouseLeave(var Msg: TMessage);
begin
  inherited;
  FHovered := False;
  if not MouseCapture then
    CancelPress;
  UpdateVisualState;
end;

procedure TCustomFluentToggleSwitch.WMSetFocus(var Msg: TWMSetFocus);
begin
  inherited;
  Invalidate;
end;

procedure TCustomFluentToggleSwitch.WMKillFocus(var Msg: TWMKillFocus);
begin
  inherited;
  if FKeyPressed then
  begin
    FKeyPressed := False;
    UpdateVisualState;
  end;
  Invalidate;
end;

// An ampersand in the header marks the accelerator, and Alt plus that letter
// works the switch as if it had been clicked
procedure TCustomFluentToggleSwitch.CMDialogChar(var Msg: TCMDialogChar);
begin
  if FShowHeader and Enabled and CanFocus and IsAccel(Msg.CharCode, FHeaderText) then
  begin
    SetFocus;
    Msg.Result := 1;
    // Last statement on purpose: a handler is free to free the switch
    if FKeyboardToggle and not FReadOnly then
      Toggle;
  end
  else
    inherited;
end;

procedure TCustomFluentToggleSwitch.WMTimer(var Msg: TWMTimer);
begin
  if Msg.TimerID = AnimationTimerId then
    AdvanceAnimation
  else
    inherited;
end;

procedure TCustomFluentToggleSwitch.WMUpdateUIState(var Msg: TMessage);
begin
  inherited;
  // The ring, or the underline in the header, may have just been shown or
  // hidden for the whole window
  if Focused or FShowHeader then
    Invalidate;
end;

// Each instance keeps its own baseline, because OnTrackFill is shared and a sibling may have refreshed it first
procedure TCustomFluentToggleSwitch.RereadAccent;
var
  Before: ARGB;
begin
  Before := FKnownAccent;
  InitAccentColors;
  FKnownAccent := OnTrackFill[isNormal];
  if FKnownAccent <> Before then
    Invalidate;
end;

procedure TCustomFluentToggleSwitch.CMSysColorChange(var Msg: TMessage);
begin
  inherited;
  RereadAccent;
end;

procedure TCustomFluentToggleSwitch.CMWinIniChange(var Msg: TMessage);
begin
  inherited;
  RereadAccent;
end;

procedure TCustomFluentToggleSwitch.CMEnabledChanged(var Msg: TMessage);
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

function TCustomFluentToggleSwitch.GetInteractionState: TFluentInteractionState;
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

function TCustomFluentToggleSwitch.StateVisual(S: TFluentInteractionState): TFluentVisualState;
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
end;

function TCustomFluentToggleSwitch.CurrentVisual: TFluentVisualState;
begin
  Result := StateVisual(FState);

  if FStateT < 1.0 then
    Result := LerpVisual(FStateFrom, Result, FStateT);
end;

procedure TCustomFluentToggleSwitch.UpdateVisualState;
var
  NewState: TFluentInteractionState;
begin
  NewState := GetInteractionState;
  if NewState = FState then
    Exit;

  FStateFrom := CurrentVisual;
  FState := NewState;
  if CanAnimate then
  begin
    FStateT := 0;
    QueryPerformanceCounter(FStateStartTime);
    StartTimer;
  end else
    FStateT := 1.0;

  Invalidate;
end;

procedure TCustomFluentToggleSwitch.Paint;
var
  G: TGPGraphics;
  Path: TGPGraphicsPath;
  Brush: TGPSolidBrush;
  Pen: TGPPen;
  TrackX, TrackY: Single;
  TrackW, TrackH, PenW, K: Single;
  VS: TFluentVisualState;
  OffFill, OffStroke, OnFill: ARGB;
  OffThumb, OnThumb: ARGB;
  OffOpacity, Fade: Single;
  ThumbCX, ThumbCY: Single;
  ThumbW, ThumbH: Single;
  TextX, TextY: Integer;
  HeaderX, HeaderY: Integer;
  RowTop, RowHeight, TrackOffsetX: Integer;
  Area, HeaderRect: TRect;
  LabelText: string;

  function Pick(Custom: TColor; Standard: ARGB): ARGB;
  begin
    if Custom = clDefault then
      Result := Standard
    else
      Result := TColorToARGB(Custom);
  end;

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
  RowTop := Area.Top;
  RowHeight := Area.Height;
  TrackOffsetX := Area.Left;
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
      TextX := TrackOffsetX;
      TrackOffsetX := TrackOffsetX + FTextWidth + TextGap;
    end else
      TextX := TrackOffsetX + Round(TrackAreaWidth * K) + TextGap;

    TextY := RowTop + (RowHeight - FTextHeight) div 2;
  end;

  TrackX := TrackOffsetX + Round((TrackAreaWidth - TrackWidth) * K / 2);
  TrackY := RowTop + Round((RowHeight - TrackH) / 2);

  VS := CurrentVisual;
  Fade := FFadeValue;
  OffOpacity := 1 - Fade;

  OffFill   := Pick(FTrackColorOff, VS.TrackOff);
  OffStroke := Pick(FTrackFrameColor, VS.StrokeOff);
  OnFill    := Pick(FTrackColorOn, VS.TrackOn);
  OffThumb  := Pick(FThumbColorOff, VS.ThumbOff);
  OnThumb   := Pick(FThumbColorOn, OnThumbFill);

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
      LabelText := FHeaderText;
      HeaderRect := Rect(HeaderX, HeaderY, HeaderX + FHeaderWidth, HeaderY + FHeaderHeight);
      Canvas.TextRect(HeaderRect, LabelText, HeaderFormat);
    end;
  end;

  if FocusRingWanted then
  begin
    Canvas.Brush.Style := bsSolid;
    Canvas.DrawFocusRect(Area);
  end;
end;

initialization
  InitAccentColors;

end.
