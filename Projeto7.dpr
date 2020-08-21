program Projeto7;

uses
  Vcl.Forms,
  uConsultas in 'uConsultas.pas' {frmConsultas},
  uDatas in 'uDatas.pas' {frmDatas};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmDatas, frmDatas);
  Application.Run;
end.
