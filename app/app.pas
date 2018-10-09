{-----------------------------------------------
 Bootstrap application
 @author Zamrony P. Juhara <zamronypj@yahoo.com>
------------------------------------------------}
program app;

uses
    sysutils,
    AppIntf,
    AppImpl,
    ConfigIntf,
    RouteCollectionIntf,
    MiddlewareCollectionAwareIntf,
    EnvironmentIntf,
    DispatcherIntf,
    ErrorHandlerIntf,

    {------------------------------------
    Register application dependencies
    -------------------------------------}
    di,

    {------------------------------------
    Register application routes
    -------------------------------------}
    routes;

    {------------------------------------
    application
    -------------------------------------}
    procedure runApp();
    var
        appInstance : IWebApplication;
        errorHandler : IErrorHandler;
    begin
        try
            errorHandler := appDependencyContainer.get('errorHandler') as IErrorHandler;
            appInstance := TFanoWebApplication.create(
                appDependencyContainer.get('dispatcher') as IDispatcher,
                appDependencyContainer.get('environment') as ICGIEnvironment,
                errorHandler
            );
            appInstance.run();
        except
            on e : Exception do
            begin
                errorHandler.handleError(e);
            end;
        end;
    end;

begin
    runApp();
end.
