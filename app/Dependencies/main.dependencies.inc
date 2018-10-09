appDependencyContainer.add(
    'config',
    TFanoConfigFactory.create(
        '../config/config.json'
    )
);

///middleware list for application level
appDependencyContainer.add('appMiddlewares', TMiddlewareCollectionAwareFactory.create());

///middleware list for each routes,
///need to be use factory so each route will have different middleware list
appDependencyContainer.factory('routeMiddlewares', TMiddlewareCollectionAwareFactory.create());

appDependencyContainer.add('router', TRouteCollectionFactory.create());

appDependencyContainer.add(
    'dispatcher',
    TDispatcherFactory.create(
        appDependencyContainer.get('appMiddlewares') as IMiddlewareCollectionAware,
        appDependencyContainer.get('router') as IRouteMatcher
    )
);
appDependencyContainer.add('environment', TCGIEnvironmentFactory.create());
appDependencyContainer.add('outputBuffer', TOutputBufferFactory.create());
appDependencyContainer.add('errorHandler', TErrorHandlerFactory.create());
