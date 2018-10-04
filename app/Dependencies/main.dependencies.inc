appDependencyContainer.add(
    'config',
    TConfigFactory.create(
        appDependencyContainer,
        '../config/config.json'
    )
);
appDependencyContainer.add('dispatcher', TDispatcherFactory.create(appDependencyContainer));
appDependencyContainer.add('router', TRouteCollectionFactory.create(appDependencyContainer));
appDependencyContainer.add('environment', TWebEnvironmentFactory.create(appDependencyContainer));
appDependencyContainer.add('outputBuffer', TOutputBufferFactory.create(appDependencyContainer));
