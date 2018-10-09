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
    EnvironmentFactoryImpl,
    DispatcherFactoryImpl,
    RouteCollectionFactoryImpl,
    OutputBufferFactoryImpl,
    ErrorHandlerFactoryImpl,
    ConfigImpl,
    ConfigFactoryImpl,
    DependencyListImpl,
    MiddlewareCollectionAwareFactoryImpl,
    TemplateParserFactoryImpl;

initialization

    appDependencyContainer := TDependencyContainer.create(TDependencyList.create());
    {$INCLUDE main.dependencies.inc}
    {$INCLUDE views.dependencies.inc}

finalization
    appDependencyContainer := nil;
end.
