## Compiler Optimization - Generics and FNC JSON

When using generics, the PAS2JS compiler can optimize too agressively and produce errors in release mode. Optimization is controlled by the setting, 'Enable Optimization', in the compile options; default in release mode is true. Here is an approach to ensure that the PAS2JS compiler does not optimize when using FNC JSON for serialization.

**Note** : Since this only occurs in release mode you should evaluate any unit tests and ensure they are run in release mode with optimization.

Watch the [webinar replay](https://youtu.be/sQ46wSnHCn8) were Bruno and I touched on this topic and before I forget it is a good time to document how to identify the error and fix the code..

Source code for this article can be found on [GitHub](https://github.com/SwiftExpat/FNC_JSON_Samples).

In the [previous blog](https://www.tmssoftware.com/site/blog.asp?post=1050) I created a VCL example on how to serialize a TObjectDictionary and TObjectList using FNC JSON. Here I will explain the code necessary to prevent the optimizer in WebCore.

# Catch the Error

This error is caught from javascript: ***TypeError t.GetKeys is not a function***. To catch this error the exception block needs to handle the else condition as demonstrated here:

```pascal
  try
    JsonSrc := FGarage.JSON; // Class helper to TTMSFNCObjectPersistence.SaveObjectToString(FGarage);
  except
    on E: Exception do
      Console.log('Dict save failed');
    else //will get caught here 
      Console.log('Dict save failed - js:' + String(js.JSExceptValue));
  end;
```

**Debug the problem**  The first debug step for this situation is to turn off optimization. 

# Fix the Code

FNC JSON is looking for a GetItemClass method on both the TObjectList and TObjectDictionary and it happens to be a natural place to include the fix. The fix works by declaring a variable of the same class type that will be returned which makes the code easy to review later. 

## TObjectDictionary Fix

In an object dictionary the location to include the fix is here:

### Declaration

```pascal
  TCarList = class(TObjectDictionary<string, TCar>, ITMSFNCBaseListIO)
  private
    FOwnerInterface: IInterface;
  protected
    function GetItemClass: TClass; // Optimization fix goes in here
    function _AddRef: integer; {$IFNDEF WEBLIB} stdcall; {$ENDIF}
    function _Release: integer; {$IFNDEF WEBLIB} stdcall; {$ENDIF}
  public
    function QueryInterface(const IID: TGUID; out Obj): HResult; virtual; {$IFNDEF WEBLIB} stdcall; {$ENDIF}
  end;
```

### Implementation

The fix code works by including a block that will not get executed due to the boolean comparison of 1 < 0. Inside the block a call is made to the keys and items collections.  The last 2 statements are included to prevent compiler warning of variable assigned but not used.

```pascal
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
```

## TObjectList Fix

In an object list the location to include the fix is here:

### Declaration

this method will

```pascal
  TCylinderList = class(TObjectList<TCylinder>, ITMSFNCBaseListIO)
  private
    FOwnerInterface: IInterface;
  protected
    function GetItemClass: TClass; // Optimization fix goes in here
    function _AddRef: integer; {$IFNDEF WEBLIB} stdcall; {$ENDIF}
    function _Release: integer; {$IFNDEF WEBLIB} stdcall; {$ENDIF}
  public
    function QueryInterface(const IID: TGUID; out Obj): HResult; virtual; {$IFNDEF WEBLIB} stdcall; {$ENDIF}
  end;
```

### Implementation

Again, the fix code works by including a block that will not get executed due to the boolean comparison of 1 < 0. Here the assignment of cyl to Item[0] is sufficient and it is not important that the result might be nil, the code will never execute.

```pascal
function TCylinderList.GetItemClass: TClass;
var
  cyl: TCylinder;  // variable is of type that will be returned
begin
  if 1 < 0 then // compiler determines this to be valid will not optimize
    cyl := self.Items[0];
  result := TCylinder;
end;
```
