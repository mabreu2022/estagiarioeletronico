object FSDHistoryProjectsForms: TFSDHistoryProjectsForms
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'FSDHistoryProjectsForms'
  ClientHeight = 433
  ClientWidth = 622
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 622
    Height = 49
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 616
    object edtSearch: TEdit
      Left = 8
      Top = 14
      Width = 265
      Height = 23
      TabOrder = 0
      OnChange = edtSearchChange
    end
  end
  object lstProjects: TListBox
    Left = 0
    Top = 49
    Width = 622
    Height = 384
    Align = alClient
    ItemHeight = 15
    TabOrder = 1
    OnKeyDown = lstProjectsKeyDown
    ExplicitWidth = 616
    ExplicitHeight = 375
  end
end
