unit frmJsonGarageVCL;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.TMSFNCTypes, Vcl.TMSFNCUtils, Vcl.TMSFNCGraphics, Vcl.TMSFNCGraphicsTypes,
  Vcl.TMSFNCPageControl, Vcl.TMSFNCCustomControl, Vcl.TMSFNCTabSet, BOGarageCars, Vcl.TMSFNCTreeViewBase,
  Vcl.TMSFNCTreeViewData, Vcl.TMSFNCCustomTreeView, Vcl.TMSFNCTreeView, Vcl.TMSFNCToolBar;

type
  TfrmJsonGarageV = class(TForm)
    TMSFNCPageControl1: TTMSFNCPageControl;
    TMSFNCPageControl1Page0: TTMSFNCPageControlContainer;
    TMSFNCPageControl1Page1: TTMSFNCPageControlContainer;
    TMSFNCPageControl1Page2: TTMSFNCPageControlContainer;
    tvLive: TTMSFNCTreeView;
    tvImport: TTMSFNCTreeView;
    TMSFNCToolBar1: TTMSFNCToolBar;
    TMSFNCToolBarButton1: TTMSFNCToolBarButton;
    procedure FormCreate(Sender: TObject);
    procedure TMSFNCToolBarButton1Click(Sender: TObject);
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
  TGarage.RegisterJsonClasses;
  FGarage := TGarage.Create;
  FJson := FGarage.JSON;
  tvLive.ViewJSONFromText(FJson);
end;

procedure TfrmJsonGarageV.TMSFNCToolBarButton1Click(Sender: TObject);
var
  g: TGarage;
  FOPIORef, FOPRoot: TObject;
begin

  FOPIORef := TTMSFNCPersistence.IOReference;
  FOPRoot := TTMSFNCPersistence.RootObject;
  try
    g := TGarage.Create(false);
    TTMSFNCPersistence.IOReference := g;
    TTMSFNCPersistence.RootObject := g;

    TTMSFNCObjectPersistence.LoadObjectFromString(g, FJson);
  finally
    TTMSFNCPersistence.IOReference := FOPIORef;
    TTMSFNCPersistence.RootObject := FOPRoot;
  end;
  tvImport.ViewJSONFromText(g.JSON);

end;

end.
