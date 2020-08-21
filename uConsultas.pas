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
    btnPesquisarMarcas: TButton;
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
    btnPesquisarModelos: TButton;
    procedure btnMotosClick(Sender: TObject);
    procedure btnCarrosClick(Sender: TObject);
    procedure btnCaminhoesClick(Sender: TObject);
    procedure limparRequests;
    procedure btnVoltarMarcasClick(Sender: TObject);
    procedure dbgMarcasDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    codigoDeReferencia: string;
  end;

var
  frmConsultas:TfrmConsultas;
  valorDoBody, tipoDoVeiculo,codigoMarca:string;

implementation

{$R *.dfm}

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

  dbgModelos.Columns[0].FieldName := 'Label';
  dbgMarcas.Columns[0].Title.Caption := 'Marcas';
end;

procedure TfrmConsultas.btnVoltarMarcasClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmConsultas.dbgMarcasDblClick(Sender: TObject);
begin
  codigoMarca := dbgMarcas.DataSource.DataSet.FieldByName('Value').AsString;
  pnModelos.BringToFront;
  RESTResponseDataSetAdapter1.ClearDataSet;
  limparRequests;
  RESTRequest1.Resource           := 'ConsultarModelos';
  tipoDoVeiculo                   := '3';
  valorDoBody                     :=
  '{ "codigoTabelaReferencia": '+codigoDeReferencia+','
  +'"codigoTipoVeiculo": '+tipoDoVeiculo+''+
  ',"codigoMarca": '+codigoMarca+'}';
  RESTRequest1.Body.Add(valorDoBody);
  RESTResponse1.ContentType       := 'application/json';
  RESTResponse1.Content.Empty;
  RESTRequest1.execute;
  StringReplace(RESTResponse1.Content, '"Modelos":', '', [rfIgnoreCase, rfReplaceAll]);
  RESTResponseDataSetAdapter1.Active;
  dbgMarcas.Columns[0].FieldName  := 'Label';
  dbgModelos.Columns[0].Title.Caption := 'Modelos';
end;

procedure TfrmConsultas.FormCreate(Sender: TObject);
begin
  pnMarcas.BringToFront;
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
  dbgMarcas.Columns[0].FieldName  := 'Label';
  dbgMarcas.Columns[0].Title.Caption := 'Marcas';
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
  dbgMarcas.Columns[0].FieldName    := 'Label';
  dbgMarcas.Columns[0].Title.Caption := 'Marcas';
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

end.