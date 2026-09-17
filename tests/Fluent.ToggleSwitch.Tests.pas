unit Fluent.ToggleSwitch.Tests;

interface

uses
  DUnitX.TestFramework,
  Winapi.Windows,
  Winapi.Messages,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Graphics,
  Fluent.ToggleSwitch;

type
  [TestFixture]
  TToggleSwitchTest = class
  private
    FForm: TForm;
    FToggle: TFluentToggleSwitch;
    FOnChangeFired: Boolean;
    FOnChangeCount: Integer;
    FOnClickCount: Integer;
    FCheckedWhenClicked: Boolean;
    FDblClickCount: Integer;
    procedure HandleOnClick(Sender: TObject);
    procedure HandleOnChange(Sender: TObject);
    procedure Render(Toggle: TFluentToggleSwitch);
    procedure PaintOnto(Toggle: TFluentToggleSwitch; Target: TBitmap);
    procedure CreateRenderDestroy;
    procedure Press(X: Integer);
    procedure MoveTo(X: Integer);
    procedure Release(X: Integer);
    procedure PressAt(X, Y: Integer);
    procedure MoveToAt(X, Y: Integer);
    procedure ReleaseAt(X, Y: Integer);
    procedure HandleDblClick(Sender: TObject);
    procedure FreeTheSender(Sender: TObject);
    procedure PressKey(Key: Word);
    procedure FocusTheSwitch;
    function RingShows(Toggle: TFluentToggleSwitch): Boolean;
    procedure ReleaseKey(Key: Word);
    function RenderToBitmap(Toggle: TFluentToggleSwitch): TBitmap;
    function DescribeDifference(A, B: TBitmap; FromY: Integer = 0): string;
    procedure DifferingColumns(A, B: TBitmap; out First, Last: Integer);
    function LineHeight(Font: TFont): Integer;
    function TrackLeftOnForm: Integer;
    procedure CopyThroughStream(Source, Target: TFluentToggleSwitch);
    function StreamFormWithSwitch(out Loaded: TFluentToggleSwitch;
      out SourceWidth: Integer): TForm;
    function AsText(Source: TFluentToggleSwitch): string;
    procedure LoadText(const Dfm: string; Target: TFluentToggleSwitch);
  public
    [SetupFixture]
    procedure SetupFixture;
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;

    // --- Color properties ---

    [Test]
    procedure DefaultColorsShouldBeClDefault;






    // --- Text properties ---

    [Test]
    procedure DefaultShowText_ShouldBeFalse;

    [Test]
    procedure DefaultTextValues;

    [Test]
    procedure DefaultTextPosition_ShouldBeTpRight;

    [Test]
    procedure DefaultTextSpacing_ShouldBe12;

    [Test]
    procedure SetShowText_True_ShouldIncreaseWidth;

    [Test]
    procedure SetShowText_False_ShouldResetWidth;



    [Test]
    procedure SetTextSpacing_Negative_ShouldClampToZero;

    [Test]
    procedure SetTextOn_ShouldAffectWidth;


    // --- Toggle and events ---

    [Test]
    procedure SetTextOn_BeforeParent_ShouldNotRaise;

    [Test]
    procedure Toggle_ShouldChangeChecked;

    [Test]
    procedure SetChecked_ShouldFireOnChange;


    [Test]
    procedure Space_ShouldFireOnClick;


    [Test]
    procedure SetChecked_ShouldNotFireOnClick;

    [Test]
    procedure DblClick_ShouldStillReachItsEvent;

    [Test]
    procedure Freed_InOnChange_ShouldNotComeBackTo;

    [Test]
    procedure Release_OffTheSwitch_ShouldLeaveNothingBehind;

    [Test]
    procedure Space_ShouldToggleOnKeyUp;

    [Test]
    procedure Space_Held_ShouldToggleOnce;

    [Test]
    procedure Space_KeyUpAlone_ShouldNotToggle;

    [Test]
    procedure Enter_ShouldNotToggle;

    [Test]
    procedure KeyboardToggle_False_Space_ShouldNotToggle;

    [Test]
    procedure TabStop_ShouldBeTrueByDefault;

    [Test]
    procedure ShowFocus_ShouldBeTrueByDefault;

    [Test]
    procedure Focused_ShouldDrawTheRing;

    [Test]
    procedure Focused_WithHeaderAndText_ShouldDrawTheRing;

    [Test]
    procedure Unfocused_ShouldDrawNoRing;

    [Test]
    procedure DragPastMiddle_ShouldTurnOnAndFireOnChange;

    [Test]
    procedure DragShort_ShouldSnapBackAndFireNothing;

    [Test]
    procedure Click_ShouldToggleAndFireBothEvents;

    [Test]
    procedure Click_ReleasedOutside_ShouldNotToggle;

    [Test]
    procedure DragPastMiddle_ReleasedOutside_ShouldStillToggle;

    [Test]
    procedure DragAwayFromTravel_ShouldNotToggle;

    [Test]
    procedure Click_OnLabel_ShouldToggle;

    [Test]
    procedure Click_OnHeader_ShouldNotToggle;

    [Test]
    procedure DragBackPastMiddle_ShouldTurnOffAndFireOnChange;

    [Test]
    procedure RightButton_ShouldNotToggle;

    [Test]
    procedure Enabled_False_Click_ShouldNotToggle;

    [Test]
    procedure Enabled_False_WhilePressed_ShouldCancelThePress;

    [Test]
    procedure Enabled_False_MidDrag_ShouldSettleTheThumb;

    [Test]
    procedure CancelMode_MidPress_ShouldNotToggle;

    [Test]
    procedure ParentColor_ShouldBeTrueByDefault;

    [Test]
    procedure DefaultChecked_ShouldBeFalse;

    [Test]
    procedure DefaultAnimationDuration_ShouldMatchWinUI;

    [Test]
    procedure AnimationDuration_ShouldClampToPositive;

    [Test]
    procedure Paint_ShouldNotChangeSize;

    [Test]
    procedure CreateAndDestroy_ShouldNotLeak;

    // --- Scaling ---

    [Test]
    procedure Scale_96_ShouldUseTheDesignSize;

    [Test]
    procedure Scale_120_ShouldGrowWithTheScale;

    [Test]
    procedure Scale_144_ShouldGrowWithTheScale;

    [Test]
    procedure Scale_192_ShouldGrowWithTheScale;

    [Test]
    procedure Scale_ThereAndBack_ShouldNotDrift;

    [Test]
    procedure AutoSize_False_ShouldKeepTheGivenSize;

    [Test]
    procedure AutoSize_True_ShouldMeasureAgain;

    // --- Header ---

    [Test]
    procedure DefaultHeaderValues;


    [Test]
    procedure ShowHeader_True_ShouldKeepTheTrackInPlace;

    [Test]
    procedure HeaderText_Long_ShouldKeepTheTrackInPlace;

    [Test]
    procedure HeaderAlignment_ShouldCarryTheSwitchWithIt;

    [Test]
    procedure SetName_ShouldSeedTheHeaderText;

    [Test]
    procedure ShowHeader_LongText_ShouldWidenTheControl;

    [Test]
    procedure HeaderPosition_ShouldNotChangeTheSize;

    // --- Streaming ---

    [Test]
    procedure Stream_RoundTrip_ShouldRestoreEveryPublishedProperty;

    [Test]
    procedure Stream_Defaults_ShouldWriteNoOwnProperty;

    [Test]
    procedure Stream_Load_ShouldNotFireOnChange;

    [Test]
    procedure Stream_HeaderFont_Custom_ShouldRoundTrip;

    [Test]
    procedure Stream_HeaderFont_Default_ShouldNotBeStored;

    [Test]
    procedure Stream_Load_WithShowText_ShouldMeasureAfterLoad;

    [Test]
    procedure Stream_Font_WithHeaderFollowing_ShouldRoundTrip;

    [Test]
    procedure Stream_InsideForm_ShouldRestoreParentAndSize;
  end;

implementation

uses
  System.SysUtils;

const
  // Design pixels the expectations below are written in. Setup pins the
  // control to this scale, so the numbers hold on any machine.
  DesignPPI = 96;
  // Press points near each end of the track, at DesignPPI: the thumb rests at
  // 10 and 30 (ThumbCenterOffX and ThumbCenterOnX in source/Fluent.ToggleSwitch.pas).
  // A drag only cares about the distance between them
  ThumbOffX = 11;
  ThumbOnX = 31;
  // Mirrors DragThreshold and the track area in source/Fluent.ToggleSwitch.pas
  DragThreshold = 4;
  TrackAreaWidth = 42;
  TrackAreaHeight = 22;

procedure TToggleSwitchTest.Setup;
begin
  // DUnitX keeps one fixture for the lot, so the counters start over here
  FOnChangeFired := False;
  FOnChangeCount := 0;
  FOnClickCount := 0;
  FCheckedWhenClicked := False;
  FDblClickCount := 0;

  FForm := TForm.CreateNew(nil);
  FToggle := TFluentToggleSwitch.Create(FForm);
  FToggle.Parent := FForm;
  // Every expectation below is in design pixels, so the suite has to say at
  // which scale it reads them instead of inheriting the machine's
  FToggle.ScaleForPPI(DesignPPI);
end;

procedure TToggleSwitchTest.TearDown;
begin
  FForm.Free;
end;

// The first window, paint and mouse input of the process fill VCL caches
// (screen lists, font handles, focus and hint bookkeeping) that live until
// shutdown. Taking that hit once here keeps the per-test leak monitor
// focused on what each test itself leaves behind. A test that opens a new
// first-time VCL path fails once with a bogus leak: extend this warm-up
// rather than ignore the test.
procedure TToggleSwitchTest.SetupFixture;
var
  Tmp: TFluentToggleSwitch;
  Width: Integer;
begin
  Setup;
  try
    FToggle.ShowText := True;
    Render(FToggle);
    Press(ThumbOffX);
    MoveTo(ThumbOnX);
    Release(ThumbOnX);
    // Destroying a child while its parent lives is a path of its own
    CreateRenderDestroy;
    // Parsing a text DFM brings up the RTL encoding singletons
    Tmp := TFluentToggleSwitch.Create(nil);
    try
      LoadText('object TFluentToggleSwitch'#13#10'  ShowText = True'#13#10'end', Tmp);
    finally
      Tmp.Free;
    end;
    // Writing one out brings up the other half of them
    AsText(FToggle);
    // Streaming a whole form brings up the class registry entry and the
    // reader's path for creating children
    StreamFormWithSwitch(Tmp, Width).Free;
    // The first keyboard message has bookkeeping of its own
    PressKey(VK_SPACE);
    ReleaseKey(VK_SPACE);
    // A window on screen, real focus and a rendering of both are each a first
    // time of their own
    FocusTheSwitch;
    RingShows(FToggle);
  finally
    TearDown;
  end;
end;

procedure TToggleSwitchTest.Render(Toggle: TFluentToggleSwitch);
var
  Bmp: TBitmap;
begin
  Bmp := TBitmap.Create;
  try
    Bmp.SetSize(Toggle.Width, Toggle.Height);
    PaintOnto(Toggle, Bmp);
  finally
    Bmp.Free;
  end;
end;

// A control with no window of its own paints nothing at all, and PaintTo says
// so by leaving the bitmap untouched. Asking for the handle is what makes the
// difference between a real drawing and a blank one
procedure TToggleSwitchTest.PaintOnto(Toggle: TFluentToggleSwitch; Target: TBitmap);
var
  Window: HWND;
begin
  Window := Toggle.Handle;
  Assert.IsTrue(Window <> 0, 'The control has a window to paint from');
  Toggle.PaintTo(Target.Canvas.Handle, 0, 0);
end;

// Painting is what builds the GDI+ objects, so a lifetime worth checking
// has to render
procedure TToggleSwitchTest.CreateRenderDestroy;
var
  Tmp: TFluentToggleSwitch;
begin
  Tmp := TFluentToggleSwitch.Create(nil);
  try
    Tmp.Parent := FForm;
    Tmp.ShowText := True;
    Render(Tmp);
  finally
    Tmp.Free;
  end;
end;

// Mouse messages land at the vertical middle of the control
// A coordinate outside the control is normal here, and MakeLParam takes
// words, so the sign travels in the bits the way Windows sends it
procedure TToggleSwitchTest.Press(X: Integer);
begin
  PressAt(X, FToggle.Height div 2);
end;

procedure TToggleSwitchTest.PressAt(X, Y: Integer);
begin
  FToggle.Perform(WM_LBUTTONDOWN, MK_LBUTTON, MakeLParam(Word(X), Word(Y)));
end;

procedure TToggleSwitchTest.MoveToAt(X, Y: Integer);
begin
  FToggle.Perform(WM_MOUSEMOVE, MK_LBUTTON, MakeLParam(Word(X), Word(Y)));
end;

procedure TToggleSwitchTest.ReleaseAt(X, Y: Integer);
begin
  FToggle.Perform(WM_LBUTTONUP, 0, MakeLParam(Word(X), Word(Y)));
end;

procedure TToggleSwitchTest.MoveTo(X: Integer);
begin
  FToggle.Perform(WM_MOUSEMOVE, MK_LBUTTON,
    MakeLParam(Word(X), Word(FToggle.Height div 2)));
end;

procedure TToggleSwitchTest.Release(X: Integer);
begin
  ReleaseAt(X, FToggle.Height div 2);
end;

// Real focus needs a window on screen, so the form goes where nobody will see
// it. Windows keeps focus rings hidden until someone navigates by keyboard,
// which is what the UI state message stands in for here
procedure TToggleSwitchTest.FocusTheSwitch;
begin
  FForm.Position := poDesigned;
  FForm.SetBounds(-4000, -4000, 200, 200);
  FForm.Show;
  FToggle.SetFocus;
  FForm.Perform(WM_CHANGEUISTATE, MakeWParam(UIS_CLEAR, UISF_HIDEFOCUS), 0);
end;

// Whether the switch paints anything that turning ShowFocus off takes away
function TToggleSwitchTest.RingShows(Toggle: TFluentToggleSwitch): Boolean;
var
  WithRing, WithoutRing: TBitmap;
  Was: Boolean;
begin
  WithRing := nil;
  WithoutRing := nil;
  Was := Toggle.ShowFocus;
  try
    Toggle.ShowFocus := True;
    WithRing := RenderToBitmap(Toggle);
    Toggle.ShowFocus := False;
    WithoutRing := RenderToBitmap(Toggle);
    Result := DescribeDifference(WithRing, WithoutRing) <> '';
  finally
    WithoutRing.Free;
    WithRing.Free;
    Toggle.ShowFocus := Was;
  end;
end;

procedure TToggleSwitchTest.PressKey(Key: Word);
begin
  FToggle.Perform(WM_KEYDOWN, Key, 0);
end;

procedure TToggleSwitchTest.ReleaseKey(Key: Word);
begin
  FToggle.Perform(WM_KEYUP, Key, 0);
end;

// The control as it would paint right now
// Where the track sits on the form. The switch centres itself under a header
// wider than it is, which is what HeaderAlignment defaults to
function TToggleSwitchTest.TrackLeftOnForm: Integer;
begin
  Result := FToggle.Left + (FToggle.Width - TrackAreaWidth) div 2;
end;

function TToggleSwitchTest.RenderToBitmap(Toggle: TFluentToggleSwitch): TBitmap;
begin
  Result := TBitmap.Create;
  try
    Result.PixelFormat := pf32bit;
    Result.SetSize(Toggle.Width, Toggle.Height);
    PaintOnto(Toggle, Result);
  except
    Result.Free;
    raise;
  end;
end;

// Empty when the two look the same. Otherwise says how much differs and
// where, which tells a thumb that moved from a color that changed. Only the
// color bits count: the fourth byte of a 32-bit DIB is not painted by GDI and
// carries whatever GDI+ happened to leave there
// The columns two renders differ in. First comes back as -1 when they match.
// Saying where the difference is, and not merely that there is one, is what
// tells a focus ring apart from a ring drawn over the track outline
procedure TToggleSwitchTest.DifferingColumns(A, B: TBitmap; out First, Last: Integer);
type
  PRow = ^TRow;
  TRow = array[0..MaxInt div SizeOf(Cardinal) - 1] of Cardinal;
const
  ColorBits = $00FFFFFF;
var
  X, Y: Integer;
  RowA, RowB: PRow;
begin
  First := -1;
  Last := -1;
  for Y := 0 to A.Height - 1 do
  begin
    RowA := A.ScanLine[Y];
    RowB := B.ScanLine[Y];
    for X := 0 to A.Width - 1 do
      if (RowA^[X] and ColorBits) <> (RowB^[X] and ColorBits) then
      begin
        if (First < 0) or (X < First) then
          First := X;
        if X > Last then
          Last := X;
      end;
  end;
end;

// A line of the given font, measured the way the switch measures it. The font
// carries its height in pixels, so any device context answers the same
function TToggleSwitchTest.LineHeight(Font: TFont): Integer;
var
  Bmp: TBitmap;
  TM: TTextMetric;
begin
  Bmp := TBitmap.Create;
  try
    Bmp.Canvas.Font := Font;
    GetTextMetrics(Bmp.Canvas.Handle, TM);
    Result := TM.tmHeight;
  finally
    Bmp.Free;
  end;
end;

function TToggleSwitchTest.DescribeDifference(A, B: TBitmap; FromY: Integer = 0): string;
type
  PRow = ^TRow;
  TRow = array[0..MaxInt div SizeOf(Cardinal) - 1] of Cardinal;
const
  ColorBits = $00FFFFFF;
var
  X, Y, Count, MinX, MaxX, FirstX, FirstY: Integer;
  RowA, RowB: PRow;
  FirstA, FirstB: Cardinal;
begin
  Count := 0;
  MinX := A.Width;
  MaxX := -1;
  FirstX := -1;
  FirstY := -1;
  FirstA := 0;
  FirstB := 0;
  for Y := FromY to A.Height - 1 do
  begin
    RowA := A.ScanLine[Y];
    RowB := B.ScanLine[Y];
    for X := 0 to A.Width - 1 do
      if (RowA^[X] and ColorBits) <> (RowB^[X] and ColorBits) then
      begin
        Inc(Count);
        if X < MinX then
          MinX := X;
        if X > MaxX then
          MaxX := X;
        if FirstX < 0 then
        begin
          FirstX := X;
          FirstY := Y;
          FirstA := RowA^[X];
          FirstB := RowB^[X];
        end;
      end;
  end;
  if Count = 0 then
    Result := ''
  else
    Result := Format('%d of %d pixels differ, in columns %d..%d; at %d,%d %.8x against %.8x',
      [Count, A.Width * A.Height, MinX, MaxX, FirstX, FirstY, FirstA, FirstB]);
end;

// --- Color tests ---

procedure TToggleSwitchTest.DefaultColorsShouldBeClDefault;
begin
  Assert.AreEqual(TColor(clDefault), FToggle.TrackFrameColor);
  Assert.AreEqual(TColor(clDefault), FToggle.TrackColorOff);
  Assert.AreEqual(TColor(clDefault), FToggle.TrackColorOn);
  Assert.AreEqual(TColor(clDefault), FToggle.ThumbColorOff);
  Assert.AreEqual(TColor(clDefault), FToggle.ThumbColorOn);
end;






// --- Text tests ---

procedure TToggleSwitchTest.DefaultShowText_ShouldBeFalse;
begin
  Assert.IsFalse(FToggle.ShowText);
end;

procedure TToggleSwitchTest.DefaultTextValues;
begin
  Assert.AreEqual('On', FToggle.TextOn);
  Assert.AreEqual('Off', FToggle.TextOff);
end;

procedure TToggleSwitchTest.DefaultTextPosition_ShouldBeTpRight;
begin
  Assert.AreEqual(Ord(tpRight), Ord(FToggle.TextPosition));
end;

procedure TToggleSwitchTest.DefaultTextSpacing_ShouldBe12;
begin
  Assert.AreEqual(12, FToggle.TextSpacing);
end;

procedure TToggleSwitchTest.SetShowText_True_ShouldIncreaseWidth;
var
  WidthBefore: Integer;
begin
  WidthBefore := FToggle.Width;
  FToggle.ShowText := True;
  Assert.IsTrue(FToggle.Width > WidthBefore, 'Width should increase when ShowText is True');
end;

procedure TToggleSwitchTest.SetShowText_False_ShouldResetWidth;
begin
  FToggle.ShowText := True;
  FToggle.ShowText := False;
  Assert.AreEqual(42, FToggle.Width);
end;



procedure TToggleSwitchTest.SetTextSpacing_Negative_ShouldClampToZero;
begin
  FToggle.TextSpacing := -5;
  Assert.AreEqual(0, FToggle.TextSpacing);
end;

procedure TToggleSwitchTest.SetTextOn_ShouldAffectWidth;
var
  WidthBefore, WidthAfter: Integer;
begin
  FToggle.ShowText := True;
  WidthBefore := FToggle.Width;
  FToggle.TextOn := 'Long text value for testing';
  WidthAfter := FToggle.Width;
  Assert.IsTrue(WidthAfter > WidthBefore, 'Width should increase with longer TextOn');
end;


// --- Toggle and event tests ---

procedure TToggleSwitchTest.HandleOnChange(Sender: TObject);
begin
  FOnChangeFired := True;
  Inc(FOnChangeCount);
end;

procedure TToggleSwitchTest.HandleDblClick(Sender: TObject);
begin
  Inc(FDblClickCount);
end;

procedure TToggleSwitchTest.FreeTheSender(Sender: TObject);
begin
  TFluentToggleSwitch(Sender).Free;
end;

procedure TToggleSwitchTest.HandleOnClick(Sender: TObject);
begin
  Inc(FOnClickCount);
  FCheckedWhenClicked := TFluentToggleSwitch(Sender).Checked;
end;

procedure TToggleSwitchTest.SetTextOn_BeforeParent_ShouldNotRaise;
begin
  Assert.WillNotRaise(
    procedure
    var
      Tmp: TFluentToggleSwitch;
    begin
      Tmp := TFluentToggleSwitch.Create(nil);
      try
        Tmp.ShowText := True;
        Tmp.TextOn := 'Test';
        Tmp.TextOff := 'Off test';
        Tmp.TextPosition := tpLeft;
        Tmp.TextSpacing := 12;
      finally
        Tmp.Free;
      end;
    end, nil, 'Text properties are usable before the control has a parent');
end;

procedure TToggleSwitchTest.Toggle_ShouldChangeChecked;
begin
  FToggle.Checked := True;
  Assert.IsTrue(FToggle.Checked);
  FToggle.Checked := False;
  Assert.IsFalse(FToggle.Checked);
end;

// OnChange is about the value, whoever moved it
procedure TToggleSwitchTest.SetChecked_ShouldFireOnChange;
begin
  FOnChangeCount := 0;
  FToggle.OnChange := HandleOnChange;
  FToggle.Checked := True;
  FToggle.Checked := True;
  FToggle.Checked := False;
  Assert.AreEqual(2, FOnChangeCount, 'Twice for two real changes, not for the repeat');
end;

// OnClick is about the action, and by the time it arrives the value is the one
// the user asked for

procedure TToggleSwitchTest.Space_ShouldFireOnClick;
begin
  FOnClickCount := 0;
  FToggle.OnClick := HandleOnClick;
  PressKey(VK_SPACE);
  ReleaseKey(VK_SPACE);
  Assert.AreEqual(1, FOnClickCount, 'The keyboard acts on the switch too');
  Assert.IsTrue(FCheckedWhenClicked, 'and the handler sees the new value');
end;

// Taking the click over from TControl must not take the double click with it
procedure TToggleSwitchTest.DblClick_ShouldStillReachItsEvent;
begin
  FDblClickCount := 0;
  FToggle.OnDblClick := HandleDblClick;
  FToggle.Perform(WM_LBUTTONDBLCLK, MK_LBUTTON,
    MakeLParam(Word(ThumbOffX), Word(FToggle.Height div 2)));
  Assert.AreEqual(1, FDblClickCount, 'A double click still reaches its handler');
end;

// A handler is allowed to free the switch, and nothing may touch it afterwards
procedure TToggleSwitchTest.Freed_InOnChange_ShouldNotComeBackTo;
var
  Doomed: TFluentToggleSwitch;
begin
  Doomed := TFluentToggleSwitch.Create(FForm);
  Doomed.Parent := FForm;
  Doomed.ScaleForPPI(DesignPPI);
  Doomed.OnChange := FreeTheSender;
  Assert.WillNotRaise(
    procedure
    begin
      Doomed.Perform(WM_LBUTTONDOWN, MK_LBUTTON,
        MakeLParam(Word(ThumbOffX), Word(Doomed.Height div 2)));
      Doomed.Perform(WM_LBUTTONUP, 0,
        MakeLParam(Word(ThumbOffX), Word(Doomed.Height div 2)));
    end, nil, 'The switch survives being freed from its own event');
end;

// The header is not part of the switch, so letting go there is not a click and
// must not leave the thumb or the colour half way
procedure TToggleSwitchTest.Release_OffTheSwitch_ShouldLeaveNothingBehind;
var
  Clean, After: TBitmap;
  Middle: Integer;
begin
  Clean := nil;
  After := nil;
  try
    FToggle.HeaderText := 'Header';
    FToggle.ShowHeader := True;
    // The pointer and the focus are beside the point here: put the switch in
    // the state the press will leave it in, minus the press itself
    FToggle.ShowFocus := False;
    Middle := FToggle.Height - TrackAreaHeight div 2;
    MoveToAt(ThumbOffX, Middle);
    Clean := RenderToBitmap(FToggle);
    PressAt(ThumbOffX, Middle);
    MoveToAt(ThumbOffX + 2, Middle);
    ReleaseAt(ThumbOffX + 2, 0);
    After := RenderToBitmap(FToggle);
    Assert.AreEqual('', DescribeDifference(Clean, After),
      'Nothing of the press is left on the switch');
  finally
    After.Free;
    Clean.Free;
  end;
end;


procedure TToggleSwitchTest.SetChecked_ShouldNotFireOnClick;
begin
  FOnClickCount := 0;
  FToggle.OnClick := HandleOnClick;
  FToggle.Checked := True;
  Assert.AreEqual(0, FOnClickCount, 'Nobody clicked anything');
end;

// Acting on the release is what keeps a held key from firing over and over
procedure TToggleSwitchTest.Space_ShouldToggleOnKeyUp;
begin
  FOnChangeCount := 0;
  FToggle.OnChange := HandleOnChange;
  PressKey(VK_SPACE);
  Assert.IsFalse(FToggle.Checked, 'Holding Space down does not toggle yet');
  ReleaseKey(VK_SPACE);
  Assert.IsTrue(FToggle.Checked, 'Letting Space go toggles the switch');
  Assert.AreEqual(1, FOnChangeCount, 'and fires OnChange once');
end;

procedure TToggleSwitchTest.Space_Held_ShouldToggleOnce;
begin
  FOnChangeCount := 0;
  FToggle.OnChange := HandleOnChange;
  // What auto-repeat looks like from here
  PressKey(VK_SPACE);
  PressKey(VK_SPACE);
  PressKey(VK_SPACE);
  ReleaseKey(VK_SPACE);
  Assert.IsTrue(FToggle.Checked, 'A held Space still toggles once');
  Assert.AreEqual(1, FOnChangeCount, 'and fires OnChange once');
end;

procedure TToggleSwitchTest.Space_KeyUpAlone_ShouldNotToggle;
begin
  FOnChangeFired := False;
  FToggle.OnChange := HandleOnChange;
  // A key pressed somewhere else and released over us
  ReleaseKey(VK_SPACE);
  Assert.IsFalse(FToggle.Checked, 'A release without a press here changes nothing');
  Assert.IsFalse(FOnChangeFired, 'and fires nothing');
end;

procedure TToggleSwitchTest.Enter_ShouldNotToggle;
begin
  FOnChangeFired := False;
  FToggle.OnChange := HandleOnChange;
  PressKey(VK_RETURN);
  ReleaseKey(VK_RETURN);
  Assert.IsFalse(FToggle.Checked, 'Enter belongs to the default button, not to us');
  Assert.IsFalse(FOnChangeFired, 'and fires nothing');
end;

procedure TToggleSwitchTest.KeyboardToggle_False_Space_ShouldNotToggle;
begin
  FToggle.KeyboardToggle := False;
  FOnChangeFired := False;
  FToggle.OnChange := HandleOnChange;
  PressKey(VK_SPACE);
  ReleaseKey(VK_SPACE);
  Assert.IsFalse(FToggle.Checked, 'With the keyboard turned off Space does nothing');
  Assert.IsFalse(FOnChangeFired, 'and fires nothing');
end;

procedure TToggleSwitchTest.TabStop_ShouldBeTrueByDefault;
begin
  Assert.IsTrue(FToggle.TabStop, 'Tab reaches the switch like any other control');
end;

procedure TToggleSwitchTest.ShowFocus_ShouldBeTrueByDefault;
begin
  Assert.IsTrue(FToggle.ShowFocus, 'The switch is allowed to show a focus ring');
  Assert.IsTrue(FToggle.KeyboardToggle, 'and answers the keyboard');
end;

procedure TToggleSwitchTest.Focused_ShouldDrawTheRing;
var
  Unfocused, WithRing: TBitmap;
  First, Last: Integer;
begin
  Unfocused := nil;
  WithRing := nil;
  try
    Unfocused := RenderToBitmap(FToggle);
    FocusTheSwitch;
    Assert.IsTrue(FToggle.Focused, 'The switch holds the focus');
    WithRing := RenderToBitmap(FToggle);
    // The ring goes on the bounds of the switch area, which for a bare switch
    // is the whole control. A ring that landed on the track outline instead
    // would still differ from the unfocused render, only not out here
    DifferingColumns(Unfocused, WithRing, First, Last);
    Assert.AreEqual(0, First, 'The ring reaches the first column of the control');
    Assert.AreEqual(FToggle.Width - 1, Last, 'and the last one');
    Assert.IsTrue(RingShows(FToggle), 'and ShowFocus takes it away again');
  finally
    WithRing.Free;
    Unfocused.Free;
  end;
end;

// The case that went unnoticed: the labels used to leave a hollow brush behind
// and GDI drew no rectangle at all
procedure TToggleSwitchTest.Focused_WithHeaderAndText_ShouldDrawTheRing;
begin
  FToggle.ShowText := True;
  FToggle.HeaderText := 'Header';
  FToggle.ShowHeader := True;
  FocusTheSwitch;
  Assert.IsTrue(RingShows(FToggle), 'A caption and a header do not hide the ring');
end;

procedure TToggleSwitchTest.Unfocused_ShouldDrawNoRing;
var
  Bmp: TBitmap;
begin
  Assert.IsFalse(FToggle.Focused, 'Nothing gave the switch the focus');
  Bmp := RenderToBitmap(FToggle);
  try
    // RingShows answers False for a switch that draws nothing either, so say
    // first that there is a switch on the bitmap to speak about
    Assert.IsTrue(Bmp.Canvas.Pixels[0, 0] <> Bmp.Canvas.Pixels[ThumbOffX, TrackAreaHeight div 2],
      'The thumb is on the bitmap, so the switch did draw itself');
  finally
    Bmp.Free;
  end;
  Assert.IsFalse(RingShows(FToggle), 'so ShowFocus changes nothing');
end;

procedure TToggleSwitchTest.DragPastMiddle_ShouldTurnOnAndFireOnChange;
begin
  FOnChangeFired := False;
  FToggle.OnChange := HandleOnChange;
  Press(ThumbOffX);
  MoveTo(ThumbOnX);
  Release(ThumbOnX);
  Assert.IsTrue(FToggle.Checked, 'Thumb released past the middle turns the switch on');
  Assert.IsTrue(FOnChangeFired, 'OnChange fires on a user drag');
end;

procedure TToggleSwitchTest.DragShort_ShouldSnapBackAndFireNothing;
begin
  FToggle.OnChange := HandleOnChange;
  FToggle.OnClick := HandleOnClick;
  Press(ThumbOffX);
  MoveTo(ThumbOffX + DragThreshold + 1);
  Release(ThumbOffX + DragThreshold + 1);
  Assert.IsFalse(FToggle.Checked, 'Thumb released before the middle snaps back');
  Assert.IsFalse(FOnChangeFired, 'and nothing changed, so OnChange stays quiet');
  Assert.AreEqual(0, FOnClickCount, 'and a drag that changed nothing is no click');
end;

procedure TToggleSwitchTest.Click_ShouldToggleAndFireBothEvents;
begin
  FToggle.OnChange := HandleOnChange;
  FToggle.OnClick := HandleOnClick;
  Press(ThumbOffX);
  Release(ThumbOffX);
  Assert.IsTrue(FToggle.Checked, 'A click without any travel toggles the switch');
  Assert.IsTrue(FOnChangeFired, 'and fires OnChange');
  Assert.AreEqual(1, FOnClickCount, 'and reports the click once');
  Assert.IsTrue(FCheckedWhenClicked, 'with the new value already in place');
end;

procedure TToggleSwitchTest.Click_ReleasedOutside_ShouldNotToggle;
begin
  FOnChangeFired := False;
  FToggle.OnChange := HandleOnChange;
  Press(ThumbOffX);
  Release(FToggle.Width + 10);
  Assert.IsFalse(FToggle.Checked, 'A press let go outside the control is no click');
  Assert.IsFalse(FOnChangeFired, 'and fires nothing');
end;

// Once the pointer has travelled far enough to count as a drag, the thumb
// decides, and the thumb is held inside the track wherever the pointer went
procedure TToggleSwitchTest.DragPastMiddle_ReleasedOutside_ShouldStillToggle;
begin
  Press(ThumbOffX);
  MoveTo(FToggle.Width + 50);
  Release(FToggle.Width + 50);
  Assert.IsTrue(FToggle.Checked, 'The thumb reached the far end, so the switch turns on');
end;

procedure TToggleSwitchTest.DragAwayFromTravel_ShouldNotToggle;
begin
  Press(ThumbOffX);
  // An off switch has no room to the left, so the thumb never moves
  MoveTo(-50);
  Release(-50);
  Assert.IsFalse(FToggle.Checked, 'A drag the thumb cannot follow changes nothing');
end;

procedure TToggleSwitchTest.Click_OnLabel_ShouldToggle;
begin
  FToggle.ShowText := True;
  // The caption belongs to the control, which is why it is drawn rather than
  // parked in a TLabel: clicking it has to work
  Press(FToggle.Width - 1);
  Release(FToggle.Width - 1);
  Assert.IsTrue(FToggle.Checked, 'Clicking the caption toggles the switch');
end;

// The header describes the switch the way a label describes an edit box, so
// it is not part of what the pointer answers for
procedure TToggleSwitchTest.Click_OnHeader_ShouldNotToggle;
begin
  FToggle.HeaderText := 'Header';
  FToggle.ShowHeader := True;
  FOnChangeFired := False;
  FToggle.OnChange := HandleOnChange;
  PressAt(ThumbOffX, 1);
  ReleaseAt(ThumbOffX, 1);
  Assert.IsFalse(FToggle.Checked, 'Clicking the header leaves the switch alone');
  Assert.IsFalse(FOnChangeFired, 'and fires nothing');
end;

procedure TToggleSwitchTest.DragBackPastMiddle_ShouldTurnOffAndFireOnChange;
begin
  FToggle.Checked := True;
  FOnChangeFired := False;
  FToggle.OnChange := HandleOnChange;
  Press(ThumbOnX);
  MoveTo(ThumbOffX);
  Release(ThumbOffX);
  Assert.IsFalse(FToggle.Checked, 'Thumb dragged back past the middle turns the switch off');
  Assert.IsTrue(FOnChangeFired, 'and fires OnChange');
end;

procedure TToggleSwitchTest.RightButton_ShouldNotToggle;
begin
  FOnChangeFired := False;
  FToggle.OnChange := HandleOnChange;
  FToggle.Perform(WM_RBUTTONDOWN, MK_RBUTTON, MakeLParam(ThumbOffX, FToggle.Height div 2));
  FToggle.Perform(WM_RBUTTONUP, 0, MakeLParam(ThumbOffX, FToggle.Height div 2));
  Assert.IsFalse(FToggle.Checked, 'Only the left button toggles the switch');
  Assert.IsFalse(FOnChangeFired, 'and fires nothing');
end;

procedure TToggleSwitchTest.Enabled_False_Click_ShouldNotToggle;
begin
  FToggle.Enabled := False;
  FOnChangeFired := False;
  FToggle.OnChange := HandleOnChange;
  Press(ThumbOffX);
  Release(ThumbOffX);
  Assert.IsFalse(FToggle.Checked, 'A disabled switch ignores the pointer');
  Assert.IsFalse(FOnChangeFired, 'and fires nothing');
end;

procedure TToggleSwitchTest.Enabled_False_WhilePressed_ShouldCancelThePress;
begin
  FOnChangeFired := False;
  FToggle.OnChange := HandleOnChange;
  Press(ThumbOffX);
  FToggle.Enabled := False;
  Release(ThumbOffX);
  Assert.IsFalse(FToggle.Checked, 'Being disabled mid-press drops the press');
  Assert.IsFalse(FOnChangeFired, 'and fires nothing');
end;

// Dropping the press is not enough: the thumb is painted at its resting place
// plus whatever the drag moved it by. The same control in the same state has
// to paint the same, so anything the drag left behind shows up here
procedure TToggleSwitchTest.Enabled_False_MidDrag_ShouldSettleTheThumb;
var
  Expected, Actual: TBitmap;
begin
  Expected := nil;
  Actual := nil;
  try
    FToggle.Enabled := False;
    Expected := RenderToBitmap(FToggle);
    FToggle.Enabled := True;
    Press(ThumbOffX);
    MoveTo(ThumbOffX + DragThreshold + 4);
    FToggle.Enabled := False;
    Actual := RenderToBitmap(FToggle);
    Assert.AreEqual('', DescribeDifference(Expected, Actual),
      'A switch disabled mid-drag looks like one that was disabled untouched');
  finally
    Actual.Free;
    Expected.Free;
  end;
end;

procedure TToggleSwitchTest.CancelMode_MidPress_ShouldNotToggle;
begin
  FOnChangeFired := False;
  FToggle.OnChange := HandleOnChange;
  Press(ThumbOffX);
  // What a menu or a modal dialog opening mid-press comes down to
  FToggle.Perform(WM_CANCELMODE, 0, 0);
  Assert.IsFalse(FToggle.Checked, 'A press the system cancels is no click');
  Assert.IsFalse(FOnChangeFired, 'and fires nothing');
end;

procedure TToggleSwitchTest.DefaultAnimationDuration_ShouldMatchWinUI;
begin
  Assert.AreEqual(367, FToggle.AnimationDuration, 'Thumb slide lasts as long as in WinUI');
end;

procedure TToggleSwitchTest.AnimationDuration_ShouldClampToPositive;
begin
  FToggle.AnimationDuration := 0;
  Assert.AreEqual(1, FToggle.AnimationDuration, 'Duration never drops below 1 ms');
end;

procedure TToggleSwitchTest.Paint_ShouldNotChangeSize;
var
  W, H: Integer;
begin
  W := FToggle.Width;
  H := FToggle.Height;
  Render(FToggle);
  Assert.AreEqual(W, FToggle.Width, 'Painting leaves the width alone');
  Assert.AreEqual(H, FToggle.Height, 'Painting leaves the height alone');
end;

procedure TToggleSwitchTest.CreateAndDestroy_ShouldNotLeak;
begin
  // The leak itself is caught by the per-test monitor
  Assert.WillNotRaise(
    procedure
    var
      I: Integer;
    begin
      for I := 1 to 50 do
        CreateRenderDestroy;
    end, nil, 'Fifty lifetimes run clean');
end;

procedure TToggleSwitchTest.ParentColor_ShouldBeTrueByDefault;
begin
  Assert.IsTrue(FToggle.ParentColor, 'Background follows the parent');
end;

procedure TToggleSwitchTest.DefaultChecked_ShouldBeFalse;
begin
  Assert.IsFalse(FToggle.Checked);
end;

// --- Scaling tests ---

procedure TToggleSwitchTest.Scale_96_ShouldUseTheDesignSize;
begin
  FToggle.ScaleForPPI(96);
  Assert.AreEqual(42, FToggle.Width);
  Assert.AreEqual(22, FToggle.Height);
end;

procedure TToggleSwitchTest.Scale_120_ShouldGrowWithTheScale;
begin
  FToggle.ScaleForPPI(120);
  Assert.AreEqual(52, FToggle.Width);
  Assert.AreEqual(28, FToggle.Height);
end;

procedure TToggleSwitchTest.Scale_144_ShouldGrowWithTheScale;
begin
  FToggle.ScaleForPPI(144);
  Assert.AreEqual(63, FToggle.Width);
  Assert.AreEqual(33, FToggle.Height);
end;

procedure TToggleSwitchTest.Scale_192_ShouldGrowWithTheScale;
begin
  FToggle.ScaleForPPI(192);
  Assert.AreEqual(84, FToggle.Width);
  Assert.AreEqual(44, FToggle.Height);
end;

// The control used to count the scale itself, multiplying it step by step, so
// a walk across monitors drifted away from the design size
procedure TToggleSwitchTest.Scale_ThereAndBack_ShouldNotDrift;
begin
  FToggle.ScaleForPPI(120);
  FToggle.ScaleForPPI(144);
  FToggle.ScaleForPPI(192);
  FToggle.ScaleForPPI(96);
  Assert.AreEqual(42, FToggle.Width);
  Assert.AreEqual(22, FToggle.Height);
end;

procedure TToggleSwitchTest.AutoSize_False_ShouldKeepTheGivenSize;
begin
  FToggle.AutoSize := False;
  FToggle.SetBounds(0, 0, 100, 50);
  Assert.AreEqual(100, FToggle.Width);
  Assert.AreEqual(50, FToggle.Height);
end;

procedure TToggleSwitchTest.AutoSize_True_ShouldMeasureAgain;
begin
  FToggle.ScaleForPPI(96);
  FToggle.AutoSize := False;
  FToggle.SetBounds(0, 0, 100, 50);
  FToggle.AutoSize := True;
  Assert.AreEqual(42, FToggle.Width);
  Assert.AreEqual(22, FToggle.Height);
end;

// --- Header tests ---

procedure TToggleSwitchTest.DefaultHeaderValues;
begin
  Assert.IsFalse(FToggle.ShowHeader);
  Assert.AreEqual('', FToggle.HeaderText);
  Assert.IsTrue(FToggle.HeaderPosition = hpTop);
  Assert.IsTrue(FToggle.HeaderAlignment = taCenter, 'The header sits over the middle');
  Assert.AreEqual(6, FToggle.HeaderSpacing, 'Six plus the pixel around the track');
end;


// Room the header takes comes out of the form, not out of where the switch
// was put
procedure TToggleSwitchTest.ShowHeader_True_ShouldKeepTheTrackInPlace;
var
  HeightBefore, Band: Integer;
begin
  FToggle.Top := 100;
  FToggle.HeaderText := 'Header';
  HeightBefore := FToggle.Height;
  // What the header is worth, measured from its font rather than from the
  // growth we are about to check
  Band := LineHeight(FToggle.HeaderFont) + FToggle.HeaderSpacing;
  FToggle.ShowHeader := True;
  Assert.AreEqual(HeightBefore + Band, FToggle.Height, 'The header took its own height and gap');
  Assert.AreEqual(100 - Band, FToggle.Top, 'out of the form, so the track did not move');
end;

procedure TToggleSwitchTest.HeaderText_Long_ShouldKeepTheTrackInPlace;
var
  TrackBefore: Integer;
begin
  FToggle.Left := 100;
  FToggle.ShowHeader := True;
  FToggle.HeaderText := 'H';
  TrackBefore := TrackLeftOnForm;
  FToggle.HeaderText := 'A header far wider than the switch';
  Assert.IsTrue(FToggle.Left < 100, 'A header wider than the switch grows the control leftwards');
  Assert.AreEqual(TrackBefore, TrackLeftOnForm, 'and the track itself did not move');
end;

// A header wider than the switch decides where the switch goes. Only the band
// below the header is compared, so the header's own move does not count
procedure TToggleSwitchTest.HeaderAlignment_ShouldCarryTheSwitchWithIt;
var
  Centred, ToTheLeft: TBitmap;
begin
  Centred := nil;
  ToTheLeft := nil;
  try
    FToggle.HeaderText := 'A header far wider than the switch';
    FToggle.ShowHeader := True;
    FToggle.HeaderAlignment := taCenter;
    Centred := RenderToBitmap(FToggle);
    FToggle.HeaderAlignment := taLeftJustify;
    ToTheLeft := RenderToBitmap(FToggle);
    // The switch band is the last TrackAreaHeight rows, whatever the header
    // font does above them
    Assert.IsTrue(DescribeDifference(Centred, ToTheLeft,
      FToggle.Height - TrackAreaHeight) <> '',
      'The switch moves with the header instead of clinging to one edge');
  finally
    ToTheLeft.Free;
    Centred.Free;
  end;
end;

procedure TToggleSwitchTest.SetName_ShouldSeedTheHeaderText;
var
  Tmp: TFluentToggleSwitch;
begin
  Tmp := TFluentToggleSwitch.Create(nil);
  try
    Tmp.Name := 'Switch1';
    Assert.AreEqual('Switch1', Tmp.HeaderText, 'An untouched header carries the name');
    Tmp.HeaderText := 'Mine';
    Tmp.Name := 'Switch2';
    Assert.AreEqual('Mine', Tmp.HeaderText, 'A header of its own survives a rename');
  finally
    Tmp.Free;
  end;
end;

procedure TToggleSwitchTest.ShowHeader_LongText_ShouldWidenTheControl;
var
  WidthBefore: Integer;
begin
  WidthBefore := FToggle.Width;
  FToggle.HeaderText := 'A header far wider than the switch itself';
  FToggle.ShowHeader := True;
  Assert.IsTrue(FToggle.Width > WidthBefore,
    'A header wider than the row should widen the control');
end;

procedure TToggleSwitchTest.HeaderPosition_ShouldNotChangeTheSize;
var
  W, H: Integer;
begin
  FToggle.HeaderText := 'Header';
  FToggle.ShowHeader := True;
  W := FToggle.Width;
  H := FToggle.Height;
  FToggle.HeaderPosition := hpBottom;
  Assert.AreEqual(W, FToggle.Width);
  Assert.AreEqual(H, FToggle.Height);
end;

// --- Streaming ---

procedure TToggleSwitchTest.CopyThroughStream(Source, Target: TFluentToggleSwitch);
var
  Stream: TMemoryStream;
begin
  Stream := TMemoryStream.Create;
  try
    Stream.WriteComponent(Source);
    Stream.Position := 0;
    Stream.ReadComponent(Target);
  finally
    Stream.Free;
  end;
end;

function TToggleSwitchTest.AsText(Source: TFluentToggleSwitch): string;
var
  Binary: TMemoryStream;
  Written: TStringStream;
begin
  Binary := TMemoryStream.Create;
  Written := TStringStream.Create;
  try
    Binary.WriteComponent(Source);
    Binary.Position := 0;
    ObjectBinaryToText(Binary, Written);
    Result := Written.DataString;
  finally
    Written.Free;
    Binary.Free;
  end;
end;

procedure TToggleSwitchTest.LoadText(const Dfm: string; Target: TFluentToggleSwitch);
var
  Source: TStringStream;
  Binary: TMemoryStream;
begin
  Source := TStringStream.Create(Dfm);
  Binary := TMemoryStream.Create;
  try
    ObjectTextToBinary(Source, Binary);
    Binary.Position := 0;
    Binary.ReadComponent(Target);
  finally
    Binary.Free;
    Source.Free;
  end;
end;

// Writes a form holding one switch and reads it back into a fresh form: the
// path every real form takes, where the switch is a child created by the
// reader rather than a root read into an instance of its own. The caller owns
// the form that comes back
function TToggleSwitchTest.StreamFormWithSwitch(out Loaded: TFluentToggleSwitch;
  out SourceWidth: Integer): TForm;
var
  Source: TForm;
  Child: TFluentToggleSwitch;
  Stream: TMemoryStream;
begin
  Stream := TMemoryStream.Create;
  try
    Source := TForm.CreateNew(nil);
    try
      Child := TFluentToggleSwitch.Create(Source);
      Child.Name := 'Switch';
      Child.Parent := Source;
      Child.ShowText := True;
      Child.TextOn := 'Yes';
      SourceWidth := Child.Width;
      Stream.WriteComponent(Source);
    finally
      Source.Free;
    end;
    Stream.Position := 0;
    Result := TForm.CreateNew(nil);
    try
      Stream.ReadComponent(Result);
      Loaded := Result.FindComponent('Switch') as TFluentToggleSwitch;
    except
      Result.Free;
      raise;
    end;
  finally
    Stream.Free;
  end;
end;

procedure TToggleSwitchTest.Stream_RoundTrip_ShouldRestoreEveryPublishedProperty;
var
  Loaded: TFluentToggleSwitch;
begin
  FToggle.Checked := True;
  FToggle.Animated := False;
  FToggle.AnimationDuration := 100;
  FToggle.TabStop := False;
  FToggle.ShowFocus := False;
  FToggle.KeyboardToggle := False;
  FToggle.TrackFrameColor := clRed;
  FToggle.TrackColorOff := clGreen;
  FToggle.TrackColorOn := clBlue;
  FToggle.ThumbColorOff := clYellow;
  FToggle.ThumbColorOn := clPurple;
  FToggle.ShowText := True;
  FToggle.TextOn := 'Yes';
  FToggle.TextOff := 'No';
  FToggle.TextPosition := tpLeft;
  FToggle.TextSpacing := 5;
  FToggle.ShowHeader := True;
  FToggle.HeaderText := 'Header';
  FToggle.HeaderPosition := hpBottom;
  FToggle.HeaderAlignment := taRightJustify;
  FToggle.HeaderSpacing := 3;
  FToggle.HeaderFont.Style := [fsBold];
  Loaded := TFluentToggleSwitch.Create(nil);
  try
    CopyThroughStream(FToggle, Loaded);
    Assert.IsTrue(Loaded.Checked, 'Checked');
    Assert.IsFalse(Loaded.Animated, 'Animated');
    Assert.AreEqual(100, Loaded.AnimationDuration, 'AnimationDuration');
    Assert.IsFalse(Loaded.TabStop, 'TabStop');
    Assert.IsFalse(Loaded.ShowFocus, 'ShowFocus');
    Assert.IsFalse(Loaded.KeyboardToggle, 'KeyboardToggle');
    Assert.AreEqual(TColor(clRed), Loaded.TrackFrameColor, 'TrackFrameColor');
    Assert.AreEqual(TColor(clGreen), Loaded.TrackColorOff, 'TrackColorOff');
    Assert.AreEqual(TColor(clBlue), Loaded.TrackColorOn, 'TrackColorOn');
    Assert.AreEqual(TColor(clYellow), Loaded.ThumbColorOff, 'ThumbColorOff');
    Assert.AreEqual(TColor(clPurple), Loaded.ThumbColorOn, 'ThumbColorOn');
    Assert.IsTrue(Loaded.ShowText, 'ShowText');
    Assert.AreEqual('Yes', Loaded.TextOn, 'TextOn');
    Assert.AreEqual('No', Loaded.TextOff, 'TextOff');
    Assert.AreEqual<TFluentTextPosition>(tpLeft, Loaded.TextPosition, 'TextPosition');
    Assert.AreEqual(5, Loaded.TextSpacing, 'TextSpacing');
    Assert.IsTrue(Loaded.ShowHeader, 'ShowHeader');
    Assert.AreEqual('Header', Loaded.HeaderText, 'HeaderText');
    Assert.AreEqual<TFluentHeaderPosition>(hpBottom, Loaded.HeaderPosition, 'HeaderPosition');
    Assert.AreEqual<TAlignment>(taRightJustify, Loaded.HeaderAlignment, 'HeaderAlignment');
    Assert.AreEqual(3, Loaded.HeaderSpacing, 'HeaderSpacing');
    Assert.IsTrue(fsBold in Loaded.HeaderFont.Style, 'HeaderFont.Style');
  finally
    Loaded.Free;
  end;
end;

procedure TToggleSwitchTest.Stream_Defaults_ShouldWriteNoOwnProperty;
const
  OwnProperties: array[0..22] of string = ('Checked', 'Animated', 'AutoSize',
    'AnimationDuration', 'TabStop', 'ShowFocus', 'KeyboardToggle',
    'TrackFrameColor', 'TrackColorOff',
    'TrackColorOn', 'ThumbColorOff', 'ThumbColorOn', 'ShowText', 'TextOn',
    'TextOff', 'TextPosition', 'TextSpacing', 'ShowHeader', 'HeaderText',
    'HeaderPosition', 'HeaderAlignment', 'HeaderSpacing', 'HeaderFont');
var
  Dfm: string;
  Name: string;
begin
  Dfm := AsText(FToggle);
  // Every Pos below answers 0 on an empty string, so make sure there is a DFM
  Assert.IsTrue(Pos('object ', Dfm) > 0, 'The switch wrote something to look at');
  for Name in OwnProperties do
    // HeaderFont streams as HeaderFont.Name and friends, the rest as Name =
    Assert.AreEqual(0, Pos('  ' + Name + ' =', Dfm) + Pos('  ' + Name + '.', Dfm),
      Name + ' stays out of a default DFM');
end;

procedure TToggleSwitchTest.Stream_Load_ShouldNotFireOnChange;
var
  Loaded: TFluentToggleSwitch;
begin
  FToggle.Checked := True;
  Loaded := TFluentToggleSwitch.Create(nil);
  try
    FOnChangeFired := False;
    Loaded.OnChange := HandleOnChange;
    CopyThroughStream(FToggle, Loaded);
    Assert.IsTrue(Loaded.Checked, 'Checked came back from the stream');
    Assert.IsFalse(FOnChangeFired, 'Loading a DFM is not a change');
  finally
    Loaded.Free;
  end;
end;

procedure TToggleSwitchTest.Stream_HeaderFont_Custom_ShouldRoundTrip;
var
  Loaded: TFluentToggleSwitch;
begin
  FToggle.HeaderFont.Style := [fsBold];
  Loaded := TFluentToggleSwitch.Create(nil);
  try
    CopyThroughStream(FToggle, Loaded);
    Assert.IsTrue(fsBold in Loaded.HeaderFont.Style, 'A header font of its own comes back');
    Assert.IsTrue(Pos('  HeaderFont.', AsText(Loaded)) > 0,
      'and is written again, so the load marked it as custom');
  finally
    Loaded.Free;
  end;
end;

procedure TToggleSwitchTest.Stream_HeaderFont_Default_ShouldNotBeStored;
var
  Dfm: string;
begin
  FToggle.Font.Size := 14;
  Dfm := AsText(FToggle);
  Assert.IsTrue(Pos('  Font.', Dfm) > 0, 'The control font itself is written');
  Assert.AreEqual(0, Pos('  HeaderFont.', Dfm),
    'A header font that only follows Font stays out of the DFM');
end;

procedure TToggleSwitchTest.Stream_Load_WithShowText_ShouldMeasureAfterLoad;
var
  Loaded, Reference: TFluentToggleSwitch;
begin
  // Both stay parentless, so nothing but Loaded can measure them
  Reference := TFluentToggleSwitch.Create(nil);
  Loaded := TFluentToggleSwitch.Create(nil);
  try
    Reference.ShowText := True;
    // The size in the DFM is deliberately wrong
    LoadText('object TFluentToggleSwitch'#13#10 +
      '  Width = 10'#13#10 +
      '  Height = 10'#13#10 +
      '  ShowText = True'#13#10 +
      'end', Loaded);
    Assert.AreEqual(Reference.Width, Loaded.Width, 'Loading measures the width');
    Assert.AreEqual(Reference.Height, Loaded.Height, 'and the height');
  finally
    Loaded.Free;
    Reference.Free;
  end;
end;

procedure TToggleSwitchTest.Stream_Font_WithHeaderFollowing_ShouldRoundTrip;
var
  Loaded: TFluentToggleSwitch;
begin
  FToggle.ShowHeader := True;
  FToggle.HeaderText := 'Header';
  FToggle.Font.Size := 14;
  Loaded := TFluentToggleSwitch.Create(nil);
  try
    CopyThroughStream(FToggle, Loaded);
    Assert.AreEqual(14, Loaded.Font.Size, 'The control font comes back');
    Assert.IsFalse(Loaded.ParentFont, 'and stops following the parent');
    Assert.AreEqual(14, Loaded.HeaderFont.Size,
      'A header font of its own was never set, so it follows the loaded font');
    Assert.AreEqual(0, Pos('  HeaderFont.', AsText(Loaded)),
      'and is still not worth writing');
  finally
    Loaded.Free;
  end;
end;

procedure TToggleSwitchTest.Stream_InsideForm_ShouldRestoreParentAndSize;
var
  Target: TForm;
  Loaded: TFluentToggleSwitch;
  SourceWidth: Integer;
begin
  Target := StreamFormWithSwitch(Loaded, SourceWidth);
  try
    Assert.IsNotNull(Loaded, 'The child came back');
    Assert.IsTrue(Loaded.Parent = Target, 'and it belongs to the form that read it');
    Assert.AreEqual('Yes', Loaded.TextOn, 'with its properties');
    Assert.AreEqual(SourceWidth, Loaded.Width, 'and the size it was measured at');
  finally
    Target.Free;
  end;
end;

initialization
  // The reader needs the class by name to create the switch inside a form
  RegisterClass(TFluentToggleSwitch);
  TDUnitX.RegisterTestFixture(TToggleSwitchTest);

end.
