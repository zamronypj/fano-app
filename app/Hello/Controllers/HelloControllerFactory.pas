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
        //we hold global container instance.
        //This cause memory leak if after build we do not set it to nil
        //TODO: need to fix this
        container := containerInst;
    end;

    destructor THelloControllerFactory.destroy();
    begin
        inherited destroy();
        container := nil;
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
            //TODO: here we need to set to nil to avoid memory leak
            //TODO: if build() called multiple times for example when called
            //TODO: with container.factory(). This will cause  access violation
            container := nil;
        end;
    end;

end.
