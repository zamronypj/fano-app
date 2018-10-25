(*!------------------------------------------------------------
 * Fano Web Framework Skeleton Application (https://fano.juhara.id)
 *
 * @link      https://github.com/zamronypj/fano-app
 * @copyright Copyright (c) 2018 Zamrony P. Juhara
 * @license   https://github.com/zamronypj/fano-app/blob/master/LICENSE (GPL 2.0)
 *------------------------------------------------------------- *)

{-----------------------------------------------
  register HelloController inside
  dependency container
------------------------------------------------}
container.add('helloController', THelloControllerFactory.create());

{-----------------------------------------------
  register HelloJsonController inside
  dependency container
------------------------------------------------}
container.add('helloJsonController', THelloJsonControllerFactory.create());
