(*!------------------------------------------------------------
 * Fano Web Framework Skeleton Application (https://fanoframework.github.io)
 *
 * @link      https://github.com/fanoframework/fano-app
 * @copyright Copyright (c) 2018 Zamrony P. Juhara
 * @license   https://github.com/fanoframework/fano-app/blob/master/LICENSE (GPL 3.0)
 *------------------------------------------------------------- *)
router.post('/hi/{name}', container.get('hiController') as IRequestHandler);
