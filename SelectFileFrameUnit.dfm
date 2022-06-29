object SelectFileFrame: TSelectFileFrame
  Left = 0
  Top = 0
  Width = 320
  Height = 240
  TabOrder = 0
  OnResize = FrameResize
  object FileListBox: TListBox
    Left = 0
    Top = 21
    Width = 320
    Height = 219
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ItemHeight = 14
    ParentFont = False
    TabOrder = 0
    OnClick = FileListBoxClick
    OnMouseDown = FileListBoxMouseDown
  end
  object FilterEdit: TEdit
    Left = 0
    Top = 0
    Width = 320
    Height = 21
    Align = alTop
    Alignment = taCenter
    TabOrder = 1
    TextHint = 'Filter'
    OnChange = FilterEditChange
  end
end
