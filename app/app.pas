{-----------------------------------------------
 Bootstrap application
 @author Zamrony P. Juhara <zamronypj@yahoo.com>
------------------------------------------------}
program app;

uses
    sysutils,
    AppIntf,
    DependencyContainerIntf,
    DependencyContainerImpl,
    DependencyListImpl,
    EnvironmentImpl,
    ErrorHandlerImpl,
    DebugAppImpl,
    myapp;

    {------------------------------------
    application
    -------------------------------------}
    procedure runApp();
    var
        appInstance : IWebApplication;
        container : IDependencyContainer;
    begin
        container := TDependencyContainer.create(TDependencyList.create());
        appInstance := TDebugWebApplication.create(TMyApp.create(
            container,
            TCGIEnvironment.create(),
            TErrorHandler.create()
        ));
        appInstance.run();
    end;

begin
    runApp();
end.
