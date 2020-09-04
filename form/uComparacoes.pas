unit uComparacoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,IniFiles,System.IOUtils, MidasLib;

type
  TfrmComparacoes = class(TForm)
    pnPrincipal: TPanel;
    Label1: TLabel;
    lblRegistro1Comparacao: TLabel;
    lblRegistro2Comparacao: TLabel;
    Button1: TButton;
    memMostrarRegistro1: TMemo;
    memMostrarRegistro2: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure exibirTodosOsDetalhes(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    informacoesRegistro1, informacoesRegistro2: TStringList;
     arquivoIni: TiniFile;
  end;

var
  frmComparacoes: TfrmComparacoes;

implementation

{$R *.dfm}

uses uComparar;


procedure TfrmComparacoes.Button1Click(Sender: TObject);
begin
  Close;
end;
procedure TfrmComparacoes.exibirTodosOsDetalhes(Sender: TObject);
begin
  memMostrarRegistro1.Clear;
  memMostrarRegistro2.Clear;

  arquivoIni := TIniFile.Create(Tpath.GetDocumentsPath+'\ConsultaFIPE\'+frmComparar.cbxRegistro1.Text+'.ini');
  With memMostrarRegistro1.Lines do
  begin
    Add('');
    Add('');
    Add('');
    Add('Marca: '+arquivoIni.ReadString(frmComparar.cbxRegistro1.Text,'Marca','Erro'));
    Add('');
    Add('Modelo: '+arquivoIni.ReadString(frmComparar.cbxRegistro1.Text,'Modelo','Erro'));
    Add('');
    Add('Ano: '+arquivoIni.ReadString(frmComparar.cbxRegistro1.Text,'Ano','Erro'));
    Add('');
    Add('Tipo de Combustivel: '+arquivoIni.ReadString(frmComparar.cbxRegistro1.Text,'Combustivel','Erro'));
    Add('');
    Add('Preço: '+arquivoIni.ReadString(frmComparar.cbxRegistro1.Text,'Preço','Erro'));
    Add('');
    Add('Codigo FIPE: '+arquivoIni.ReadString(frmComparar.cbxRegistro1.Text,'CodigoFipe','Erro'));
    Add('');
    Add('');
    Add('Mês de Referência: '+arquivoIni.ReadString(frmComparar.cbxRegistro1.Text,'Mes de Referencia','Erro'));
    Add('');
    Add('Data Da Consulta: '+arquivoIni.ReadString(frmComparar.cbxRegistro1.Text,'Data da Consulta','Erro'));
    arquivoIni.Free;
    lblRegistro1Comparacao.Caption:= frmComparar.cbxRegistro1.Text;
  end;

  arquivoIni := TiniFile.Create(Tpath.GetDocumentsPath+'\ConsultaFIPE\'+frmComparar.cbxRegistro2.Text+'.ini');
  With memMostrarRegistro2.Lines do
  begin
    Add('');
    Add('');
    Add('');
    Add('Marca: '+arquivoIni.ReadString(frmComparar.cbxRegistro2.Text,'Marca','Erro'));
    Add('');
    Add('Modelo: '+arquivoIni.ReadString(frmComparar.cbxRegistro2.Text,'Modelo','Erro'));
    Add('');
    Add('Ano: '+arquivoIni.ReadString(frmComparar.cbxRegistro2.Text,'Ano','Erro'));
    Add('');
    Add('Tipo de Combustivel: '+arquivoIni.ReadString(frmComparar.cbxRegistro2.Text,'Combustivel','Erro'));
    Add('');
    Add('Preço: '+arquivoIni.ReadString(frmComparar.cbxRegistro2.Text,'Preço','Erro'));
    Add('');
    Add('Codigo FIPE: '+arquivoIni.ReadString(frmComparar.cbxRegistro2.Text,'CodigoFipe','Erro'));
    Add('');
    Add('');
    Add('Mês de Referência: '+arquivoIni.ReadString(frmComparar.cbxRegistro2.Text,'Mes de Referencia','Erro'));
    Add('');
    Add('Data Da Consulta: '+arquivoIni.ReadString(frmComparar.cbxRegistro2.Text,'Data da Consulta','Erro'));
    arquivoIni.Free;
    lblRegistro2Comparacao.Caption:= frmComparar.cbxRegistro2.Text;
  end;
end;

procedure TfrmComparacoes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action         := caFree;
 frmComparacoes := nil;
end;

end.
