(*!------------------------------------------------------------
 * Fano Web Framework Skeleton Application (https://fanoframework.github.io)
 *
 * @link      https://github.com/fanoframework/fano-app
 * @copyright Copyright (c) 2018 Zamrony P. Juhara
 * @license   https://github.com/fanoframework/fano-app/blob/master/LICENSE (GPL 3.0)
 *------------------------------------------------------------- *)
unit HiController;

interface

uses

    fano;

type

    (*!-----------------------------------------------
     * controller that handle route :
     * /hi/{name} (POST)
     *
     * See Routes/Hi/routes.inc
     *
     * @author Zamrony P. Juhara <zamronypj@yahoo.com>
     *------------------------------------------------*)
    THiController = class(TRouteHandler, IDependency)
    public
        function handleRequest(
            const request : IRequest;
            const response : IResponse
        ) : IResponse; override;
    end;

implementation

    function THiController.handleRequest(
          const request : IRequest;
          const response : IResponse
    ) : IResponse;
    var strName : string;
    begin
        (*!------------------------------------
         * get single data sent from POST
         * for route pattern /hi/{name}
         * and actual url /hi/John
         * and POST data
         * name=Joko&lastName=Widowo
         * strName will contain string 'Joko'
         *--------------------------------------*)
        strName := request.getParsedBodyParam('name');
        result := TJsonResponse.create(response.headers(), '{"name":"'+ strName +'"}');
    end;

end.
