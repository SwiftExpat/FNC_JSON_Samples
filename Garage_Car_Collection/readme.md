# JSON GARAGE

This sample demonstrates how to use TMS FNC Core JSON to deal with generic collections and restoring using the interfaces that are recognized by FNC JSON. Currently the garage holds 2 types of cars, TGasolineCar and TElectricCar both are **class(TCar)** and the collection is defined as TObjectDictionary<string, TCar> to allow all cars to be added to the garage.

# Explaination

## Root Object - TGarage Implements ITMSFNCBasePersistenceIO

```pascal
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
```

Your root object needs to implement ITMSFNCBasePersistenceIO, this will allow your object to create the correct class type on restore using the function, CreateObject.  The list that holds the cars is covered next.

## Generic List - TCarList Implements ITMSFNCBaseListIO

```pascal
  TCarList = class(TObjectDictionary<string, TCar>, ITMSFNCBaseListIO)
  private
    FOwnerInterface: IInterface;
  protected
    function GetItemClass: TClass;
    function _AddRef: integer; stdcall;
    function _Release: integer; stdcall;
  public
    function QueryInterface(const IID: TGUID; out Obj): HResult; virtual; stdcall;
  end;
```

Implementing the ITMSFNCBaseListIO allows the framework to query the base type of the item class in the list, this will be passed back to CreateObject in the Root Object class.

Execution

The form create event is used to create a TGarage and load some cars, then display it in an FNCTree so that you can compare the values.

Export Object to JSON

FNC has a object help to expose a JSON property, so here the JSON is captured to a string variable

```pascal
  FJson := FGarage.JSON;
```
