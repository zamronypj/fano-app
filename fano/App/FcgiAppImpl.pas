{*!
 * Fano Web Framework (https://fano.juhara.id)
 *
 * @link      https://github.com/zamronypj/fano
 * @copyright Copyright (c) 2018 Zamrony P. Juhara
 * @license   https://github.com/zamronypj/fano/blob/master/LICENSE (GPL 2.0)
 *}

unit FcgiAppImpl;

interface

uses

    RunnableIntf,
    FcgiEnvirontmentIntf,
    AppIntf;

type

    {*!
     * Adapter class that turn CGI application into FastCGI application
     *
     * @author Zamrony P. Juhara <zamronypj@yahoo.com>
     *}
    TFcgiWebApplication = class(TInterfacedObject, IWebApplication, IRunnable)
    private
        cgiApp : IWebApplication;
        fastCgiEnv : IFCGIEnvironment;

        function initFastCgiEnv(const env :IFCGIEnvironment): IFCGIEnvironment;
        function acceptRequest(const env :IFCGIEnvironment) : boolean;
        function isCgiRequest(const env :IFCGIEnvironment) : boolean;
        procedure runFastCgiLoop(const env :IFCGIEnvironment);
        procedure parseRequestAndSetupCgiEnv(const env :IFCGIEnvironment);
    public
        constructor create(const actualApp : IWebApplication);
        destructor destroy(); override;
        function run() : IRunnable;
    end;

implementation

    constructor TFcgiWebApplication.create(
        const actualApp : IWebApplication
        const env : IFCGIEnvironment
    );
    begin
        cgiApp := actualApp;
        fastCgiEnv := env;
    end;

    destructor TFcgiWebApplication.destroy();
    begin
        inherited destroy();
        cgiApp := nil;
        fastCgiEnv := nil;
    end;

    function TFcgiWebApplication.initFastCgiEnv(
        const env :IFCGIEnvironment
    ): IFCGIEnvironment;
    begin
        //TODO: implement initFastCgiEnv()
        result := env;
    end;

    function TFcgiWebApplication.acceptRequest(const env : IFCGIEnvironment) : boolean;
    begin
        //TODO: implement acceptRequest()
        result := false;
    end;

    function TFcgiWebApplication.isCgiRequest(const env : IFCGIEnvironment) : boolean;
    begin
        //TODO: implement isCgiRequest()
        result := true;
    end;

    procedure TFcgiWebApplication.runFastCgiLoop(const env : IFCGIEnvironment);
    begin
        while (acceptRequest(env)) do
        begin
            parseRequestAndSetupCgiEnv(env);
            app.run();
        end;
    end;

    procedure TFcgiWebApplication.parseRequestAndSetupCgiEnv(const env : IFCGIEnvironment);
    begin
        //TODO: implement parseRequestAndSetupCgiEnv()
    end;

    function TFcgiWebApplication.run() : IRunnable;
    begin
        fastCgiEnv:= initFastCgiEnv(fastCgiEnv);
        if (isCgiRequest(fastCgiEnv)) then
        begin
            //run app as ordinary CGI App and exit when done
            cgiApp.run();
        end else
        begin
            //run as FastCGI
            runFastCgiLoop(fastCgiEnv);
        end;
        result := self;
    end;

end.