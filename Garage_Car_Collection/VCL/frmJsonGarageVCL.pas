unit frmJsonGarageVCL;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.TMSFNCTypes, Vcl.TMSFNCUtils, Vcl.TMSFNCGraphics, Vcl.TMSFNCGraphicsTypes,
  Vcl.TMSFNCPageControl, Vcl.TMSFNCCustomControl, Vcl.TMSFNCTabSet, BOGarageCars, Vcl.TMSFNCTreeViewBase,
  Vcl.TMSFNCTreeViewData, Vcl.TMSFNCCustomTreeView, Vcl.TMSFNCTreeView, Vcl.TMSFNCToolBar, Vcl.TMSFNCSplitter,
  Vcl.StdCtrls;

type
  TfrmJsonGarageV = class(TForm)
    tvLive: TTMSFNCTreeView;
    tvImport: TTMSFNCTreeView;
    TMSFNCToolBar1: TTMSFNCToolBar;
    btnImport: TTMSFNCToolBarButton;
    TMSFNCSplitter1: TTMSFNCSplitter;
    Memo1: TMemo;
    btnBoolean: TTMSFNCToolBarButton;
    procedure FormCreate(Sender: TObject);
    procedure btnImportClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btnBooleanClick(Sender: TObject);
  private
    FGarage: TGarage;
    FJson: string;
    procedure ConLog(AMessage: string);
  public
    { Public declarations }
  end;

var
  frmJsonGarageV: TfrmJsonGarageV;

implementation

uses Vcl.TMSFNCPersistence;

{$R *.dfm}

procedure TfrmJsonGarageV.FormCreate(Sender: TObject);
begin
  // register the persistent classes
  TGarage.RegisterJsonClasses;
  // Create the Garage that will be the source
  FGarage := TGarage.Create;
  FJson := FGarage.JSON;
  tvLive.ViewJSONFromText(FJson);
end;

procedure TfrmJsonGarageV.FormResize(Sender: TObject);
begin
  tvLive.Width := Round(self.Width / 2);
end;

procedure TfrmJsonGarageV.btnBooleanClick(Sender: TObject);
var
  cyl, restore: TCylinder;
  JSON: string;
  FTestResult, val, refTrue, refFalse: boolean;
begin
  cyl := TCylinder.Create;
  restore := TCylinder.Create;
  try
    FTestResult := False;
    try
      cyl.CylinderNumber := 5;
      cyl.Fired := true;
      JSON := TTMSFNCObjectPersistence.SaveObjectToString(cyl);
      TTMSFNCObjectPersistence.LoadObjectFromString(restore, JSON);

      val := restore.Fired;
      refTrue := true;
      refFalse := False;

      if restore.Fired then // eval against variant?? intrinsic?
        ConLog('restore has been fired - If Boolean eval??')
      else
        ConLog('restore ready to fire - If Boolean eval ??');

      if val then // experiment to simulate some normal code reference
        ConLog('Pass : val = true, has been fired')
      else
        ConLog('restore ready to fire');

      if (restore.Fired = cyl.Fired) then // should pass, it has just been restored
        ConLog('Pass : restore.Fired = cyl.Fired evals to true  - compare to CylFired')
      else
        ConLog('!! Fail : restore.Fired <> cyl.Fired evals to false  - compare to CylFired ');

      if (val = refTrue) then // experiment - no value
        ConLog('Pass : val = true evals to true  - compare to CylFired')
      else
        ConLog('!! Fail : val <> true evals to false');

      // confirm it does not evaulate to true
      if (restore.Fired = true) then
        ConLog('Pass : restore.Fired = true evals to true - compare to true')
      else
        ConLog('!! Fail : restore.Fired <> true evals to false - compare to true');

      { above we have confirmed fired <> true, being a boolean it should eval to false }
      if (restore.Fired = False) then
        ConLog('Pass : Fired = false evals to true')
      else
        ConLog('!! Fail : Fired = false evals to false, above compared to true');

      if (val = refFalse) then // should eval true, above confirmed to not be true
        ConLog('Pass : val = false evals to true')
      else
        ConLog('!! Fail : val <> false evals to false');

      FTestResult := restore.Fired;

    except
      on E: Exception do
        ConLog('Failure in CylinderFive Low e:' + E.Message)
      else
        ConLog('Failure in CylinderFive Low js:')
    end;

    if FTestResult then
      ConLog('Test Completion Status');
  finally
    cyl.Free;
    restore.Free;
  end;

end;

procedure TfrmJsonGarageV.btnImportClick(Sender: TObject);
var
  g: TGarage; // a new object to restore to
  FOPIORef, FOPRoot: TObject; // capture the references
begin
  // capture the refs to be able to restore after finished
  FOPIORef := TTMSFNCPersistence.IOReference; // class var needs to be restored after use
  FOPRoot := TTMSFNCPersistence.RootObject; // class var needs to be restored after use
  try
    // create the new object that will be the destination for the data
    g := TGarage.Create(False); // false creates it without cars
    // IO Reference allows the framework to ask your object to create the destination classes
    TTMSFNCPersistence.IOReference := g; // set the IO Reference
    TTMSFNCPersistence.RootObject := g; // set the Root Object
    // Load the new object with a copy of the original object
    TTMSFNCObjectPersistence.LoadObjectFromString(g, FJson);
  finally
    TTMSFNCPersistence.IOReference := FOPIORef; // restore
    TTMSFNCPersistence.RootObject := FOPRoot; // restore
  end;
  tvImport.ViewJSONFromText(g.JSON); // load the tree to view the JSON
end;

procedure TfrmJsonGarageV.ConLog(AMessage: string);
begin
  Memo1.Lines.Add(AMessage)
end;

end.
