object SettingsForm: TSettingsForm
  Left = 0
  Top = 0
  Caption = 'Settings'
  ClientHeight = 326
  ClientWidth = 434
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object JvSettingsTreeView: TJvSettingsTreeView
    Left = 0
    Top = 0
    Width = 97
    Height = 326
    PageDefault = 0
    PageList = JvPageList
    Align = alLeft
    Indent = 19
    TabOrder = 0
    Items.NodeData = {
      030300000034000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000020000
      0000000000010B4400690072006500630074006F007200690065007300260000
      00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000100000000000000010446
      006F0072006D002A000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
      0000000000000001065300740079006C0065007300}
    Items.Links = {03000000020000000100000000000000}
  end
  object JvPageList: TJvPageList
    Left = 97
    Top = 0
    Width = 337
    Height = 326
    ActivePage = JvStandardPageForm
    PropagateEnable = False
    Align = alClient
    object JvStandardPageStyles: TJvStandardPage
      Left = 0
      Top = 0
      Width = 337
      Height = 326
      Caption = ' '
      object StylesListBox: TListBox
        Left = 24
        Top = 24
        Width = 121
        Height = 193
        ItemHeight = 13
        TabOrder = 0
        OnClick = StylesListBoxClick
      end
      object StylesMMCheckBox: TCheckBox
        Left = 24
        Top = 232
        Width = 121
        Height = 17
        Caption = 'Styles on MainMenu'
        TabOrder = 1
        OnClick = StylesMMCheckBoxClick
      end
      object EnableStylesSettingsCheckBox: TCheckBox
        Left = 24
        Top = 255
        Width = 145
        Height = 17
        Hint = 'Causes access violation'
        Caption = 'Enable Styles on Settings'
        TabOrder = 2
        OnClick = EnableStylesSettingsCheckBoxClick
      end
    end
    object JvStandardPageForm: TJvStandardPage
      Left = 0
      Top = 0
      Width = 337
      Height = 326
      Caption = ' '
      object SetDefaultScreenBtn: TButton
        Left = 17
        Top = 24
        Width = 121
        Height = 25
        Caption = 'Set Default Screen'
        TabOrder = 0
        OnClick = SetDefaultScreenBtnClick
      end
      object SetAlomstFullScreenBtn: TButton
        Left = 17
        Top = 64
        Width = 121
        Height = 25
        Caption = 'Set Alomst Full Screen'
        TabOrder = 1
        OnClick = SetAlomstFullScreenBtnClick
      end
      object SavFrmSizChkBox: TCheckBox
        Left = 17
        Top = 104
        Width = 97
        Height = 17
        Caption = 'Save form size'
        TabOrder = 2
        OnClick = SavFrmSizChkBoxClick
      end
      object SavFrmPosChkBox: TCheckBox
        Left = 17
        Top = 126
        Width = 113
        Height = 17
        Caption = 'Save form position'
        TabOrder = 3
        OnClick = SavFrmPosChkBoxClick
      end
      inline TScrPosFrame: TScrPosFrame
        Left = 9
        Top = 157
        Width = 185
        Height = 65
        TabOrder = 4
        ExplicitLeft = 9
        ExplicitTop = 157
        inherited SpinEditLeft: TSpinEdit
          OnChange = TScrPosFrameSpinEditLeftChange
        end
        inherited SpinEditTop: TSpinEdit
          OnChange = TScrPosFrameSpinEditTopChange
        end
        inherited SpinEditHeight: TSpinEdit
          OnChange = TScrPosFrameSpinEditHeightChange
        end
        inherited SpinEditWidth: TSpinEdit
          OnChange = TScrPosFrameSpinEditWidthChange
        end
      end
      object MainFormSettingsListBox: TListBox
        Left = 144
        Top = 26
        Width = 178
        Height = 117
        ItemHeight = 13
        TabOrder = 5
      end
      object MainFormSettingsToListBoxBtn: TButton
        Left = 229
        Top = 165
        Width = 96
        Height = 25
        Caption = 'Get (To ListBox)'
        TabOrder = 6
        OnClick = MainFormSettingsToListBoxBtnClick
      end
      object DeleteListBoxItemBtn: TButton
        Left = 229
        Top = 280
        Width = 96
        Height = 25
        Caption = 'Delete'
        TabOrder = 7
        OnClick = DeleteListBoxItemBtnClick
      end
      object ListToFormGroupBox: TGroupBox
        Left = 222
        Top = 191
        Width = 113
        Height = 80
        Caption = 'List to Form'
        TabOrder = 8
        object MainFormPosSettingsToFormBtn: TButton
          Left = 8
          Top = 16
          Width = 45
          Height = 25
          Caption = 'Pos'
          TabOrder = 0
          OnClick = MainFormPosSettingsToFormBtnClick
        end
        object MainFormSizeSettingsToFormBtn: TButton
          Left = 59
          Top = 16
          Width = 45
          Height = 25
          Caption = 'Size'
          TabOrder = 1
          OnClick = MainFormSizeSettingsToFormBtnClick
        end
        object MainFormSettingsToFormBtn: TButton
          Left = 8
          Top = 47
          Width = 96
          Height = 25
          Caption = 'Set (To Form)'
          TabOrder = 2
          OnClick = MainFormSettingsToFormBtnClick
        end
      end
      object StayOnTopCheckBox: TCheckBox
        Left = 17
        Top = 288
        Width = 80
        Height = 17
        Caption = 'Stay On Top'
        TabOrder = 9
        OnClick = StayOnTopCheckBoxClick
      end
    end
    object JvStandardPageDirectories: TJvStandardPage
      Left = 0
      Top = 0
      Width = 337
      Height = 326
      Caption = 'JvStandardPageDirectories'
      object DtaDirGrpBox: TGroupBox
        Left = 0
        Top = 0
        Width = 337
        Height = 65
        Align = alTop
        Caption = 'DtaDir'
        TabOrder = 0
        object DtaDirLbl: TLabel
          Left = 8
          Top = 16
          Width = 43
          Height = 13
          Caption = 'DtaDirLbl'
        end
        object DtaDirCopyToClpBrdBtn: TButton
          Left = 7
          Top = 34
          Width = 104
          Height = 25
          Caption = 'Copy to Clipboard'
          TabOrder = 0
          OnClick = DtaDirCopyToClpBrdBtnClick
        end
        object DtaDirOpenInExplorerBtn: TButton
          Left = 117
          Top = 34
          Width = 104
          Height = 25
          Caption = 'Open in Explorer'
          TabOrder = 1
          OnClick = DtaDirOpenInExplorerBtnClick
        end
      end
      object TmpDirGrpBox: TGroupBox
        Left = 0
        Top = 130
        Width = 337
        Height = 65
        Align = alTop
        Caption = 'TmpDir'
        TabOrder = 1
        object TmpDirLbl: TLabel
          Left = 8
          Top = 16
          Width = 46
          Height = 13
          Caption = 'TmpDirLbl'
        end
        object TmpDirCopyToClpBrdBtn: TButton
          Left = 7
          Top = 34
          Width = 104
          Height = 25
          Caption = 'Copy to Clipboard'
          TabOrder = 0
          OnClick = TmpDirCopyToClpBrdBtnClick
        end
        object TmpDirOpenInExplorerBtn: TButton
          Left = 117
          Top = 34
          Width = 104
          Height = 25
          Caption = 'Open in Explorer'
          TabOrder = 1
          OnClick = TmpDirOpenInExplorerBtnClick
        end
      end
      object LstDirGrpBox: TGroupBox
        Left = 0
        Top = 65
        Width = 337
        Height = 65
        Align = alTop
        Caption = 'LstDir'
        TabOrder = 2
        object LstDirLbl: TLabel
          Left = 8
          Top = 16
          Width = 40
          Height = 13
          Caption = 'LstDirLbl'
        end
        object LstDirCopyToClpBrdBtn: TButton
          Left = 7
          Top = 34
          Width = 104
          Height = 25
          Caption = 'Copy to Clipboard'
          TabOrder = 0
          OnContextPopup = LstDirCopyToClpBrdBtnContextPopup
        end
        object LstDirOpenInExplorerBtn: TButton
          Left = 117
          Top = 34
          Width = 104
          Height = 25
          Caption = 'Open in Explorer'
          TabOrder = 1
          OnClick = LstDirOpenInExplorerBtnClick
        end
      end
    end
  end
  object DtaDirJvBalloonHint: TJvBalloonHint
    Left = 360
    Top = 80
  end
  object TmpDirJvBalloonHint: TJvBalloonHint
    Left = 360
    Top = 272
  end
  object LstDirJvBalloonHint: TJvBalloonHint
    Left = 360
    Top = 176
  end
end
