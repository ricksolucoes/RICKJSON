unit rickjson.principal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    btCriarObjeto: TButton;
    btLerCampo: TButton;
    btParseJson: TButton;
    btModificarCampo: TButton;
    btPesquisarArray: TButton;
    procedure btCriarObjetoClick(Sender: TObject);
    procedure btLerCampoClick(Sender: TObject);
    procedure btModificarCampoClick(Sender: TObject);
    procedure btParseJsonClick(Sender: TObject);
    procedure btPesquisarArrayClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }
uses
  RICK.JSON,
  RICK.JSON.Objects,
  RICK.JSON.Interfaces;

procedure TForm1.btCriarObjetoClick(Sender: TObject);
var
  LJSONObject: iRICKJSONObject;
begin
  LJSONObject := TRICKJSONObject.New
                  .Add('Nome', 'Jose')
                  .Add('Idade', 32)
                  .Add('Homem', True)
                  .Add('Salario', 123.34)
                  .Add('Solteiro');


  ShowMessage('Resultado com interface');
  ShowMessage(LJSONObject.ToJson);

  ShowMessage('Resultado sem interface');
  ShowMessage(TRICKJSON.New.Objects.Add('Teste sem interface', True).ToJson);

end;

procedure TForm1.btLerCampoClick(Sender: TObject);
var
  LJSONObject: iRICKJSONObject;
begin
  LJSONObject := TRICKJSONObject.New
                  .ParseJson(
                  '{"Fld1" : "Hello", "Fld2" : 42, "Colors" : ["Red", "Green", "Blue"]}');

  ShowMessage('Resultado com interface');
  ShowMessage(LJSONObject.ToJson);
  ShowMessage(LJSONObject.GetField('Fld2')); //apresenta uma mensagem de execao informando que o campo não existe.
  ShowMessage(LJSONObject.GetTryFieldArray('Colors', 123)); //passa vazio se o campo não existir
  ShowMessage(LJSONObject.GetField('Fld1', ''));

  ShowMessage('Resultado sem interface');

  ShowMessage(TRICKJSON.New
                .Objects
                  .ParseJson(
                  '{"Fld1" : "Hello", "Fld2" : 42, "Colors" : ["Red", "Green", "Blue"]}')
                           .ToJson);

  ShowMessage(TRICKJSON.New
                .Objects
                  .ParseJson(
                  '{"Fld1" : "Hello", "Fld2" : 42, "Colors" : ["Red", "Green", "Blue"]}')
                           .GetField('Fld1'));

  ShowMessage(TRICKJSON.New
                .Objects
                  .ParseJson(
                  '{"Fld1" : "Hello", "Fld2" : 42, "Colors" : ["Red", "Green", "Blue"]}')
                           .GetField('Fld2', 0).ToString);
end;

procedure TForm1.btModificarCampoClick(Sender: TObject);
var
  LJSONObject: iRICKJSONObject;
begin
  LJSONObject := TRICKJSONObject.New
                  .ParseJson(
                             '{"Fld1" : "Hello", "Fld2" : 42, "Colors" : ["Red", "Green", "Blue"]}')
                  .SetField('Fld1', 'By By')
                  .SetField('Fld2', 98);
  ShowMessage('Resultado com interface');
  ShowMessage(LJSONObject.ToJson);

  ShowMessage('Resultado sem interface');

  ShowMessage(TRICKJSON.New
                .Objects
                  .ParseJson(
                  '{"Fld1" : "Hello", "Fld2" : 42, "Colors" : ["Red", "Green", "Blue"]}')
                  .SetField('Fld1', 'Hello By By')
                  .SetField('Fld2', 3498)
                  .ToJson);

end;

procedure TForm1.btParseJsonClick(Sender: TObject);
var
  LJSONObject: iRICKJSONObject;
begin
  LJSONObject := TRICKJSONObject.New
                  .ParseJson(
                             '{"Fld1" : "Hello", "Fld2" : 42, "Colors" : ["Red", "Green", "Blue"]}');

  ShowMessage('Resultado com interface');
  ShowMessage(LJSONObject.ToJson);

  ShowMessage('Resultado sem interface');

  ShowMessage(TRICKJSON.New
                .Objects
                  .ParseJson(
                  '{"Fld1" : "Hello", "Fld2" : 42, "Colors" : ["Red", "Green", "Blue"]}')
                  .ToJson);

end;

procedure TForm1.btPesquisarArrayClick(Sender: TObject);
var
  LJSONObject: iRICKJSONObject;
begin
  LJSONObject := TRICKJSONObject.New
                  .ParseJson(
                             '{"Fld1" : "Hello", "Fld2" : 42, "Colors" : ["Red", "Green", "Blue"]}');

  ShowMessage('Resultado com interface');
  ShowMessage(LJSONObject.GetFieldArray('Colors', 2));

  ShowMessage('Resultado sem interface');

  ShowMessage(TRICKJSON.New
                .Objects
                  .ParseJson(
                  '{"Fld1" : "Hello", "Fld2" : 42, "Colors" : ["Red", "Green", "Blue"]}')
                  .GetFieldArray('Colors', 1));
end;

end.
