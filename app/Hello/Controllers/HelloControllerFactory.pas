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
    ViewParametersImpl;

    function THelloControllerFactory.build(const container : IDependencyContainer) : IDependency;
    var routeMiddlewares : IMiddlewareCollectionAware;
        config : IAppConfiguration;
    begin
        routeMiddlewares := container.get('routeMiddlewares') as IMiddlewareCollectionAware;
        config := container.get('config') as IAppConfiguration;
        try
            result := THelloController.create(
                routeMiddlewares.getBeforeMiddlewares(),
                routeMiddlewares.getAfterMiddlewares(),
                TTemplateFileView.create(
                    container.get('outputBuffer') as IOutputBuffer,
                    container.get('templateParser') as ITemplateParser,
                    extractFilePath(getCurrentDir()) + '/Templates/Hello/index.html'
                ),
                (TViewParameters.create())
                    .setVar('baseUrl', config.getString('baseUrl'))
                    .setVar('name', 'Fano')
                    .setVar('appName', config.getString('appName'))
            );
        finally
            routeMiddlewares := nil;
            config := nil;
        end;
    end;
end.
