object GetSetFrame: TGetSetFrame
  Left = 0
  Top = 0
  Width = 358
  Height = 45
  TabOrder = 0
  object HeightSpinEdit: TSpinEdit
    Left = 233
    Top = 0
    Width = 50
    Height = 22
    Hint = 'Height'
    MaxValue = 0
    MinValue = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    Value = 300
  end
  object LeftSpinEdit: TSpinEdit
    Left = 77
    Top = 0
    Width = 50
    Height = 22
    Hint = 'Left'
    MaxValue = 0
    MinValue = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    Value = 0
  end
  object TopSpinEdit: TSpinEdit
    Left = 129
    Top = 0
    Width = 50
    Height = 22
    Hint = 'Top'
    MaxValue = 0
    MinValue = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    Value = 0
  end
  object WidthSpinEdit: TSpinEdit
    Left = 181
    Top = 0
    Width = 50
    Height = 22
    Hint = 'Width'
    MaxValue = 0
    MinValue = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    Value = 500
  end
  object NameEdit: TEdit
    Left = 77
    Top = 24
    Width = 205
    Height = 21
    TabOrder = 4
  end
  object GSGetPanel: TPanel
    Left = 3
    Top = 2
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
    TabOrder = 5
    object GSGetWindowReticle: TWindowReticle
      Left = 30
      Top = 4
      Width = 32
      Height = 32
      OnDropSelect = GSGetWindowReticleDropSelect
    end
  end
  object GSSetPanel: TPanel
    Left = 285
    Top = 2
    Width = 72
    Height = 40
    Alignment = taLeftJustify
    BorderWidth = 4
    Caption = 'SET'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    object GSSetWindowReticle: TWindowReticle
      Left = 30
      Top = 4
      Width = 32
      Height = 32
      OnDropSelect = GSSetWindowReticleDropSelect
    end
  end
end
