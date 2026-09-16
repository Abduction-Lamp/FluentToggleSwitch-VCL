object Form1: TForm1
  Left = 0
  Top = 0
  Margins.Left = 6
  Margins.Top = 6
  Margins.Right = 6
  Margins.Bottom = 6
  Caption = 'TFluentToggleSwitch Demo'
  ClientHeight = 541
  ClientWidth = 1071
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
    Width = 1047
    Height = 529
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
    DesignSize = (
      1047
      529)
    object LabelGroupKeyboard: TLabel
      AlignWithMargins = True
      Left = 56
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
      Left = 534
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
      Left = 174
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
      ExplicitHeight = 32
    end
    object FluentToggleSwitch1: TFluentToggleSwitch
      AlignWithMargins = True
      Left = 328
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
    end
    object Label6: TLabel
      AlignWithMargins = True
      Left = 717
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
      ExplicitHeight = 32
    end
    object FluentToggleSwitch6: TFluentToggleSwitch
      AlignWithMargins = True
      Left = 880
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
    end
    object Label2: TLabel
      AlignWithMargins = True
      Left = 31
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
      ExplicitHeight = 32
    end
    object FluentToggleSwitch2: TFluentToggleSwitch
      AlignWithMargins = True
      Left = 328
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
    end
    object Label7: TLabel
      AlignWithMargins = True
      Left = 701
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
      ExplicitHeight = 32
    end
    object FluentToggleSwitch7: TFluentToggleSwitch
      AlignWithMargins = True
      Left = 880
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
    end
    object Label3: TLabel
      AlignWithMargins = True
      Left = 44
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
      ExplicitHeight = 32
    end
    object FluentToggleSwitch3: TFluentToggleSwitch
      AlignWithMargins = True
      Left = 328
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
    end
    object Label8: TLabel
      AlignWithMargins = True
      Left = 624
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
      ExplicitHeight = 32
    end
    object FluentToggleSwitch8: TFluentToggleSwitch
      AlignWithMargins = True
      Left = 880
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
    end
    object Label4: TLabel
      AlignWithMargins = True
      Left = 110
      Top = 218
      Width = 142
      Height = 80
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 24
      Margins.Bottom = 6
      Align = alRight
      Caption = 'Custom color'
      Layout = tlCenter
      ExplicitHeight = 32
    end
    object FluentToggleSwitch4: TFluentToggleSwitch
      AlignWithMargins = True
      Left = 328
      Top = 236
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
    end
    object Label9: TLabel
      AlignWithMargins = True
      Left = 753
      Top = 254
      Width = 77
      Height = 44
      Margins.Left = 6
      Margins.Top = 42
      Margins.Right = 24
      Margins.Bottom = 6
      Align = alRight
      Caption = 'Header'
      Layout = tlCenter
      ExplicitHeight = 32
    end
    object FluentToggleSwitch9: TFluentToggleSwitch
      AlignWithMargins = True
      Left = 908
      Top = 218
      Width = 84
      Height = 80
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
    end
    object Label5: TLabel
      AlignWithMargins = True
      Left = 67
      Top = 310
      Width = 185
      Height = 80
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 24
      Margins.Bottom = 6
      Align = alRight
      Caption = 'Animated = False'
      Layout = tlCenter
      ExplicitHeight = 32
    end
    object FluentToggleSwitch5: TFluentToggleSwitch
      AlignWithMargins = True
      Left = 328
      Top = 328
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
    end
    object Label10: TLabel
      AlignWithMargins = True
      Left = 644
      Top = 310
      Width = 186
      Height = 44
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 24
      Margins.Bottom = 42
      Align = alRight
      Caption = 'Header = Bottom'
      Layout = tlCenter
      ExplicitHeight = 32
    end
    object FluentToggleSwitch10: TFluentToggleSwitch
      AlignWithMargins = True
      Left = 908
      Top = 310
      Width = 84
      Height = 80
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
    end
    object Label11: TLabel
      AlignWithMargins = True
      Left = 26
      Top = 456
      Width = 226
      Height = 44
      Margins.Left = 6
      Margins.Top = 60
      Margins.Right = 24
      Margins.Bottom = 6
      Align = alRight
      Caption = 'Header and text (Off)'
      Layout = tlCenter
      ExplicitHeight = 32
    end
    object FluentToggleSwitch11: TFluentToggleSwitch
      AlignWithMargins = True
      Left = 300
      Top = 420
      Width = 140
      Height = 80
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
    end
    object Label12: TLabel
      AlignWithMargins = True
      Left = 587
      Top = 456
      Width = 243
      Height = 44
      Margins.Left = 6
      Margins.Top = 60
      Margins.Right = 24
      Margins.Bottom = 6
      Align = alRight
      Caption = 'Every colour of its own'
      Layout = tlCenter
      ExplicitHeight = 32
    end
    object FluentToggleSwitch12: TFluentToggleSwitch
      AlignWithMargins = True
      Left = 878
      Top = 420
      Width = 145
      Height = 80
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
    end
  end
end
