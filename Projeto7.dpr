program Projeto7;

uses
  Vcl.Forms,
  uConsultas in 'form\uConsultas.pas' {frmConsultas},
  uDatas in 'form\uDatas.pas' {frmDatas},
  Vcl.Themes,
  Vcl.Styles,
  uComparar in 'form\uComparar.pas' {frmComparar},
  uComparacoes in 'form\uComparacoes.pas' {frmComparacoes};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Consultar Tabela FIPE';
  TStyleManager.TrySetStyle('Turquoise Gray');
  Application.CreateForm(TfrmDatas, frmDatas);
  Application.Run;
end.
