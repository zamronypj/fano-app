(*!------------------------------------------------------------
 * Fano Web Framework Skeleton Application (https://fanoframework.github.io)
 *
 * @link      https://github.com/fanoframework/fano-app
 * @copyright Copyright (c) 2018 Zamrony P. Juhara
 * @license   https://github.com/fanoframework/fano-app/blob/master/LICENSE (GPL 3.0)
 *------------------------------------------------------------- *)
unit myapp;

interface

uses

    fano;

type

    TMyAppServiceProvider = class(TBasicServiceProvider)
    public
        procedure register(const container : IDependencyContainer); override;
        procedure buildRoutes(const router : IRouter); override;
    end;

implementation

uses
    sysutils,

    {*! -------------------------------
        controllers factory
    ----------------------------------- *}
    HelloControllerFactory,
    HelloJsonControllerFactory,
    HiControllerFactory;


    procedure TMyAppServiceProvider.buildDependencies(const container : IDependencyContainer);
    begin
        {$INCLUDE Dependencies/dependencies.inc}
    end;

    procedure TMyAppServiceProvider.buildRoutes(const router : IRouter);
    begin
        {$INCLUDE Routes/routes.inc}
    end;
end.
