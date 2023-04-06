unit frmJsonGarageWebU;

{$DEFINE WEBLIB}

interface

uses
  System.SysUtils, System.Classes, JS, Web, WEBLib.Graphics, WEBLib.Controls,
  WEBLib.Forms, WEBLib.Dialogs, VCL.TMSFNCTypes, VCL.TMSFNCUtils, VCL.TMSFNCGraphics, VCL.TMSFNCGraphicsTypes,
  VCL.TMSFNCStatusBar, VCL.TMSFNCSplitter, VCL.TMSFNCTreeViewBase, VCL.TMSFNCTreeViewData, VCL.TMSFNCCustomTreeView,
  VCL.TMSFNCTreeView, VCL.Controls, VCL.TMSFNCCustomControl, VCL.TMSFNCToolBar, BOGarageCars, VCL.StdCtrls,
  WEBLib.StdCtrls;

type
  TfrmJsonGarage = class(TWebForm)
    TMSFNCToolBar1: TTMSFNCToolBar;
    tvLive: TTMSFNCTreeView;
    TMSFNCSplitter1: TTMSFNCSplitter;
    tvImport: TTMSFNCTreeView;
    TMSFNCStatusBar1: TTMSFNCStatusBar;
    btnImport: TTMSFNCToolBarButton;
    WebMemo1: TWebMemo;
    btnCheckCylinders: TTMSFNCToolBarButton;
    procedure WebFormCreate(Sender: TObject);
    procedure WebFormResize(Sender: TObject);
    procedure btnImportClick(Sender: TObject);
    procedure btnCheckCylindersClick(Sender: TObject);
  private
    FGarage: TGarage;
    FJson: string;
    procedure LogMsg(AMessage: string);
    procedure TestCylinderLow;
    procedure TestCylinderEven;
    procedure TestCylinders;
  public
    { Public declarations }
  end;

var
  frmJsonGarage: TfrmJsonGarage;

implementation

uses WEBLib.TMSFNCPersistence;

{$R *.dfm}

procedure TfrmJsonGarage.btnCheckCylindersClick(Sender: TObject);
begin
  TestCylinderLow;
  TestCylinderEven;
  TestCylinders;
end;

procedure TfrmJsonGarage.btnImportClick(Sender: TObject);
var
  g: TGarage; // a new object to restore to
  FOPIORef, FOPRoot: TObject; // capture the references
begin
  LogMsg('Begin Json');
  LogMsg(FJson);
  LogMsg('END Json');
  // capture the refs to be able to restore after finished
  FOPIORef := TTMSFNCPersistence.IOReference; // class var needs to be restored after use
  FOPRoot := TTMSFNCPersistence.RootObject; // class var needs to be restored after use
  try
    try
      // create the new object that will be the destination for the data
      g := TGarage.Create(false); // false creates it without cars
      // IO Reference allows the framework to ask your object to create the destination classes
      TTMSFNCPersistence.IOReference := g; // set the IO Reference
      TTMSFNCPersistence.RootObject := g; // set the Root Object
      // Load the new object with a copy of the original object
      TTMSFNCObjectPersistence.LoadObjectFromString(g, FJson);
    except
      on E: Exception do
        LogMsg('Load Exception ex:' + E.Message);
      else
        LogMsg('Load Exception js:' + String(JS.JSExceptValue));
    end;

  finally
    TTMSFNCPersistence.IOReference := FOPIORef; // restore
    TTMSFNCPersistence.RootObject := FOPRoot; // restore
  end;
  try
    tvImport.ViewJSONFromText(g.JSON); // load the tree to view the JSON
  except
    on E: Exception do
      LogMsg('Import Exception ex:' + E.Message);
    else
      LogMsg('Import Exception js:' + String(JS.JSExceptValue));
  end;
end;

procedure TfrmJsonGarage.LogMsg(AMessage: string);
begin
  WebMemo1.Lines.Add(AMessage);
end;

procedure TfrmJsonGarage.TestCylinderEven;
var
  cyl, restore: TEvenCylinder;
  JSON: string;
begin
  TGarage.RegisterJsonClasses;
  cyl := TEvenCylinder.Create;
  restore := TEvenCylinder.Create;
  try
    try
      cyl.CylinderNumber := 5;
      cyl.Fired := true;
      JSON := TTMSFNCObjectPersistence.SaveObjectToString(cyl);
      TTMSFNCObjectPersistence.LoadObjectFromString(restore, JSON);
      if cyl.CylinderNumber = restore.CylinderNumber then
        LogMsg('check number');
      // added to debug boolean
      if restore.Fired then
        Console.log('restore has been fired')
      else
        Console.log('restore ready to fire');
      // fails true <> 1
      if (cyl.Fired = restore.Fired) then
        LogMsg('check fired eq is true');
      // this works and the 2 booleans
      if (cyl.Fired) and (restore.Fired) then
        LogMsg('check fired and is true');
    except
      on E: Exception do
        Console.log('Failure in Cyl Low e:' + E.Message)
      else
        Console.log('Failure in Cyl Low js:' + String(JS.JSExceptValue))
    end;
  finally
    cyl.Free;
    restore.Free;
  end;

end;

procedure TfrmJsonGarage.TestCylinderLow;
var
  cyl, restore: TOddCylinder;
  JSON: string;
begin
  TGarage.RegisterJsonClasses;
  cyl := TOddCylinder.Create;
  restore := TOddCylinder.Create;
  try
    try
      cyl.CylinderNumber := 5;
      cyl.Fired := true;
      JSON := TTMSFNCObjectPersistence.SaveObjectToString(cyl);
      TTMSFNCObjectPersistence.LoadObjectFromString(restore, JSON);
      if cyl.CylinderNumber = restore.CylinderNumber then
        LogMsg('check number');
      // added to debug boolean
      if restore.Fired then
        Console.log('restore has been fired')
      else
        Console.log('restore ready to fire');
      // fails true <> 1
      if (cyl.Fired = restore.Fired) then
        LogMsg('check fired eq is true');
      // this works and the 2 booleans
      if (cyl.Fired) and (restore.Fired) then
        LogMsg('check fired and is true');
    except
      on E: Exception do
        Console.log('Failure in Cyl Low e:' + E.Message)
      else
        Console.log('Failure in Cyl Low js:' + String(JS.JSExceptValue))
    end;
  finally
    cyl.Free;
    restore.Free;
  end;

end;

procedure TfrmJsonGarage.TestCylinders;
var
  aCylEven, bCylEven: TEvenCylinder;
  //aCylOdd, bCylOdd: TOddCylinder;
  sae, sbe:  string;//, sao, sbo: string;
begin
  TGarage.RegisterJsonClasses;
  aCylEven := TEvenCylinder.Create;
  //aCylOdd := TOddCylinder.Create;
  bCylEven := TEvenCylinder.Create;
  //bCylOdd := TOddCylinder.Create;
  // set some data
  aCylEven.CylinderNumber := 3;
  aCylEven.Fired := true;
  sae := 'clear';
  sbe := 'restore';
  try
    Console.log('Begin Export JSON' + sae);
    sae := TTMSFNCObjectPersistence.SaveObjectToString(aCylEven);
    Console.log('Exported JSON' + sae);
    TTMSFNCObjectPersistence.LoadObjectFromString(bCylEven, sae);
    Console.log('Loaded JSON success');
    sbe := TTMSFNCObjectPersistence.SaveObjectToString(bCylEven);
  except
    on E: Exception do
      Console.log('CopyCylinder failed e=' + E.Message)
    else
      Console.log('CopyCylinder failed js=' + String(JS.JSExceptValue))
  end;
  if sae.Length = sbe.Length then
    LogMsg('Same length');
  aCylEven.CylinderNumber := 6;
  aCylEven.Fired := true;

end;

procedure TfrmJsonGarage.WebFormCreate(Sender: TObject);
begin
  // register the persistent classes
  TGarage.RegisterJsonClasses;
  // Create the Garage that will be the source
  FGarage := TGarage.Create;
  FJson := FGarage.JSON;
  tvLive.ViewJSONFromText(FJson);
end;

procedure TfrmJsonGarage.WebFormResize(Sender: TObject);
begin
  tvLive.Width := Round(self.Width / 2);
end;

end.
