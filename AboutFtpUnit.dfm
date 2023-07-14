object AboutFtpForm: TAboutFtpForm
  Left = 0
  Top = 0
  Caption = 'Simple FTP Client'
  ClientHeight = 331
  ClientWidth = 334
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poOwnerFormCenter
  TextHeight = 15
  inline FTPAboutFrame: TFtpFrame
    Left = 0
    Top = 0
    Width = 334
    Height = 331
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 320
    ExplicitHeight = 312
    inherited BottomPanel: TPanel
      Width = 334
      Height = 176
      ExplicitWidth = 316
      ExplicitHeight = 156
      inherited PageControl: TPageControl
        Width = 332
        Height = 174
        ExplicitWidth = 314
        ExplicitHeight = 154
        inherited DirectoryTabSheet: TTabSheet
          ExplicitWidth = 324
          ExplicitHeight = 144
          inherited FileView: TTreeView
            Width = 324
            Height = 144
            ExplicitWidth = 306
            ExplicitHeight = 124
          end
        end
      end
    end
    inherited TopPanel: TPanel
      Width = 334
      ExplicitWidth = 316
      inherited MiddlePanel: TPanel
        Width = 332
        ExplicitWidth = 314
        inherited XferProgressBar: TJvProgressBar
          Width = 330
          ExplicitWidth = 312
        end
      end
      inherited JvToolBar: TJvToolBar
        Width = 332
        ExplicitWidth = 314
      end
    end
  end
end
