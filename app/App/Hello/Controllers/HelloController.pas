(*!------------------------------------------------------------
 * Fano Web Framework Skeleton Application (https://fanoframework.github.io)
 *
 * @link      https://github.com/fanoframework/fano-app
 * @copyright Copyright (c) 2018 Zamrony P. Juhara
 * @license   https://github.com/fanoframework/fano-app/blob/master/LICENSE (GPL 3.0)
 *------------------------------------------------------------- *)
unit HelloController;

interface

uses

    fano;

type

    (*!-----------------------------------------------
     * controller that handle route :
     * / (GET)
     * /hello/{name} (GET)
     * /hello/{name} (POST)
     *
     * See Routes/Hello/routes.inc
     *
     * @author Zamrony P. Juhara <zamronypj@yahoo.com>
     *------------------------------------------------*)
    THelloController = class(TController)
    public
        function handleRequest(
            const request : IRequest;
            const response : IResponse;
            const args : IRouteArgsReader
        ) : IResponse; override;
    end;

implementation

    function THelloController.handleRequest(
        const request : IRequest;
        const response : IResponse;
        const args : IRouteArgsReader
    ) : IResponse;
    var placeHolders : TArrayOfPlaceholders;
        i:integer;
    begin
        (*!------------------------------------
         * get route arguments as array
         * for route pattern /hello/{firstName}/{lastName}/is/nice
         * and actual url /hello/John/Doe/is/nice
         * placeHolders will contains array of
         * [
         *    { name: 'firstName', value : 'John'}
         *    { name: 'lastName', value : 'Doe'}
         * ]
         *--------------------------------------*)
        placeHolders := args.getArgs();

        for i:=0 to length(placeholders)-1 do
        begin
            fViewParams.setVar(placeholders[i].name, placeholders[i].value);
        end;
        result := inherited handleRequest(request, response, args);
    end;

end.
