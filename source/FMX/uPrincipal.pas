unit uPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TForm1 = class(TForm)
    btCriarObjeto: TSpeedButton;
    btParseJSON: TSpeedButton;
    btLerCampo: TSpeedButton;
    btModificarCampo: TSpeedButton;
    btPesquisarArray: TSpeedButton;
    procedure btCriarObjetoClick(Sender: TObject);
    procedure btParseJSONClick(Sender: TObject);
    procedure btLerCampoClick(Sender: TObject);
    procedure btModificarCampoClick(Sender: TObject);
    procedure btPesquisarArrayClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}
uses
  RICK.JSON,
  RICK.JSON.interfaces;
procedure TForm1.btCriarObjetoClick(Sender: TObject);
var
  LJSONObject: iRICKJSON;
begin
  LJSONObject := TRICKJSON.New.Objects
                  .Add('Colapso')
                  .Add('Nome', 'José')
                  .Add('Casado', True)
                  .Add('idade', 34)
                  .Add('Salario', 123.54)
                  .&End;
  ShowMessage('Json Sting: ' + #13 + #13 +  LJSONObject.Objects.ToStrings);
  ShowMessage('Json: ' + #13 + #13 +  LJSONObject.Objects.ToJson);
  ShowMessage('Json Fomatado: ' + #13 + #13 +  LJSONObject.Objects.ToJsonFormmater);
end;

procedure TForm1.btLerCampoClick(Sender: TObject);
var
  LJSONObject: iRICKJSON;
begin
  LJSONObject := TRICKJSON.New.Objects
                  .ParseJson(
                    '{"Fld1" : "Hello", "Fld2" : 42, "Colors" : ["Red", "Green", "Blue"]}')
                  .&End;


  ShowMessage(LJSONObject.Objects.ToJsonFormmater);
  ShowMessage('Json Fld2: ' + #13 + #13 +  LJSONObject.Objects.GetField('Fld2'));
  ShowMessage('Json Fld1: ' + #13 + #13 +  LJSONObject.Objects.GetField('Fld1', ''));
end;

procedure TForm1.btModificarCampoClick(Sender: TObject);
var
  LJSONObject: iRICKJSON;
begin
  LJSONObject := TRICKJSON.New.Objects
                  .ParseJson(
                    '{"Fld1" : "Hello", "Fld2" : 42, "Colors" : ["Red", "Green", "Blue"]}')
                  .&End;
  ShowMessage('Json Sting: ' + #13 + #13 +  LJSONObject.Objects.ToJsonFormmater);

  LJSONObject.Objects
    .SetField('Fld1', 'By By')
    .SetField('Fld2', 98);

  ShowMessage('Json Sting: ' + #13 + #13 +  LJSONObject.Objects.ToJsonFormmater);
end;

procedure TForm1.btParseJSONClick(Sender: TObject);
var
  LJSONObject: iRICKJSON;
begin
  LJSONObject := TRICKJSON.New.Objects
                  .ParseJson(
                    '{"Fld1" : "Hello", "Fld2" : 42, "Colors" : ["Red", "Green", "Blue"]}')
                  .&End;
  ShowMessage('Json Sting: ' + #13 + #13 +  LJSONObject.Objects.ToStrings);
  ShowMessage('Json: ' + #13 + #13 +  LJSONObject.Objects.ToJson);
  ShowMessage('Json Fomatado: ' + #13 + #13 +  LJSONObject.Objects.ToJsonFormmater);
end;

procedure TForm1.btPesquisarArrayClick(Sender: TObject);
var
  LJSONObject: iRICKJSON;
begin
  LJSONObject := TRICKJSON.New.Objects
                  .ParseJson(
                    '{"Fld1" : "Hello", "Fld2" : 42, "Colors" : ["Red", "Green", "Blue"]}')
                  .&End;

  ShowMessage('Json: ' + #13 + #13 +  LJSONObject.Objects.ToJsonFormmater);


  ShowMessage('Colors Index 2: ' + #13 + #13 +  LJSONObject.Objects.GetFieldArray('Colors', 2)); //Apresenta execao se o index não existir
  ShowMessage('Colors Index 12: ' + #13 + #13 +  LJSONObject.Objects.GetTryFieldArray('Colors', 12)); //Arpesenta informação vazia se o indixes não existir
  ShowMessage('Colors Index 22: ' + #13 + #13 +  LJSONObject.Objects.GetFieldArray('Colors', 22)); //Apresenta execao se o index não existir


end;

end.
