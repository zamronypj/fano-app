{-----------------------------------------------
 Register application dependencies

 @author Zamrony P. Juhara <zamronypj@yahoo.com>
------------------------------------------------}
unit di;

interface

uses
    DependencyIntf,
    DependencyContainerIntf,
    DependencyContainerImpl;

var
    {------------------------------------
    global dependency container instance
    -------------------------------------}
    appDependencyContainer : IDependencyContainer;

implementation

uses
    sysutils,
    EnvironmentFactoryImpl,
    DispatcherFactoryImpl,
    RouteMatcherIntf,
    RouteCollectionFactoryImpl,
    OutputBufferFactoryImpl,
    DebugErrorHandlerFactoryImpl,
    ErrorHandlerFactoryImpl,
    ConfigImpl,
    ConfigFactoryImpl,
    DependencyListImpl,
    MiddlewareCollectionAwareIntf,
    MiddlewareCollectionAwareFactoryImpl,
    TemplateParserFactoryImpl;

initialization

    try
        appDependencyContainer := TDependencyContainer.create(TDependencyList.create());
        {$INCLUDE main.dependencies.inc}
        {$INCLUDE views.dependencies.inc}
    except
        appDependencyContainer := nil;
        raise;
    end;
finalization
    appDependencyContainer := nil;
end.
