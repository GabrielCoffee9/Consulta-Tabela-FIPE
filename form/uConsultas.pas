unit uConsultas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, REST.Types,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Datasnap.DBClient, REST.Response.Adapter, System.JSON,
  Vcl.DBCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uDatas, MidasLib, IniFiles,System.IOUtils;

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
    btnSalvarRegistro: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnMotosClick(Sender: TObject);
    procedure btnCarrosClick(Sender: TObject);
    procedure btnCaminhoesClick(Sender: TObject);
    procedure limparRequests;
    procedure btnVoltarMarcasClick(Sender: TObject);
    procedure dbgMarcasDblClick(Sender: TObject);
    procedure dbgModelosDblClick(Sender: TObject);
    procedure dbgAnosDblClick(Sender: TObject);
    procedure btnSalvarRegistroClick(Sender: TObject);
    procedure edtPesquisarMarcasChange(Sender: TObject);
    procedure edtPesquisarModelosChange(Sender: TObject);
    procedure edtPesquisarAnosChange(Sender: TObject);
    procedure transicaoParaPanelModelos;
    procedure transicaoParaPanelAnos;
    procedure transicaoParaPanelDetalhes;
    procedure converterJsonParaDataset(aDataset: TDataSet; aJSON: string);
    procedure preencherMemosDetalhes;


  private
    { Private declarations }
  public
    codigoDeReferencia, nomeParaSalvar: string;
  end;

var
  frmConsultas:TfrmConsultas;
  valorDoBody, tipoDoVeiculo,codigoMarca,codigoModelo:string;
  valueFinal, tipoCombustivel, anoModelo: string;
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
  RESTRequest1.Resource               := 'ConsultarMarcas';       //Parametros
  tipoDoVeiculo                       := '2';
  valorDoBody                         :=
  '{ "codigoTabelaReferencia": '+codigoDeReferencia+','
  +'"codigoTipoVeiculo": '+tipoDoVeiculo+'}';
  RESTRequest1.Params.AddBody(valorDobody);
  RESTResponse1.ContentType           := 'application/json';
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

  RESTRequest1.Resource               := 'ConsultarMarcas';

  tipoDoVeiculo                       := '1';
  valorDoBody                         :=
  '{ "codigoTabelaReferencia":'+codigoDeReferencia+','
  +'"codigoTipoVeiculo":'+tipoDoVeiculo+'}';
  RESTRequest1.Body.Add(valorDoBody);
  RESTResponse1.ContentType           := 'application/json';
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
  RESTRequest1.Resource               := 'ConsultarMarcas';
  tipoDoVeiculo                       := '3';
  valorDoBody                         :=
  '{ "codigoTabelaReferencia": '+codigoDeReferencia+','
  +'"codigoTipoVeiculo": '+tipoDoVeiculo+''+
  '}';
  RESTRequest1.Body.Add(valorDoBody);
  RESTResponse1.ContentType           := 'application/json';
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
  codigomodelo := dbgModelos.DataSource.DataSet.FieldByName('Value').AsString;
  pnAnos.BringToFront;
  frmConsultas.Caption := 'Anos';
  transicaoParaPanelAnos;

end;

procedure TfrmConsultas.dbgAnosDblClick(Sender: TObject);
begin
  valueFinal      := dbgAnos.DataSource.DataSet.FieldByName('Value').AsString;
  anoModelo       := copy(valueFinal,1,4);
  tipoCombustivel := copy(valueFinal,6,1);
  frmConsultas.Caption := 'Todos os Detalhes';
  transicaoParaPanelDetalhes;
end;

procedure TfrmConsultas.btnSalvarRegistroClick(Sender: TObject);
var
arquivoIni: TiniFile;
arq: TextFile;
begin
  if not DirectoryExists(Tpath.GetDocumentsPath+'\ConsultaFIPE')then
  CreateDir(Tpath.GetDocumentsPath+'\ConsultaFIPE');

  if  DirectoryExists(Tpath.GetDocumentsPath+'\ConsultaFIPE')then
  begin
    nomeParaSalvar:=InputBox('Salvar Registro', 'Insira o nome Para Salvar','');
    nomeParaSalvar:=StringReplace(nomeParaSalvar,'\','', [rfReplaceAll, rfIgnoreCase]);
    nomeParaSalvar:=StringReplace(nomeParaSalvar,'/','', [rfReplaceAll, rfIgnoreCase]);
    nomeParaSalvar:=StringReplace(nomeParaSalvar,'?','', [rfReplaceAll, rfIgnoreCase]);
    nomeParaSalvar:=StringReplace(nomeParaSalvar,':','', [rfReplaceAll, rfIgnoreCase]);
    nomeParaSalvar:=StringReplace(nomeParaSalvar,'*','', [rfReplaceAll, rfIgnoreCase]);
    nomeParaSalvar:=StringReplace(nomeParaSalvar,'"','', [rfReplaceAll, rfIgnoreCase]);
    nomeParaSalvar:=StringReplace(nomeParaSalvar,'<','', [rfReplaceAll, rfIgnoreCase]);
    nomeParaSalvar:=StringReplace(nomeParaSalvar,'>','', [rfReplaceAll, rfIgnoreCase]);
    nomeParaSalvar:=StringReplace(nomeParaSalvar,'|','', [rfReplaceAll, rfIgnoreCase]);
    if nomeParaSalvar = '' then
    ShowMessage('Não foi possivel salvar pois o nome arquivo é vazio,'+
     'tente novamente com outro nome. OBS: Alguns caracteres especiais '+
     'não são permitidos')
    else
    begin
      arquivoIni := TIniFile.Create(Tpath.GetDocumentsPath+'\ConsultaFIPE\'+nomeParaSalvar+'.ini');
      arquivoIni.WriteString(nomeParaSalvar,'Marca',(RESTResponseDataSetAdapter1.Dataset.FieldByName('Marca').AsString));
      arquivoIni.WriteString(nomeParaSalvar,'Modelo',(RESTResponseDataSetAdapter1.Dataset.FieldByName('Modelo').AsString));
      arquivoIni.WriteString(nomeParaSalvar,'Ano',(RESTResponseDataSetAdapter1.Dataset.FieldByName('AnoModelo').AsString));
      arquivoIni.WriteString(nomeParaSalvar,'Combustivel',(RESTResponseDataSetAdapter1.Dataset.FieldByName('Combustivel').AsString));
      arquivoIni.WriteString(nomeParaSalvar,'Preço',(RESTResponseDataSetAdapter1.Dataset.FieldByName('Valor').AsString));
      arquivoIni.WriteString(nomeParaSalvar,'CodigoFipe',(RESTResponseDataSetAdapter1.Dataset.FieldByName('CodigoFipe').AsString));
      arquivoIni.WriteString(nomeParaSalvar,'Mes de Referencia',(RESTResponseDataSetAdapter1.Dataset.FieldByName('MesReferencia').AsString));
      arquivoIni.WriteString(nomeParaSalvar,'Data da Consulta',(RESTResponseDataSetAdapter1.Dataset.FieldByName('DataConsulta').AsString));
      btnSalvarRegistro.Enabled := False;
    end;

  end;

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
  RESTRequest1.Resource               := 'ConsultarAnoModelo';
  valorDoBody                         :=
  '{ "codigoTabelaReferencia": '+codigoDeReferencia+','
  +'"codigoTipoVeiculo": '+tipoDoVeiculo+''+
  ',"codigoMarca": '+codigoMarca+
  ',"codigoModelo": '+codigoModelo+'}';
  RESTRequest1.Body.Add(valorDoBody);
  RESTResponse1.ContentType           := 'application/json';
  RESTResponse1.Content.Empty;
  RESTRequest1.execute;
  RESTResponseDataSetAdapter1.Active;
  dbgAnos.Columns[0].FieldName        := 'Label';
  dbgAnos.Columns[0].Title.Caption    := 'Ano';
  dbgAnos.Columns[1].FieldName        := 'Value';
  dbgAnos.Columns[1].Visible          := False;
  edtPesquisarAnos.Enabled            := True;
end;

procedure TfrmConsultas.transicaoParaPanelDetalhes;
begin
  try
    pnPrecoFinal.BringToFront;
    limparRequests;
    RESTRequest1.Resource               := 'ConsultarValorComTodosParametros';
    valorDoBody                         :=
    '{ "codigoTabelaReferencia": '+codigoDeReferencia+','
    +'"codigoTipoVeiculo": '+tipoDoVeiculo+''+
    ',"codigoMarca": '+codigoMarca+
    ',"ano":"'+valueFinal+'"'+
    ',"codigoTipoCombustivel":'+tipoCombustivel+
    ',"anoModelo":'+anoModelo+
    ',"codigoModelo": '+codigoModelo+
    ',"tipoConsulta": "tradicional"}';
    RESTRequest1.Body.Add(valorDoBody);
    RESTResponse1.ContentType           := 'application/json';
    RESTResponse1.Content.Empty;
    RESTRequest1.execute;
    RESTResponseDataSetAdapter1.Active;
    preencherMemosDetalhes;
  except
  with CreateMessageDialog('Algo deu errado com as informações, por favor tente'+
  'com outro modelo ou ano',
   mtInformation,[mbOK]) do
   try
    Caption:= 'Erro';
    ShowModal;
   finally
    Free;
    btnVoltarDetalhes.Click;
   end;
  end;
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

procedure TfrmConsultas.preencherMemosDetalhes;
begin
  memDetalhes.Lines.Add('');
  memDetalhes.Lines.Add ('Marca: '+ RESTResponseDataSetAdapter1.Dataset.FieldByName('Marca').AsString);
  memDetalhes.Lines.Add('');
  memDetalhes.Lines.Add ('Modelo: '+ RESTResponseDataSetAdapter1.Dataset.FieldByName('Modelo').AsString);
  memDetalhes.Lines.Add('');
  memDetalhes.Lines.Add ('Ano: '+ RESTResponseDataSetAdapter1.Dataset.FieldByName('AnoModelo').AsString);
  memDetalhes.Lines.Add('');
  memDetalhes.Lines.Add ('Combustível: '+ RESTResponseDataSetAdapter1.Dataset.FieldByName('Combustivel').AsString);
  memDetalhes.Lines.Add('');
  memDetalhes.Lines.Add ('Preço: '+ RESTResponseDataSetAdapter1.Dataset.FieldByName('Valor').AsString);
  memDetalhes.Lines.Add('');
  memDetalhes.Lines.Add ('Código da tabela FIPE: '+ RESTResponseDataSetAdapter1.Dataset.FieldByName('CodigoFipe').AsString);
  memDetalhes.Lines.Add('');
  memDetalhes.Lines.Add('');
  memDetalhes.Lines.Add ('Mês de Referência: '+ RESTResponseDataSetAdapter1.Dataset.FieldByName('MesReferencia').AsString);
  memDetalhes.Lines.Add ('Data da Consulta: '+ RESTResponseDataSetAdapter1.Dataset.FieldByName('DataConsulta').AsString);
  memDetalhes.Lines.Add('');
  memDetalhes.Lines.Add ('Autenticação usada: '+ RESTResponseDataSetAdapter1.Dataset.FieldByName('Autenticacao').AsString);
end;

end.
