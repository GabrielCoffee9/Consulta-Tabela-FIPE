unit uComparar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, System.IOUtils,
  Vcl.Buttons, Vcl.ComCtrls, IniFiles, uComparacoes;

type
  TfrmComparar = class(TForm)
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
    btnCompararFechar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnTransicaoParaExclusaoClick(Sender: TObject);
    procedure btnVoltarDaExclusaoClick(Sender: TObject);
    procedure btnTenhoCertezaClick(Sender: TObject);
    procedure mostrarArquivos;
    procedure btnSelecionarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCompararFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
  procedure listarArquivos;
  end;

var
  frmComparar: TfrmComparar;
  teste :Tstringlist;
  registroExiste: integer;

implementation

{$R *.dfm}

{ TfrmComparacao }


procedure TfrmComparar.btnCompararFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmComparar.btnSelecionarClick(Sender: TObject);

begin
  frmComparacoes := TfrmComparacoes.Create(nil);
  if registroExiste > 1 then
  begin
  if cbxRegistro1.Text = cbxRegistro2.Text then
    begin
      ShowMessage('Você não pode comparar dois registros iguais!');
      frmComparacoes.Close;
      frmComparacoes.Free;
    end
  else
    begin
      if (cbxRegistro1.Text = '') or (cbxRegistro2.Text = '') then
      ShowMessage('Selecione os dois campos!!!')
      else
      frmComparacoes.ShowModal;
    end;
  end
  else
  begin
    ShowMessage('Quantidade de registros nula ou insuficiente para fazer Comparação');
  end;

  end;

procedure TfrmComparar.btnTenhoCertezaClick(Sender: TObject);
begin
  if cbxExcluir.Text = '' then
  ShowMessage('Selecione um registro para excluir')
  else
  begin
    deletefile(Tpath.GetDocumentsPath+'\ConsultaFIPE\'+cbxExcluir.text+'.ini');
    ShowMessage('Registro deletado com sucesso');
    mostrarArquivos;
  end;

end;

procedure TfrmComparar.btnTransicaoParaExclusaoClick(Sender: TObject);
begin
  pnExcluir.BringToFront;
  mostrarArquivos;
end;

procedure TfrmComparar.btnVoltarDaExclusaoClick(Sender: TObject);
begin
  pnCompararPrincipal.BringToFront;
  mostrarArquivos;
end;

procedure TfrmComparar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action      := caFree;
  frmComparar := nil;
end;

procedure TfrmComparar.FormCreate(Sender: TObject);
begin
  mostrarArquivos;
end;

procedure TfrmComparar.listarArquivos;
var
  SR: TSearchRec;
  I: integer;
begin
  cbxRegistro1.Items.Clear;
  cbxRegistro2.Items.Clear;
  cbxExcluir.Items.Clear;
  registroExiste:= 0;
  I := FindFirst(Tpath.GetDocumentsPath+'\ConsultaFIPE\'+'*.ini', faAnyFile, SR);
  while I = 0 do
  begin
    cbxRegistro1.Items.Add(sr.Name);
    cbxRegistro2.Items.Add(sr.Name);
    cbxExcluir.Items.Add(sr.Name);
    registroExiste:= registroExiste+1;
    I := FindNext(SR);
  end;

end;

procedure TfrmComparar.mostrarArquivos;
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
