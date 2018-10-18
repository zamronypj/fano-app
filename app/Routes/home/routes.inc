router.get('/tet/{tess}/{ss}', container.get('helloController') as IRouteHandler);
router.get('/stet/stet/{tes}', container.get('helloController') as IRouteHandler);
router.get('/hello/{name}', container.get('helloController') as IRouteHandler);
