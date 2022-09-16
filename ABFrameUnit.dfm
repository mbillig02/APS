object ApplicationBoundsFrame: TApplicationBoundsFrame
  Left = 0
  Top = 0
  Width = 261
  Height = 172
  TabOrder = 0
  object ApplicationBounsJvPageList: TJvPageList
    Left = 0
    Top = 22
    Width = 174
    Height = 111
    ActivePage = GetSetJvStandardPage
    PropagateEnable = False
    object CenterPercentJvStandardPage: TJvStandardPage
      Left = 0
      Top = 0
      Width = 174
      Height = 111
      Caption = 'CenterPercentJvStandardPage'
      object CenterPercentGroupBox: TGroupBox
        Left = 0
        Top = 0
        Width = 174
        Height = 111
        Align = alClient
        Caption = 'Center'
        TabOrder = 0
        object CenterPercentPanel: TPanel
          Left = 26
          Top = 18
          Width = 72
          Height = 40
          TabOrder = 0
          object CenterPercentWindowReticle: TWindowReticle
            Left = 20
            Top = 4
            Width = 32
            Height = 32
            OnDropSelect = WindowReticleDropSelect
          end
        end
        object CenterPercentSpinEdit: TSpinEdit
          Left = 104
          Top = 28
          Width = 43
          Height = 22
          Increment = 5
          MaxValue = 100
          MinValue = 50
          TabOrder = 1
          Value = 75
        end
        object CenterPanel: TPanel
          Left = 26
          Top = 64
          Width = 72
          Height = 40
          TabOrder = 2
          object CenterWindowReticle: TWindowReticle
            Left = 20
            Top = 4
            Width = 32
            Height = 32
            OnDropSelect = WindowReticleDropSelect
          end
        end
      end
    end
    object ScreenCornersJvStandardPage: TJvStandardPage
      Left = 0
      Top = 0
      Width = 174
      Height = 111
      Caption = 'ScreenCornersJvStandardPage'
      object ScreenCornersGroupBox: TGroupBox
        Left = 0
        Top = 0
        Width = 174
        Height = 110
        Caption = 'Screen Corners'
        TabOrder = 0
        object SCTLPanel: TPanel
          Left = 10
          Top = 15
          Width = 72
          Height = 40
          TabOrder = 0
          object SCTLWindowReticle: TWindowReticle
            Left = 20
            Top = 4
            Width = 32
            Height = 32
            OnDropSelect = WindowReticleDropSelect
          end
        end
        object SCTRPanel: TPanel
          Left = 91
          Top = 15
          Width = 72
          Height = 40
          TabOrder = 1
          object SCTRWindowReticle: TWindowReticle
            Left = 20
            Top = 4
            Width = 32
            Height = 32
            OnDropSelect = WindowReticleDropSelect
          end
        end
        object SCBLPanel: TPanel
          Left = 10
          Top = 61
          Width = 72
          Height = 40
          TabOrder = 2
          object SCBLWindowReticle: TWindowReticle
            Left = 20
            Top = 4
            Width = 32
            Height = 32
            OnDropSelect = WindowReticleDropSelect
          end
        end
        object SCBRPanel: TPanel
          Left = 91
          Top = 61
          Width = 72
          Height = 40
          TabOrder = 3
          object SCBRWindowReticle: TWindowReticle
            Left = 20
            Top = 4
            Width = 32
            Height = 32
            OnDropSelect = WindowReticleDropSelect
          end
        end
      end
    end
    object ScreenSidesJvStandardPage: TJvStandardPage
      Left = 0
      Top = 0
      Width = 174
      Height = 111
      Caption = 'ScreenSidesJvStandardPage'
      object ScreenSidesGroupBox: TGroupBox
        Left = 0
        Top = 0
        Width = 174
        Height = 110
        Caption = 'Screen Sides'
        TabOrder = 0
        object SSLPanel: TPanel
          Left = 10
          Top = 15
          Width = 72
          Height = 86
          TabOrder = 0
          object SSLWindowReticle: TWindowReticle
            Left = 20
            Top = 27
            Width = 32
            Height = 32
            OnDropSelect = WindowReticleDropSelect
          end
        end
        object SSRPanel: TPanel
          Left = 91
          Top = 15
          Width = 72
          Height = 86
          TabOrder = 1
          object SSRWindowReticle: TWindowReticle
            Left = 20
            Top = 27
            Width = 32
            Height = 32
            OnDropSelect = WindowReticleDropSelect
          end
        end
      end
    end
    object GetSetJvStandardPage: TJvStandardPage
      Left = 0
      Top = 0
      Width = 174
      Height = 111
      Caption = 'GetSetJvStandardPage'
      object GetSetGroupBox: TGroupBox
        Left = 0
        Top = 0
        Width = 174
        Height = 110
        Caption = 'Get Set'
        TabOrder = 0
        object GSGetPanel: TPanel
          Left = 10
          Top = 61
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
        object GSSetPanel: TPanel
          Left = 91
          Top = 61
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
          TabOrder = 1
          object GSSetWindowReticle: TWindowReticle
            Left = 30
            Top = 4
            Width = 32
            Height = 32
            OnDropSelect = WindowReticleDropSelect
          end
        end
        object LeftLabeledEdit: TLabeledEdit
          Left = 8
          Top = 31
          Width = 35
          Height = 21
          EditLabel.Width = 23
          EditLabel.Height = 13
          EditLabel.Caption = 'Left:'
          NumbersOnly = True
          TabOrder = 2
          Text = '0'
        end
        object TopLabeledEdit: TLabeledEdit
          Left = 49
          Top = 31
          Width = 35
          Height = 21
          EditLabel.Width = 22
          EditLabel.Height = 13
          EditLabel.Caption = 'Top:'
          NumbersOnly = True
          TabOrder = 3
          Text = '0'
        end
        object WidthLabeledEdit: TLabeledEdit
          Left = 90
          Top = 31
          Width = 35
          Height = 21
          EditLabel.Width = 32
          EditLabel.Height = 13
          EditLabel.Caption = 'Width:'
          NumbersOnly = True
          TabOrder = 4
          Text = '600'
        end
        object HeightLabeledEdit: TLabeledEdit
          Left = 131
          Top = 31
          Width = 35
          Height = 21
          EditLabel.Width = 35
          EditLabel.Height = 13
          EditLabel.Caption = 'Height:'
          NumbersOnly = True
          TabOrder = 5
          Text = '300'
        end
      end
    end
  end
  object JvToolBar: TJvToolBar
    Left = 0
    Top = 0
    Width = 261
    Height = 24
    ButtonHeight = 21
    ButtonWidth = 45
    Caption = 'JvToolBar'
    ShowCaptions = True
    TabOrder = 1
    object CenterToolButton: TToolButton
      Left = 0
      Top = 0
      Action = aCenterPage
      AutoSize = True
    end
    object CornersToolButton: TToolButton
      Left = 44
      Top = 0
      Action = aCornersPage
      AutoSize = True
    end
    object SidesToolButton: TToolButton
      Left = 93
      Top = 0
      Action = aSidesPage
      AutoSize = True
    end
    object GetSetToolButton: TToolButton
      Left = 129
      Top = 0
      Action = aGetSetPage
      AutoSize = True
    end
  end
  object ABFActionList: TActionList
    Left = 120
    Top = 72
    object aCenterPage: TAction
      Caption = 'Center'
      OnExecute = aCenterPageExecute
    end
    object aCornersPage: TAction
      Caption = 'Corners'
      OnExecute = aCornersPageExecute
    end
    object aSidesPage: TAction
      Caption = 'Sides'
      OnExecute = aSidesPageExecute
    end
    object aGetSetPage: TAction
      Caption = 'GetSet'
      OnExecute = aGetSetPageExecute
    end
  end
end
