object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'TFluentToggleSwitch Demo'
  ClientHeight = 288
  ClientWidth = 540
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object GridPanel: TGridPanel
    AlignWithMargins = True
    Left = 6
    Top = 3
    Width = 528
    Height = 282
    Margins.Left = 6
    Margins.Right = 6
    Align = alClient
    BevelOuter = bvNone
    ColumnCollection = <
      item
        Value = 100.000000000000000000
      end
      item
        SizeStyle = ssAuto
      end
      item
        SizeStyle = ssAuto
      end
      item
        SizeStyle = ssAbsolute
        Value = 23.000000000000000000
      end
      item
        SizeStyle = ssAuto
      end
      item
        SizeStyle = ssAuto
      end>
    ControlCollection = <
      item
        Column = 1
        Control = LabelGroupKeyboard
        Row = 0
      end
      item
        Column = 4
        Control = LabelGroupNoKeyboard
        Row = 0
      end
      item
        Column = 1
        Control = Label1
        Row = 1
      end
      item
        Column = 2
        Control = FluentToggleSwitch1
        Row = 1
      end
      item
        Column = 4
        Control = Label6
        Row = 1
      end
      item
        Column = 5
        Control = FluentToggleSwitch6
        Row = 1
      end
      item
        Column = 1
        Control = Label2
        Row = 2
      end
      item
        Column = 2
        Control = FluentToggleSwitch2
        Row = 2
      end
      item
        Column = 4
        Control = Label7
        Row = 2
      end
      item
        Column = 5
        Control = FluentToggleSwitch7
        Row = 2
      end
      item
        Column = 1
        Control = Label3
        Row = 3
      end
      item
        Column = 2
        Control = FluentToggleSwitch3
        Row = 3
      end
      item
        Column = 4
        Control = Label8
        Row = 3
      end
      item
        Column = 5
        Control = FluentToggleSwitch8
        Row = 3
      end
      item
        Column = 1
        Control = Label4
        Row = 4
      end
      item
        Column = 2
        Control = FluentToggleSwitch4
        Row = 4
      end
      item
        Column = 4
        Control = Label9
        Row = 4
      end
      item
        Column = 5
        Control = FluentToggleSwitch9
        Row = 4
      end
      item
        Column = 1
        Control = Label5
        Row = 5
      end
      item
        Column = 2
        Control = FluentToggleSwitch5
        Row = 5
      end
      item
        Column = 4
        Control = Label10
        Row = 5
      end
      item
        Column = 5
        Control = FluentToggleSwitch10
        Row = 5
      end
      item
        Column = 1
        Control = Label11
        Row = 6
      end
      item
        Column = 2
        Control = FluentToggleSwitch11
        Row = 6
      end
      item
        Column = 4
        Control = Label12
        Row = 6
      end
      item
        Column = 5
        Control = FluentToggleSwitch12
        Row = 6
      end>
    ExpandStyle = emFixedSize
    RowCollection = <
      item
        SizeStyle = ssAuto
      end
      item
        SizeStyle = ssAuto
      end
      item
        SizeStyle = ssAuto
      end
      item
        SizeStyle = ssAuto
      end
      item
        SizeStyle = ssAuto
      end
      item
        SizeStyle = ssAuto
      end
      item
        SizeStyle = ssAuto
      end>
    TabOrder = 0
    ExplicitWidth = 518
    ExplicitHeight = 250
    DesignSize = (
      528
      282)
    object LabelGroupKeyboard: TLabel
      AlignWithMargins = True
      Left = 46
      Top = 3
      Width = 94
      Height = 15
      Margins.Left = 12
      Margins.Right = 12
      Align = alRight
      Alignment = taRightJustify
      Caption = 'Tab, Space, focus'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      ExplicitLeft = 37
    end
    object LabelGroupNoKeyboard: TLabel
      AlignWithMargins = True
      Left = 281
      Top = 3
      Width = 139
      Height = 15
      Margins.Left = 12
      Margins.Right = 12
      Align = alRight
      Caption = 'No Tab, no Space, no ring'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      ExplicitLeft = 272
    end
    object Label1: TLabel
      AlignWithMargins = True
      Left = 102
      Top = 24
      Width = 38
      Height = 22
      Margins.Right = 12
      Align = alRight
      Caption = 'Default'
      Layout = tlCenter
      ExplicitLeft = 92
      ExplicitTop = 25
      ExplicitHeight = 15
    end
    object FluentToggleSwitch1: TFluentToggleSwitch
      AlignWithMargins = True
      Left = 178
      Top = 24
      Width = 42
      Height = 22
      Margins.Left = 12
      Margins.Right = 12
      Anchors = []
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 0
      ExplicitLeft = 168
    end
    object Label6: TLabel
      AlignWithMargins = True
      Left = 365
      Top = 24
      Width = 55
      Height = 22
      Margins.Right = 12
      Align = alRight
      Caption = 'Text = Left'
      Layout = tlCenter
      ExplicitLeft = 363
      ExplicitTop = 25
      ExplicitHeight = 15
    end
    object FluentToggleSwitch6: TFluentToggleSwitch
      AlignWithMargins = True
      Left = 445
      Top = 24
      Width = 70
      Height = 22
      Margins.Left = 12
      Margins.Right = 12
      Anchors = []
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabStop = False
      TabOrder = 1
      ShowFocus = False
      KeyboardToggle = False
      ShowText = True
      TextPosition = tpLeft
      ExplicitLeft = 435
    end
    object Label2: TLabel
      AlignWithMargins = True
      Left = 30
      Top = 52
      Width = 110
      Height = 22
      Margins.Right = 12
      Align = alRight
      Caption = 'Checked = True (On)'
      Layout = tlCenter
      ExplicitLeft = 20
      ExplicitTop = 53
      ExplicitHeight = 15
    end
    object FluentToggleSwitch2: TFluentToggleSwitch
      AlignWithMargins = True
      Left = 178
      Top = 52
      Width = 42
      Height = 22
      Margins.Left = 12
      Margins.Right = 12
      Anchors = []
      DoubleBuffered = True
      ParentDoubleBuffered = False
      Checked = True
      TabOrder = 2
      OnChange = FluentToggleSwitch2Change
      ExplicitLeft = 168
    end
    object Label7: TLabel
      AlignWithMargins = True
      Left = 357
      Top = 52
      Width = 63
      Height = 22
      Margins.Right = 12
      Align = alRight
      Caption = 'Text = Right'
      Layout = tlCenter
      ExplicitLeft = 355
      ExplicitTop = 53
      ExplicitHeight = 15
    end
    object FluentToggleSwitch7: TFluentToggleSwitch
      AlignWithMargins = True
      Left = 445
      Top = 52
      Width = 70
      Height = 22
      Margins.Left = 12
      Margins.Right = 12
      Anchors = []
      DoubleBuffered = True
      ParentDoubleBuffered = False
      Checked = True
      TabStop = False
      TabOrder = 5
      ShowFocus = False
      KeyboardToggle = False
      ShowText = True
      ExplicitLeft = 435
    end
    object Label3: TLabel
      AlignWithMargins = True
      Left = 37
      Top = 80
      Width = 103
      Height = 22
      Margins.Right = 12
      Align = alRight
      Caption = 'Enable = False (Off)'
      Layout = tlCenter
      ExplicitLeft = 27
      ExplicitTop = 81
      ExplicitHeight = 15
    end
    object FluentToggleSwitch3: TFluentToggleSwitch
      AlignWithMargins = True
      Left = 178
      Top = 80
      Width = 42
      Height = 22
      Margins.Left = 12
      Margins.Right = 12
      Anchors = []
      DoubleBuffered = True
      ParentDoubleBuffered = False
      Enabled = False
      TabOrder = 8
      OnChange = FluentToggleSwitch3Change
      ExplicitLeft = 168
    end
    object Label8: TLabel
      AlignWithMargins = True
      Left = 318
      Top = 80
      Width = 102
      Height = 22
      Margins.Right = 12
      Align = alRight
      Caption = 'Enable = False (On)'
      Layout = tlCenter
      ExplicitLeft = 317
      ExplicitTop = 81
      ExplicitHeight = 15
    end
    object FluentToggleSwitch8: TFluentToggleSwitch
      AlignWithMargins = True
      Left = 445
      Top = 80
      Width = 70
      Height = 22
      Margins.Left = 12
      Margins.Right = 12
      Anchors = []
      DoubleBuffered = True
      ParentDoubleBuffered = False
      Checked = True
      Enabled = False
      TabStop = False
      TabOrder = 3
      ShowFocus = False
      KeyboardToggle = False
      OnChange = FluentToggleSwitch8Change
      ShowText = True
      ExplicitLeft = 435
    end
    object Label4: TLabel
      AlignWithMargins = True
      Left = 68
      Top = 108
      Width = 72
      Height = 42
      Margins.Right = 12
      Align = alRight
      Caption = 'Custom color'
      Layout = tlCenter
      ExplicitLeft = 60
      ExplicitTop = 109
      ExplicitHeight = 15
    end
    object FluentToggleSwitch4: TFluentToggleSwitch
      AlignWithMargins = True
      Left = 178
      Top = 118
      Width = 42
      Height = 22
      Margins.Left = 12
      Margins.Right = 12
      Anchors = []
      DoubleBuffered = True
      ParentDoubleBuffered = False
      Checked = True
      TabOrder = 4
      TrackFrameColor = clSlateblue
      TrackColorOff = clOrangered
      TrackColorOn = clLimegreen
      ThumbColorOff = clKhaki
      ThumbColorOn = clGold
      ExplicitLeft = 168
    end
    object Label9: TLabel
      AlignWithMargins = True
      Left = 382
      Top = 126
      Width = 38
      Height = 24
      Margins.Top = 21
      Margins.Right = 12
      Align = alRight
      Caption = 'Header'
      Layout = tlCenter
      ExplicitLeft = 381
      ExplicitTop = 127
      ExplicitHeight = 15
    end
    object FluentToggleSwitch9: TFluentToggleSwitch
      AlignWithMargins = True
      Left = 459
      Top = 108
      Width = 42
      Height = 42
      Margins.Left = 12
      Margins.Right = 12
      Anchors = []
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabStop = False
      TabOrder = 6
      ShowFocus = False
      KeyboardToggle = False
      ShowHeader = True
      HeaderText = 'Top'
      HeaderFont.Charset = DEFAULT_CHARSET
      HeaderFont.Color = clWindowText
      HeaderFont.Height = -12
      HeaderFont.Name = 'Consolas'
      HeaderFont.Style = [fsBold]
      ExplicitLeft = 449
    end
    object Label5: TLabel
      AlignWithMargins = True
      Left = 48
      Top = 156
      Width = 92
      Height = 45
      Margins.Right = 12
      Align = alRight
      Caption = 'Animated = False'
      Layout = tlCenter
      ExplicitLeft = 38
      ExplicitTop = 157
      ExplicitHeight = 15
    end
    object FluentToggleSwitch5: TFluentToggleSwitch
      AlignWithMargins = True
      Left = 178
      Top = 167
      Width = 42
      Height = 22
      Margins.Left = 12
      Margins.Right = 12
      Anchors = []
      DoubleBuffered = True
      ParentDoubleBuffered = False
      Animated = False
      TabOrder = 7
      ExplicitLeft = 168
    end
    object Label10: TLabel
      AlignWithMargins = True
      Left = 328
      Top = 153
      Width = 92
      Height = 30
      Margins.Top = 0
      Margins.Right = 12
      Margins.Bottom = 21
      Align = alRight
      Caption = 'Header = Bottom'
      Layout = tlCenter
      ExplicitLeft = 327
      ExplicitTop = 154
      ExplicitHeight = 15
    end
    object FluentToggleSwitch10: TFluentToggleSwitch
      AlignWithMargins = True
      Left = 459
      Top = 157
      Width = 42
      Height = 43
      Margins.Left = 12
      Margins.Top = 4
      Margins.Right = 12
      Margins.Bottom = 4
      Anchors = []
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabStop = False
      TabOrder = 9
      ShowFocus = False
      KeyboardToggle = False
      ShowHeader = True
      HeaderText = 'Bottom'
      HeaderPosition = hpBottom
      HeaderFont.Charset = DEFAULT_CHARSET
      HeaderFont.Color = clWindowText
      HeaderFont.Height = -12
      HeaderFont.Name = 'Segoe UI'
      HeaderFont.Style = [fsUnderline]
      ExplicitLeft = 449
    end
    object Label11: TLabel
      AlignWithMargins = True
      Left = 29
      Top = 238
      Width = 111
      Height = 21
      Margins.Top = 34
      Margins.Right = 12
      Align = alRight
      Caption = 'Header and text (Off)'
      Layout = tlCenter
      ExplicitLeft = 18
      ExplicitHeight = 15
    end
    object FluentToggleSwitch11: TFluentToggleSwitch
      AlignWithMargins = True
      Left = 164
      Top = 216
      Width = 70
      Height = 43
      Margins.Left = 12
      Margins.Top = 12
      Margins.Right = 12
      Anchors = []
      DoubleBuffered = True
      ParentDoubleBuffered = False
      AnimationDuration = 1500
      TabOrder = 10
      OnChange = FluentToggleSwitch11Change
      ShowText = True
      ShowHeader = True
      HeaderText = '&Header'
      ExplicitLeft = 154
    end
    object Label12: TLabel
      AlignWithMargins = True
      Left = 300
      Top = 238
      Width = 120
      Height = 21
      Margins.Top = 34
      Margins.Right = 12
      Align = alRight
      Caption = 'Every colour of its own'
      Layout = tlCenter
      ExplicitLeft = 298
      ExplicitHeight = 15
    end
    object FluentToggleSwitch12: TFluentToggleSwitch
      AlignWithMargins = True
      Left = 444
      Top = 216
      Width = 72
      Height = 43
      Margins.Left = 12
      Margins.Top = 12
      Margins.Right = 12
      Anchors = []
      DoubleBuffered = True
      ParentDoubleBuffered = False
      ParentFont = False
      TabStop = False
      TabOrder = 11
      ShowFocus = False
      KeyboardToggle = False
      TrackColorOff = clYellow
      TrackColorOn = clPurple
      ThumbColorOff = clRed
      ThumbColorOn = clAqua
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clOrangered
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ShowText = True
      TextOn = 'Yes'
      TextOff = 'No'
      TextPosition = tpLeft
      ShowHeader = True
      HeaderText = 'Colours'
      HeaderFont.Charset = DEFAULT_CHARSET
      HeaderFont.Color = clTeal
      HeaderFont.Height = -12
      HeaderFont.Name = 'Segoe UI'
      HeaderFont.Style = [fsBold]
      ExplicitLeft = 434
    end
  end
end
