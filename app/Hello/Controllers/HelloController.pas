unit HelloController;

interface

uses
    ResponseIntf,
    RequestIntf,
    RouteHandlerIntf,
    ControllerImpl;

type

    THelloController = class(TController)
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
    begin
        result := gView.render('views/template/home.html', response);
    end;

end.
