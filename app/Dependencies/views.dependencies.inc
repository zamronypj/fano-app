(*!------------------------------------------------------------
 * Fano Web Framework Skeleton Application (https://fanoframework.github.io)
 *
 * @link      https://github.com/fanoframework/fano-app
 * @copyright Copyright (c) 2018 Zamrony P. Juhara
 * @license   https://github.com/fanoframework/fano-app/blob/master/LICENSE (GPL 3.0)
 *------------------------------------------------------------- *)

{-----------------------------------------------
   setup headers instance
 ------------------------------------------------}
container.add('headers', THeadersFactory.create());

{-----------------------------------------------
  setup output buffer instance
------------------------------------------------}
container.add('outputBuffer', TOutputBufferFactory.create());

{-----------------------------------------------
  setup html template parser
------------------------------------------------}
container.add('templateParser', TSimpleTemplateParserFactory.create());

{-----------------------------------------------
  setup global view parameters
------------------------------------------------}
container.add('viewParams', TViewParametersFactory.create());
