object frmDatas: TfrmDatas
  Left = 0
  Top = 0
  Caption = 'frmDatas'
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
  object pnDatas: TPanel
    Left = -7
    Top = -45
    Width = 441
    Height = 353
    TabOrder = 0
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
      TabOrder = 0
      OnClick = btnPesquisarDatasClick
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 139
      Top = 187
      Width = 145
      Height = 21
      ListSource = DataSource2
      TabOrder = 1
    end
  end
  object RESTClient2: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'http://veiculos.fipe.org.br/api/veiculos'
    ContentType = 'application/json'
    Params = <>
    RaiseExceptionOn500 = False
    Left = 16
    Top = 280
  end
  object RESTRequest2: TRESTRequest
    Client = RESTClient2
    Method = rmPOST
    Params = <>
    Response = RESTResponse2
    SynchronizedEvents = False
    Left = 64
    Top = 280
  end
  object RESTResponse2: TRESTResponse
    ContentType = 'text/html'
    Left = 104
    Top = 280
  end
  object RESTResponseDataSetAdapter2: TRESTResponseDataSetAdapter
    Dataset = FDMemTable2
    FieldDefs = <>
    Response = RESTResponse2
    Left = 144
    Top = 280
  end
  object FDMemTable2: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    Left = 184
    Top = 280
  end
  object DataSource2: TDataSource
    DataSet = FDMemTable2
    Left = 249
    Top = 275
  end
end
