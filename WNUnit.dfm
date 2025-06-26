object WhatsNewForm: TWhatsNewForm
  Left = 0
  Top = 0
  Caption = 'What'#39's New'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnActivate = FormActivate
  TextHeight = 15
  object RichEdit: TRichEdit
    Left = 0
    Top = 0
    Width = 628
    Height = 401
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 0
    ExplicitWidth = 624
    ExplicitHeight = 400
  end
  object BottomPanel: TPanel
    Left = 0
    Top = 401
    Width = 628
    Height = 41
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 400
    ExplicitWidth = 624
    DesignSize = (
      628
      41)
    object CloseBtn: TButton
      Left = 536
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Close'
      ModalResult = 8
      TabOrder = 0
      OnClick = CloseBtnClick
      ExplicitLeft = 532
    end
  end
end
