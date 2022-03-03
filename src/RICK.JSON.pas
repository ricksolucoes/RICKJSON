unit RICK.JSON;

{$IF DEFINED(FPC)}
  {$MODE DELPHI}{$H+}
{$ENDIF}

interface
uses
  {$IF DEFINED(FPC)}
    SysUtils,
  {$ELSE}
    System.JSON,
  {$ENDIF}
  RICK.JSON.Arrays,
  RICK.JSON.Objects,
  RICK.JSON.Interfaces;
type

  { TRICKJSON }

  TRICKJSON = class(TInterfacedObject, iRICKJSON)
  private
    {$IFNDEF FPC}
    FObject  : iRICKJSONObject;
    FArray   : iRICKJSONArray;
    {$ENDIF}
  protected
    function Objects : iRICKJSONObject;
    function Arrays  : iRICKJSONArray;

  public
    class function New: iRICKJSON;
    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TRICKJSON }

constructor TRICKJSON.Create;
begin

end;

function TRICKJSON.Objects: iRICKJSONObject;
begin
{$IF DEFINED(FPC)}
  Result:=    TRICKJSONObject.New(Self);
{$ELSE}
  if not Assigned(FObject) then
    FObject:= TRICKJSONObject.New(Self);
  Result:= FObject;
{$ENDIF}
end;

function TRICKJSON.Arrays: iRICKJSONArray;
begin
{$IF DEFINED(FPC)}
  Result:= TRICKJSONArray.New(Self);
{$ELSE}
  if not Assigned(FArray) then
    FArray:= TRICKJSONArray.New(Self);
  Result:= FArray;
{$ENDIF}
end;

class function TRICKJSON.New: iRICKJSON;
begin
  Result:= Self.Create;
end;

destructor TRICKJSON.Destroy;
begin
  inherited Destroy;
end;

end.
