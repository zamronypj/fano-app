router.get('/', container.get('helloController') as IRouteHandler);
//router.post('/hello/{name}', container.get('helloController') as IRouteHandler);
router.get('/hello/{name}', container.get('helloController') as IRouteHandler);
