router.get('/', container.get('helloController') as IRouteHandler);
//router.post('/hello/{name}', container.get('helloController') as IRouteHandler);
router.get('/hello/{name}', container.get('helloController') as IRouteHandler);
router.get('/a/{name}/{unitId}/{tes}', container.get('helloController') as IRouteHandler);
router.get('/tes/{name}/ok', container.get('helloController') as IRouteHandler);
