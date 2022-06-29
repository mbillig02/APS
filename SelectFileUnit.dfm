object SelectFileDlg: TSelectFileDlg
  Left = 227
  Top = 108
  Caption = 'Select File'
  ClientHeight = 169
  ClientWidth = 374
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = True
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inline SelectFileFrame: TSelectFileFrame
    Left = 0
    Top = 0
    Width = 374
    Height = 169
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 374
    ExplicitHeight = 169
    inherited FileListBox: TListBox
      Width = 374
      Height = 148
      ExplicitWidth = 374
      ExplicitHeight = 148
    end
    inherited FilterEdit: TEdit
      Width = 374
      ExplicitWidth = 374
    end
  end
end
