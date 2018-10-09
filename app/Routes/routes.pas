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
    TemplateParserIntf,
    ViewParamsImpl,
    OutputBufferIntf,
    HelloController;

var router : IRouteCollection;
    routeMiddlewares : IMiddlewareCollectionAware;

initialization

    try
        router := appDependencyContainer.get('router') as IRouteCollection;
        routeMiddlewares := appDependencyContainer.get('routeMiddlewares') as IMiddlewareCollectionAware;
        {$INCLUDE home/routes.inc}
    except
        router := nil;
        routeMiddlewares := nil;
    end;

finalization
    router := nil;
    routeMiddlewares := nil;
end.
