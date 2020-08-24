unit uDatas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, REST.Types, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, REST.Response.Adapter, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmDatas = class(TForm)
    pnDatas: TPanel;
    lblPesquisarDatas: TLabel;
    btnPesquisarDatas: TButton;
    DBLookupComboBox1: TDBLookupComboBox;
    RESTClient2: TRESTClient;
    RESTRequest2: TRESTRequest;
    RESTResponse2: TRESTResponse;
    RESTResponseDataSetAdapter2: TRESTResponseDataSetAdapter;
    FDMemTable2: TFDMemTable;
    DataSource2: TDataSource;
    procedure btnPesquisarDatasClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
  end;

var
  frmDatas: TfrmDatas;
implementation

{$R *.dfm}

uses uConsultas;

procedure TfrmDatas.btnPesquisarDatasClick(Sender: TObject);
begin
  frmConsultas := TfrmConsultas.Create(self);
  frmConsultas.codigoDeReferencia:= DBLookupComboBox1.ListSource.DataSet.FieldByName('codigo').AsString;
  frmConsultas.ShowModal;
end;

procedure TfrmDatas.FormCreate(Sender: TObject);
begin
  RESTRequest2.Params.Clear;
  RESTRequest2.Params.Add;
  RESTRequest2.Params[0].ContentType:=ctAPPLICATION_JSON;
  RESTRequest2.Params[0].Kind       := pkGETorPOST;
  RESTRequest2.Resource             := 'ConsultarTabelaDeReferencia';
  RESTRequest2.execute;
  RESTResponseDataSetAdapter2.Active;
  DBLookupComboBox1.KeyField        := 'Mes';
  DBLookupComboBox1.ListFieldIndex := 1;
end;

end.
