object FSDNewProjectForms: TFSDNewProjectForms
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Novo Projeto MVC'
  ClientHeight = 157
  ClientWidth = 812
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 15
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 107
    Height = 23
    Caption = 'Nome Projeto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 176
    Top = 8
    Width = 91
    Height = 23
    Caption = 'NameSpace'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 67
    Width = 67
    Height = 23
    Caption = 'Diret'#243'rio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object EdtNomeProjeto: TEdit
    Left = 8
    Top = 29
    Width = 162
    Height = 31
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Text = 'Estoque'
  end
  object EdtNameSpace: TEdit
    Left = 176
    Top = 29
    Width = 177
    Height = 31
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Text = 'Estoque'
  end
  object EdtDiretorio: TEdit
    Left = 8
    Top = 88
    Width = 713
    Height = 31
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Text = 
      'H:\Desenvolvimento\workspace\Delphi\FormacaoDelphiSenior\OpenToo' +
      'lsAPI\Project\'
  end
  object btnCriar: TButton
    Left = 8
    Top = 125
    Width = 75
    Height = 25
    Caption = 'Criar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    ModalResult = 1
    ParentFont = False
    TabOrder = 3
    OnClick = btnCriarClick
  end
end
