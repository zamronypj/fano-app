(*!------------------------------------------------------------
 * Fano Web Framework Skeleton Application (https://fano.juhara.id)
 *
 * @link      https://github.com/zamronypj/fano-app
 * @copyright Copyright (c) 2018 Zamrony P. Juhara
 * @license   https://github.com/zamronypj/fano-app/blob/master/LICENSE (GPL 2.0)
 *------------------------------------------------------------- *)
unit HelloControllerFactory;

interface

uses
    DependencyContainerIntf,
    DependencyIntf,
    FactoryImpl;

type

    THelloControllerFactory = class(TFactory, IDependencyFactory)
    public
        function build(const container : IDependencyContainer) : IDependency; override;
    end;

implementation

uses
    sysutils,

    {*! -------------------------------
        unit interfaces
    ----------------------------------- *}
    RouteMatcherIntf,
    RouteCollectionIntf,
    MiddlewareCollectionAwareIntf,
    ConfigIntf,
    OutputBufferIntf,
    TemplateParserIntf,

    HelloController,
    TemplateParserFactoryImpl,
    TemplateFileViewImpl,
    ViewParametersIntf,
    LoggerIntf,
    ViewIntf;

    function THelloControllerFactory.build(const container : IDependencyContainer) : IDependency;
    var routeMiddlewares : IMiddlewareCollectionAware;
        config : IAppConfiguration;
        viewParams : IViewParameters;
        logger : ILogger;
        tmplView : IView;
    begin
        routeMiddlewares := container.get('routeMiddlewares') as IMiddlewareCollectionAware;
        config := container.get('config') as IAppConfiguration;
        viewParams := container.get('viewParams') as IViewParameters;
        logger := container.get('logger') as ILogger;
        tmplView := TTemplateFileView.create(
            container.get('outputBuffer') as IOutputBuffer,
            container.get('templateParser') as ITemplateParser,
            extractFileDir(getCurrentDir()) + '/Templates/Hello/index.html'
        );
        try
            try
            result := THelloController.create(
                routeMiddlewares.getBefore(),
                routeMiddlewares.getAfter(),
                tmplView,
                viewParams
                    .setVar('baseUrl', config.getString('baseUrl'))
                    .setVar('name', 'Fano')
                    .setVar('appName', config.getString('appName')),
                logger
            );
            except
                result :=nil;
                raise;
            end;
        finally
            routeMiddlewares := nil;
            config := nil;
            viewParams := nil;
            logger := nil;
            tmplView := nil;
        end;
    end;
end.
