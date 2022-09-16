object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'Application Position & Size'
  ClientHeight = 185
  ClientWidth = 559
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
  object JvPageList: TJvPageList
    Left = 0
    Top = 0
    Width = 559
    Height = 185
    ActivePage = JvStandardPage3
    PropagateEnable = False
    Align = alClient
    object JvStandardPage1: TJvStandardPage
      Left = 0
      Top = 0
      Width = 559
      Height = 185
      Caption = 'JvStandardPage1'
      object WindowNameEdit: TEdit
        Left = 0
        Top = 0
        Width = 559
        Height = 21
        Align = alTop
        Alignment = taCenter
        TabOrder = 0
        Text = 'WindowName'
      end
      object BottomPanel: TPanel
        Left = 0
        Top = 21
        Width = 559
        Height = 164
        Align = alClient
        TabOrder = 1
        object InfoMemo: TMemo
          Left = 8
          Top = 20
          Width = 529
          Height = 133
          Lines.Strings = (
            'InfoMemo')
          TabOrder = 2
          Visible = False
        end
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
            Left = 7
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
          Width = 337
          Height = 162
          Align = alClient
          TabOrder = 1
          object RightBottomPanel: TPanel
            Left = 1
            Top = 132
            Width = 335
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
            Width = 335
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
    end
    object JvStandardPage2: TJvStandardPage
      Left = 0
      Top = 0
      Width = 559
      Height = 185
      Caption = 'JvStandardPage2'
      object P2LeftPanel: TPanel
        Left = 0
        Top = 0
        Width = 121
        Height = 185
        Align = alLeft
        TabOrder = 0
        object Button3: TButton
          Left = 24
          Top = 144
          Width = 75
          Height = 25
          Action = aListProcs
          TabOrder = 0
        end
        object Button1: TButton
          Left = 24
          Top = 24
          Width = 75
          Height = 25
          Action = aTest
          TabOrder = 1
        end
      end
      object P2RightPanel: TPanel
        Left = 121
        Top = 0
        Width = 438
        Height = 185
        Align = alClient
        Caption = 'P2RightPanel'
        TabOrder = 1
        object Splitter1: TSplitter
          Left = 1
          Top = 84
          Width = 436
          Height = 3
          Cursor = crVSplit
          Align = alBottom
          ExplicitTop = 1
          ExplicitWidth = 83
        end
        object P2Memo: TMemo
          Left = 1
          Top = 1
          Width = 436
          Height = 83
          Align = alClient
          ScrollBars = ssBoth
          TabOrder = 0
        end
        object VST: TVirtualStringTree
          Left = 1
          Top = 87
          Width = 436
          Height = 97
          AccessibleName = 'Title'
          Align = alBottom
          Colors.BorderColor = 15987699
          Colors.DisabledColor = clGray
          Colors.DropMarkColor = 15385233
          Colors.DropTargetColor = 15385233
          Colors.DropTargetBorderColor = 15385233
          Colors.FocusedSelectionColor = 15385233
          Colors.FocusedSelectionBorderColor = 15385233
          Colors.GridLineColor = 15987699
          Colors.HeaderHotColor = clBlack
          Colors.HotColor = clBlack
          Colors.SelectionRectangleBlendColor = 15385233
          Colors.SelectionRectangleBorderColor = 15385233
          Colors.SelectionTextColor = clBlack
          Colors.TreeLineColor = 9471874
          Colors.UnfocusedColor = clGray
          Colors.UnfocusedSelectionColor = 13421772
          Colors.UnfocusedSelectionBorderColor = 13421772
          Header.AutoSizeIndex = 0
          Header.Options = [hoAutoResize, hoColumnResize, hoDrag, hoShowSortGlyphs, hoVisible]
          PopupMenu = VSTPopupMenu
          TabOrder = 1
          TreeOptions.SelectionOptions = [toFullRowSelect]
          OnGetText = VSTGetText
          OnMouseDown = VSTMouseDown
          Columns = <
            item
              Position = 0
              Text = 'File Description'
              Width = 236
            end
            item
              Position = 1
              Text = 'Left'
            end
            item
              Position = 2
              Text = 'Top'
            end
            item
              Position = 3
              Text = 'Width'
            end
            item
              Position = 4
              Text = 'Height'
            end>
        end
      end
    end
    object JvStandardPage3: TJvStandardPage
      Left = 0
      Top = 0
      Width = 559
      Height = 185
      Caption = 'JvStandardPage3'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 182
        Height = 185
        Align = alLeft
        Caption = 'Panel1'
        TabOrder = 0
        object ConfirmSetGroupBox: TGroupBox
          Left = 1
          Top = 144
          Width = 180
          Height = 40
          Align = alBottom
          Caption = 'Confirm Set'
          TabOrder = 0
          ExplicitLeft = -2
          ExplicitTop = 138
          ExplicitWidth = 175
          object BeforeCheckBox: TCheckBox
            Left = 21
            Top = 15
            Width = 55
            Height = 17
            Caption = 'Before'
            Checked = True
            State = cbChecked
            TabOrder = 0
            OnClick = BeforeCheckBoxClick
          end
          object AfterCheckBox: TCheckBox
            Left = 98
            Top = 15
            Width = 55
            Height = 17
            Caption = 'After'
            Checked = True
            State = cbChecked
            TabOrder = 1
            OnClick = AfterCheckBoxClick
          end
        end
        inline ApplicationBoundsFrame: TApplicationBoundsFrame
          Left = 1
          Top = 1
          Width = 180
          Height = 143
          Align = alClient
          TabOrder = 1
          ExplicitLeft = 1
          ExplicitTop = 1
          ExplicitWidth = 180
          ExplicitHeight = 143
          inherited JvToolBar: TJvToolBar
            Width = 180
            ExplicitWidth = 180
            inherited CenterToolButton: TToolButton
              ExplicitWidth = 44
            end
            inherited CornersToolButton: TToolButton
              ExplicitWidth = 49
            end
            inherited SidesToolButton: TToolButton
              ExplicitWidth = 36
            end
            inherited GetSetToolButton: TToolButton
              ExplicitWidth = 44
            end
          end
        end
      end
      object FrameScrollBox: TScrollBox
        Left = 182
        Top = 0
        Width = 377
        Height = 185
        Align = alClient
        PopupMenu = FrameScrollPopupMenu
        TabOrder = 1
        ExplicitLeft = -201
        ExplicitTop = 1
        ExplicitWidth = 380
        ExplicitHeight = 183
      end
    end
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
      object mmiAutoStartElevated: TMenuItem
        AutoCheck = True
        Caption = 'Auto Start Elevated'
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object mmiExit: TMenuItem
        Action = aExit
      end
    end
    object mmiPages: TMenuItem
      Caption = 'Pages'
      object mmiPage1: TMenuItem
        Action = aPage1
      end
      object mmiPage2: TMenuItem
        Action = aPage2
      end
      object mmiPage3: TMenuItem
        Action = aPage3
      end
    end
    object mmiFrames: TMenuItem
      Caption = 'Frames'
      object mmiAddFrame: TMenuItem
        Action = aAddFrame
      end
      object mmiClearGetSetFrames: TMenuItem
        Action = aClearGetSetFrames
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object mmiSaveAsFrameList: TMenuItem
        Action = aSaveAsFrameList
      end
      object mmiSelectFrameListFile: TMenuItem
        Action = aSelectFrameList
      end
      object N9: TMenuItem
        Caption = '-'
      end
      object mmiSaveFrames: TMenuItem
        Action = aSaveFrameList
      end
      object mmiLoadFrames: TMenuItem
        Action = aLoadFrameList
      end
    end
    object mmiBounds: TMenuItem
      Caption = 'Bounds'
      object mmiFullScreen: TMenuItem
        Action = aFullScreen
      end
      object aCenterInScreen1: TMenuItem
        Action = aCenterInScreen
      end
      object mmiFullMinus5: TMenuItem
        Action = aFullMinus5
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object mmiScreenPercents: TMenuItem
        Caption = 'Screen Percents'
        object mmi95Percent: TMenuItem
          Action = a95Percent
        end
        object mmi90Percent: TMenuItem
          Action = a90Percent
        end
        object mmi75Percent: TMenuItem
          Action = a75Percent
        end
      end
      object mmiScreenQuarters1: TMenuItem
        Caption = 'Screen Quarters'
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
      object N7: TMenuItem
        Caption = '-'
      end
      object mmiAllAppsToCSV: TMenuItem
        Action = aAllAppsToCSV
      end
    end
    object mmiSettings: TMenuItem
      Action = aSettings
    end
    object mmiStyles: TMenuItem
      Caption = 'Styles'
    end
    object mmiRestartElevated: TMenuItem
      Action = aRestartElevated
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
      Caption = '1/4 (Left/Top)'
      OnExecute = a1of4Execute
    end
    object a2of4: TAction
      Category = 'AppPosAndSize'
      Caption = '2/4 (Right/Top)'
      OnExecute = a2of4Execute
    end
    object a3of4: TAction
      Category = 'AppPosAndSize'
      Caption = '3/4 (Left/Bottom)'
      OnExecute = a3of4Execute
    end
    object a4of4: TAction
      Category = 'AppPosAndSize'
      Caption = '4/4 (Right/Bottom)'
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
    object aCenterInScreen: TAction
      Category = 'AppPosAndSize'
      Caption = 'Center In Screen'
      OnExecute = aCenterInScreenExecute
    end
    object a75Percent: TAction
      Category = 'AppPosAndSize'
      Caption = '75 %'
      OnExecute = a75PercentExecute
    end
    object aAllAppsToCSV: TAction
      Category = 'AppPosAndSize'
      Caption = 'All Apps To CSV'
      OnExecute = aAllAppsToCSVExecute
    end
    object aPage1: TAction
      Category = 'Page'
      Caption = 'Page-1'
      OnExecute = aPage1Execute
    end
    object aPage2: TAction
      Category = 'Page'
      Caption = 'Page-2'
      OnExecute = aPage2Execute
    end
    object aListProcs: TAction
      Caption = 'List Procs'
      OnExecute = aListProcsExecute
    end
    object aTest: TAction
      Caption = 'Test'
      OnExecute = aTestExecute
    end
    object aPage3: TAction
      Category = 'Page'
      Caption = 'Page-3'
      OnExecute = aPage3Execute
    end
    object aLoadFrameList: TAction
      Category = 'Frames'
      Caption = 'Load Frames'
      OnExecute = aLoadFrameListExecute
    end
    object aSaveFrameList: TAction
      Category = 'Frames'
      Caption = 'Save Frames'
      OnExecute = aSaveFrameListExecute
    end
    object aClearGetSetFrames: TAction
      Category = 'Frames'
      Caption = 'Clear Frames'
      OnExecute = aClearGetSetFramesExecute
    end
    object aAddFrame: TAction
      Category = 'Frames'
      Caption = 'Add Frame'
      OnExecute = aAddFrameExecute
    end
    object aSaveAsFrameList: TAction
      Category = 'Frames'
      Caption = 'Save As'
      OnExecute = aSaveAsFrameListExecute
    end
    object aSelectFrameList: TAction
      Category = 'Frames'
      Caption = 'Select File'
      OnExecute = aSelectFrameListExecute
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
  object VSTPopupMenu: TPopupMenu
    Left = 289
    Top = 80
    object pmiGet: TMenuItem
      Caption = 'Get'
      OnClick = pmiGetClick
    end
  end
  object GSFramePopupMenu: TPopupMenu
    Left = 48
    Top = 80
    object pmiGSAddFrame: TMenuItem
      Action = aAddFrame
    end
    object N11: TMenuItem
      Caption = '-'
    end
    object pmiGSRemoveFrame: TMenuItem
      Caption = 'Remove Frame'
      OnClick = pmiGSRemoveFrameClick
    end
    object pmiGSClearFrames: TMenuItem
      Action = aClearGetSetFrames
    end
  end
  object FrameScrollPopupMenu: TPopupMenu
    Left = 396
    Top = 80
    object pmiFSAddFrame: TMenuItem
      Action = aAddFrame
    end
    object pmiFSClearFrames: TMenuItem
      Action = aClearGetSetFrames
    end
    object N10: TMenuItem
      Caption = '-'
    end
    object pmiFSSelectFile: TMenuItem
      Action = aSelectFrameList
    end
    object pmiFSSaveAsFrameList: TMenuItem
      Action = aSaveAsFrameList
    end
  end
end
