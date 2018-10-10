container.add(
    'config',
    TFanoConfigFactory.create(
        extractFilePath(getCurrentDir()) + 'config/config.json'
    )
);

///middleware list for application level
container.add('appMiddlewares', TMiddlewareCollectionAwareFactory.create());

///middleware list for each routes,
///need to be use factory so each route will have different middleware list
container.factory('routeMiddlewares', TMiddlewareCollectionAwareFactory.create());

container.add('router', TRouteCollectionFactory.create());

container.add(
    'dispatcher',
    TDispatcherFactory.create(
        container.get('appMiddlewares') as IMiddlewareCollectionAware,
        container.get('router') as IRouteMatcher
    )
);
container.add('environment', TCGIEnvironmentFactory.create());
container.add('outputBuffer', TOutputBufferFactory.create());
container.add('errorHandler', TDebugErrorHandlerFactory.create());
