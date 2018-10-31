(*!------------------------------------------------------------
 * Fano Web Framework Skeleton Application (https://fano.juhara.id)
 *
 * @link      https://github.com/zamronypj/fano-app
 * @copyright Copyright (c) 2018 Zamrony P. Juhara
 * @license   https://github.com/zamronypj/fano-app/blob/master/LICENSE (GPL 3.0)
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
    THelloController = class(TController, IDependency)
    public
        function handleRequest(
            const request : IRequest;
            const response : IResponse
        ) : IResponse; override;
    end;

implementation

    function THelloController.handleRequest(
          const request : IRequest;
          const response : IResponse
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
         *    { phName: 'firstName', phValue : 'John'}
         *    { phName: 'lastName', phValue : 'Doe'}
         * ]
         *--------------------------------------*)
        placeHolders := getArgs();

        for i:=0 to length(placeholders)-1 do
        begin
            viewParams.setVar(placeholders[i].phName, placeholders[i].phValue);
        end;
        result := inherited handleRequest(request, response);
    end;

end.
