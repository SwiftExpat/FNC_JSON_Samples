unit BOGarageCars;

interface

uses System.Classes, Generics.Collections,
{$IFDEF WEBLIB}
  WebLib.TMSFNCJSONReader, WebLib.TMSFNCPersistence;
{$ELSE}
VCL.TMSFNCJSONReader, VCL.TMSFNCPersistence;
{$ENDIF}

type

  TCar = class abstract(TPersistent)
  strict private
    FMaker: string;
    FModel: string;
    FID: TGUID;
    function IDRead: String;
    procedure IDWrite(const Value: String);
  public
    constructor Create(const AMaker, AModel: string);
    destructor Destroy; override;
  published
    property Maker: string read FMaker write FMaker;
    property Model: string read FModel write FModel;
    property ID: String read IDRead write IDWrite;
  end;

  TCylinder = class abstract(TPersistent)
  strict private
    FCylinderNumber: integer;
    FFired: boolean;
  published
    property CylinderNumber: integer read FCylinderNumber write FCylinderNumber;
    property Fired: boolean read FFired write FFired;
  end;

  TEvenCylinder = class(TCylinder);
  TOddCylinder = class(TCylinder);

  TCylinderList = class(TObjectList<TCylinder>, ITMSFNCBaseListIO)
  private
    FOwnerInterface: IInterface;
  protected
    function GetItemClass: TClass;
    function _AddRef: integer; {$IFNDEF WEBLIB} stdcall; {$ENDIF}
    function _Release: integer; {$IFNDEF WEBLIB} stdcall; {$ENDIF}
  public
    function QueryInterface(const IID: TGUID; out Obj): HResult; virtual; {$IFNDEF WEBLIB} stdcall; {$ENDIF}
  end;

  TGasolineCar = class(TCar)
  private
    FCylinderList: TCylinderList;
  public
    constructor Create(const AMaker, AModel: string; const ACylinderCount: integer);
  published
    property CylinderList: TCylinderList read FCylinderList write FCylinderList;
  end;

  TElectricCar = class(TCar)
  private
    FKW: integer;
  public
    constructor Create(const AMaker, AModel: string; const AKW: integer);
  published
    property KW: integer read FKW write FKW;
  end;

  TCarList = class(TObjectDictionary<string, TCar>, ITMSFNCBaseListIO)
  private
    FOwnerInterface: IInterface;
  protected
    function GetItemClass: TClass;
    function _AddRef: integer; {$IFNDEF WEBLIB} stdcall; {$ENDIF}
    function _Release: integer; {$IFNDEF WEBLIB} stdcall; {$ENDIF}
  public
    function QueryInterface(const IID: TGUID; out Obj): HResult; virtual; {$IFNDEF WEBLIB} stdcall; {$ENDIF}
  end;

  TGarage = class(TInterfacedPersistent, ITMSFNCBasePersistenceIO)
  strict private
    FCarList: TCarList;
    FName: string;
    procedure LoadCars;
  protected
    function CreateObject(const AClassName: string; const ABaseClass: TClass): TObject;
  public
    constructor Create(ALoadCars: boolean = true);
    destructor Destroy; override;
    class procedure RegisterJsonClasses;
  published
    property Name: string read FName write FName;
    property CarList: TCarList read FCarList;
  end;

implementation

uses
{$IFDEF WEBLIB}
  WebLib.TMSFNCUtils,
{$ELSE}
  VCL.TMSFNCUtils,
{$ENDIF}
  System.DateUtils, System.SysUtils;

{ TGarage }

constructor TGarage.Create(ALoadCars: boolean = true);
begin
  FName := 'Jason''s Garage';
  FCarList := TCarList.Create([DoOwnsValues]);
  if ALoadCars then
    LoadCars;
end;

function TGarage.CreateObject(const AClassName: string; const ABaseClass: TClass): TObject;
begin
  result := nil;
  if AClassName = 'TElectricCar' then
    result := TElectricCar.Create('co - electric', 'json load', 0);
  if AClassName = 'TGasolineCar' then
    result := TGasolineCar.Create('co - gasoline', 'json load', 0);
  if AClassName = 'TEvenCylinder' then
    result := TEvenCylinder.Create();
  if AClassName = 'TOddCylinder' then
    result := TOddCylinder.Create();
end;

destructor TGarage.Destroy;
begin
  FCarList.Free;
  inherited;
end;

procedure TGarage.LoadCars;
var
  // g: TGasolineCar;
  // e: TElectricCar;
  c: TCar;
begin
  c := TGasolineCar.Create('Chevrolet', 'El Camino', 8);
  FCarList.Add(c.ID, c);

  c := TElectricCar.Create('General Motors', 'EV1', 102);
  FCarList.Add(c.ID, c);
end;

class procedure TGarage.RegisterJsonClasses;
begin
  RegisterClass(TCar);
  RegisterClass(TGasolineCar);
  RegisterClass(TElectricCar);
  RegisterClass(TCylinder);
  RegisterClass(TGarage);
end;

{ TCar }

constructor TCar.Create(const AMaker, AModel: string);
begin
  FMaker := AMaker;
  FModel := AModel;
  CreateGuid(FID);
end;

destructor TCar.Destroy;
begin
  inherited;
end;

function TCar.IDRead: String;
begin
  result := FID.ToString;
end;

procedure TCar.IDWrite(const Value: String);
begin
  FID := StringToGuid(Value);
end;

{ TGasolineCar }

constructor TGasolineCar.Create(const AMaker, AModel: string; const ACylinderCount: integer);
var
  i: integer;
  cyl: TCylinder;
begin
  inherited Create(AMaker, AModel);
  FCylinderList := TCylinderList.Create(true);
  for i := 1 to ACylinderCount do
  begin
    if (i mod 2) = 0 then
      cyl := TEvenCylinder.Create
    else
      cyl := TOddCylinder.Create;
    cyl.CylinderNumber := i;
    cyl.Fired := true;
    FCylinderList.Add(cyl);
  end;
end;

{ TElectricCar }

constructor TElectricCar.Create(const AMaker, AModel: string; const AKW: integer);
begin
  inherited Create(AMaker, AModel);
  FKW := AKW;
end;

{ TCylinderList }

function TCylinderList.GetItemClass: TClass;
var
  cyl: TCylinder;  // variable is of type that will be returned
begin
  if 1 < 0 then // compiler determines this to be valid will not optimize
    cyl := self.Items[0];
  result := TCylinder;
end;

function TCylinderList.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  if GetInterface(IID, Obj) then
    result := 0
  else
    result := E_NOINTERFACE;
end;

function TCylinderList._AddRef: integer;
begin
  if FOwnerInterface <> nil then
    result := FOwnerInterface._AddRef
  else
    result := -1;
end;

function TCylinderList._Release: integer;
begin
  if FOwnerInterface <> nil then
    result := FOwnerInterface._Release
  else
    result := -1;
end;

{ TCarList }

function TCarList.GetItemClass: TClass;
var
  c: TCar; // variable is of type that will be returned
  s: String; // variable for itterator
begin
  if 1 < 0 then // compiler determines this to be valid - will not optimize
  begin
    for s in self.Keys do // call to keys on generic
      c := Items[s];
    s := ''; // avoid warning variable not used
    c := nil; // avoid warning variable not used
  end;
  result := TCar;
end;

function TCarList.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  if GetInterface(IID, Obj) then
    result := 0
  else
    result := E_NOINTERFACE;
end;

function TCarList._AddRef: integer;
begin
  if FOwnerInterface <> nil then
    result := FOwnerInterface._AddRef
  else
    result := -1;
end;

function TCarList._Release: integer;
begin
  if FOwnerInterface <> nil then
    result := FOwnerInterface._Release
  else
    result := -1;
end;

end.
