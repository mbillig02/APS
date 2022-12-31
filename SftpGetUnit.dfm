object SftpGetForm: TSftpGetForm
  Left = 0
  Top = 0
  Caption = 'SftpGetForm'
  ClientHeight = 439
  ClientWidth = 616
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object FileListMemo: TMemo
    Left = 144
    Top = 56
    Width = 129
    Height = 89
    TabOrder = 0
  end
  object PgmUpdFileStorage: TScFileStorage
    Left = 48
    Top = 24
  end
  object PgmUpdSFTPClient: TScSFTPClient
    SSHClient = PgmUpdSSHClient
    OnDirectoryList = PgmUpdSFTPClientDirectoryList
    Left = 48
    Top = 152
  end
  object PgmUpdSSHClient: TScSSHClient
    HostKeyAlgorithms = <
      item
        Algorithm = aaRSA
      end
      item
        Algorithm = aaEC
      end
      item
        Algorithm = aaDSA
      end>
    KeyStorage = PgmUpdFileStorage
    OnServerKeyValidate = PgmUpdSSHClientServerKeyValidate
    Left = 48
    Top = 88
  end
end
