unit uComparacoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,IniFiles,System.IOUtils;

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
    procedure FormCreate(Sender: TObject);
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

procedure TfrmComparacoes.FormCreate(Sender: TObject);
begin
    memMostrarRegistro1.Clear;
    memMostrarRegistro2.Clear;
    arquivoIni := TiniFile.Create(Tpath.GetDocumentsPath+'\ConsultaFIPE\'+frmComparacao.cbxRegistro1.Text+'.ini');
    With informacoesRegistro1 do
    begin
      Add('');
      Add(arquivoIni.ReadString(frmComparacao.cbxRegistro1.Text,'Marca','Erro'));
      Add(arquivoIni.ReadString(frmComparacao.cbxRegistro1.Text,'Modelo','Erro'));
      Add(arquivoIni.ReadString(frmComparacao.cbxRegistro1.Text,'Ano','Erro'));
      Add(arquivoIni.ReadString(frmComparacao.cbxRegistro1.Text,'Combustivel','Erro'));
      Add(arquivoIni.ReadString(frmComparacao.cbxRegistro1.Text,'Preço','Erro'));
      Add(arquivoIni.ReadString(frmComparacao.cbxRegistro1.Text,'CodigoFipe','Erro'));
      Add('');
      Add(arquivoIni.ReadString(frmComparacao.cbxRegistro1.Text,'Mes de Referencia','Erro'));
      Add(arquivoIni.ReadString(frmComparacao.cbxRegistro1.Text,'Data da Consulta','Erro'));
    end;

    With informacoesRegistro2 do
    begin
      Add('');
      Add(arquivoIni.ReadString(frmComparacao.cbxRegistro2.Text,'Marca','Erro'));
      Add(arquivoIni.ReadString(frmComparacao.cbxRegistro2.Text,'Modelo','Erro'));
      Add(arquivoIni.ReadString(frmComparacao.cbxRegistro2.Text,'Ano','Erro'));
      Add(arquivoIni.ReadString(frmComparacao.cbxRegistro2.Text,'Combustivel','Erro'));
      Add(arquivoIni.ReadString(frmComparacao.cbxRegistro2.Text,'Preço','Erro'));
      Add(arquivoIni.ReadString(frmComparacao.cbxRegistro2.Text,'CodigoFipe','Erro'));
      Add('');
      Add(arquivoIni.ReadString(frmComparacao.cbxRegistro2.Text,'Mes de Referencia','Erro'));
      Add(arquivoIni.ReadString(frmComparacao.cbxRegistro2.Text,'Data da Consulta','Erro'));
    end;
end;

end.
