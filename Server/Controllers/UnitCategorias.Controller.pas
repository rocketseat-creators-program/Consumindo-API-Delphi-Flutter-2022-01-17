unit UnitCategorias.Controller;

interface

uses
  Horse,
  Horse.Commons,
  Classes,
  SysUtils,
  System.Json;

type
  TControllerCategorias = class
    class procedure Registrar;
    class procedure Get(Req: THorseRequest; Res: THorseResponse; Next: TProc);
  end;

implementation

{ TControllerCategorias }

class procedure TControllerCategorias.Get(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
var
  CategoriasJson: TJSONObject;
  aJson: TJSONArray;
begin
  // objetos json
  aJson := TJSONArray.Create;
  /// /
  CategoriasJson := TJSONObject.Create;
  CategoriasJson.AddPair('nome', 'Bebidas');
  CategoriasJson.AddPair('url', 'http://localhost:' + THorse.Port.ToString +
    '/bebidas.jpg');
  aJson.AddElement(CategoriasJson);
  /// /
  CategoriasJson := TJSONObject.Create;
  CategoriasJson.AddPair('nome', 'Diversos');
  CategoriasJson.AddPair('url', 'http://localhost:' + THorse.Port.ToString +
    '/diversos.jpg');
  aJson.AddElement(CategoriasJson);
  /// /
  CategoriasJson := TJSONObject.Create;
  CategoriasJson.AddPair('nome', 'Doces');
  CategoriasJson.AddPair('url', 'http://localhost:' + THorse.Port.ToString +
    '/doces.jpg');
  aJson.AddElement(CategoriasJson);
  /// /
  CategoriasJson := TJSONObject.Create;
  CategoriasJson.AddPair('nome', 'Lanches');
  CategoriasJson.AddPair('url', 'http://localhost:' + THorse.Port.ToString +
    '/lanches.jpg');
  aJson.AddElement(CategoriasJson);
  /// /
  CategoriasJson := TJSONObject.Create;
  CategoriasJson.AddPair('nome', 'Pizzas');
  CategoriasJson.AddPair('url', 'http://localhost:' + THorse.Port.ToString +
    '/pizza.jpg');
  aJson.AddElement(CategoriasJson);
  /// /
  CategoriasJson := TJSONObject.Create;
  CategoriasJson.AddPair('nome', 'Sorvetes');
  CategoriasJson.AddPair('url', 'http://localhost:' + THorse.Port.ToString +
    '/sorvetes.jpg');
  aJson.AddElement(CategoriasJson);
  // resposta
  Res.Send<TJSONArray>(aJson).Status(THTTPStatus.OK);
end;

class procedure TControllerCategorias.Registrar;
begin
  THorse.Get('/categorias', Get);
end;

end.
