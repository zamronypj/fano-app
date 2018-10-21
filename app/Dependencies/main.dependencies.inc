{-----------------------------------------------
  register application configuration
------------------------------------------------}
container.add(
    'config',
    TFanoConfigFactory.create(
        extractFileDir(getCurrentDir()) + '/config/config.json'
    )
);

{-----------------------------------------------
  register middleware list for each routes that
  does nothing,
  need to be use factory so each route will have
  different middleware list
------------------------------------------------}
container.factory('routeMiddlewares', TNullMiddlewareCollectionAwareFactory.create());

{-----------------------------------------------
  register application simple router instance
  which does not support middleware
------------------------------------------------}
container.add('router', TSimpleRouteCollectionFactory.create());

{-----------------------------------------------
  setup application request dispatcher
------------------------------------------------}
container.add(
    'dispatcher',
    TSimpleDispatcherFactory.create(
        container.get('router') as IRouteMatcher
    )
);
