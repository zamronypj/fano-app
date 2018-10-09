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
appDependencyContainer.add('errorHandler', TErrorHandlerFactory.create(appDependencyContainer));

///middleware list for application level
appDependencyContainer.add('appMiddlewares', TMiddlewareCollectionAwareFactory.create(appDependencyContainer));

///middleware list for each routes,
///need to be use factory so each route will have different middleware list
appDependencyContainer.factory('routeMiddlewares', TMiddlewareCollectionAwareFactory.create(appDependencyContainer));
