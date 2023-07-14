object RealtimeFrame: TRealtimeFrame
  Left = 0
  Top = 0
  Width = 364
  Height = 165
  Color = clBtnFace
  ParentBackground = False
  ParentColor = False
  TabOrder = 0
  object RectLbl: TLabel
    Left = 0
    Top = 135
    Width = 364
    Height = 15
    Align = alBottom
    Alignment = taCenter
    ExplicitWidth = 3
  end
  object AppHandleLbl: TLabel
    Left = 0
    Top = 120
    Width = 364
    Height = 15
    Align = alBottom
    Alignment = taCenter
    ExplicitWidth = 3
  end
  object AppNameLbl: TLabel
    Left = 0
    Top = 150
    Width = 364
    Height = 15
    Align = alBottom
    Alignment = taCenter
    ExplicitWidth = 3
  end
  object PidLbl: TLabel
    Left = 0
    Top = 105
    Width = 364
    Height = 15
    Align = alBottom
    Alignment = taCenter
    ExplicitWidth = 3
  end
  object GSGetPanel: TPanel
    Left = 0
    Top = 81
    Width = 72
    Height = 40
    Alignment = taLeftJustify
    BorderWidth = 4
    Caption = 'GET'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object GSGetWindowReticle: TWindowReticle
      Left = 30
      Top = 4
      Width = 32
      Height = 32
      OnDropSelect = GSGetWindowReticleDropSelect
    end
  end
  object RefreshBtn: TButton
    Left = 286
    Top = 74
    Width = 75
    Height = 25
    Caption = 'Refresh'
    Enabled = False
    TabOrder = 1
    Visible = False
    OnClick = RefreshBtnClick
  end
  object StartBtn: TButton
    Left = 286
    Top = 12
    Width = 75
    Height = 25
    Caption = 'Start'
    Enabled = False
    TabOrder = 2
    Visible = False
    OnClick = StartBtnClick
  end
  object StopBtn: TButton
    Left = 286
    Top = 43
    Width = 75
    Height = 25
    Caption = 'Stop'
    Enabled = False
    TabOrder = 3
    Visible = False
    OnClick = StopBtnClick
  end
  object IncGroupBox: TGroupBox
    Left = 78
    Top = 77
    Width = 85
    Height = 45
    Caption = 'Increment'
    TabOrder = 4
    object SpinButtonX5: TSpinButton
      Left = 50
      Top = 17
      Width = 15
      Height = 17
      Hint = 'Adjust increment by 5'
      DownGlyph.Data = {
        0E010000424D0E01000000000000360000002800000009000000060000000100
        200000000000D800000000000000000000000000000000000000008080000080
        8000008080000080800000808000008080000080800000808000008080000080
        8000008080000080800000808000000000000080800000808000008080000080
        8000008080000080800000808000000000000000000000000000008080000080
        8000008080000080800000808000000000000000000000000000000000000000
        0000008080000080800000808000000000000000000000000000000000000000
        0000000000000000000000808000008080000080800000808000008080000080
        800000808000008080000080800000808000}
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      UpGlyph.Data = {
        0E010000424D0E01000000000000360000002800000009000000060000000100
        200000000000D800000000000000000000000000000000000000008080000080
        8000008080000080800000808000008080000080800000808000008080000080
        8000000000000000000000000000000000000000000000000000000000000080
        8000008080000080800000000000000000000000000000000000000000000080
        8000008080000080800000808000008080000000000000000000000000000080
        8000008080000080800000808000008080000080800000808000000000000080
        8000008080000080800000808000008080000080800000808000008080000080
        800000808000008080000080800000808000}
      OnDownClick = SpinButtonX5DownClick
      OnUpClick = SpinButtonX5UpClick
    end
    object IncSpinEdit: TSpinEdit
      Left = 4
      Top = 15
      Width = 44
      Height = 24
      MaxValue = 25
      MinValue = 1
      TabOrder = 1
      Value = 1
    end
    object SpinButtonX10: TSpinButton
      Left = 65
      Top = 17
      Width = 15
      Height = 17
      Hint = 'Adjust increment by 10'
      DownGlyph.Data = {
        0E010000424D0E01000000000000360000002800000009000000060000000100
        200000000000D800000000000000000000000000000000000000008080000080
        8000008080000080800000808000008080000080800000808000008080000080
        8000008080000080800000808000000000000080800000808000008080000080
        8000008080000080800000808000000000000000000000000000008080000080
        8000008080000080800000808000000000000000000000000000000000000000
        0000008080000080800000808000000000000000000000000000000000000000
        0000000000000000000000808000008080000080800000808000008080000080
        800000808000008080000080800000808000}
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      UpGlyph.Data = {
        0E010000424D0E01000000000000360000002800000009000000060000000100
        200000000000D800000000000000000000000000000000000000008080000080
        8000008080000080800000808000008080000080800000808000008080000080
        8000000000000000000000000000000000000000000000000000000000000080
        8000008080000080800000000000000000000000000000000000000000000080
        8000008080000080800000808000008080000000000000000000000000000080
        8000008080000080800000808000008080000080800000808000000000000080
        8000008080000080800000808000008080000080800000808000008080000080
        800000808000008080000080800000808000}
      OnDownClick = SpinButtonX10DownClick
      OnUpClick = SpinButtonX10UpClick
    end
  end
  object MoveGroupBox: TGroupBox
    Left = 5
    Top = 0
    Width = 67
    Height = 71
    Caption = 'Move'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    object TriangleButtonLU: TTriangleButton
      Left = 7
      Top = 15
      Width = 20
      Height = 20
      Hint = 'Up Left'
      ButtonColor = clHighlight
      ButtonDownColor = clBtnShadow
      InnerCursor = crHandPoint
      Enabled = False
      OnClick = TriangleButtonLUClick
      Direction = dirLU
    end
    object TriangleButtonL: TTriangleButton
      Left = 7
      Top = 29
      Width = 17
      Height = 20
      Hint = 'Left'
      ButtonColor = clAqua
      ButtonDownColor = clBtnShadow
      InnerCursor = crHandPoint
      Enabled = False
      OnClick = TriangleButtonLClick
      Direction = dirLeft
    end
    object TriangleButtonU: TTriangleButton
      Left = 22
      Top = 15
      Width = 20
      Height = 17
      Hint = 'Up'
      ButtonColor = 36095
      ButtonDownColor = clBtnShadow
      InnerCursor = crHandPoint
      Enabled = False
      OnClick = TriangleButtonUClick
      Direction = dirUp
    end
    object TriangleButtonRU: TTriangleButton
      Left = 38
      Top = 15
      Width = 20
      Height = 20
      Hint = 'Up Right'
      ButtonColor = clHighlight
      ButtonDownColor = clBtnShadow
      InnerCursor = crHandPoint
      Enabled = False
      OnClick = TriangleButtonRUClick
      Direction = dirRU
    end
    object TriangleButtonR: TTriangleButton
      Left = 40
      Top = 29
      Width = 17
      Height = 20
      Hint = 'Right'
      ButtonColor = clYellow
      ButtonDownColor = clBtnShadow
      InnerCursor = crHandPoint
      Enabled = False
      OnClick = TriangleButtonRClick
      Direction = dirRight
    end
    object TriangleButtonRD: TTriangleButton
      Left = 38
      Top = 44
      Width = 20
      Height = 20
      Hint = 'Down Right'
      ButtonColor = clHighlight
      ButtonDownColor = clBtnShadow
      InnerCursor = crHandPoint
      Enabled = False
      OnClick = TriangleButtonRDClick
      Direction = dirRD
    end
    object TriangleButtonD: TTriangleButton
      Left = 22
      Top = 47
      Width = 20
      Height = 17
      Hint = 'Down'
      ButtonColor = clLime
      ButtonDownColor = clBtnShadow
      InnerCursor = crHandPoint
      Enabled = False
      OnClick = TriangleButtonDClick
      Direction = dirDown
    end
    object TriangleButtonLD: TTriangleButton
      Left = 7
      Top = 44
      Width = 20
      Height = 20
      Hint = 'Down Left'
      ButtonColor = clHighlight
      ButtonDownColor = clBtnShadow
      InnerCursor = crHandPoint
      Enabled = False
      OnClick = TriangleButtonLDClick
      Direction = dirLD
    end
  end
  object ResizeGroupBox: TGroupBox
    Left = 78
    Top = 0
    Width = 75
    Height = 80
    Caption = 'Resize'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    object TriangleButtonIL: TTriangleButton
      Left = 5
      Top = 35
      Width = 17
      Height = 20
      Hint = 'Left In'
      ButtonColor = clAqua
      ButtonDownColor = clBtnShadow
      InnerCursor = crHandPoint
      Enabled = False
      OnClick = TriangleButtonILClick
      Direction = dirRight
    end
    object TriangleButtonDL: TTriangleButton
      Left = 5
      Top = 55
      Width = 17
      Height = 20
      Hint = 'Left Out'
      ButtonColor = clAqua
      ButtonDownColor = clBtnShadow
      InnerCursor = crHandPoint
      Enabled = False
      OnClick = TriangleButtonDLClick
      Direction = dirLeft
    end
    object TriangleButtonIT: TTriangleButton
      Left = 25
      Top = 15
      Width = 20
      Height = 17
      Hint = 'Top In'
      ButtonColor = 36095
      ButtonDownColor = clBtnShadow
      InnerCursor = crHandPoint
      Enabled = False
      OnClick = TriangleButtonITClick
      Direction = dirDown
    end
    object TriangleButtonDT: TTriangleButton
      Left = 5
      Top = 15
      Width = 20
      Height = 17
      Hint = 'Top Out'
      ButtonColor = 36095
      ButtonDownColor = clBtnShadow
      InnerCursor = crHandPoint
      Enabled = False
      OnClick = TriangleButtonDTClick
      Direction = dirUp
    end
    object TriangleButtonDB: TTriangleButton
      Left = 27
      Top = 58
      Width = 20
      Height = 17
      Hint = 'Bottom In'
      ButtonColor = clLime
      ButtonDownColor = clBtnShadow
      InnerCursor = crHandPoint
      Enabled = False
      OnClick = TriangleButtonDBClick
      Direction = dirUp
    end
    object TriangleButtonIB: TTriangleButton
      Left = 47
      Top = 58
      Width = 20
      Height = 17
      Hint = 'Bottom Out'
      ButtonColor = clLime
      ButtonDownColor = clBtnShadow
      InnerCursor = crHandPoint
      Enabled = False
      OnClick = TriangleButtonIBClick
      Direction = dirDown
    end
    object TriangleButtonDR: TTriangleButton
      Left = 51
      Top = 34
      Width = 17
      Height = 20
      Hint = 'Right In'
      ButtonColor = clYellow
      ButtonDownColor = clBtnShadow
      InnerCursor = crHandPoint
      Enabled = False
      OnClick = TriangleButtonDRClick
      Direction = dirLeft
    end
    object TriangleButtonIR: TTriangleButton
      Left = 51
      Top = 14
      Width = 17
      Height = 20
      Hint = 'Right Out'
      ButtonColor = clYellow
      ButtonDownColor = clBtnShadow
      InnerCursor = crHandPoint
      Enabled = False
      OnClick = TriangleButtonIRClick
      Direction = dirRight
    end
  end
  object RefreshTimer: TTimer
    Enabled = False
    OnTimer = RefreshTimerTimer
    Left = 296
    Top = 112
  end
end
