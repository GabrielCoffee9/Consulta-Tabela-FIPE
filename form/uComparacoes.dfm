object frmComparacoes: TfrmComparacoes
  Left = 0
  Top = 0
  Caption = 'Compara'#231#227'o de Registros'
  ClientHeight = 359
  ClientWidth = 598
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = exibirTodosOsDetalhes
  PixelsPerInch = 96
  TextHeight = 13
  object pnPrincipal: TPanel
    Left = -8
    Top = 0
    Width = 641
    Height = 369
    TabOrder = 0
    object Label1: TLabel
      Left = 290
      Top = 113
      Width = 35
      Height = 116
      Caption = '-'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -96
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblRegistro1Comparacao: TLabel
      Left = 16
      Top = 25
      Width = 64
      Height = 14
      Caption = 'Registro 1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblRegistro2Comparacao: TLabel
      Left = 351
      Top = 25
      Width = 64
      Height = 14
      Caption = 'Registro 2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnVoltar: TButton
      Left = 275
      Top = 304
      Width = 67
      Height = 25
      Cursor = crHandPoint
      Caption = 'Voltar'
      TabOrder = 0
      OnClick = btnVoltarClick
    end
    object rdtMostrarRegistro1: TRichEdit
      Left = 16
      Top = 40
      Width = 253
      Height = 289
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      StyleElements = [seFont, seBorder]
      Zoom = 100
    end
    object rdtMostrarRegistro2: TRichEdit
      Left = 348
      Top = 45
      Width = 253
      Height = 289
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      StyleElements = [seFont, seBorder]
      Zoom = 100
    end
  end
end
