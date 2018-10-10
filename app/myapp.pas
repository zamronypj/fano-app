unit myapp;

interface

uses
    DependencyContainerIntf,
    RunnableIntf,
    DispatcherIntf,
    EnvironmentIntf,
    ErrorHandlerIntf,
    AppImpl;

type

    TMyApp = class(TFanoWebApplication)
    protected
        procedure buildDependencies(const container : IDependencyContainer); override;
        procedure buildRoutes(const container : IDependencyContainer); override;
        function initDispatcher(const container : IDependencyContainer) : IDispatcher; override;
        function initEnvironment(const container : IDependencyContainer) : ICGIEnvironment;override;
        function initErrorHandler(const container : IDependencyContainer) : IErrorHandler; override;
    end;

implementation

uses
    sysutils,

    {*! -------------------------------
        unit interfaces
    ----------------------------------- *}
    RouteMatcherIntf,
    RouteCollectionIntf,
    MiddlewareCollectionAwareIntf,
    ConfigIntf,
    OutputBufferIntf,
    TemplateParserIntf,

    {*! -------------------------------
        unit implementations
    ----------------------------------- *}
    EnvironmentFactoryImpl,
    DispatcherFactoryImpl,
    RouteCollectionFactoryImpl,
    OutputBufferFactoryImpl,
    DebugErrorHandlerFactoryImpl,
    ErrorHandlerFactoryImpl,
    ConfigImpl,
    ConfigFactoryImpl,
    DependencyListImpl,
    MiddlewareCollectionAwareFactoryImpl,
    TemplateParserFactoryImpl,
    TemplateFileViewImpl,
    ViewParametersImpl,

    {*! -------------------------------
        controllers
    ----------------------------------- *}
    HelloController;


    procedure TMyApp.buildDependencies(const container : IDependencyContainer);
    begin
        {$INCLUDE Dependencies/main.dependencies.inc}
        {$INCLUDE Dependencies/views.dependencies.inc}
    end;

    procedure TMyApp.buildRoutes(const container : IDependencyContainer);
    var router : IRouteCollection;
        routeMiddlewares : IMiddlewareCollectionAware;
        config : IAppConfiguration;
    begin
        router := container.get('router') as IRouteCollection;
        routeMiddlewares := container.get('routeMiddlewares') as IMiddlewareCollectionAware;
        config := container.get('config') as IAppConfiguration;
        try
            {$INCLUDE Routes/home/routes.inc}
        finally
            router := nil;
            routeMiddlewares := nil;
            config := nil;
        end;
    end;

    function TMyApp.initDispatcher(const container : IDependencyContainer) : IDispatcher;
    begin
        result := container.get('dispatcher') as IDispatcher;
    end;

    function TMyApp.initEnvironment(const container : IDependencyContainer) : ICGIEnvironment;
    begin
        result := container.get('environment') as ICGIEnvironment;
    end;

    function TMyApp.initErrorHandler(const container : IDependencyContainer) : IErrorHandler;
    begin
        result := container.get('errorHandler') as IErrorHandler;
    end;

end.