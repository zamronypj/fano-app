(*!------------------------------------------------------------
 * Fano Web Framework Skeleton Application (https://fanoframework.github.io)
 *
 * @link      https://github.com/fanoframework/fano-app
 * @copyright Copyright (c) 2018 Zamrony P. Juhara
 * @license   https://github.com/fanoframework/fano-app/blob/master/LICENSE (GPL 3.0)
 *------------------------------------------------------------- *)
program app;

uses

    fano,
    myapp;

var
    appInstance : IWebApplication;

begin
    (*!-----------------------------------------------
     * Bootstrap application
     *
     * @author Zamrony P. Juhara <zamronypj@yahoo.com>
     *------------------------------------------------*)
    appInstance := TCgiWebApplication.create(
        TMyAppServiceProvider.create(),
        TMyAppRoutes.create()
    );
    appInstance.run();
end.
