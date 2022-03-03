unit RICK.JSON.Interfaces;

{$IF DEFINED(FPC)}
  {$MODE DELPHI}{$H+}
{$ENDIF}

interface
  uses
  {$IF DEFINED(FPC)}
    SysUtils,
    fpjson
  {$ELSE}
    System.JSON
  {$ENDIF};
type
  iRICKJSON = interface ;
  iRICKJSONObject = interface;
  iRICKJSONArray = interface;

   iRICKJSON = interface
     ['{3D6670A5-7CFC-413E-BE70-CE044A3A9426}']
     function Objects : iRICKJSONObject;
     function Arrays  : iRICKJSONArray;
   end;

  iRICKJSONObject = interface
    ['{0CF5C80B-0463-4CC6-970D-AE5C1ACFEA2B}']
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

  function &End : iRICKJSON;
  end;

  iRICKJSONArray = interface
    ['{5494BCE8-190F-4F17-AC28-2706F5BA7A1D}']
  end;

implementation

end.
