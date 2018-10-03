unit HelloController;

interface

uses
    ResponseIntf,
    RequestIntf,
    RouteHandlerIntf,
    Controller;

type

    THelloController = class(TController)
    private
        gView : IView;
    public
        constructor create(const viewInst : IView);
        destructor destroy(); override;

        function handleRequest(
              const request : IRequest;
              const response : IResponse
        ) : IResponse; override;
    end;

implementation

    constructor THelloController.create(const viewInst : IView);
    begin
        gView := viewInst;
    end;

    destructor destroy(); override;
    begin
        gView := nil;
    end;

    function THelloController.handleRequest(
          const request : IRequest;
          const response : IResponse
    ) : IResponse;
    begin
        result := gView.render('views/template/home.html', response);
    end;

end.
