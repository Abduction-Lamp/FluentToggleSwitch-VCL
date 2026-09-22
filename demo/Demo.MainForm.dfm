object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'TFluentToggleSwitch Demo'
  ClientHeight = 346
  ClientWidth = 584
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
    Width = 572
    Height = 340
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
      end
      item
        Column = 1
        Control = Label13
        Row = 7
      end
      item
        Column = 2
        Control = FluentToggleSwitch13
        Row = 7
      end
      item
        Column = 4
        Control = Label14
        Row = 7
      end
      item
        Column = 5
        Control = FluentToggleSwitch14
        Row = 7
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
      end
      item
        SizeStyle = ssAuto
      end>
    TabOrder = 0
    ExplicitWidth = 518
    ExplicitHeight = 308
    DesignSize = (
      572
      340)
    object LabelGroupKeyboard: TLabel
      AlignWithMargins = True
      Left = 62
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
      Left = 297
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
      Left = 118
      Top = 24
      Width = 38
      Height = 22
      Margins.Right = 12
      Align = alRight
      Caption = 'Default'
      Layout = tlCenter
      ExplicitLeft = 102
      ExplicitHeight = 15
    end
    object FluentToggleSwitch1: TFluentToggleSwitch
      AlignWithMargins = True
      Left = 194
      Top = 24
      Width = 42
      Height = 22
      Margins.Left = 12
      Margins.Right = 12
      Anchors = []
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 0
      ExplicitLeft = 140
    end
    object Label6: TLabel
      AlignWithMargins = True
      Left = 381
      Top = 24
      Width = 55
      Height = 22
      Margins.Right = 12
      Align = alRight
      Caption = 'Text = Left'
      Layout = tlCenter
      ExplicitLeft = 365
      ExplicitHeight = 15
    end
    object FluentToggleSwitch6: TFluentToggleSwitch
      AlignWithMargins = True
      Left = 475
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
      ExplicitLeft = 421
    end
    object Label2: TLabel
      AlignWithMargins = True
      Left = 46
      Top = 52
      Width = 110
      Height = 22
      Margins.Right = 12
      Align = alRight
      Caption = 'Checked = True (On)'
      Layout = tlCenter
      ExplicitLeft = 30
      ExplicitHeight = 15
    end
    object FluentToggleSwitch2: TFluentToggleSwitch
      AlignWithMargins = True
      Left = 194
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
      ExplicitLeft = 140
    end
    object Label7: TLabel
      AlignWithMargins = True
      Left = 373
      Top = 52
      Width = 63
      Height = 22
      Margins.Right = 12
      Align = alRight
      Caption = 'Text = Right'
      Layout = tlCenter
      ExplicitLeft = 357
      ExplicitHeight = 15
    end
    object FluentToggleSwitch7: TFluentToggleSwitch
      AlignWithMargins = True
      Left = 475
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
      ExplicitLeft = 421
    end
    object Label3: TLabel
      AlignWithMargins = True
      Left = 53
      Top = 80
      Width = 103
      Height = 22
      Margins.Right = 12
      Align = alRight
      Caption = 'Enable = False (Off)'
      Layout = tlCenter
      ExplicitLeft = 37
      ExplicitHeight = 15
    end
    object FluentToggleSwitch3: TFluentToggleSwitch
      AlignWithMargins = True
      Left = 194
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
      ExplicitLeft = 140
    end
    object Label8: TLabel
      AlignWithMargins = True
      Left = 334
      Top = 80
      Width = 102
      Height = 22
      Margins.Right = 12
      Align = alRight
      Caption = 'Enable = False (On)'
      Layout = tlCenter
      ExplicitLeft = 318
      ExplicitHeight = 15
    end
    object FluentToggleSwitch8: TFluentToggleSwitch
      AlignWithMargins = True
      Left = 475
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
      ExplicitLeft = 421
    end
    object Label4: TLabel
      AlignWithMargins = True
      Left = 84
      Top = 108
      Width = 72
      Height = 42
      Margins.Right = 12
      Align = alRight
      Caption = 'Custom color'
      Layout = tlCenter
      ExplicitLeft = 68
      ExplicitHeight = 15
    end
    object FluentToggleSwitch4: TFluentToggleSwitch
      AlignWithMargins = True
      Left = 194
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
      ExplicitLeft = 140
    end
    object Label9: TLabel
      AlignWithMargins = True
      Left = 398
      Top = 126
      Width = 38
      Height = 24
      Margins.Top = 21
      Margins.Right = 12
      Align = alRight
      Caption = 'Header'
      Layout = tlCenter
      ExplicitLeft = 382
      ExplicitHeight = 15
    end
    object FluentToggleSwitch9: TFluentToggleSwitch
      AlignWithMargins = True
      Left = 489
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
      ParentHeaderFont = False
      ExplicitLeft = 435
    end
    object Label5: TLabel
      AlignWithMargins = True
      Left = 64
      Top = 156
      Width = 92
      Height = 45
      Margins.Right = 12
      Align = alRight
      Caption = 'Animated = False'
      Layout = tlCenter
      ExplicitLeft = 48
      ExplicitHeight = 15
    end
    object FluentToggleSwitch5: TFluentToggleSwitch
      AlignWithMargins = True
      Left = 194
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
      ExplicitLeft = 140
    end
    object Label10: TLabel
      AlignWithMargins = True
      Left = 344
      Top = 153
      Width = 92
      Height = 30
      Margins.Top = 0
      Margins.Right = 12
      Margins.Bottom = 21
      Align = alRight
      Caption = 'Header = Bottom'
      Layout = tlCenter
      ExplicitLeft = 328
      ExplicitHeight = 15
    end
    object FluentToggleSwitch10: TFluentToggleSwitch
      AlignWithMargins = True
      Left = 489
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
      ParentHeaderFont = False
      ExplicitLeft = 435
    end
    object Label11: TLabel
      AlignWithMargins = True
      Left = 45
      Top = 238
      Width = 111
      Height = 21
      Margins.Top = 34
      Margins.Right = 12
      Align = alRight
      Caption = 'Header and text (Off)'
      Layout = tlCenter
      ExplicitLeft = 29
      ExplicitHeight = 15
    end
    object FluentToggleSwitch11: TFluentToggleSwitch
      AlignWithMargins = True
      Left = 180
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
      ExplicitLeft = 126
    end
    object Label12: TLabel
      AlignWithMargins = True
      Left = 316
      Top = 238
      Width = 120
      Height = 21
      Margins.Top = 34
      Margins.Right = 12
      Align = alRight
      Caption = 'Every colour of its own'
      Layout = tlCenter
      ExplicitLeft = 300
      ExplicitHeight = 15
    end
    object FluentToggleSwitch12: TFluentToggleSwitch
      AlignWithMargins = True
      Left = 474
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
      ParentHeaderFont = False
      ExplicitLeft = 420
    end
    object Label13: TLabel
      AlignWithMargins = True
      Left = 15
      Top = 296
      Width = 141
      Height = 21
      Margins.Top = 34
      Margins.Right = 12
      Align = alRight
      Caption = 'BiDiMode = bdRightToLeft'
      Layout = tlCenter
      ExplicitLeft = 3
      ExplicitTop = 304
      ExplicitHeight = 15
    end
    object FluentToggleSwitch13: TFluentToggleSwitch
      AlignWithMargins = True
      Left = 180
      Top = 274
      Width = 70
      Height = 43
      Margins.Left = 12
      Margins.Top = 12
      Margins.Right = 12
      Anchors = []
      BiDiMode = bdRightToLeft
      DoubleBuffered = True
      ParentBiDiMode = False
      ParentDoubleBuffered = False
      TabOrder = 12
      ShowText = True
      ShowHeader = True
      HeaderText = 'Right to left'
      HeaderAlignment = taLeftJustify
      ExplicitLeft = 126
    end
    object Label14: TLabel
      AlignWithMargins = True
      Left = 341
      Top = 296
      Width = 95
      Height = 21
      Margins.Top = 34
      Margins.Right = 12
      Align = alRight
      Caption = 'Text = Left, Arabic'
      Layout = tlCenter
      ExplicitLeft = 290
      ExplicitTop = 304
      ExplicitHeight = 15
    end
    object FluentToggleSwitch14: TFluentToggleSwitch
      AlignWithMargins = True
      Left = 460
      Top = 274
      Width = 100
      Height = 43
      Margins.Left = 12
      Margins.Top = 12
      Margins.Right = 12
      Anchors = []
      BiDiMode = bdRightToLeft
      DoubleBuffered = True
      ParentBiDiMode = False
      ParentDoubleBuffered = False
      TabStop = False
      TabOrder = 13
      ShowFocus = False
      KeyboardToggle = False
      ShowText = True
      TextOn = #1578#1588#1594#1610#1604
      TextOff = #1573#1610#1602#1575#1601
      TextPosition = tpLeft
      ShowHeader = True
      HeaderText = #1605#1606' '#1575#1604#1610#1605#1610#1606' '#1573#1604#1609' '#1575#1604#1610#1587#1575#1585
      HeaderAlignment = taLeftJustify
      ExplicitLeft = 406
    end
  end
end
