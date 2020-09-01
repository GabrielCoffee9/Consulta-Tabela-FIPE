object frmComparacao: TfrmComparacao
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Comparar Registros'
  ClientHeight = 310
  ClientWidth = 370
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnExcluir: TPanel
    Left = -8
    Top = -8
    Width = 393
    Height = 326
    TabOrder = 1
    object lblSelecione: TLabel
      Left = 74
      Top = 62
      Width = 234
      Height = 14
      Caption = 'Selecione o registro que deseja excluir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ComboBox1: TComboBox
      Left = 106
      Top = 110
      Width = 145
      Height = 22
      Style = csOwnerDrawFixed
      TabOrder = 0
    end
    object Button1: TButton
      Left = 138
      Top = 177
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 1
    end
    object btnVoltarDaExclusao: TButton
      Left = 12
      Top = 13
      Width = 41
      Height = 25
      Caption = 'Voltar'
      TabOrder = 2
      OnClick = btnVoltarDaExclusaoClick
    end
  end
  object pnCompararPrincipal: TPanel
    Left = -8
    Top = -8
    Width = 393
    Height = 326
    TabOrder = 0
    object lblRegistro1: TLabel
      Left = 16
      Top = 138
      Width = 58
      Height = 13
      Caption = 'Registro 1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblRegistro2: TLabel
      Left = 224
      Top = 138
      Width = 58
      Height = 13
      Caption = 'Registro 2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cbxRegistro1: TComboBox
      Left = 16
      Top = 152
      Width = 145
      Height = 22
      Style = csOwnerDrawFixed
      TabOrder = 0
    end
    object cbxRegistro2: TComboBox
      Left = 224
      Top = 152
      Width = 145
      Height = 22
      Style = csOwnerDrawFixed
      TabOrder = 1
    end
    object btnTransicaoParaExclusao: TButton
      Left = 16
      Top = 288
      Width = 89
      Height = 25
      Caption = 'Excluir Registro'
      TabOrder = 2
      OnClick = btnTransicaoParaExclusaoClick
    end
    object btnSelecionar: TButton
      Left = 138
      Top = 208
      Width = 121
      Height = 25
      Caption = 'Comparar Registros'
      TabOrder = 3
    end
  end
end
