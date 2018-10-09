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
    DependencyContainerIntf,
    ConfigIntf,
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
    appConfig : IAppConfiguration;

    procedure buildRoute(
        const routerInst : IRouteCollection;
        const middlewaresInst : IMiddlewareCollectionAware;
        const cfg : IAppConfiguration;
        const container : IDependencyContainer
    );
    begin
        routerInst.get(
            '/',
            THelloController.create(
                middlewaresInst.getBeforeMiddlewares(),
                middlewaresInst.getBeforeMiddlewares(),
                TTemplateFileView.create(
                    container.get('outputBuffer') as IOutputBuffer,
                    container.get('templateParser') as ITemplateParser,
                    extractFilePath(getCurrentDir()) + '/Templates/Hello/index.html'
                ),
                (TViewParameters.create())
                    .setVar('baseUrl', cfg.getString('baseUrl'))
                    .setVar('name', 'Fano')
                    .setVar('appName', 'Fano Web Framework')
            )
        );
    end;

initialization

    try
        router := appDependencyContainer.get('router') as IRouteCollection;
        routeMiddlewares := appDependencyContainer.get('routeMiddlewares') as IMiddlewareCollectionAware;
        appConfig := appDependencyContainer.get('config') as IAppConfiguration;
        buildRoute(router, routeMiddlewares, appConfig, appDependencyContainer);
    except
        router := nil;
        routeMiddlewares := nil;
        appConfig := nil;
        raise;
    end;

finalization
    router := nil;
    routeMiddlewares := nil;
    appConfig := nil;
end.
