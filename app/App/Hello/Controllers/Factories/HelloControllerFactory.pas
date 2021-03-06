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
    var config : IAppConfiguration;
        viewParams : IViewParameters;
        tmplView : IView;
    begin
        config := container.get('config') as IAppConfiguration;
        viewParams := container.get('viewParams') as IViewParameters;
        tmplView := TTemplateView.create(
            extractFileDir(getCurrentDir()) + '/app/Templates/Hello/index.html',
            container.get('templateParser') as ITemplateParser,
            container.get('fileReader') as IFileReader
        );
        try
            viewParams['baseUrl'] := config.getString('baseUrl');
            result := THelloController.create(
                tmplView,
                viewParams
                    //.setVar('baseUrl', config.getString('baseUrl'))
                    .setVar('name', 'Fano')
                    .setVar('appName', config.getString('appName'))
            );
        finally
            config := nil;
            viewParams := nil;
            tmplView := nil;
        end;
    end;
end.
