unit RICK.JSON.Objects;

{$IF DEFINED(FPC)}
  {$MODE DELPHI}{$H+}
{$ENDIF}

interface

uses
  {$IF DEFINED(FPC)}
    SysUtils,
    fpjson,
    variants,
  {$ELSE}
    REST.JSON,
    System.JSON,
    System.SysUtils,
  {$ENDIF}
    RICK.JSON.interfaces;

type

  { TRICKJSONObject }

  TRICKJSONObject = class(TInterfacedObject, iRICKJSONObject)
  private
  
    {$IFNDEF FPC} 
    [weak] 
    {$ENDIF}
    FParent: iRICKJSON;
    FJSONObject: TJSONObject;
  {$IF DEFINED(FPC)}
    FData: TJSONData;
  {$Else}
    FData: TJSonValue;
  {$ENDIF}

  protected

  {$IF DEFINED(FPC)}
    function Add(const AName: TJSONStringType; AValue: TJSONData): iRICKJSONObject; overload;
    function Add(const AName: TJSONStringType; AValue: boolean): iRICKJSONObject; overload;
    function Add(const AName: TJSONStringType; AValue: TJSONFloat): iRICKJSONObject; overload;
    function Add(const AName, AValue: TJSONStringType): iRICKJSONObject; overload;
    {$IFNDEF PAS2JS}
    function Add(const AName: string; AValue: TJSONUnicodeStringType): iRICKJSONObject;
      overload;
    function Add(const AName: TJSONStringType; Avalue: int64): iRICKJSONObject; overload;
    function Add(const AName: TJSONStringType; Avalue: QWord): iRICKJSONObject; overload;
    {$ELSE}
    function Add(const AName: TJSONStringType; Avalue: NativeInt): iRICKJSONObject; overload;
    {$ENDIF}
    function Add(const AName: TJSONStringType; Avalue: integer): iRICKJSONObject; overload;
    function Add(const AName: TJSONStringType): iRICKJSONObject; overload;
    function Add(const AName: TJSONStringType; AValue: TJSONArray): iRICKJSONObject; overload;
  {$ELSE}
    function Add(const AName: string): iRICKJSONObject; overload;
    function Add(const AName: string; AValue: string): iRICKJSONObject; overload;
    function Add(const AName: string; AValue: boolean): iRICKJSONObject; overload;
    function Add(const AName: string; AValue: Float32): iRICKJSONObject; overload;
    function Add(const AName: string; AValue: Double): iRICKJSONObject; overload;
    function Add(const AName: string; Avalue: int64): iRICKJSONObject; overload;
    function Add(const AName: string; Avalue: integer): iRICKJSONObject; overload;
    function Add(const AName: string; AValue: TJSONArray): iRICKJSONObject; overload;
    function Add(const AName: string; AValue: TJSONObject): iRICKJSONObject; overload;

  {$ENDIF}

    function ParseJson(AJSONString: string): iRICKJSONObject;

    function GetField(AField: string): string; overload;
    function GetField(const AField: string; ADefault: double): double; overload;
    function GetField(const AField: string; ADefault: integer): integer; overload;
    function GetField(const AField: string; ADefault: boolean): boolean; overload;
  {$IF DEFINED(FPC)}
    {$IFNDEF PAS2JS}
    function GetField(const AField: string; ADefault: int64): int64; overload;
    function GetField(const AField: string; ADefault: QWord): QWord; overload;
    function GetField(const AField: string;
      ADefault: TJSONUnicodeStringType): TJSONUnicodeStringType; overload;
    {$ENDIF}
    function GetField(const AField: string;
      ADefault: TJSONStringType): TJSONStringType; overload;
  {$ELSE}
    function GetField(AField: string; ADefault: string): string; overload;

  {$ENDIF}
    function GetField(const AField: string; ADefault: TJSONArray): TJSONArray;
      overload;
    function GetField(const AField: string; ADefault: TJSONObject): TJSONObject;
      overload;

    function GetFieldArray(AField: string; AIndex: integer): string; overload;
    function GetFieldArray(const AField: string; AIndex: integer;
      ADefault: double): double; overload;
    function GetFieldArray(const AField: string; AIndex: integer;
      ADefault: integer): integer; overload;
  {$IF DEFINED(FPC)}
    {$IFNDEF PAS2JS}
    function GetFieldArray(const AField: string; AIndex: integer;
      ADefault: int64): int64; overload;
    function GetFieldArray(const AField: string; AIndex: integer;
      ADefault: QWord): QWord; overload;
    function GetFieldArray(const AField: string; AIndex: integer;
      ADefault: TJSONUnicodeStringType): TJSONUnicodeStringType; overload;
    {$ENDIF}
  {$ELSE}

  {$ENDIF}
    function GetFieldArray(const AField: string; AIndex: integer;
      ADefault: boolean): boolean; overload;
  {$IF DEFINED(FPC)}
    function GetFieldArray(const AField: string; AIndex: integer;
      ADefault: TJSONStringType): TJSONStringType; overload;
  {$ENDIF}

    function SetField(const AField: string; ADefault: double): iRICKJSONObject; overload;
    function SetField(const AField: string; ADefault: integer): iRICKJSONObject; overload;
  {$IF DEFINED(FPC)}
    {$IFNDEF PAS2JS}
    function SetField(const AField: string; ADefault: int64): iRICKJSONObject; overload;
    function SetField(const AField: string; ADefault: QWord): iRICKJSONObject; overload;
    function SetField(const AField: string; ADefault: string): iRICKJSONObject; overload;
    {$ENDIF}
  {$ELSE}
    function SetField(const AField: string; ADefault: string): iRICKJSONObject; overload;

  {$ENDIF}
    function SetField(const AField: string; ADefault: boolean): iRICKJSONObject; overload;

    function ToJson: string;
  {$IFNDEF FPC }
    function ToStrings: string;
    function ToJsonFormmater: string;
  {$ENDIF}

  function GetTryField(AField: string): string; overload;

  function GetTryFieldArray(AField: string; AIndex: integer): string; overload;
  function GetTryFieldArray(const AField: string; AIndex: integer;
    ADefault: double): double; overload;
  function GetTryFieldArray(const AField: string; AIndex: integer;
    ADefault: integer): integer; overload;
{$IF DEFINED(FPC)}
  {$IFNDEF PAS2JS}
  function GetTryFieldArray(const AField: string; AIndex: integer;
    ADefault: int64): int64; overload;
  function GetTryFieldArray(const AField: string; AIndex: integer;
    ADefault: QWord): QWord; overload;
  function GetTryFieldArray(const AField: string; AIndex: integer;
    ADefault: TJSONUnicodeStringType): TJSONUnicodeStringType; overload;
  {$ENDIF}
{$ELSE}

{$ENDIF}
  function GetTryFieldArray(const AField: string; AIndex: integer;
    ADefault: boolean): boolean; overload;
{$IF DEFINED(FPC)}
  function GetTryFieldArray(const AField: string; AIndex: integer;
    ADefault: TJSONStringType): TJSONStringType; overload;
{$ENDIF}

  function &End: iRICKJSON;

  public
    class function New: iRICKJSONObject; overload;
    class function New(AValue: iRICKJSON): iRICKJSONObject; overload;

    constructor Create; overload;
    constructor Create(AValue: iRICKJSON); overload;

    destructor Destroy; override;
  end;


implementation

{ TRICKJSONObject }

constructor TRICKJSONObject.Create;
begin
  if not Assigned(FJSONObject) then
    FJSONObject := TJSONObject.Create;
end;

constructor TRICKJSONObject.Create(AValue: iRICKJSON);
begin
  FParent := AValue;

  if not Assigned(FJSONObject) then
    FJSONObject := TJSONObject.Create;
end;

{$IF DEFINED(FPC)}

function TRICKJSONObject.Add(const AName: TJSONStringType; AValue: TJSONData
  ): iRICKJSONObject;
begin
  Result := Self;
  FJSONObject.Add(AName, AValue);
end;

function TRICKJSONObject.Add(const AName: TJSONStringType; AValue: boolean
  ): iRICKJSONObject;
begin
  Result := Self;
  FJSONObject.Add(AName, AValue);
end;

function TRICKJSONObject.Add(const AName: TJSONStringType; AValue: TJSONFloat
  ): iRICKJSONObject;
begin
  Result := Self;
  FJSONObject.Add(AName, AValue);
end;

function TRICKJSONObject.Add(const AName, AValue: TJSONStringType
  ): iRICKJSONObject;
begin
  Result := Self;
  FJSONObject.Add(AName, AValue);
end;
{$IFNDEF PAS2JS}
function TRICKJSONObject.Add(const AName: string; AValue: TJSONUnicodeStringType
  ): iRICKJSONObject;
begin
  Result := Self;
  FJSONObject.Add(AName, AValue);
end;

function TRICKJSONObject.Add(const AName: TJSONStringType; Avalue: int64
  ): iRICKJSONObject;
begin
  Result := Self;
  FJSONObject.Add(AName, AValue);
end;

function TRICKJSONObject.Add(const AName: TJSONStringType; Avalue: QWord
  ): iRICKJSONObject;
begin
  Result := Self;
  FJSONObject.Add(AName, AValue);
end;
{$ELSE}
function TRICKJSONObject.Add(const AName: TJSONStringType; Avalue: NativeInt): iRICKJSONObject;
begin
  Result := Self;
  FJSONObject.Add(AName, AValue);
end;
{$ENDIF}

function TRICKJSONObject.Add(const AName: TJSONStringType; Avalue: integer
  ): iRICKJSONObject;
begin
  Result := Self;
  FJSONObject.Add(AName, AValue);
end;

function TRICKJSONObject.Add(const AName: TJSONStringType): iRICKJSONObject;
begin
  Result := Self;
  FJSONObject.Add(AName);
end;

function TRICKJSONObject.Add(const AName: TJSONStringType; AValue: TJSONArray
  ): iRICKJSONObject;
begin
  Result := Self;
  FJSONObject.Add(AName, AValue);
end;
{$ELSE}
function TRICKJSONObject.Add(const AName: string): iRICKJSONObject;
begin
  Result:= Self;
  FJSONObject.AddPair(AName, TJSONNull.Create);
end;
function TRICKJSONObject.Add(const AName: string; AValue: string): iRICKJSONObject;
begin
  Result:= Self;
  FJSONObject.AddPair(AName, AValue);
end;
function TRICKJSONObject.Add(const AName: string; AValue: boolean): iRICKJSONObject;
begin
  Result:= Self;
  FJSONObject.AddPair(AName, TJSONBool.Create(AValue));
end;
function TRICKJSONObject.Add(const AName: string; AValue: Float32): iRICKJSONObject;
begin
  Result:= Self;
  FJSONObject.AddPair(AName, TJSONNumber.Create(AValue));
end;
function TRICKJSONObject.Add(const AName: string; AValue: Double): iRICKJSONObject;
begin
  Result:= Self;
  FJSONObject.AddPair(AName, TJSONNumber.Create(AValue));
end;
function TRICKJSONObject.Add(const AName: string; Avalue: int64): iRICKJSONObject;
begin
  Result:= Self;
  FJSONObject.AddPair(AName, TJSONNumber.Create(AValue));
end;
function TRICKJSONObject.Add(const AName: string; Avalue: integer): iRICKJSONObject;
begin
  Result:= Self;
  FJSONObject.AddPair(AName, TJSONNumber.Create(AValue));
end;
function TRICKJSONObject.Add(const AName: string; AValue: TJSONArray): iRICKJSONObject;
begin
  Result:= Self;
  FJSONObject.AddPair(AName, AValue);
end;
function TRICKJSONObject.Add(const AName: string; AValue: TJSONObject): iRICKJSONObject;
begin
  Result:= Self;
  FJSONObject.AddPair(AName, AValue);
end;

{$ENDIF}

function TRICKJSONObject.ParseJson(AJSONString: string): iRICKJSONObject;
begin
  Result := Self;
  if Assigned(FJSONObject) then
  {$IF DEFINED(FPC)}
    FreeAndNil(FJSONObject);
  {$ELSE}
    {$IFDEF MSWINDOWS}
      FJSONObject.Free;
    {$ELSE}
      FJSONObject.DisposeOf;
    {$ENDIF}
  {$ENDIF}

{$IF DEFINED(FPC)}
  FData := GetJSON(AJSONString);
  FJSONObject := FData as TJSONObject;
{$ELSE}
  FData := TJSonObject.ParseJSONValue(AJSONString);
  FJSONObject := FData as TJSONObject;
{$ENDIF}
end;

function TRICKJSONObject.GetField(AField: string): string;
begin
{$IF DEFINED(FPC)}
  if FJSONObject.Find(AField) = Nil then
    raise Exception.Create('Campo não existe.');

  Result := VarToStr(FJSONObject.Get(AField));
{$ELSE}
  if FData.FindValue(AField) = nil then
    raise Exception.Create('Campo não existe.');

  Result:= FJSONObject.GetValue<string>(AField);
{$ENDIF}
end;

function TRICKJSONObject.GetField(const AField: string; ADefault: double
  ): double;
begin
{$IF DEFINED(FPC)}
  Result := FJSONObject.Get(AField, ADefault);
{$ELSE}
  Result:= FJSONObject.GetValue<Double>(AField, ADefault);
{$ENDIF}
end;

function TRICKJSONObject.GetField(const AField: string; ADefault: integer
  ): integer;
begin
{$IF DEFINED(FPC)}
  Result := FJSONObject.Get(AField, ADefault);
{$ELSE}
  Result:= FJSONObject.GetValue<integer>(AField, ADefault);
{$ENDIF}
end;

function TRICKJSONObject.GetField(const AField: string; ADefault: boolean
  ): boolean;
begin
{$IF DEFINED(FPC)}
  Result := FJSONObject.Get(AField, ADefault);
{$ELSE}
  Result:= FJSONObject.GetValue<Boolean>(AField, ADefault);
{$ENDIF}
end;

{$IF DEFINED(FPC)}
{$IFNDEF PAS2JS}
function TRICKJSONObject.GetField(const AField: string; ADefault: int64): int64;
begin
  Result := FJSONObject.Get(AField, ADefault);
end;

function TRICKJSONObject.GetField(const AField: string; ADefault: QWord): QWord;
begin
  Result := FJSONObject.Get(AField, ADefault);
end;

function TRICKJSONObject.GetField(const AField: string;
  ADefault: TJSONUnicodeStringType): TJSONUnicodeStringType;
begin
  Result := FJSONObject.Get(AField, ADefault);
end;
{$ENDIF}

function TRICKJSONObject.GetField(const AField: string;
  ADefault: TJSONStringType): TJSONStringType;
begin
  Result := FJSONObject.Get(AField, ADefault);
end;
{$ELSE}
function TRICKJSONObject.GetField(AField, ADefault: string): string;
begin
  Result:= FJSONObject.GetValue<string>(AField, ADefault);
end;

{$ENDIF}

function TRICKJSONObject.GetField(const AField: string; ADefault: TJSONArray
  ): TJSONArray;
begin
{$IF DEFINED(FPC)}
  Result := FJSONObject.Get(AField, ADefault);
{$ELSE}
  Result:= FJSONObject.GetValue<TJSONArray>(AField, ADefault);
{$ENDIF}
end;

function TRICKJSONObject.GetField(const AField: string; ADefault: TJSONObject
  ): TJSONObject;
begin
{$IF DEFINED(FPC)}
  Result := FJSONObject.Get(AField, ADefault);
{$ELSE}
  Result:= FJSONObject.GetValue<TJSONObject>(AField, ADefault);
{$ENDIF}
end;

function TRICKJSONObject.GetFieldArray(AField: string; AIndex: integer): string;
begin
  if not Assigned(FData) then
    raise Exception.Create('Parse JSON não informado');
  
{$IF DEFINED(FPC)}
  if AIndex > FData.Count then
    raise Exception.Create('Index não existe.');

  Result := FData.FindPath(Format('%s[%d]', [AField, AIndex])).AsString;
{$ELSE}
  if FData.FindValue(Format('%s[%d]', [AField, AIndex])) = nil then
    raise Exception.Create('Index não existe.');

  FData.TryGetValue<string>(Format('%s[%d]', [AField, AIndex]), Result);
{$ENDIF}
end;

function TRICKJSONObject.GetFieldArray(const AField: string; AIndex: integer;
  ADefault: double): double;
begin
  Result := ADefault;

  if not Assigned(FData) then
    raise Exception.Create('Parse JSON não informado');

{$IF DEFINED(FPC)}
  if AIndex > FData.Count then
    raise Exception.Create('Index não existe.');

  Result := FData.FindPath(Format('%s[%d]', [AField, AIndex])).AsFloat;
{$ELSE}
  if FData.FindValue(Format('%s[%d]', [AField, AIndex])) = nil then
    raise Exception.Create('Index não existe.');

  FData.TryGetValue<Double>(Format('%s[%d]', [AField, AIndex]), Result);
{$ENDIF}

end;
function TRICKJSONObject.GetFieldArray(const AField: string; AIndex: integer;
  ADefault: integer): integer;
begin
  Result := ADefault;

  if not Assigned(FData) then
    raise Exception.Create('Parse JSON não informado');

{$IF DEFINED(FPC)}
  if AIndex > FData.Count then
    raise Exception.Create('Index não existe.');

  Result := FData.FindPath(Format('%s[%d]', [AField, AIndex])).AsInteger;
{$ELSE}
  if FData.FindValue(Format('%s[%d]', [AField, AIndex])) = nil then
    raise Exception.Create('Index não existe.');

  FData.TryGetValue<Integer>(Format('%s[%d]', [AField, AIndex]), Result);
{$ENDIF}

end;
{$IF DEFINED(FPC)}
{$IFNDEF PAS2JS}

function TRICKJSONObject.GetFieldArray(const AField: string; AIndex: integer;
  ADefault: int64): int64;
begin
  Result := ADefault;

  if not Assigned(FData) then
    raise Exception.Create('Parse JSON não informado');

  if AIndex > FData.Count then
    raise Exception.Create('Index não existe.');

  Result := FData.FindPath(Format('%s[%d]', [AField, AIndex])).AsInt64;

end;

function TRICKJSONObject.GetFieldArray(const AField: string; AIndex: integer;
  ADefault: QWord): QWord;
begin
  Result := ADefault;

  if not Assigned(FData) then
    raise Exception.Create('Parse JSON não informado');

  if AIndex > FData.Count then
    raise Exception.Create('Index não existe.');

  Result := FData.FindPath(Format('%s[%d]', [AField, AIndex])).AsQWord;

end;

function TRICKJSONObject.GetFieldArray(const AField: string; AIndex: integer;
  ADefault: TJSONUnicodeStringType): TJSONUnicodeStringType;
begin
  Result := ADefault;

  if not Assigned(FData) then
    raise Exception.Create('Parse JSON não informado');

  if AIndex > FData.Count then
    raise Exception.Create('Index não existe.');

  Result := FData.FindPath(Format('%s[%d]', [AField, AIndex])).AsUnicodeString;

end;
{$ENDIF}

{$ELSE}

{$ENDIF}

function TRICKJSONObject.GetFieldArray(const AField: string; AIndex: integer;
  ADefault: boolean): boolean;
begin
  Result := ADefault;

  if not Assigned(FData) then
    raise Exception.Create('Parse JSON não informado');

{$IF DEFINED(FPC)}
  if AIndex > FData.Count then
    raise Exception.Create('Index não existe.');

  Result := FData.FindPath(Format('%s[%d]', [AField, AIndex])).AsBoolean;
{$ELSE}
  if FData.FindValue(Format('%s[%d]', [AField, AIndex])) = nil then
    raise Exception.Create('Index não existe.');

  FData.TryGetValue<Boolean>(Format('%s[%d]', [AField, AIndex]), Result);
{$ENDIF}

end;

{$IF DEFINED(FPC)}
function TRICKJSONObject.GetFieldArray(const AField: string; AIndex: integer;
  ADefault: TJSONStringType): TJSONStringType;
begin
  Result := ADefault;

  if not Assigned(FData) then
    raise Exception.Create('Parse JSON não informado');

  if AIndex > FData.Count then
    raise Exception.Create('Index não existe.');

  Result := FData.FindPath(Format('%s[%d]', [AField, AIndex])).AsString;
end;
{$ENDIF}

function TRICKJSONObject.SetField(const AField: string; ADefault: double
  ): iRICKJSONObject;
begin
  Result := Self;
{$IF DEFINED(FPC)}
  FJSONObject.Floats[AField] := ADefault;
{$ELSE}
  FJSONObject.RemovePair(AField).Free;
  FJSONObject.AddPair(AField, TJSONNumber.Create(ADefault));
{$ENDIF}
end;

function TRICKJSONObject.SetField(const AField: string; ADefault: integer
  ): iRICKJSONObject;
begin
  Result := Self;
{$IF DEFINED(FPC)}
  FJSONObject.Integers[AField] := ADefault;
{$ELSE}
  FJSONObject.RemovePair(AField).Free;
  FJSONObject.AddPair(AField, TJSONNumber.Create(ADefault));
{$ENDIF}
end;
{$IF DEFINED(FPC)}
{$IFNDEF PAS2JS}
function TRICKJSONObject.SetField(const AField: string; ADefault: int64
  ): iRICKJSONObject;
begin
  Result := Self;
  FJSONObject.Int64s[AField] := ADefault;
end;

function TRICKJSONObject.SetField(const AField: string; ADefault: QWord
  ): iRICKJSONObject;
begin
  Result := Self;
  FJSONObject.QWords[AField] := ADefault;
end;

function TRICKJSONObject.SetField(const AField: string; ADefault: string
  ): iRICKJSONObject;
begin
  Result := Self;
  FJSONObject.Strings[AField] := ADefault;
end;
{$ENDIF}

{$ELSE}
function TRICKJSONObject.SetField(const AField: string;
  ADefault: string): iRICKJSONObject;
begin
  Result:= Self;
  FJSONObject.RemovePair(AField).Free;
  FJSONObject.AddPair(AField, ADefault);
end;

{$ENDIF}

function TRICKJSONObject.SetField(const AField: string; ADefault: boolean
  ): iRICKJSONObject;
begin
  Result := Self;
{$IF DEFINED(FPC)}
  FJSONObject.Booleans[AField] := ADefault;
{$ELSE}
  FJSONObject.RemovePair(AField).Free;
  FJSONObject.AddPair(AField, TJSONBool.Create(ADefault));
{$ENDIF}
end;

function TRICKJSONObject.ToJson: string;
begin
{$IF DEFINED(FPC)}
  Result := FJSONObject.FormatJSON();
{$ELSE}
  Result := FJSONObject.ToJSon;
{$ENDIF}
end;

{$IFNDEF FPC }
function TRICKJSONObject.ToStrings: string;
begin
  Result := FJSONObject.ToString;
end;

function TRICKJSONObject.ToJsonFormmater: string;
begin
  Result:= FJSONObject.Format;
end;

{$ENDIF}
function TRICKJSONObject.GetTryField(AField: string): string;
begin
  {$IF DEFINED(FPC)}
    Result := VarToStr(FJSONObject.Get(AField));
  {$ELSE}
    FJSONObject.TryGetValue<string>(AField, Result);
  {$ENDIF}

end;

function TRICKJSONObject.GetTryFieldArray(AField: string; AIndex: integer
  ): string;
begin
  Result:= EmptyStr;

  if not Assigned(FData) then
    raise Exception.Create('Parse JSON não informado');

{$IF DEFINED(FPC)}
  if not (AIndex > FData.Count) then
    Result := FData.FindPath(Format('%s[%d]', [AField, AIndex])).AsString;
{$ELSE}
  FData.TryGetValue<string>(Format('%s[%d]', [AField, AIndex]), Result);
{$ENDIF}

end;

function TRICKJSONObject.GetTryFieldArray(const AField: string;
  AIndex: integer; ADefault: double): double;
begin
  Result := ADefault;

  if not Assigned(FData) then
    raise Exception.Create('Parse JSON não informado');

  {$IF DEFINED(FPC)}
    if not (AIndex > FData.Count) then
      Result := FData.FindPath(Format('%s[%d]', [AField, AIndex])).AsFloat;
  {$ELSE}
    FData.TryGetValue<Double>(Format('%s[%d]', [AField, AIndex]), Result);
  {$ENDIF}
end;

function TRICKJSONObject.GetTryFieldArray(const AField: string;
  AIndex: integer; ADefault: integer): integer;
begin
  Result := ADefault;

  if not Assigned(FData) then
    raise Exception.Create('Parse JSON não informado');

  {$IF DEFINED(FPC)}
    if not (AIndex > FData.Count) then
      Result := FData.FindPath(Format('%s[%d]', [AField, AIndex])).AsInteger;
  {$ELSE}
    FData.TryGetValue<integer>(Format('%s[%d]', [AField, AIndex]), Result);
  {$ENDIF}

end;
{$IF DEFINED(FPC)}
  {$IFNDEF PAS2JS}

function TRICKJSONObject.GetTryFieldArray(const AField: string;
  AIndex: integer; ADefault: int64): int64;
begin
  Result := ADefault;

  if not Assigned(FData) then
    raise Exception.Create('Parse JSON não informado');

  if not (AIndex > FData.Count) then
    Result := FData.FindPath(Format('%s[%d]', [AField, AIndex])).AsInt64;
end;

function TRICKJSONObject.GetTryFieldArray(const AField: string;
  AIndex: integer; ADefault: QWord): QWord;
begin
  Result := ADefault;

  if not Assigned(FData) then
    raise Exception.Create('Parse JSON não informado');

  if not (AIndex > FData.Count) then
    Result := FData.FindPath(Format('%s[%d]', [AField, AIndex])).AsQWord;

end;

function TRICKJSONObject.GetTryFieldArray(const AField: string;
  AIndex: integer; ADefault: TJSONUnicodeStringType): TJSONUnicodeStringType;
begin
  Result := ADefault;

  if not Assigned(FData) then
    raise Exception.Create('Parse JSON não informado');

  if not (AIndex > FData.Count) then
    Result := FData.FindPath(Format('%s[%d]', [AField, AIndex])).AsUnicodeString;
end;
{$ENDIF}
{$ELSE}

{$ENDIF}

function TRICKJSONObject.GetTryFieldArray(const AField: string;
  AIndex: integer; ADefault: boolean): boolean;
begin
  Result := ADefault;

  if not Assigned(FData) then
    raise Exception.Create('Parse JSON não informado');

  {$IF DEFINED(FPC)}
    if not (AIndex > FData.Count) then
      Result := FData.FindPath(Format('%s[%d]', [AField, AIndex])).AsBoolean;
  {$ELSE}
    FData.TryGetValue<boolean>(Format('%s[%d]', [AField, AIndex]), Result);
  {$ENDIF}

end;
{$IF DEFINED(FPC)}

function TRICKJSONObject.GetTryFieldArray(const AField: string;
  AIndex: integer; ADefault: TJSONStringType): TJSONStringType;
begin
  Result := ADefault;

  if not Assigned(FData) then
    raise Exception.Create('Parse JSON não informado');

  if not (AIndex > FData.Count) then
    Result := FData.FindPath(Format('%s[%d]', [AField, AIndex])).AsString;

end;
{$ENDIF}

function TRICKJSONObject.&End: iRICKJSON;
begin
  Result := FParent;
end;

class function TRICKJSONObject.New: iRICKJSONObject;
begin
  Result := Self.Create;
end;

class function TRICKJSONObject.New(AValue: iRICKJSON): iRICKJSONObject;
begin
  Result := Self.Create(AValue);
end;

destructor TRICKJSONObject.Destroy;
begin
  if Assigned(FJSONObject) then
  {$IF DEFINED(FPC)}
    FreeAndNil(FJSONObject);
  {$ELSE}
    {$IFDEF MSWINDOWS}
      FJSONObject.Free;
    {$ELSE}
      FJSONObject.DisposeOf;
    {$ENDIF}
  {$ENDIF}

  inherited Destroy;
end;

end.
