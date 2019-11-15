(*!------------------------------------------------------------
 * Fano Web Framework Skeleton Application (https://fanoframework.github.io)
 *
 * @link      https://github.com/fanoframework/fano-app
 * @copyright Copyright (c) 2018 Zamrony P. Juhara
 * @license   https://github.com/fanoframework/fano-app/blob/master/LICENSE (GPL 3.0)
 *------------------------------------------------------------- *)
unit HelloJsonController;

interface

uses

    fano;

type

    (*!-----------------------------------------------
     * controller that handle route :
     * /hello/{name}/json (GET)
     *
     * See Routes/Hello/routes.inc
     *
     * @author Zamrony P. Juhara <zamronypj@yahoo.com>
     *------------------------------------------------*)
    THelloJsonController = class(TAbstractController)
    public
        function handleRequest(
            const request : IRequest;
            const response : IResponse;
            const args : IRouteArgsReader
        ) : IResponse; override;
    end;

implementation

    function THelloJsonController.handleRequest(
        const request : IRequest;
        const response : IResponse;
        const args : IRouteArgsReader
    ) : IResponse;
    var placeholder : TPlaceholder;
    begin
        (*!------------------------------------
         * get single route argument
         * for route pattern /hello/{name}/json
         * and actual url /hello/John/json
         * placeHolder will contains
         * { name : 'name', value : 'John'}
         *--------------------------------------*)
        placeholder := args.getArg('name');
        result := TJsonResponse.create(response.headers(), '{"'+ placeholder.name +'":"'+ placeholder.value +'"}');
    end;

end.
