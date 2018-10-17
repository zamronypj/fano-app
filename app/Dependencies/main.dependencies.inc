{-----------------------------------------------
  register application configuration
------------------------------------------------}
container.add(
    'config',
    TFanoConfigFactory.create(
        extractFilePath(getCurrentDir()) + 'config/config.json'
    )
);

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
