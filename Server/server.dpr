program server;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  System.JSON,
  Horse,
  Horse.Commons,
  Horse.Jhonson,
  Horse.ServerStatic,
  UnitCategorias.Controller in 'Controllers\UnitCategorias.Controller.pas';

begin
  THorse.Use(Jhonson())
        .Use(ServerStatic('categorias'));

  TControllerCategorias.Registrar;

  THorse.Listen(9000,
    procedure(App: THorse)
    begin
      Writeln('Server is running on port ' + App.Port.ToString);
    end);

end.
