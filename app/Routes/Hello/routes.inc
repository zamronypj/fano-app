(*!------------------------------------------------------------
 * Fano Web Framework Skeleton Application (https://fanoframework.github.io)
 *
 * @link      https://github.com/fanoframework/fano-app
 * @copyright Copyright (c) 2018 Zamrony P. Juhara
 * @license   https://github.com/fanoframework/fano-app/blob/master/LICENSE (GPL 3.0)
 *------------------------------------------------------------- *)
router.get('/', container.get('helloController') as IRequestHandler);
router.post('/hello/{name}', container.get('helloController') as IRequestHandler);
router.get('/hello/{name}', container.get('helloController') as IRequestHandler);
router.get('/hello/{name}/json', container.get('helloJsonController') as IRequestHandler);
