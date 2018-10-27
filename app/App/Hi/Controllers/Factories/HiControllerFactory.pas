(*!------------------------------------------------------------
 * Fano Web Framework Skeleton Application (https://fano.juhara.id)
 *
 * @link      https://github.com/zamronypj/fano-app
 * @copyright Copyright (c) 2018 Zamrony P. Juhara
 * @license   https://github.com/zamronypj/fano-app/blob/master/LICENSE (GPL 2.0)
 *------------------------------------------------------------- *)
unit HiControllerFactory;

interface

uses
    DependencyContainerIntf,
    DependencyIntf,
    FactoryImpl;

type

    THiControllerFactory = class(TFactory, IDependencyFactory)
    public
        function build(const container : IDependencyContainer) : IDependency; override;
    end;

implementation

uses
    sysutils,

    {*! -------------------------------
        unit interfaces
    ----------------------------------- *}
    MiddlewareCollectionAwareIntf,
    HiController;

    function THiControllerFactory.build(const container : IDependencyContainer) : IDependency;
    var routeMiddlewares : IMiddlewareCollectionAware;
    begin
        routeMiddlewares := container.get('routeMiddlewares') as IMiddlewareCollectionAware;
        try
            result := THiController.create(
                routeMiddlewares.getBefore(),
                routeMiddlewares.getAfter()
            );
        finally
            routeMiddlewares := nil;
        end;
    end;
end.
