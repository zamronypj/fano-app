{-----------------------------------------------
 Register application routes

 @author Zamrony P. Juhara <zamronypj@yahoo.com>
------------------------------------------------}
unit routes;

interface

implementation

uses
    sysutils,
    di,
    RouteCollectionIntf,
    MiddlewareCollectionIntf,
    MiddlewareCollectionAwareIntf,
    TemplateFileViewImpl,
    ViewParamsImpl,
    OutputBufferIntf,
    TemplateParserImpl,
    RegexImpl,
    HelloController;

var router : IRouteCollection;
    routeMiddlewares : IMiddlewareCollectionAware;

initialization

    router := appDependencyContainer.get('router') as IRouteCollection;
    routeMiddlewares := appDependencyContainer.get('routeMiddlewares') as IMiddlewareCollectionAware;
    {$include home/routes.inc}

finalization
    router := nil;
    routeMiddlewares := nil;
end.
