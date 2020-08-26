unit uConsultas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, REST.Types,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Datasnap.DBClient, REST.Response.Adapter, System.JSON,
  Vcl.DBCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uDatas;

type
  TfrmConsultas = class(TForm)
    pnMarcas: TPanel;
    btnMotos: TButton;
    btnCarros: TButton;
    dbgMarcas: TDBGrid;
    btnCaminhoes: TButton;
    pnModelos: TPanel;
    dbgModelos: TDBGrid;
    pnAnos: TPanel;
    dbgAnos: TDBGrid;
    edtPesquisarMarcas: TEdit;
    lblEditMarcas: TLabel;
    btnVoltarMarcas: TButton;
    DataSource1: TDataSource;
    FDMemTable1: TFDMemTable;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    edtPesquisarModelos: TEdit;
    lblEditModelos: TLabel;
    btnVoltarModelos: TButton;
    ClientDataSetContent: TClientDataSet;
    DataSourceContent: TDataSource;
    lblPesquisarAnos: TLabel;
    edtPesquisarAnos: TEdit;
    Button1: TButton;
    pnPrecoFinal: TPanel;
    memDetalhes: TMemo;
    btnVoltarDetalhes: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnMotosClick(Sender: TObject);
    procedure btnCarrosClick(Sender: TObject);
    procedure btnCaminhoesClick(Sender: TObject);
    procedure limparRequests;
    procedure btnVoltarMarcasClick(Sender: TObject);
    procedure dbgMarcasDblClick(Sender: TObject);
    procedure dbgModelosDblClick(Sender: TObject);
    procedure edtPesquisarMarcasChange(Sender: TObject);
    procedure edtPesquisarModelosChange(Sender: TObject);
    procedure edtPesquisarAnosChange(Sender: TObject);
    procedure transicaoParaPanelModelos;
    procedure transicaoParaPanelAnos;
    procedure converterJsonParaDataset(aDataset: TDataSet; aJSON: string);

  private
    { Private declarations }
  public
    codigoDeReferencia: string;
  end;

var
  frmConsultas:TfrmConsultas;
  valorDoBody, tipoDoVeiculo,codigoMarca,codigoAnos:string;
  jValue:TJSONValue;

implementation

{$R *.dfm}

procedure TfrmConsultas.FormCreate(Sender: TObject);
begin
  pnMarcas.BringToFront;
end;

procedure TfrmConsultas.btnMotosClick(Sender: TObject);
begin
  RESTRequest1.Params.Clear;
  limparRequests; //limpar Resquests
  RESTRequest1.Resource           := 'ConsultarMarcas';       //Parametros
  tipoDoVeiculo                   := '2';
  valorDoBody                     :=
  '{ "codigoTabelaReferencia": '+codigoDeReferencia+','
  +'"codigoTipoVeiculo": '+tipoDoVeiculo+'}';
  RESTRequest1.Params.AddBody(valorDobody);
  RESTResponse1.ContentType       := 'application/json';
  RESTRequest1.execute;   //         Executar
  RESTResponseDataSetAdapter1.Active;

  dbgModelos.Columns[0].FieldName     := 'Label';
  dbgMarcas.Columns[0].Title.Caption  := 'Marcas';
  dbgMarcas.Columns[1].FieldName      := 'Value';
  dbgMarcas.Columns[1].Visible        := False;
  dbgMarcas.Visible                   := True;
  edtPesquisarMarcas.Enabled          := True;
end;

procedure TfrmConsultas.btnCarrosClick(Sender: TObject);
begin
  RESTResponseDataSetAdapter1.ClearDataSet;
  limparRequests;

  RESTRequest1.Resource             := 'ConsultarMarcas';

  tipoDoVeiculo                     := '1';
  valorDoBody                       :=
  '{ "codigoTabelaReferencia":'+codigoDeReferencia+','
  +'"codigoTipoVeiculo":'+tipoDoVeiculo+'}';
  RESTRequest1.Body.Add(valorDoBody);
  RESTResponse1.ContentType         := 'application/json';
  RESTRequest1.execute;
  RESTResponseDataSetAdapter1.Active;
  dbgMarcas.Columns[0].FieldName      := 'Label';
  dbgMarcas.Columns[0].Title.Caption  := 'Marcas';
  dbgMarcas.Columns[1].FieldName      := 'Value';
  dbgMarcas.Columns[1].Visible        := False;
  dbgMarcas.Visible                   := True;
  edtPesquisarMarcas.Enabled          := True;

end;

procedure TfrmConsultas.btnCaminhoesClick(Sender: TObject);
begin
  RESTResponseDataSetAdapter1.ClearDataSet;
  limparRequests;
  RESTRequest1.Resource           := 'ConsultarMarcas';
  tipoDoVeiculo                   := '3';
  valorDoBody                     :=
  '{ "codigoTabelaReferencia": '+codigoDeReferencia+','
  +'"codigoTipoVeiculo": '+tipoDoVeiculo+''+
  '}';
  RESTRequest1.Body.Add(valorDoBody);
  RESTResponse1.ContentType       := 'application/json';
  RESTRequest1.execute;
  RESTResponseDataSetAdapter1.Active;
  dbgMarcas.Columns[0].FieldName      := 'Label';
  dbgMarcas.Columns[0].Title.Caption  := 'Marcas';
  dbgMarcas.Columns[1].FieldName      := 'Value';
  dbgMarcas.Columns[1].Visible        := False;
  dbgMarcas.Visible                   := True;
  edtPesquisarMarcas.Enabled          := True;
end;

procedure TfrmConsultas.limparRequests;
begin
  RESTClient1.BaseURL := 'http://veiculos.fipe.org.br/api/veiculos';

  dbgMarcas.Columns.Clear;
  dbgModelos.Columns.Clear;

  RESTResponse1.Content.Empty;
  RESTRequest1.Body.ClearBody;
  RESTResponseDataSetAdapter1.ClearDataSet;
  RESTRequest1.Params.Clear;
  RESTRequest1.Params.Add;
  RESTRequest1.Params[0].ContentType:=ctAPPLICATION_JSON;
  RESTRequest1.Params[0].Kind       := pkGETorPOST;

  end;

procedure TfrmConsultas.btnVoltarMarcasClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmConsultas.dbgMarcasDblClick(Sender: TObject);
begin
  codigoMarca := dbgMarcas.DataSource.DataSet.FieldByName('Value').AsString;
  pnModelos.BringToFront;
  frmConsultas.Caption := 'Modelos';
  transicaoParaPanelModelos;
end;

procedure TfrmConsultas.dbgModelosDblClick(Sender: TObject);
begin
  codigoAnos := dbgModelos.DataSource.DataSet.FieldByName('Value').AsString;
  pnAnos.BringToFront;
  frmConsultas.Caption := 'Anos';
  transicaoParaPanelAnos;

end;

procedure TfrmConsultas.edtPesquisarMarcasChange(Sender: TObject);
begin
  dbgMarcas.DataSource.DataSet.Locate('Label',edtPesquisarMarcas.Text,[ LoPartialKey]);
end;

procedure TfrmConsultas.edtPesquisarModelosChange(Sender: TObject);
begin
  dbgModelos.DataSource.DataSet.Locate('Label',edtPesquisarModelos.Text,[ LoPartialKey]);
end;

procedure TfrmConsultas.edtPesquisarAnosChange(Sender: TObject);
begin
  dbgAnos.DataSource.DataSet.Locate('Label',edtPesquisarAnos.Text,[ LoPartialKey]);
end;

procedure TfrmConsultas.transicaoParaPanelModelos;
  var
  contentTemp: string;
  tamanho, nPosi: integer;
begin
  limparRequests;
  RESTRequest1.Resource               := 'ConsultarModelos';
  valorDoBody                         :=
  '{ "codigoTabelaReferencia": '+codigoDeReferencia+','
  +'"codigoTipoVeiculo": '+tipoDoVeiculo+''+
  ',"codigoMarca": '+codigoMarca+'}';
  RESTRequest1.Body.Add(valorDoBody);
  RESTResponse1.ContentType           := 'application/json';
  RESTResponse1.Content.Empty;
  RESTRequest1.execute;
  contentTemp := RESTResponse1.Content;
  delete(contentTemp,1,11);
  nPosi := Pos('],"Anos',contentTemp);
  tamanho:= length(contentTemp);
  delete (contentTemp,nPosi+1,tamanho);
  converterJsonParaDataset(ClientDataSetContent,contentTemp);
  ClientDataSetContent.Active;
  dbgModelos.Columns[0].FieldName     := 'Label';
  dbgModelos.Columns[0].Title.Caption := 'Modelos';
  dbgModelos.Columns[1].FieldName     := 'Value';
  dbgModelos.Columns[1].Visible       := False;
  edtPesquisarModelos.Enabled         := True;
end;

procedure TfrmConsultas.transicaoParaPanelAnos;
begin
  limparRequests;
  RESTRequest1.Resource           := 'ConsultarAnoModelo';
  valorDoBody                     :=
  '{ "codigoTabelaReferencia": '+codigoDeReferencia+','
  +'"codigoTipoVeiculo": '+tipoDoVeiculo+''+
  ',"codigoMarca": '+codigoMarca+
  ',"codigoModelo": '+codigoAnos+'}';
  RESTRequest1.Body.Add(valorDoBody);
  RESTResponse1.ContentType       := 'application/json';
  RESTResponse1.Content.Empty;
  RESTRequest1.execute;
  RESTResponseDataSetAdapter1.Active;
  dbgAnos.Columns[0].FieldName      := 'Label';
  dbgAnos.Columns[0].Title.Caption  := 'Ano';
  dbgAnos.Columns[1].FieldName      := 'Value';
  dbgAnos.Columns[1].Visible        := False;
  //colocar edit de pesquisa



end;



procedure TfrmConsultas.converterJsonParaDataset(aDataset: TDataSet;
aJSON: string);
  var
    jObjeto: TJSONArray;
    vConverter : TCustomJSONDataSetAdapter;
begin
  if (aJSON = EmptyStr) then
  begin
    Exit;
  end;

  jObjeto := TJSONObject.ParseJSONValue(aJSON) as TJSONArray;
  vConverter := TCustomJSONDataSetAdapter.Create(Nil);

  try
    vConverter.Dataset := aDataset;
    vConverter.UpdateDataSet(jObjeto);
  finally
    vConverter.Free;
    jObjeto.Free;
  end;
end;
end.
