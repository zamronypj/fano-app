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
    DebugErrorHandlerImpl,
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
        appInstance := TMyApp.create(
            container,
            TCGIEnvironment.create(),
            TDebugErrorHandler.create()
        );
        appInstance.run();
    end;

begin
    runApp();
end.
