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
    AppConfig,
    di,
    RouteCollectionIntf,
    EnvironmentIntf,
    DispatcherIntf;

type

    {------------------------------------
    Base application Bootstrap
    @author Zamrony P. Juhara <zamronypj@yahoo.com>
    -------------------------------------}
    TWebApp = class(TFanoWebApplication)
    end;

var
    appInstance : IWebApplication;

begin
    try
        appInstance := TWebApp.create(
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
