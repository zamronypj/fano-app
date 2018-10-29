(*!------------------------------------------------------------
 * Fano Web Framework Skeleton Application (https://fano.juhara.id)
 *
 * @link      https://github.com/zamronypj/fano-app
 * @copyright Copyright (c) 2018 Zamrony P. Juhara
 * @license   https://github.com/zamronypj/fano-app/blob/master/LICENSE (GPL 3.0)
 *------------------------------------------------------------- *)
unit HelloJsonController;

interface

uses

    DependencyIntf,
    RequestIntf,
    ResponseIntf,
    RouteHandlerImpl;

type

    THelloJsonController = class(TRouteHandler, IDependency)
    public
        function handleRequest(
            const request : IRequest;
            const response : IResponse
        ) : IResponse; override;
    end;

implementation

uses

    JsonResponseImpl,
    PlaceholderTypes;

    function THelloJsonController.handleRequest(
          const request : IRequest;
          const response : IResponse
    ) : IResponse;
    var placeholder : TPlaceholder;
    begin
        placeholder := getArg('name');
        result := TJsonResponse.create(response.headers(), '{"'+ placeholder.phName +'":"'+ placeholder.phValue +'"}');
    end;

end.
