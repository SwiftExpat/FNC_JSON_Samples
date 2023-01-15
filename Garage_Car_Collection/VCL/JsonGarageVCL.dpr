program JsonGarageVCL;

uses
  Vcl.Forms,
  frmJsonGarageVCL in 'frmJsonGarageVCL.pas' {frmJsonGarageV},
  BOGarageCars in '..\BOGarageCars.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmJsonGarageV, frmJsonGarageV);
  Application.Run;
end.
