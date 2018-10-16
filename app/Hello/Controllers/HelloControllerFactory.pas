unit HelloControllerFactory;

interface

uses
    DependencyContainerIntf,
    DependencyIntf,
    DependencyFactoryIntf,
    FactoryImpl;

type

    THelloControllerFactory = class(TFactory, IDependencyFactory)
    private
        container : IDependencyContainer;
    public

        constructor create(const containerInst : IDependencyContainer);
        destructor destroy(); override;
        function build() : IDependency; override;
        procedure cleanUp(); override;
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

    constructor THelloControllerFactory.create(const containerInst : IDependencyContainer);
    begin
        container := containerInst;
    end;

    destructor THelloControllerFactory.destroy();
    begin
        inherited destroy();
        cleanUp();
    end;

    function THelloControllerFactory.build() : IDependency;
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
            cleanUp();
        end;
    end;

    procedure THelloControllerFactory.cleanUp();
    begin
        //release our reference to container to avoid memory leak
        container := nil;
    end;

end.
