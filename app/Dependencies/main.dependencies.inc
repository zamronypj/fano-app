appDependencyContainer.add(
    'config',
    TFanoConfigFactory.create(
        appDependencyContainer,
        '../config/config.json'
    )
);
appDependencyContainer.add('dispatcher', TDispatcherFactory.create(appDependencyContainer));
appDependencyContainer.add('router', TRouteCollectionFactory.create(appDependencyContainer));
appDependencyContainer.add('environment', TCGIEnvironmentFactory.create(appDependencyContainer));
appDependencyContainer.add('outputBuffer', TOutputBufferFactory.create(appDependencyContainer));
