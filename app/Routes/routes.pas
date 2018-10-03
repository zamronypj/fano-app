{-----------------------------------------------
 Register application routes

 @author Zamrony P. Juhara <zamronypj@yahoo.com>
------------------------------------------------}
unit routes;

interface

implementation

uses
    di,
    RouteCollectionIntf,
    HelloController;

var router : IRouteCollection;

initialization

    router := appDependencyContainer.get('router') as IRouteCollection;
    router.get('/', THelloController.create());

finalization
    router := nil;
end.
