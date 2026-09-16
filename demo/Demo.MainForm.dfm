object Form1: TForm1
  Left = 0
  Top = 0
  Margins.Left = 6
  Margins.Top = 6
  Margins.Right = 6
  Margins.Bottom = 6
  Caption = 'TFluentToggleSwitch Demo'
  ClientHeight = 565
  ClientWidth = 1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -24
  Font.Name = 'Segoe UI'
  Font.Style = []
  PixelsPerInch = 192
  TextHeight = 32
  object GridPanel: TGridPanel
    AlignWithMargins = True
    Left = 12
    Top = 6
    Width = 1056
    Height = 553
    Margins.Left = 12
    Margins.Top = 6
    Margins.Right = 12
    Margins.Bottom = 6
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
        Value = 46.000000000000000000
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
    ExplicitWidth = 1047
    ExplicitHeight = 529
    DesignSize = (
      1056
      553)
    object LabelGroupKeyboard: TLabel
      AlignWithMargins = True
      Left = 65
      Top = 6
      Width = 196
      Height = 32
      Margins.Left = 24
      Margins.Top = 6
      Margins.Right = 24
      Margins.Bottom = 6
      Align = alRight
      Alignment = taRightJustify
      Caption = 'Tab, Space, focus'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      ExplicitLeft = 47
    end
    object LabelGroupNoKeyboard: TLabel
      AlignWithMargins = True
      Left = 543
      Top = 6
      Width = 296
      Height = 32
      Margins.Left = 24
      Margins.Top = 6
      Margins.Right = 24
      Margins.Bottom = 6
      Align = alRight
      Caption = 'No Tab, no Space, no ring'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      ExplicitLeft = 575
    end
    object Label1: TLabel
      AlignWithMargins = True
      Left = 183
      Top = 50
      Width = 78
      Height = 44
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 24
      Margins.Bottom = 6
      Align = alRight
      Caption = 'Default'
      Layout = tlCenter
      ExplicitLeft = 174
      ExplicitHeight = 32
    end
    object FluentToggleSwitch1: TFluentToggleSwitch
      AlignWithMargins = True
      Left = 337
      Top = 50
      Width = 84
      Height = 44
      Margins.Left = 24
      Margins.Top = 6
      Margins.Right = 24
      Margins.Bottom = 6
      Anchors = []
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 0
      ExplicitLeft = 328
    end
    object Label6: TLabel
      AlignWithMargins = True
      Left = 726
      Top = 50
      Width = 113
      Height = 44
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 24
      Margins.Bottom = 6
      Align = alRight
      Caption = 'Text = Left'
      Layout = tlCenter
      ExplicitLeft = 717
      ExplicitHeight = 32
    end
    object FluentToggleSwitch6: TFluentToggleSwitch
      AlignWithMargins = True
      Left = 889
      Top = 50
      Width = 140
      Height = 44
      Margins.Left = 24
      Margins.Top = 6
      Margins.Right = 24
      Margins.Bottom = 6
      Anchors = []
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabStop = False
      TabOrder = 1
      ShowFocus = False
      KeyboardToggle = False
      ShowText = True
      TextPosition = tpLeft
      ExplicitLeft = 880
    end
    object Label2: TLabel
      AlignWithMargins = True
      Left = 40
      Top = 106
      Width = 221
      Height = 44
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 24
      Margins.Bottom = 6
      Align = alRight
      Caption = 'Checked = True (On)'
      Layout = tlCenter
      ExplicitLeft = 31
      ExplicitHeight = 32
    end
    object FluentToggleSwitch2: TFluentToggleSwitch
      AlignWithMargins = True
      Left = 337
      Top = 106
      Width = 84
      Height = 44
      Margins.Left = 24
      Margins.Top = 6
      Margins.Right = 24
      Margins.Bottom = 6
      Anchors = []
      DoubleBuffered = True
      ParentDoubleBuffered = False
      Checked = True
      TabOrder = 2
      OnChange = FluentToggleSwitch2Change
      ExplicitLeft = 328
    end
    object Label7: TLabel
      AlignWithMargins = True
      Left = 710
      Top = 106
      Width = 129
      Height = 44
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 24
      Margins.Bottom = 6
      Align = alRight
      Caption = 'Text = Right'
      Layout = tlCenter
      ExplicitLeft = 701
      ExplicitHeight = 32
    end
    object FluentToggleSwitch7: TFluentToggleSwitch
      AlignWithMargins = True
      Left = 889
      Top = 106
      Width = 140
      Height = 44
      Margins.Left = 24
      Margins.Top = 6
      Margins.Right = 24
      Margins.Bottom = 6
      Anchors = []
      DoubleBuffered = True
      ParentDoubleBuffered = False
      Checked = True
      TabStop = False
      TabOrder = 5
      ShowFocus = False
      KeyboardToggle = False
      ShowText = True
      ExplicitLeft = 880
    end
    object Label3: TLabel
      AlignWithMargins = True
      Left = 53
      Top = 162
      Width = 208
      Height = 44
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 24
      Margins.Bottom = 6
      Align = alRight
      Caption = 'Enable = False (Off)'
      Layout = tlCenter
      ExplicitLeft = 44
      ExplicitHeight = 32
    end
    object FluentToggleSwitch3: TFluentToggleSwitch
      AlignWithMargins = True
      Left = 337
      Top = 162
      Width = 84
      Height = 44
      Margins.Left = 24
      Margins.Top = 6
      Margins.Right = 24
      Margins.Bottom = 6
      Anchors = []
      DoubleBuffered = True
      ParentDoubleBuffered = False
      Enabled = False
      TabOrder = 8
      OnChange = FluentToggleSwitch3Change
      ExplicitLeft = 328
    end
    object Label8: TLabel
      AlignWithMargins = True
      Left = 633
      Top = 162
      Width = 206
      Height = 44
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 24
      Margins.Bottom = 6
      Align = alRight
      Caption = 'Enable = False (On)'
      Layout = tlCenter
      ExplicitLeft = 624
      ExplicitHeight = 32
    end
    object FluentToggleSwitch8: TFluentToggleSwitch
      AlignWithMargins = True
      Left = 889
      Top = 162
      Width = 140
      Height = 44
      Margins.Left = 24
      Margins.Top = 6
      Margins.Right = 24
      Margins.Bottom = 6
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
      ExplicitLeft = 880
    end
    object Label4: TLabel
      AlignWithMargins = True
      Left = 119
      Top = 218
      Width = 142
      Height = 84
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 24
      Margins.Bottom = 6
      Align = alRight
      Caption = 'Custom color'
      Layout = tlCenter
      ExplicitLeft = 110
      ExplicitHeight = 32
    end
    object FluentToggleSwitch4: TFluentToggleSwitch
      AlignWithMargins = True
      Left = 337
      Top = 238
      Width = 84
      Height = 44
      Margins.Left = 24
      Margins.Top = 6
      Margins.Right = 24
      Margins.Bottom = 6
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
      ExplicitLeft = 328
    end
    object Label9: TLabel
      AlignWithMargins = True
      Left = 762
      Top = 254
      Width = 77
      Height = 48
      Margins.Left = 6
      Margins.Top = 42
      Margins.Right = 24
      Margins.Bottom = 6
      Align = alRight
      Caption = 'Header'
      Layout = tlCenter
      ExplicitLeft = 753
      ExplicitHeight = 32
    end
    object FluentToggleSwitch9: TFluentToggleSwitch
      AlignWithMargins = True
      Left = 917
      Top = 218
      Width = 84
      Height = 84
      Margins.Left = 24
      Margins.Top = 6
      Margins.Right = 24
      Margins.Bottom = 6
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
      HeaderFont.Height = -24
      HeaderFont.Name = 'Consolas'
      HeaderFont.Style = [fsBold]
      ExplicitLeft = 908
    end
    object Label5: TLabel
      AlignWithMargins = True
      Left = 76
      Top = 314
      Width = 185
      Height = 88
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 24
      Margins.Bottom = 6
      Align = alRight
      Caption = 'Animated = False'
      Layout = tlCenter
      ExplicitLeft = 67
      ExplicitHeight = 32
    end
    object FluentToggleSwitch5: TFluentToggleSwitch
      AlignWithMargins = True
      Left = 337
      Top = 336
      Width = 84
      Height = 44
      Margins.Left = 24
      Margins.Top = 6
      Margins.Right = 24
      Margins.Bottom = 6
      Anchors = []
      DoubleBuffered = True
      ParentDoubleBuffered = False
      Animated = False
      TabOrder = 7
      ExplicitLeft = 328
    end
    object Label10: TLabel
      AlignWithMargins = True
      Left = 653
      Top = 314
      Width = 186
      Height = 52
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 24
      Margins.Bottom = 42
      Align = alRight
      Caption = 'Header = Bottom'
      Layout = tlCenter
      ExplicitLeft = 644
      ExplicitHeight = 32
    end
    object FluentToggleSwitch10: TFluentToggleSwitch
      AlignWithMargins = True
      Left = 917
      Top = 314
      Width = 84
      Height = 88
      Margins.Left = 24
      Margins.Top = 6
      Margins.Right = 24
      Margins.Bottom = 6
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
      HeaderFont.Height = -24
      HeaderFont.Name = 'Segoe UI'
      HeaderFont.Style = [fsUnderline]
      ExplicitLeft = 908
    end
    object Label11: TLabel
      AlignWithMargins = True
      Left = 35
      Top = 468
      Width = 226
      Height = 52
      Margins.Left = 6
      Margins.Top = 60
      Margins.Right = 24
      Margins.Bottom = 6
      Align = alRight
      Caption = 'Header and text (Off)'
      Layout = tlCenter
      ExplicitLeft = 26
      ExplicitHeight = 32
    end
    object FluentToggleSwitch11: TFluentToggleSwitch
      AlignWithMargins = True
      Left = 309
      Top = 432
      Width = 140
      Height = 88
      Margins.Left = 24
      Margins.Top = 24
      Margins.Right = 24
      Margins.Bottom = 6
      Anchors = []
      DoubleBuffered = True
      ParentDoubleBuffered = False
      AnimationDuration = 1500
      TabOrder = 10
      OnChange = FluentToggleSwitch11Change
      ShowText = True
      ShowHeader = True
      HeaderText = 'Header'
      ExplicitLeft = 300
    end
    object Label12: TLabel
      AlignWithMargins = True
      Left = 596
      Top = 468
      Width = 243
      Height = 52
      Margins.Left = 6
      Margins.Top = 60
      Margins.Right = 24
      Margins.Bottom = 6
      Align = alRight
      Caption = 'Every colour of its own'
      Layout = tlCenter
      ExplicitLeft = 587
      ExplicitHeight = 32
    end
    object FluentToggleSwitch12: TFluentToggleSwitch
      AlignWithMargins = True
      Left = 887
      Top = 432
      Width = 145
      Height = 88
      Margins.Left = 24
      Margins.Top = 24
      Margins.Right = 24
      Margins.Bottom = 6
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
      Font.Height = -24
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
      HeaderFont.Height = -24
      HeaderFont.Name = 'Segoe UI'
      HeaderFont.Style = [fsBold]
      ExplicitLeft = 878
    end
  end
end
