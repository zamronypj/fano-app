unit HelloController;

interface

uses
    ResponseIntf,
    RequestIntf,
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
        result := gView.render(viewParams, response);
    end;

end.
