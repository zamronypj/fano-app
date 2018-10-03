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
    appDependencyContainer : IDependencyContainer;

implementation

uses
    EnvironmentFactoryImpl,
    DispatcherFactoryImpl,
    RouteCollectionFactoryImpl,
    config;

initialization

    appDependencyContainer := TServiceContainer.create();
    appDI.add('config', TWebAppConfigFactory.create(appDependencyContainer));
    appDI.add('dispatcher', TDispatcherFactory.create(appDependencyContainer));
    appDI.add('router', TRouterCollectionFactory.create(appDependencyContainer));
    appDI.add('environment', TWebEnvironmentFactory.create(appDependencyContainer));

finalization
    appDI := nil;
end.
