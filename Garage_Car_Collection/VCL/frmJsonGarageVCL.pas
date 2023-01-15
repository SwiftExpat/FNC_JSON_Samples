unit frmJsonGarageVCL;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.TMSFNCTypes, Vcl.TMSFNCUtils, Vcl.TMSFNCGraphics, Vcl.TMSFNCGraphicsTypes,
  Vcl.TMSFNCPageControl, Vcl.TMSFNCCustomControl, Vcl.TMSFNCTabSet, BOGarageCars, Vcl.TMSFNCTreeViewBase,
  Vcl.TMSFNCTreeViewData, Vcl.TMSFNCCustomTreeView, Vcl.TMSFNCTreeView, Vcl.TMSFNCToolBar, Vcl.TMSFNCSplitter;

type
  TfrmJsonGarageV = class(TForm)
    tvLive: TTMSFNCTreeView;
    tvImport: TTMSFNCTreeView;
    TMSFNCToolBar1: TTMSFNCToolBar;
    btnImport: TTMSFNCToolBarButton;
    TMSFNCSplitter1: TTMSFNCSplitter;
    procedure FormCreate(Sender: TObject);
    procedure btnImportClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    FGarage: TGarage;
    FJson: string;
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
    g := TGarage.Create(false); // false creates it without cars
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

end.
