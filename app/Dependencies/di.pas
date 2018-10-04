{-----------------------------------------------
 Register application dependencies

 @author Zamrony P. Juhara <zamronypj@yahoo.com>
------------------------------------------------}
unit di;

interface

uses
    DependencyAwareIntf,
    DependencyContainerIntf,
    DependencyContainerImpl;

type

    TServiceContainer = class(TDependencyContainer)
    end;

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
    AppConfig,
    AppConfigFactoryImpl,
    DependencyListImpl;

initialization

    appDependencyContainer := TServiceContainer.create(TDependencyList.create());
    {$INCLUDE main.dependencies.inc}
    {$INCLUDE controllers.dependencies.inc}

finalization
    appDependencyContainer := nil;
end.
