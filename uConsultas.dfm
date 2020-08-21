object frmConsultas: TfrmConsultas
  Left = 0
  Top = 0
  Caption = 'frmConsultas'
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
  object pnModelos: TPanel
    Left = -22
    Top = -45
    Width = 441
    Height = 353
    TabOrder = 2
    object lblEditModelos: TLabel
      Left = 33
      Top = 82
      Width = 92
      Height = 13
      Caption = 'Pesquisar Modelos:'
    end
    object dbgModelos: TDBGrid
      Left = 24
      Top = 128
      Width = 320
      Height = 169
      DataSource = DataSource1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          Title.Caption = 'Modelos'
          Visible = True
        end>
    end
    object edtPesquisarModelos: TEdit
      Left = 131
      Top = 79
      Width = 180
      Height = 21
      Enabled = False
      TabOrder = 1
      OnChange = edtPesquisarModelosChange
    end
  end
  object pnAnos: TPanel
    Left = -22
    Top = -45
    Width = 441
    Height = 353
    TabOrder = 1
    object dbgAnos: TDBGrid
      Left = 24
      Top = 128
      Width = 320
      Height = 169
      TabOrder = 0
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
  end
  object pnMarcas: TPanel
    Left = -16
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
      ReadOnly = True
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = dbgMarcasDblClick
      Columns = <
        item
          Expanded = False
          Title.Caption = 'Marcas'
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
      Width = 180
      Height = 21
      Enabled = False
      TabOrder = 4
      OnChange = edtPesquisarMarcasChange
    end
    object btnVoltarMarcas: TButton
      Left = 296
      Top = 303
      Width = 83
      Height = 25
      Caption = 'Voltar as Datas'
      TabOrder = 5
      OnClick = btnVoltarMarcasClick
    end
  end
  object DataSource1: TDataSource
    DataSet = FDMemTable1
    Left = 217
    Top = 283
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    Left = 152
    Top = 280
  end
  object RESTClient1: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'http://veiculos.fipe.org.br/api/veiculos'
    Params = <>
    RaiseExceptionOn500 = False
    Left = 16
    Top = 274
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Method = rmPOST
    Params = <>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 56
    Top = 280
  end
  object RESTResponse1: TRESTResponse
    ContentType = 'text/html'
    Left = 88
    Top = 280
  end
  object RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter
    Dataset = FDMemTable1
    FieldDefs = <>
    ResponseJSON = RESTResponse1
    Left = 120
    Top = 280
  end
end
