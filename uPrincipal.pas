unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, REST.Types,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Datasnap.DBClient, REST.Response.Adapter, System.JSON;

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
    procedure btnMotosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCarrosClick(Sender: TObject);
    procedure converterJsonParaDataset(aDataset : TDataSet; aJSON : string);
    procedure btnCaminhoesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;
  jValue:TJSONValue;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnMotosClick(Sender: TObject);
begin
  RESTRequest1.Resource := 'motos/marcas';
  RESTRequest1.execute;
  jValue := RESTResponse1.JSONValue;
  converterJsonParaDataset(ClientDataSet1,jValue.ToString);
  dbgMarcas.Columns[0].FieldName := 'nome';
end;

procedure TfrmPrincipal.btnCaminhoesClick(Sender: TObject);
begin
  RESTRequest1.Resource := 'caminhoes/marcas';
  RESTRequest1.execute;
  jValue := RESTResponse1.JSONValue;
  converterJsonParaDataset(ClientDataSet1,jValue.ToString);
  dbgMarcas.Columns[0].FieldName := 'nome';
end;

procedure TfrmPrincipal.btnCarrosClick(Sender: TObject);
begin
  RESTRequest1.Resource := 'carros/marcas';
  RESTRequest1.execute;
  jValue := RESTResponse1.JSONValue;
  converterJsonParaDataset(ClientDataSet1,jValue.ToString);
  dbgMarcas.Columns[0].FieldName := 'nome';
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
end;

end.
