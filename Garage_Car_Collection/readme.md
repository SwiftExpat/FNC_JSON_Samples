# JSON GARAGE

This sample demonstrates how to use TMS FNC Core JSON to deal with generic collections and restoring using the interfaces that are recognized by FNC JSON. Currently the garage holds 2 types of cars, TGasolineCar and TElectricCar both are **class(TCar)** and the collection is defined as TObjectDictionary<string, TCar> to allow all cars to be added to the garage.

The sample is for you to set debug break points to be able to trace the execuction, notes are included in the code where I felt clarification was needed.

Reference from TMS is here: https://www.tmssoftware.com/site/blog.asp?post=971

The article above lacks abstract and derived classes, so in this code I have implemented abstract and derived to allow you to set breakpoints and examine where the calls to CreateObject.

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

# Execution

The form create event is used to create a TGarage and load some cars, then display it in an FNCTree so that you can compare the values.

## Export Object to JSON

FNC has a object help to expose a JSON property, so here the JSON is captured to a string variable

```pascal
  FJson := FGarage.JSON;
```

## Import Object from JSON

Since this object requires types, there is a little more code here. **Capture and RESTORE the IO and root refrences when you Load your object.** These are class var for the TTMSFNCPersistence class so you are assigning them and must restore, just use a try finally block.

```pascal
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

```
