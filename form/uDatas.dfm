object frmDatas: TfrmDatas
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Refer'#234'ncia de Consulta'
  ClientHeight = 128
  ClientWidth = 461
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
  object pnDatas: TPanel
    Left = -7
    Top = -45
    Width = 496
    Height = 353
    TabOrder = 0
    object lblPesquisarDatas: TLabel
      Left = 13
      Top = 97
      Width = 147
      Height = 14
      Caption = 'Refer'#234'ncia da consulta :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnPesquisarDatas: TButton
      Left = 381
      Top = 91
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Caption = 'Pesquisar'
      TabOrder = 0
      OnClick = btnPesquisarDatasClick
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 172
      Top = 93
      Width = 189
      Height = 21
      Cursor = crHandPoint
      ListSource = DataSource2
      TabOrder = 1
    end
    object btnComparar: TButton
      Left = 13
      Top = 139
      Width = 212
      Height = 25
      Cursor = crHandPoint
      Caption = 'J'#225' Salvei dois registros e Quero Comparar'
      TabOrder = 2
      OnClick = btnCompararClick
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
