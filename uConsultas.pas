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
    procedure btnMotosClick(Sender: TObject);
    procedure btnCarrosClick(Sender: TObject);
    procedure btnCaminhoesClick(Sender: TObject);
    procedure limparRequests;
    procedure btnVoltarMarcasClick(Sender: TObject);
  private
    { Private declarations }
  public
    codigoDeReferencia: string;
  end;

var
  frmConsultas:TfrmConsultas;
  valorDoBody, tipoDoVeiculo:string;

implementation

{$R *.dfm}

procedure TfrmConsultas.btnMotosClick(Sender: TObject);
begin
  RESTResponseDataSetAdapter1.ClearDataSet;
  limparRequests; //limpar Resquests

  RESTRequest1.Resource           := 'ConsultarMarcas';       //Parametros
  tipoDoVeiculo                   := '2';
  valorDoBody                     :=
  '{ "codigoTabelaReferencia": '+codigoDeReferencia+','
  +'"codigoTipoVeiculo": '+tipoDoVeiculo+'}';
  ShowMessage(valorDoBody);
  RESTRequest1.Body.ClearBody;
  RESTRequest1.Params.AddBody(valorDobody);
  RESTResponse1.ContentType       := 'application/json';
  RESTRequest1.execute;   //         Executar
  RESTResponseDataSetAdapter1.Active;

  dbgMarcas.Columns[0].FieldName := 'Label';
end;

procedure TfrmConsultas.btnVoltarMarcasClick(Sender: TObject);
begin
  Close;
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
end;


procedure TfrmConsultas.limparRequests;
begin
  RESTClient1.BaseURL := 'http://veiculos.fipe.org.br/api/veiculos';
  dbgMarcas.Columns.Clear;
  RESTResponse1.Content.Empty;
end;

end.
