unit uComparar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, System.IOUtils,
  Vcl.Buttons, Vcl.ComCtrls;

type
  TfrmComparacao = class(TForm)
    pnCompararPrincipal: TPanel;
    cbxRegistro1: TComboBox;
    cbxRegistro2: TComboBox;
    lblRegistro1: TLabel;
    lblRegistro2: TLabel;
    btnSelecionar: TButton;
    btnTransicaoParaExclusao: TButton;
    pnExcluir: TPanel;
    cbxExcluir: TComboBox;
    lblSelecione: TLabel;
    btnVoltarDaExclusao: TButton;
    btnTenhoCerteza: TBitBtn;
    pnTodosOsParametros: TPanel;
    rdtComparacao: TRichEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnTransicaoParaExclusaoClick(Sender: TObject);
    procedure btnVoltarDaExclusaoClick(Sender: TObject);
    procedure btnTenhoCertezaClick(Sender: TObject);
    procedure mostrarArquivos;
    procedure btnSelecionarClick(Sender: TObject);
  private
    { Private declarations }
  public
  procedure listarArquivos;
  end;

var
  frmComparacao: TfrmComparacao;
  teste :Tstringlist;

implementation

{$R *.dfm}

{ TfrmComparacao }


procedure TfrmComparacao.btnSelecionarClick(Sender: TObject);
begin
  if cbxRegistro1.Text = cbxRegistro2.Text then
  ShowMessage('Você não pode comparar dois registros iguais!')
  else
  begin
    //comparacao
  end;
end;

procedure TfrmComparacao.btnTenhoCertezaClick(Sender: TObject);
begin
  deletefile(Tpath.GetDocumentsPath+'\ConsultaFIPE\'+cbxExcluir.text+'.ini');
  ShowMessage('Registro deletado com sucesso');
  mostrarArquivos;
end;

procedure TfrmComparacao.btnTransicaoParaExclusaoClick(Sender: TObject);
begin
  pnExcluir.BringToFront;
  mostrarArquivos;
end;

procedure TfrmComparacao.btnVoltarDaExclusaoClick(Sender: TObject);
begin
  pnCompararPrincipal.BringToFront;
  mostrarArquivos;
end;

procedure TfrmComparacao.FormCreate(Sender: TObject);
begin
  mostrarArquivos;
end;

procedure TfrmComparacao.listarArquivos;
var
  SR: TSearchRec;
  I: integer;
begin
   cbxRegistro1.Items.Clear;
   cbxRegistro2.Items.Clear;
   cbxExcluir.Items.Clear;
  I := FindFirst(Tpath.GetDocumentsPath+'\ConsultaFIPE\'+'*.ini', faAnyFile, SR);
  while I = 0 do
  begin
    cbxRegistro1.Items.Add(sr.Name);
    cbxRegistro2.Items.Add(sr.Name);
    cbxExcluir.Items.Add(sr.Name);
    I := FindNext(SR);
  end;
end;

procedure TfrmComparacao.mostrarArquivos;
var
indice: integer;
begin
  listarArquivos;
 for indice := 0 to cbxRegistro1.Items.Count -1 do
   begin
    cbxRegistro1.Items[indice]:= StringReplace(cbxRegistro1.Items[indice],'.ini','',[rfReplaceAll]);
    cbxRegistro2.Items[indice]:= StringReplace(cbxRegistro2.Items[indice],'.ini','',[rfReplaceAll]);
    cbxExcluir.Items[indice]:= StringReplace(cbxExcluir.Items[indice],'.ini','',[rfReplaceAll]);
   end;

end;

end.
