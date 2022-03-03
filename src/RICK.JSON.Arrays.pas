unit RICK.JSON.Arrays;

{$IF DEFINED(FPC)}
  {$MODE DELPHI}{$H+}
{$ENDIF}

interface

uses
  {$IF DEFINED(FPC)}
    fpjson,
  {$ELSE}
    System.JSON,
  {$ENDIF}
    RICK.JSON.interfaces;
type

  { TRICKJSONArray }

  TRICKJSONArray = class(TInterfacedObject, iRICKJSONArray)
  private
    {$IFNDEF FPC}
    [weak]
    {$ENDIF}
    FParent: iRICKJSON;
  protected
    function &End: iRICKJSON;

  public
    class function New: iRICKJSONArray; overload;
    class function New(AValue: iRICKJSON): iRICKJSONArray; overload;
    constructor Create; overload;
    constructor Create(AValue: iRICKJSON); overload;
    destructor Destroy; override;
  end;
implementation

{ TRICKJSONArray }

constructor TRICKJSONArray.Create;
begin

end;

constructor TRICKJSONArray.Create(AValue: iRICKJSON);
begin
  FParent:= AValue;
end;

function TRICKJSONArray.&End: iRICKJSON;
begin
  Result:= FParent;
end;

class function TRICKJSONArray.New: iRICKJSONArray;
begin
  Result:= Self.Create;
end;

class function TRICKJSONArray.New(AValue: iRICKJSON): iRICKJSONArray;
begin
  Result:= Self.Create(AValue);
end;

destructor TRICKJSONArray.Destroy;
begin
  inherited Destroy;
end;

end.

