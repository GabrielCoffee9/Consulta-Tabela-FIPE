unit uComparar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, System.IOUtils;

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
    ComboBox1: TComboBox;
    lblSelecione: TLabel;
    Button1: TButton;
    btnVoltarDaExclusao: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnTransicaoParaExclusaoClick(Sender: TObject);
    procedure btnVoltarDaExclusaoClick(Sender: TObject);
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


procedure TfrmComparacao.btnTransicaoParaExclusaoClick(Sender: TObject);
begin
  frmComparacao.ClientHeight := 214;
  frmComparacao.ClientWidth  := 346;
  pnExcluir.BringToFront;
  frmComparacao.Hide;
  frmComparacao.Position     := poScreenCenter;
  frmComparacao.Show;
end;

procedure TfrmComparacao.btnVoltarDaExclusaoClick(Sender: TObject);
begin
  frmComparacao.ClientHeight := 310;
  frmComparacao.ClientWidth  := 370;
  pnCompararPrincipal.BringToFront;
end;

procedure TfrmComparacao.FormCreate(Sender: TObject);
var
indice: integer;
begin
  listarArquivos;
 for indice := 0 to cbxRegistro1.Items.Count -1 do
   begin
   cbxRegistro1.Items[indice]:= StringReplace(cbxRegistro1.Items[indice],'.ini','',[rfReplaceAll]);
   cbxRegistro2.Items[indice]:= StringReplace(cbxRegistro2.Items[indice],'.ini','',[rfReplaceAll]);
   end;

end;

procedure TfrmComparacao.listarArquivos;
var
  SR: TSearchRec;
  I: integer;
begin
   cbxRegistro1.Items.Clear;
   cbxRegistro2.Items.Clear;
  I := FindFirst(Tpath.GetDocumentsPath+'\ConsultaFIPE\'+'*.ini', faAnyFile, SR);
  while I = 0 do
  begin
    cbxRegistro1.Items.Add(sr.Name);
    cbxRegistro2.Items.Add(sr.Name);
    I := FindNext(SR);
  end;
end;

end.
