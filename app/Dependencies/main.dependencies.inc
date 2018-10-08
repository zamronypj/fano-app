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

///middleware list for application level
appDependencyContainer.add('appMiddlewares', TMiddlewareCollectionFactory.create(appDependencyContainer));

///middleware list for each routes,
///need to be use factory so each route will have different middleware list
appDependencyContainer.factory('routeMiddlewares', TMiddlewareCollectionFactory.create(appDependencyContainer));
