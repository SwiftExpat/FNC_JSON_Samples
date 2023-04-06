program JsonGarageWeb;

uses
  Vcl.Forms,
  WEBLib.Forms,
  frmJsonGarageWebU in 'frmJsonGarageWebU.pas' {frmJsonGarage: TWebForm} {*.html},
  BOGarageCars in '..\BOGarageCars.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmJsonGarage, frmJsonGarage);
  Application.Run;
end.
