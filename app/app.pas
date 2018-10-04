{-----------------------------------------------
 Bootstrap application
 @author Zamrony P. Juhara <zamronypj@yahoo.com>
------------------------------------------------}
program app;

uses
    AppIntf,
    AppImpl,
    ConfigIntf,
    ConfigImpl,
    RouteCollectionIntf,
    EnvironmentIntf,
    DispatcherIntf,
    di,
    routes;

var
    {------------------------------------
    global application instance
    -------------------------------------}
    appInstance : IWebApplication;

begin
    try
        appInstance := TFanoWebApplication.create(
            appDependencyContainer.get('config') as IWebConfiguration,
            appDependencyContainer.get('dispatcher') as IDispatcher,
            appDependencyContainer.get('environment') as IWebEnvironment,
            appDependencyContainer.get('router') as IRouteCollection,
            appDependencyContainer
        );
        appInstance.run();
    finally
        appInstance := nil;
    end;
end.
