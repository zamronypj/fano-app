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
    TemplateFileViewImpl,
    ViewParamsImpl,
    OutputBufferIntf,
    TemplateParserImpl,
    RegexImpl,
    HelloController;

var router : IRouteCollection;

initialization

    router := appDependencyContainer.get('router') as IRouteCollection;
    {$include home/routes.inc}

finalization
    router := nil;
end.
