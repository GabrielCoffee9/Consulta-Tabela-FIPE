unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, REST.Types,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Datasnap.DBClient, REST.Response.Adapter, System.JSON,
  Vcl.DBCtrls;

type
  TfrmPrincipal = class(TForm)
    pnMarcas: TPanel;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    btnMotos: TButton;
    btnCarros: TButton;
    dbgMarcas: TDBGrid;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    btnCaminhoes: TButton;
    pnModelos: TPanel;
    Button1: TButton;
    Button2: TButton;
    dbgModelos: TDBGrid;
    Button3: TButton;
    pnAnos: TPanel;
    Button4: TButton;
    Button5: TButton;
    dbgAnos: TDBGrid;
    Button6: TButton;
    edtPesquisarMarcas: TEdit;
    btnPesquisarMarcas: TButton;
    lblEditMarcas: TLabel;
    btnResetar: TButton;
    pnDatas: TPanel;
    lblPesquisarDatas: TLabel;
    btnPesquisarDatas: TButton;
    btnResetarDatas: TButton;
    DBLookupComboBox1: TDBLookupComboBox;
    procedure btnMotosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCarrosClick(Sender: TObject);
    procedure converterJsonParaDataset(aDataset : TDataSet; aJSON : string);
    procedure btnCaminhoesClick(Sender: TObject);
    procedure limparRequests;
    procedure btnResetarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;
  jValue:TJSONValue;
  valorDoBody: string;
  codigoDeReferencia, tipoDoVeiculo : string;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnMotosClick(Sender: TObject);
begin
  limparRequests; //limpar Resquests

  RESTRequest1.Resource := 'ConsultarMarcas';       //Parametros
  codigoDeReferencia := '231';
  tipoDoVeiculo:= '2';
  valorDoBody := '{'+
  '"codigoTabelaReferencia": '+codigoDeReferencia+','
  +'"codigoTipoVeiculo": '+tipoDoVeiculo+''+
'}';
  RESTRequest1.Body.Add(valorDoBody);
  RESTResponse1.ContentType := 'application/json';
  RESTRequest1.execute;       //Executar

  jValue := RESTResponse1.JSONValue;
  ShowMessage (jValue.ToString);

  converterJsonParaDataset(ClientDataSet1,jValue.ToString);

  ClientDataSet1.Active;
  dbgMarcas.Columns[0].FieldName := 'Label';
end;

procedure TfrmPrincipal.btnResetarClick(Sender: TObject);
begin
//http://veiculos.fipe.org.br/api/veiculos/ConsultarModelos
end;

procedure TfrmPrincipal.btnCaminhoesClick(Sender: TObject);
begin
  limparRequests;
  RESTRequest1.Resource := 'ConsultarMarcas';

  tipoDoVeiculo:= '3';
  codigoDeReferencia := '231';

  valorDoBody := '{'+
  '"codigoTabelaReferencia": '+codigoDeReferencia+','
  +'"codigoTipoVeiculo": '+tipoDoVeiculo+''+
'}';
  RESTRequest1.Body.Add(valorDoBody);
  RESTResponse1.ContentType := 'application/json';
  RESTRequest1.execute;
  jValue := RESTResponse1.JSONValue;
  ShowMessage (jValue.ToString);
  converterJsonParaDataset(ClientDataSet1,jValue.ToString);

  ClientDataSet1.Active;
  dbgMarcas.Columns[0].FieldName := 'Label';
end;

procedure TfrmPrincipal.btnCarrosClick(Sender: TObject);
begin
  limparRequests;

  RESTRequest1.Resource := 'ConsultarMarcas';

  tipoDoVeiculo:= '1';
  codigoDeReferencia := '231';
  valorDoBody := '{'+
  '"codigoTabelaReferencia": '+codigoDeReferencia+','
  +'"codigoTipoVeiculo": '+tipoDoVeiculo+''+
'}';

  RESTRequest1.Body.Add(valorDoBody);
  RESTResponse1.ContentType := 'application/json';
  RESTRequest1.execute;
  jValue := RESTResponse1.JSONValue;
  converterJsonParaDataset(ClientDataSet1,jValue.ToString);

  ClientDataSet1.Active;
  dbgMarcas.Columns[0].FieldName := 'Label';
end;

procedure TfrmPrincipal.converterJsonParaDataset(aDataset: TDataSet;
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

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  RESTRequest1.Params.Clear;
  RESTRequest1.Params.Add;
  RESTRequest1.Params[0].ContentType:=ctAPPLICATION_JSON;
  RESTRequest1.Params[0].Kind  := pkGETorPOST;
//  RESTRequest1.Resource := 'ConsultarTabelaDeReferencia';
//  RESTRequest1.execute;
//  jValue := RESTResponse1.JSONValue;
//  converterJsonParaDataset(ClientDataSet1,jValue.ToString);
//  DBLookupComboBox1.Field.Name := 'Mes';
end;

procedure TfrmPrincipal.limparRequests;
begin
  RESTRequest1.Response.FullRequestURI;
  RESTRequest1.Body.ClearBody;
  RESTRequest1.Resource.Empty;
  RESTClient1.BaseURL:= 'http://veiculos.fipe.org.br/api/veiculos';
  ClientDataSet1.FieldDefs.Clear;
  ClientDataSet1.Fields.Clear;
  dbgMarcas.Columns.Clear;
//  Jvalue.Free;

  RESTResponse1.Content.Empty;
  RESTResponse1.ContentType := '';
end;

end.
