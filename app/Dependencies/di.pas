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
    AppConfig,
    AppConfigFactoryImpl,
    DependencyListImpl;

initialization

    appDependencyContainer := TServiceContainer.create(TDependencyList.create());
    appDependencyContainer.add(
        'config',
        TWebAppConfigFactory.create(
            appDependencyContainer,
            '../config/config.json'
        )
    );
    appDependencyContainer.add('dispatcher', TDispatcherFactory.create(appDependencyContainer));
    appDependencyContainer.add('router', TRouteCollectionFactory.create(appDependencyContainer));
    appDependencyContainer.add('environment', TWebEnvironmentFactory.create(appDependencyContainer));

finalization
    appDependencyContainer := nil;
end.
