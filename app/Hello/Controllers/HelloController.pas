(*!------------------------------------------------------------
 * Fano Web Framework Skeleton Application (https://fano.juhara.id)
 *
 * @link      https://github.com/zamronypj/fano-app
 * @copyright Copyright (c) 2018 Zamrony P. Juhara
 * @license   https://github.com/zamronypj/fano-app/blob/master/LICENSE (GPL 2.0)
 *------------------------------------------------------------- *)
unit HelloController;

interface

uses

    DependencyIntf,
    RequestIntf,
    ResponseIntf,
    LoggerIntf,
    MiddlewareCollectionIntf,
    ViewIntf,
    ViewParametersIntf,
    ControllerImpl;

type

    THelloController = class(TController, IDependency)
    private
        logger : ILogger;
    public
        constructor create(
            const beforeMiddlewares : IMiddlewareCollection;
            const afterMiddlewares : IMiddlewareCollection;
            const viewInst : IView;
            const viewParamsInst : IViewParameters;
            const loggerInst : ILogger
        );
        destructor destroy(); override;

        function handleRequest(
            const request : IRequest;
            const response : IResponse
        ) : IResponse; override;
    end;

implementation

uses

    PlaceholderTypes;

    constructor THelloController.create(
        const beforeMiddlewares : IMiddlewareCollection;
        const afterMiddlewares : IMiddlewareCollection;
        const viewInst : IView;
        const viewParamsInst : IViewParameters;
        const loggerInst : ILogger
    );
    begin
        inherited create(
            beforeMiddlewares,
            afterMiddlewares,
            viewInst,
            viewParamsInst
        );
        logger := loggerInst;
    end;
    destructor THelloController.destroy();
    begin
        logger:= nil;
    end;

    function THelloController.handleRequest(
          const request : IRequest;
          const response : IResponse
    ) : IResponse;
    var placeHolders : TArrayOfPlaceholders;
        i:integer;
    begin
        logger.info('handle request');
        placeHolders := getArgs();
        for i:=0 to length(placeholders)-1 do
        begin
            viewParams.setVar(placeholders[i].phName, placeholders[i].phValue);
        end;
        result := inherited handleRequest(request, response);
    end;

end.
