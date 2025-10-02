object SettingsForm: TSettingsForm
  Left = 0
  Top = 0
  Caption = 'Settings'
  ClientHeight = 325
  ClientWidth = 430
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poDesigned
  OnActivate = FormActivate
  OnShow = FormShow
  TextHeight = 13
  object JvPageList: TJvPageList
    Left = 75
    Top = 0
    Width = 355
    Height = 325
    ActivePage = JvStandardPageForm
    PropagateEnable = False
    Align = alClient
    ExplicitWidth = 351
    ExplicitHeight = 324
    object JvStandardPageAdmin: TJvStandardPage
      Left = 0
      Top = 0
      Width = 355
      Height = 325
      Caption = 'JvStandardPageAdmin'
      OnShow = JvStandardPageAdminShow
      object PublicDesktopGroupBox: TGroupBox
        Left = 0
        Top = 0
        Width = 355
        Height = 35
        Hint = 'C:\Users\Public\Desktop\APS.lnk'
        Align = alTop
        Caption = 'Public Desktop'
        TabOrder = 0
        Visible = False
        object PublicDesktopRunAsCheckBox: TCheckBox
          Left = 6
          Top = 15
          Width = 97
          Height = 17
          Caption = 'Run as admin'
          TabOrder = 0
          OnClick = RunAsAdminCheckBoxClick
        end
      end
      object PublicStartMenuGroupBox: TGroupBox
        Left = 0
        Top = 35
        Width = 355
        Height = 35
        Hint = 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\APS\APS.lnk'
        Align = alTop
        Caption = 'Public Start Menu'
        TabOrder = 1
        Visible = False
        object PublicStartMenuRunAsCheckBox: TCheckBox
          Left = 6
          Top = 15
          Width = 97
          Height = 17
          Caption = 'Run as admin'
          TabOrder = 0
          OnClick = RunAsAdminCheckBoxClick
        end
      end
      object UserTaskbarGroupBox: TGroupBox
        Left = 0
        Top = 105
        Width = 355
        Height = 35
        Hint = 
          'C:\Users\user\AppData\Roaming\Microsoft\Internet Explorer\Quick ' +
          'Launch\User Pinned\TaskBar\APS.lnk'
        Align = alTop
        Caption = 'User Taskbar'
        TabOrder = 2
        Visible = False
        object UserTaskbarRunAsCheckBox: TCheckBox
          Left = 6
          Top = 15
          Width = 97
          Height = 17
          Caption = 'Run as admin'
          TabOrder = 0
          OnClick = RunAsAdminCheckBoxClick
        end
      end
      object UserDesktopGroupBox: TGroupBox
        Left = 0
        Top = 70
        Width = 355
        Height = 35
        Hint = 
          'C:\Users\user\AppData\Roaming\Microsoft\Internet Explorer\Quick ' +
          'Launch\User Pinned\TaskBar\APS.lnk'
        Align = alTop
        Caption = 'User Desktop'
        TabOrder = 3
        Visible = False
        object UserDesktopRunAsCheckBox: TCheckBox
          Left = 6
          Top = 15
          Width = 97
          Height = 17
          Caption = 'Run as admin'
          TabOrder = 0
          OnClick = RunAsAdminCheckBoxClick
        end
      end
      object SetAdmBtmPanel: TPanel
        Left = 0
        Top = 140
        Width = 355
        Height = 185
        Align = alClient
        TabOrder = 4
        object SetAdmBtmRPanel: TPanel
          Left = 278
          Top = 1
          Width = 76
          Height = 183
          Align = alRight
          TabOrder = 0
          object CreateIniBtn: TButton
            Left = 0
            Top = 0
            Width = 75
            Height = 25
            Caption = 'Create Ini'
            TabOrder = 0
            OnClick = CreateIniBtnClick
          end
          object EditIniBtn: TButton
            Left = 0
            Top = 25
            Width = 75
            Height = 25
            Caption = 'Edit Ini'
            TabOrder = 1
            OnClick = EditIniBtnClick
          end
          object LoadAndCheckBtn: TButton
            Left = 0
            Top = 50
            Width = 75
            Height = 25
            Caption = 'Load && Check'
            TabOrder = 2
            OnClick = LoadAndCheckBtnClick
          end
          object ShowMissingLinksCheckBox: TCheckBox
            Left = 8
            Top = 106
            Width = 57
            Height = 41
            Caption = 'Show Missing Links'
            TabOrder = 3
            WordWrap = True
            OnClick = ShowMissingLinksCheckBoxClick
          end
          object ColorChgBtn: TButton
            Left = 0
            Top = 75
            Width = 75
            Height = 25
            Caption = 'Color Change'
            TabOrder = 4
            OnClick = ColorChgBtnClick
          end
        end
        inline RunAsFrame: TRunAsFrame
          Left = 1
          Top = 1
          Width = 277
          Height = 183
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Align = alClient
          TabOrder = 1
          ExplicitLeft = 1
          ExplicitTop = 1
          ExplicitWidth = 277
          ExplicitHeight = 183
          inherited RunAsListBox: TListBox
            Top = 87
            Width = 277
            Height = 96
            ItemHeight = 13
            ExplicitTop = 87
            ExplicitWidth = 277
            ExplicitHeight = 96
          end
          inherited RunAsCheckListBox: TCheckListBox
            Width = 277
            Height = 87
            ItemHeight = 17
            ExplicitWidth = 277
            ExplicitHeight = 87
          end
        end
      end
    end
    object JvStandardPageDirectories: TJvStandardPage
      Left = 0
      Top = 0
      Width = 355
      Height = 325
      Caption = 'JvStandardPageDirectories'
      object DtaDirGrpBox: TGroupBox
        Left = 0
        Top = 0
        Width = 355
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
        Width = 355
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
        Width = 355
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
          OnClick = LstDirCopyToClpBrdBtnClick
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
    object JvStandardPageForm: TJvStandardPage
      Left = 0
      Top = 0
      Width = 355
      Height = 325
      Caption = ' '
      ExplicitLeft = 5
      ExplicitTop = 1
      object SetDefaultScreenBtn: TButton
        Left = 17
        Top = 17
        Width = 121
        Height = 25
        Hint = 'Set Default Screen'
        Caption = 'Set Default Screen'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = SetDefaultScreenBtnClick
      end
      object SetAlomstFullScreenBtn: TButton
        Left = 17
        Top = 73
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
        inherited LeftLbl: TLabel
          Width = 19
          Height = 13
          ExplicitWidth = 19
          ExplicitHeight = 13
        end
        inherited TopLbl: TLabel
          Width = 18
          Height = 13
          ExplicitWidth = 18
          ExplicitHeight = 13
        end
        inherited HeightLbl: TLabel
          Width = 31
          Height = 13
          ExplicitWidth = 31
          ExplicitHeight = 13
        end
        inherited WidthLbl: TLabel
          Width = 28
          Height = 13
          ExplicitWidth = 28
          ExplicitHeight = 13
        end
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
      object SetDefaultPosBtn: TButton
        Left = 17
        Top = 45
        Width = 55
        Height = 25
        Hint = 'Default Position'
        Caption = 'Pos'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 10
        OnClick = SetDefaultPosBtnClick
      end
      object SetDefaultSizeBtn: TButton
        Left = 83
        Top = 45
        Width = 55
        Height = 25
        Hint = 'Default Size'
        Caption = 'Size'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 11
        OnClick = SetDefaultSizeBtnClick
      end
    end
    object JvStandardPageStyles: TJvStandardPage
      Left = 0
      Top = 0
      Width = 355
      Height = 325
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
    object JvStandardPageHotKeys: TJvStandardPage
      Left = 0
      Top = 0
      Width = 355
      Height = 325
      Caption = 'JvStandardPageHotKeys'
      object AppHideShowGroupBox: TGroupBox
        Left = 16
        Top = 16
        Width = 277
        Height = 49
        Caption = 'Application Hide Show'
        TabOrder = 0
        object AltCheckBox: TCheckBox
          Left = 11
          Top = 19
          Width = 45
          Height = 17
          Caption = 'Alt'
          TabOrder = 0
        end
        object CtrlCheckBox: TCheckBox
          Left = 51
          Top = 19
          Width = 45
          Height = 17
          Caption = 'Ctrl'
          TabOrder = 1
        end
        object KeyComboBox: TComboBox
          Left = 137
          Top = 17
          Width = 45
          Height = 21
          TabOrder = 2
          Text = 'F10'
          Items.Strings = (
            '1'
            '2'
            '3'
            '4'
            '5'
            '6'
            '7'
            '8'
            '9'
            '0'
            'A'
            'B'
            'C'
            'D'
            'E'
            'F'
            'G'
            'H'
            'I'
            'J'
            'K'
            'L'
            'M'
            'N'
            'O'
            'P'
            'Q'
            'R'
            'S'
            'T'
            'U'
            'V'
            'W'
            'X'
            'Y'
            'Z')
        end
        object ShftCheckBox: TCheckBox
          Left = 91
          Top = 19
          Width = 45
          Height = 17
          Caption = 'Shft'
          TabOrder = 3
        end
        object SetHotKeyBtn: TButton
          Left = 191
          Top = 15
          Width = 75
          Height = 25
          Caption = 'Set HotKey'
          TabOrder = 4
          OnClick = SetHotKeyBtnClick
        end
      end
    end
    object JvStandardPagePages: TJvStandardPage
      Left = 0
      Top = 0
      Width = 355
      Height = 325
      Caption = 'JvStandardPagePages'
      object MiscMainMenuGroupBox: TGroupBox
        Left = 6
        Top = 3
        Width = 163
        Height = 142
        Caption = 'MainMenu'
        TabOrder = 0
        object PagesCheckBox: TCheckBox
          Left = 16
          Top = 18
          Width = 137
          Height = 17
          Caption = 'Show Pages Sub-menu'
          TabOrder = 0
          OnClick = PagesCheckBoxClick
        end
        object Page1CheckBox: TCheckBox
          Left = 16
          Top = 41
          Width = 129
          Height = 17
          Caption = 'Page 1 (CSV DB)'
          TabOrder = 1
          OnClick = Page1CheckBoxClick
        end
        object Page2CheckBox: TCheckBox
          Left = 16
          Top = 65
          Width = 144
          Height = 17
          Caption = 'Page 2 (Application List)'
          TabOrder = 2
          OnClick = Page2CheckBoxClick
        end
        object Page3CheckBox: TCheckBox
          Left = 16
          Top = 88
          Width = 129
          Height = 17
          Caption = 'Page 3 (Get Set)'
          TabOrder = 3
          OnClick = Page3CheckBoxClick
        end
        object Page4CheckBox: TCheckBox
          Left = 16
          Top = 111
          Width = 129
          Height = 17
          Caption = 'Page 4 (Real Time)'
          TabOrder = 4
          OnClick = Page4CheckBoxClick
        end
      end
    end
    object JvStandardPageMisc: TJvStandardPage
      Left = 0
      Top = 0
      Width = 355
      Height = 325
      Caption = 'JvStandardPageMisc'
      object SaveCenterPercentCheckBox: TCheckBox
        Left = 16
        Top = 9
        Width = 129
        Height = 17
        Caption = 'Save Center Percent'
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object ConfirmBeforeCheckBox: TCheckBox
        Left = 16
        Top = 51
        Width = 145
        Height = 17
        Caption = 'Confirm Before'
        Checked = True
        State = cbChecked
        TabOrder = 1
        OnClick = ConfirmBeforeCheckBoxClick
      end
      object ConfirmAfterCheckBox: TCheckBox
        Left = 16
        Top = 74
        Width = 145
        Height = 17
        Caption = 'Confirm After'
        Checked = True
        State = cbChecked
        TabOrder = 2
        OnClick = ConfirmAfterCheckBoxClick
      end
      object AutoLoadApplicationListChkBox: TCheckBox
        Left = 16
        Top = 116
        Width = 153
        Height = 17
        Caption = 'Auto Load Application List'
        Checked = True
        State = cbChecked
        TabOrder = 3
      end
    end
  end
  object SetLeftPanel: TPanel
    Left = 0
    Top = 0
    Width = 75
    Height = 325
    Align = alLeft
    TabOrder = 1
    ExplicitHeight = 324
    object AdminBtn: TButton
      Left = 1
      Top = 1
      Width = 73
      Height = 25
      Align = alTop
      Caption = 'Admin'
      TabOrder = 0
      OnClick = AdminBtnClick
    end
    object DirBtn: TButton
      Left = 1
      Top = 26
      Width = 73
      Height = 25
      Align = alTop
      Caption = 'Directories'
      TabOrder = 1
      OnClick = DirBtnClick
    end
    object FormBtn: TButton
      Left = 1
      Top = 51
      Width = 73
      Height = 25
      Align = alTop
      Caption = 'Form'
      TabOrder = 2
      OnClick = FormBtnClick
    end
    object StylesBtn: TButton
      Left = 1
      Top = 151
      Width = 73
      Height = 25
      Align = alTop
      Caption = 'Styles'
      TabOrder = 3
      OnClick = StylesBtnClick
    end
    object HotKeysBtn: TButton
      Left = 1
      Top = 76
      Width = 73
      Height = 25
      Align = alTop
      Caption = 'HotKeys'
      TabOrder = 4
      OnClick = HotKeysBtnClick
    end
    object PagesBtn: TButton
      Left = 1
      Top = 126
      Width = 73
      Height = 25
      Align = alTop
      Caption = 'Pages'
      TabOrder = 5
      OnClick = PagesBtnClick
    end
    object MiscBtn: TButton
      Left = 1
      Top = 101
      Width = 73
      Height = 25
      Align = alTop
      Caption = 'Misc'
      TabOrder = 6
      OnClick = MiscBtnClick
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
  object ColorDialog: TColorDialog
    Left = 219
    Top = 164
  end
end
