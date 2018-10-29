(*!------------------------------------------------------------
 * Fano Web Framework Skeleton Application (https://fano.juhara.id)
 *
 * @link      https://github.com/zamronypj/fano-app
 * @copyright Copyright (c) 2018 Zamrony P. Juhara
 * @license   https://github.com/zamronypj/fano-app/blob/master/LICENSE (GPL 3.0)
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
