(*!------------------------------------------------------------
 * Fano Web Framework Skeleton Application (https://fano.juhara.id)
 *
 * @link      https://github.com/zamronypj/fano-app
 * @copyright Copyright (c) 2018 Zamrony P. Juhara
 * @license   https://github.com/zamronypj/fano-app/blob/master/LICENSE (GPL 3.0)
 *------------------------------------------------------------- *)
program app;

uses

    fano,
    myapp;

(*!-----------------------------------------------
 * Bootstrap application
 *
 * @author Zamrony P. Juhara <zamronypj@yahoo.com>
 *------------------------------------------------*)
var
    appInstance : IWebApplication;

begin
    appInstance := TMyApp.create(
        TDependencyContainer.create(TDependencyList.create()),
        TCGIEnvironment.create(),
        TErrorHandler.create()
    );
    appInstance.run();
end.
