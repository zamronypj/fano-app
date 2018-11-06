(*!------------------------------------------------------------
 * Fano Web Framework Skeleton Application (https://fanoframework.github.io)
 *
 * @link      https://github.com/fanoframework/fano-app
 * @copyright Copyright (c) 2018 Zamrony P. Juhara
 * @license   https://github.com/fanoframework/fano-app/blob/master/LICENSE (GPL 3.0)
 *------------------------------------------------------------- *)
unit HelloControllerFactory;

interface

uses
    fano;

type

    THelloControllerFactory = class(TFactory, IDependencyFactory)
    public
        function build(const container : IDependencyContainer) : IDependency; override;
    end;

implementation

uses
    sysutils,

    HelloController;

    function THelloControllerFactory.build(const container : IDependencyContainer) : IDependency;
    var routeMiddlewares : IMiddlewareCollectionAware;
        config : IAppConfiguration;
        viewParams : IViewParameters;
        tmplView : IView;
    begin
        routeMiddlewares := container.get('routeMiddlewares') as IMiddlewareCollectionAware;
        config := container.get('config') as IAppConfiguration;
        viewParams := container.get('viewParams') as IViewParameters;
        tmplView := TTemplateFileView.create(
            container.get('headers') as IHeaders,
            container.get('outputBuffer') as IOutputBuffer,
            container.get('templateParser') as ITemplateParser,
            extractFileDir(getCurrentDir()) + '/Templates/Hello/index.html'
        );
        try
            result := THelloController.create(
                routeMiddlewares.getBefore(),
                routeMiddlewares.getAfter(),
                tmplView,
                viewParams
                    .setVar('baseUrl', config.getString('baseUrl'))
                    .setVar('name', 'Fano')
                    .setVar('appName', config.getString('appName'))
            );
        finally
            routeMiddlewares := nil;
            config := nil;
            viewParams := nil;
            tmplView := nil;
        end;
    end;
end.
