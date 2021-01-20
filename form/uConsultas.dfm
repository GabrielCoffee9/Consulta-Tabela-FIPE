object frmConsultas: TfrmConsultas
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Marcas'
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
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnAnos: TPanel
    Left = -22
    Top = -45
    Width = 441
    Height = 353
    Cursor = crHandPoint
    TabOrder = 1
    object lblPesquisarAnos: TLabel
      Left = 33
      Top = 109
      Width = 80
      Height = 13
      Caption = 'Pesquisar Anos :'
    end
    object dbgAnos: TDBGrid
      Left = 30
      Top = 141
      Width = 355
      Height = 169
      Cursor = crHandPoint
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = dbgAnosDblClick
      Columns = <
        item
          Expanded = False
          Visible = True
        end
        item
          Expanded = False
          Visible = True
        end>
    end
    object edtPesquisarAnos: TEdit
      Left = 119
      Top = 106
      Width = 202
      Height = 21
      Cursor = crIBeam
      Enabled = False
      TabOrder = 1
      OnChange = edtPesquisarAnosChange
    end
    object Button1: TButton
      Left = 287
      Top = 324
      Width = 98
      Height = 25
      Cursor = crHandPoint
      Caption = 'Voltar para Datas'
      TabOrder = 2
      OnClick = btnVoltarMarcasClick
    end
  end
  object pnPrecoFinal: TPanel
    Left = -31
    Top = -24
    Width = 441
    Height = 353
    Cursor = crHandPoint
    TabOrder = 3
    object memDetalhes: TMemo
      Left = 47
      Top = 33
      Width = 347
      Height = 264
      ReadOnly = True
      TabOrder = 0
    end
    object btnVoltarDetalhes: TButton
      Left = 271
      Top = 303
      Width = 123
      Height = 25
      Cursor = crHandPoint
      Caption = 'Voltar para Tela inicial'
      TabOrder = 1
      OnClick = btnVoltarMarcasClick
    end
    object btnSalvarRegistro: TButton
      Left = 47
      Top = 303
      Width = 87
      Height = 25
      Caption = 'Salvar Registro'
      TabOrder = 2
      OnClick = btnSalvarRegistroClick
    end
  end
  object pnModelos: TPanel
    Left = -22
    Top = -48
    Width = 441
    Height = 359
    TabOrder = 2
    object lblEditModelos: TLabel
      Left = 33
      Top = 106
      Width = 92
      Height = 13
      Caption = 'Pesquisar Modelos:'
    end
    object dbgModelos: TDBGrid
      Left = 33
      Top = 141
      Width = 348
      Height = 169
      Cursor = crHandPoint
      DataSource = DataSourceContent
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = dbgModelosDblClick
      Columns = <
        item
          Expanded = False
          Title.Caption = 'Modelos'
          Visible = True
        end>
    end
    object edtPesquisarModelos: TEdit
      Left = 131
      Top = 103
      Width = 180
      Height = 21
      Cursor = crIBeam
      Enabled = False
      TabOrder = 1
      OnChange = edtPesquisarModelosChange
    end
    object btnVoltarModelos: TButton
      Left = 287
      Top = 327
      Width = 98
      Height = 25
      Cursor = crHandPoint
      Caption = 'Voltar para Datas'
      TabOrder = 2
      OnClick = btnVoltarMarcasClick
    end
  end
  object pnMarcas: TPanel
    Left = -16
    Top = -24
    Width = 441
    Height = 353
    TabOrder = 0
    object lblEditMarcas: TLabel
      Left = 32
      Top = 96
      Width = 87
      Height = 13
      Caption = 'Pesquisar marcas:'
    end
    object btnMotos: TButton
      Left = 164
      Top = 49
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Caption = 'Motos'
      TabOrder = 0
      OnClick = btnMotosClick
    end
    object btnCarros: TButton
      Left = 32
      Top = 49
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Caption = 'Carros'
      TabOrder = 1
      OnClick = btnCarrosClick
    end
    object dbgMarcas: TDBGrid
      Left = 27
      Top = 120
      Width = 348
      Height = 169
      Cursor = crHandPoint
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Visible = False
      OnDblClick = dbgMarcasDblClick
      Columns = <
        item
          Expanded = False
          Title.Caption = 'Marcas'
          Visible = True
        end
        item
          Expanded = False
          Visible = True
        end>
    end
    object btnCaminhoes: TButton
      Left = 291
      Top = 49
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Caption = 'Caminh'#245'es'
      TabOrder = 3
      OnClick = btnCaminhoesClick
    end
    object edtPesquisarMarcas: TEdit
      Left = 125
      Top = 93
      Width = 180
      Height = 21
      Cursor = crIBeam
      Enabled = False
      TabOrder = 4
      OnChange = edtPesquisarMarcasChange
    end
    object btnVoltarMarcas: TButton
      Left = 283
      Top = 303
      Width = 96
      Height = 25
      Cursor = crHandPoint
      Caption = 'Voltar para Datas'
      TabOrder = 5
      OnClick = btnVoltarMarcasClick
    end
  end
  object DataSource1: TDataSource
    DataSet = FDMemTable1
    Left = 217
    Top = 267
  end
  object FDMemTable1: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    StoreDefs = True
    Left = 152
    Top = 264
  end
  object RESTClient1: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'http://veiculos.fipe.org.br/api/veiculos'
    Params = <>
    RaiseExceptionOn500 = False
    Left = 16
    Top = 266
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Method = rmPOST
    Params = <>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 56
    Top = 264
  end
  object RESTResponse1: TRESTResponse
    ContentType = 'text/html'
    Left = 88
    Top = 264
  end
  object RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter
    Dataset = FDMemTable1
    FieldDefs = <>
    ResponseJSON = RESTResponse1
    NestedElements = True
    Left = 120
    Top = 264
  end
  object ClientDataSetContent: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 338
    Top = 3
  end
  object DataSourceContent: TDataSource
    DataSet = ClientDataSetContent
    Left = 338
    Top = 51
  end
end
