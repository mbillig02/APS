object AboutSftpForm: TAboutSftpForm
  Left = 0
  Top = 0
  Caption = 'Simple SFTP Client'
  ClientHeight = 312
  ClientWidth = 320
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poOwnerFormCenter
  TextHeight = 15
  inline SFTPAboutFrame: TSFTPFrame
    Left = 0
    Top = 0
    Width = 320
    Height = 312
    Align = alClient
    TabOrder = 0
    ExplicitHeight = 312
    inherited FileView: TTreeView
      Height = 166
      ExplicitWidth = 316
      ExplicitHeight = 165
    end
    inherited TopPanel: TPanel
      ExplicitWidth = 316
    end
    inherited JvToolBar: TJvToolBar
      ExplicitWidth = 316
    end
    inherited ScFileStorageF: TScFileStorage
      Path = ''
    end
  end
end
