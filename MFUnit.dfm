object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'Application Position & Size'
  ClientHeight = 185
  ClientWidth = 553
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object InfoMemo: TMemo
    Left = 79
    Top = 20
    Width = 185
    Height = 89
    Lines.Strings = (
      'InfoMemo')
    TabOrder = 2
    Visible = False
  end
  object BottomPanel: TPanel
    Left = 0
    Top = 21
    Width = 553
    Height = 164
    Align = alClient
    TabOrder = 0
    object LeftPanel: TPanel
      Left = 1
      Top = 1
      Width = 220
      Height = 162
      Align = alLeft
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object HeightLbl: TLabel
        Left = 163
        Top = 1
        Width = 35
        Height = 13
        Caption = 'Height:'
      end
      object LeftLbl: TLabel
        Left = 6
        Top = 1
        Width = 23
        Height = 13
        Caption = 'Left:'
      end
      object TopLbl: TLabel
        Left = 59
        Top = 1
        Width = 22
        Height = 13
        Caption = 'Top:'
      end
      object WidthLbl: TLabel
        Left = 111
        Top = 1
        Width = 32
        Height = 13
        Caption = 'Width:'
      end
      object CloseBtn: TButton
        Left = 137
        Top = 70
        Width = 75
        Height = 25
        Action = aCloseDB
        TabOrder = 0
      end
      object FromDBBtn: TButton
        Left = 137
        Top = 96
        Width = 37
        Height = 25
        Action = aFromDB
        TabOrder = 1
      end
      object GetBtn: TButton
        Left = 6
        Top = 44
        Width = 50
        Height = 25
        Action = aGetAppPosAndSize
        TabOrder = 2
      end
      object HeightSpinEdit: TSpinEdit
        Left = 162
        Top = 16
        Width = 50
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 3
        Value = 500
      end
      object LeftSpinEdit: TSpinEdit
        Left = 6
        Top = 16
        Width = 50
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 4
        Value = 100
      end
      object OpenBtn: TButton
        Left = 137
        Top = 44
        Width = 75
        Height = 25
        Action = aOpenDB
        TabOrder = 5
      end
      object SetBtn: TButton
        Left = 58
        Top = 44
        Width = 50
        Height = 25
        Action = aSetAppPosAndSize
        TabOrder = 6
      end
      object ToDBBtn: TButton
        Left = 175
        Top = 96
        Width = 37
        Height = 25
        Action = aToDB
        TabOrder = 7
      end
      object TopSpinEdit: TSpinEdit
        Left = 58
        Top = 16
        Width = 50
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 8
        Value = 100
      end
      object WidthSpinEdit: TSpinEdit
        Left = 110
        Top = 16
        Width = 50
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 9
        Value = 500
      end
      object WindowReticle: TWindowReticle
        Left = 41
        Top = 88
        Width = 32
        Height = 32
        Hint = 'Drag on to application to select'
        OnWindowChange = WindowReticleWindowChange
      end
      object FileNameEdit: TEdit
        Left = 1
        Top = 140
        Width = 218
        Height = 21
        Align = alBottom
        Alignment = taCenter
        TabOrder = 11
        Text = 'APS.csv'
      end
    end
    object RightPanel: TPanel
      Left = 221
      Top = 1
      Width = 331
      Height = 162
      Align = alClient
      TabOrder = 1
      object RightBottomPanel: TPanel
        Left = 1
        Top = 132
        Width = 329
        Height = 29
        Align = alBottom
        TabOrder = 0
        object DBNavigator: TDBNavigator
          Left = 44
          Top = 2
          Width = 240
          Height = 25
          DataSource = JvDataSource
          TabOrder = 0
        end
      end
      object DBGrid: TDBGrid
        Left = 1
        Top = 1
        Width = 329
        Height = 131
        Align = alClient
        DataSource = JvDataSource
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'WindowName'
            Title.Alignment = taCenter
            Width = 175
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Left'
            Title.Alignment = taCenter
            Width = 35
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Top'
            Title.Alignment = taCenter
            Width = 35
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Width'
            Title.Alignment = taCenter
            Width = 35
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Height'
            Title.Alignment = taCenter
            Width = 35
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Notes'
            Title.Alignment = taCenter
            Visible = True
          end>
      end
    end
  end
  object WindowNameEdit: TEdit
    Left = 0
    Top = 0
    Width = 553
    Height = 21
    Align = alTop
    Alignment = taCenter
    TabOrder = 1
    Text = 'WindowName'
  end
  object MainMenu: TMainMenu
    Left = 24
    Top = 16
    object mmiFile: TMenuItem
      Caption = 'File'
      object mmiSelectListFile: TMenuItem
        Action = aSelectListFile
      end
      object mmiLoadListFile: TMenuItem
        Action = aLoadListFile
      end
      object mmiSaveListFile: TMenuItem
        Action = aSaveListFile
        Visible = False
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object mmiOpenDtaDirInExplorer: TMenuItem
        Action = aOpenDtaDirInExplorer
      end
      object mmiCopyDtaDirPathToClipboard: TMenuItem
        Action = aCopyDtaDirPathToClipboard
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object mmiOpenLstDirInExplorer: TMenuItem
        Action = aOpenLstDirInExplorer
      end
      object mmiCopyLstDirPathToClipboard: TMenuItem
        Action = aCopyLstDirPathToClipboard
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object mmiOpenTmpDirInExplorer: TMenuItem
        Action = aOpenTmpDirInExplorer
      end
      object mmiCopyTmpDirPathToClipboard: TMenuItem
        Action = aCopyTmpDirPathToClipboard
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object mmiRestartElevated: TMenuItem
        Action = aRestartElevated
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object mmiExit: TMenuItem
        Action = aExit
      end
    end
    object mmiBounds: TMenuItem
      Caption = 'Bounds'
      object mmiFullScreen: TMenuItem
        Action = aFullScreen
      end
      object mmiFullMinus5: TMenuItem
        Action = aFullMinus5
      end
      object mmi95Percent: TMenuItem
        Action = a95Percent
      end
      object mmi90Percent: TMenuItem
        Action = a90Percent
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object mmi1of4: TMenuItem
        Action = a1of4
      end
      object mmi2of4: TMenuItem
        Action = a2of4
      end
      object mmi3of4: TMenuItem
        Action = a3of4
      end
      object mmi4of4: TMenuItem
        Action = a4of4
      end
    end
    object mmiSettings: TMenuItem
      Action = aSettings
    end
    object mmiStyles: TMenuItem
      Caption = 'Styles'
    end
    object mmiVersionAbout: TMenuItem
      Caption = 'About'
      OnClick = mmiVersionAboutClick
    end
  end
  object ActionList: TActionList
    Left = 92
    Top = 16
    object aOpenTmpDirInExplorer: TAction
      Category = 'File'
      Caption = 'Open TmpDir in Explorer'
      OnExecute = aOpenTmpDirInExplorerExecute
    end
    object aCopyTmpDirPathToClipboard: TAction
      Category = 'File'
      Caption = 'Copy TmpDir Path To Clipboard'
      OnExecute = aCopyTmpDirPathToClipboardExecute
    end
    object aOpenDtaDirInExplorer: TAction
      Category = 'File'
      Caption = 'Open DtaDir in Explorer'
      OnExecute = aOpenDtaDirInExplorerExecute
    end
    object aCopyDtaDirPathToClipboard: TAction
      Category = 'File'
      Caption = 'Copy DtaDir Path To Clipboard'
      OnExecute = aCopyDtaDirPathToClipboardExecute
    end
    object aExit: TAction
      Category = 'File'
      Caption = 'Exit'
      OnExecute = aExitExecute
    end
    object aSettings: TAction
      Category = 'Settings'
      Caption = 'Settings'
      OnExecute = aSettingsExecute
    end
    object aLoadListFile: TAction
      Category = 'File'
      Caption = 'Load List File'
      OnExecute = aLoadListFileExecute
    end
    object aSaveListFile: TAction
      Category = 'File'
      Caption = 'Save List File'
      OnExecute = aSaveListFileExecute
    end
    object aSelectListFile: TAction
      Category = 'File'
      Caption = 'Select List File'
      OnExecute = aSelectListFileExecute
    end
    object aOpenLstDirInExplorer: TAction
      Category = 'File'
      Caption = 'Open LstDir In Explorer'
      OnExecute = aOpenLstDirInExplorerExecute
    end
    object aCopyLstDirPathToClipboard: TAction
      Category = 'File'
      Caption = 'Copy LstDir Path To Clipboard'
      OnExecute = aCopyLstDirPathToClipboardExecute
    end
    object aGetAppPosAndSize: TAction
      Category = 'AppPosAndSize'
      Caption = 'Get'
      OnExecute = aGetAppPosAndSizeExecute
    end
    object aSetAppPosAndSize: TAction
      Category = 'AppPosAndSize'
      Caption = 'Set'
      OnExecute = aSetAppPosAndSizeExecute
    end
    object aOpenDB: TAction
      Category = 'DB'
      Caption = 'OpenDB'
      OnExecute = aOpenDBExecute
    end
    object aCloseDB: TAction
      Category = 'DB'
      Caption = 'CloseDB'
      Enabled = False
      OnExecute = aCloseDBExecute
    end
    object aFromDB: TAction
      Category = 'DB'
      Caption = '<-'
      Enabled = False
      OnExecute = aFromDBExecute
    end
    object aToDB: TAction
      Category = 'DB'
      Caption = '->'
      Enabled = False
      OnExecute = aToDBExecute
    end
    object aFullScreen: TAction
      Category = 'AppPosAndSize'
      Caption = 'Full Screen'
      OnExecute = aFullScreenExecute
    end
    object a1of4: TAction
      Category = 'AppPosAndSize'
      Caption = '1/4'
      OnExecute = a1of4Execute
    end
    object a2of4: TAction
      Category = 'AppPosAndSize'
      Caption = '2/4'
      OnExecute = a2of4Execute
    end
    object a3of4: TAction
      Category = 'AppPosAndSize'
      Caption = '3/4'
      OnExecute = a3of4Execute
    end
    object a4of4: TAction
      Category = 'AppPosAndSize'
      Caption = '4/4'
      OnExecute = a4of4Execute
    end
    object a90Percent: TAction
      Category = 'AppPosAndSize'
      Caption = '90 %'
      OnExecute = a90PercentExecute
    end
    object a95Percent: TAction
      Category = 'AppPosAndSize'
      Caption = '95 %'
      OnExecute = a95PercentExecute
    end
    object aFullMinus5: TAction
      Category = 'AppPosAndSize'
      Caption = 'Full-5'
      OnExecute = aFullMinus5Execute
    end
    object aRestartElevated: TAction
      Caption = 'Restart Elevated'
      Enabled = False
      OnExecute = aRestartElevatedExecute
    end
  end
  object MostRecentFiles: TMostRecentFiles
    MaxFiles = 8
    ShowFullPath = True
    OwnerMenuItem = mmiFile
    MenuPosition = 3
    OnMenuClick = MostRecentFilesMenuClick
    Left = 292
    Top = 16
  end
  object OpenDialog: TOpenDialog
    Left = 156
    Top = 16
  end
  object SaveDialog: TSaveDialog
    Left = 220
    Top = 16
  end
  object JvCsvDataSet: TJvCsvDataSet
    FileName = 'APS.csv'
    AutoBackupCount = 0
    StoreDefs = True
    Left = 136
    Top = 80
  end
  object JvDataSource: TJvDataSource
    DataSet = JvCsvDataSet
    Left = 216
    Top = 80
  end
end
