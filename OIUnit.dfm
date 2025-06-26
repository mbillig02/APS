object OIForm: TOIForm
  Left = 0
  Top = 0
  Caption = 'Object Inspector'
  ClientHeight = 442
  ClientWidth = 445
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnActivate = FormActivate
  TextHeight = 15
  object LeftPanel: TPanel
    Left = 0
    Top = 0
    Width = 185
    Height = 442
    Align = alLeft
    TabOrder = 0
    ExplicitHeight = 441
    object BottomLeftPanel: TPanel
      Left = 1
      Top = 81
      Width = 183
      Height = 360
      Align = alClient
      Caption = 'BottomLeftPanel'
      TabOrder = 0
      ExplicitHeight = 359
      object Splitter: TSplitter
        Left = 1
        Top = 101
        Width = 181
        Height = 3
        Cursor = crVSplit
        Align = alBottom
        ExplicitTop = 1
        ExplicitWidth = 207
      end
      object ListBox1: TListBox
        Left = 1
        Top = 1
        Width = 181
        Height = 100
        Align = alClient
        ItemHeight = 15
        TabOrder = 0
        OnClick = ListBox1Click
        ExplicitLeft = -3
        ExplicitTop = -1
        ExplicitHeight = 148
      end
      object ListBox2: TListBox
        Left = 1
        Top = 104
        Width = 181
        Height = 255
        Align = alBottom
        ItemHeight = 15
        TabOrder = 1
        OnClick = ListBox2Click
      end
    end
    object TopLeftPanel: TPanel
      Left = 1
      Top = 1
      Width = 183
      Height = 80
      Align = alTop
      TabOrder = 1
      object WindowReticle: TWindowReticle
        Left = 76
        Top = 18
        Width = 32
        Height = 32
        OnDropSelect = WindowReticleDropSelect
      end
      object IncludeEventsCheckBox: TCheckBox
        Left = 11
        Top = 56
        Width = 100
        Height = 17
        Caption = 'Include Events'
        TabOrder = 1
        OnClick = IncludeEventsCheckBoxClick
      end
    end
  end
  object zObjectInspector: TzObjectInspector
    Left = 185
    Top = 0
    Width = 260
    Height = 442
    Align = alClient
    Text = 'zObjectInspector'
    Color = clWhite
    BorderStyle = bsSingle
    Component = zObjectInspector
    TabOrder = 1
    AllowSearch = True
    AutoCompleteText = True
    DefaultCategoryName = 'Miscellaneous'
    ShowGutter = True
    GutterColor = clCream
    GutterEdgeColor = clGray
    NameColor = clBtnText
    ValueColor = clNavy
    NonDefaultValueColor = clNavy
    BoldNonDefaultValue = True
    HighlightColor = 14737632
    ReferencesColor = clMaroon
    SubPropertiesColor = clGreen
    ShowHeader = False
    ShowGridLines = False
    GridColor = clBlack
    SplitterColor = clGray
    ReadOnlyColor = clGrayText
    FixedSplitter = False
    ReadOnly = False
    TrackChange = False
    GutterWidth = 12
    ShowItemHint = True
    SortByCategory = False
    SplitterPos = 100
    HeaderPropText = 'Property'
    HeaderValueText = 'Value'
    FloatPreference.MaxDigits = 2
    FloatPreference.ExpPrecision = 6
    OnBeforeAddItem = zObjectInspectorBeforeAddItem
    ExplicitWidth = 256
    ExplicitHeight = 441
  end
end
