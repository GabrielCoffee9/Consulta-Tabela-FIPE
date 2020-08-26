program Projeto7;

uses
  Vcl.Forms,
  uConsultas in 'uConsultas.pas' {frmConsultas},
  uDatas in 'uDatas.pas' {frmDatas},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Light');
  Application.CreateForm(TfrmDatas, frmDatas);
  Application.Run;
end.
