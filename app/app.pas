(*!------------------------------------------------------------
 * Fano Web Framework Skeleton Application (https://fano.juhara.id)
 *
 * @link      https://github.com/zamronypj/fano-app
 * @copyright Copyright (c) 2018 Zamrony P. Juhara
 * @license   https://github.com/zamronypj/fano-app/blob/master/LICENSE (GPL 3.0)
 *------------------------------------------------------------- *)
program app;

uses
    sysutils,
    AppIntf,
    DependencyContainerIntf,
    DependencyContainerImpl,
    DependencyListImpl,
    EnvironmentImpl,
    ErrorHandlerImpl,
    myapp;

    (*!-----------------------------------------------
     * Bootstrap application
     *
     * @author Zamrony P. Juhara <zamronypj@yahoo.com>
     *------------------------------------------------*)
    procedure runApp();
    var
        appInstance : IWebApplication;
        container : IDependencyContainer;
    begin
        container := TDependencyContainer.create(TDependencyList.create());
        appInstance := TMyApp.create(
            container,
            TCGIEnvironment.create(),
            TErrorHandler.create()
        );
        appInstance.run();
    end;

begin
    runApp();
end.
