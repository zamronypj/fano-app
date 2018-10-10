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
        appInstance := TMyApp.Create(container);
        try
            appInstance.run();
        finally
            appInstance := nil;
            container := nil;
        end;
    end;

begin
    runApp();
end.
