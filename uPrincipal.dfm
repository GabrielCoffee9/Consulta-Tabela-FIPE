object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'frmPrincipal'
  ClientHeight = 310
  ClientWidth = 370
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnDatas: TPanel
    Left = -15
    Top = -45
    Width = 441
    Height = 353
    TabOrder = 3
    object lblPesquisarDatas: TLabel
      Left = 23
      Top = 191
      Width = 110
      Height = 13
      Caption = 'Referencia da consulta'
    end
    object btnPesquisarDatas: TButton
      Left = 303
      Top = 186
      Width = 75
      Height = 25
      Caption = 'Pesquisar'
      Enabled = False
      TabOrder = 0
    end
    object btnResetarDatas: TButton
      Left = 304
      Top = 303
      Width = 75
      Height = 25
      Caption = 'Resetar'
      TabOrder = 1
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 139
      Top = 187
      Width = 145
      Height = 21
      DataSource = DataSource1
      TabOrder = 2
    end
  end
  object pnModelos: TPanel
    Left = -22
    Top = -45
    Width = 441
    Height = 353
    TabOrder = 2
    object Button1: TButton
      Left = 64
      Top = 57
      Width = 75
      Height = 25
      Caption = 'Motos'
      TabOrder = 0
      OnClick = btnMotosClick
    end
    object Button2: TButton
      Left = 177
      Top = 57
      Width = 75
      Height = 25
      Caption = 'Carros'
      TabOrder = 1
      OnClick = btnCarrosClick
    end
    object dbgModelos: TDBGrid
      Left = 24
      Top = 128
      Width = 320
      Height = 169
      DataSource = DataSource1
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 's'
          Title.Caption = 'Marcas'
          Width = 107
          Visible = True
        end>
    end
    object Button3: TButton
      Left = 289
      Top = 57
      Width = 75
      Height = 25
      Caption = 'Caminh'#227'o'
      TabOrder = 3
      OnClick = btnCaminhoesClick
    end
  end
  object pnAnos: TPanel
    Left = -22
    Top = -45
    Width = 441
    Height = 353
    TabOrder = 1
    object Button4: TButton
      Left = 64
      Top = 57
      Width = 75
      Height = 25
      Caption = 'Motos'
      TabOrder = 0
      OnClick = btnMotosClick
    end
    object Button5: TButton
      Left = 177
      Top = 57
      Width = 75
      Height = 25
      Caption = 'Carros'
      TabOrder = 1
      OnClick = btnCarrosClick
    end
    object dbgAnos: TDBGrid
      Left = 24
      Top = 128
      Width = 320
      Height = 169
      DataSource = DataSource1
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 's'
          Title.Caption = 'Marcas'
          Width = 107
          Visible = True
        end>
    end
    object Button6: TButton
      Left = 289
      Top = 57
      Width = 75
      Height = 25
      Caption = 'Caminh'#227'o'
      TabOrder = 3
      OnClick = btnCaminhoesClick
    end
  end
  object pnMarcas: TPanel
    Left = -8
    Top = -24
    Width = 441
    Height = 353
    TabOrder = 0
    object lblEditMarcas: TLabel
      Left = 32
      Top = 104
      Width = 87
      Height = 13
      Caption = 'Pesquisar marcas:'
    end
    object btnMotos: TButton
      Left = 32
      Top = 49
      Width = 75
      Height = 25
      Caption = 'Motos'
      TabOrder = 0
      OnClick = btnMotosClick
    end
    object btnCarros: TButton
      Left = 155
      Top = 49
      Width = 75
      Height = 25
      Caption = 'Carros'
      TabOrder = 1
      OnClick = btnCarrosClick
    end
    object dbgMarcas: TDBGrid
      Left = 24
      Top = 128
      Width = 320
      Height = 169
      DataSource = DataSource1
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 's'
          Title.Caption = 'Marcas'
          Width = 107
          Visible = True
        end>
    end
    object btnCaminhoes: TButton
      Left = 283
      Top = 49
      Width = 75
      Height = 25
      Caption = 'Caminh'#245'es'
      TabOrder = 3
      OnClick = btnCaminhoesClick
    end
    object edtPesquisarMarcas: TEdit
      Left = 125
      Top = 101
      Width = 140
      Height = 21
      Enabled = False
      TabOrder = 4
    end
    object btnPesquisarMarcas: TButton
      Left = 304
      Top = 97
      Width = 75
      Height = 25
      Caption = 'Pesquisar'
      Enabled = False
      TabOrder = 5
    end
    object btnResetar: TButton
      Left = 304
      Top = 303
      Width = 75
      Height = 25
      Caption = 'Resetar'
      TabOrder = 6
      OnClick = btnResetarClick
    end
  end
  object RESTClient1: TRESTClient
    Accept = 'http://veiculos.fipe.org.br/api/veiculos'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'http://veiculos.fipe.org.br/api/veiculos'
    ContentType = 'ctAPPLICATION_JSON'
    Params = <>
    RaiseExceptionOn500 = False
    Left = 32
    Top = 280
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Method = rmPOST
    Params = <>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 136
    Top = 280
  end
  object RESTResponse1: TRESTResponse
    ContentType = 'application/json'
    Left = 88
    Top = 280
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 176
    Top = 280
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 216
    Top = 280
  end
end
