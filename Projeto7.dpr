program Projeto7;

uses
  Vcl.Forms,
  uConsultas in 'form\uConsultas.pas' {frmConsultas},
  uDatas in 'form\uDatas.pas' {frmDatas},
  Vcl.Themes,
  Vcl.Styles,
  uComparar in 'form\uComparar.pas' {frmComparacao},
  uComparacoes in 'form\uComparacoes.pas' {frmComparacoes};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Turquoise Gray');
  Application.CreateForm(TfrmDatas, frmDatas);
  Application.Run;
end.
