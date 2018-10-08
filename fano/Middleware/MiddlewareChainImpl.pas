unit MiddlewareChainImpl;

interface

uses
    MiddlewareIntf,
    MiddlewareChainIntf,
    RequestHandlerIntf,
    RequestIntf,
    ResponseIntf,
    MiddlewareCollectionIntf;

type

    PMiddlewareChainRec = ^TMiddlewareChainRec;
    TMiddlewareChainRec = record
        mw : IMiddleware;
        next : PMiddlewareChainRec;
    end;

    {------------------------------------------------
     interface for any class having capability to
     manage one or more middlewares
     @author Zamrony P. Juhara <zamronypj@yahoo.com>
    -----------------------------------------------}
    TMiddlewareChain = class(TInterfacedObject, IMiddlewareChain)
    private
        chain : PMiddlewareChainRec;
    public
        constructor create(const middlewares : IMiddlewareCollection);
        destructor destroy(); override;

        function executeChain() : IResponse;
    end;

implementation

    constructor TMiddlewareChain.create(const middlewares : IMiddlewareCollection);
    var item : PMiddlewareChainRec;
    begin
        middlewareList := middlewares;
        chain := nil;
        for i:=0 to len-2 do
        begin
            if (chain = nil) then
            begin
              new(chain);
              chain^.current := middlewareList.get(i);
              chain^.next := nil;
            end;
        end;
    end;

    destructor TMiddlewareChain.destroy();
    var chain :PMiddlewareChainRec;
    begin
        inherited destroy();
        for i:=len-1 downto 0 do
        begin
            chain := chainList[i];
            chain^.current := nil;
            chain^.next := nil;
            dispose(chain);
            chainList.delete(i);
        end;
        chainList.free();
    end;

    function TMiddlewareChain.executeChain() : IResponse;
    begin
        chain^.current.handleChainedRequest(request, response, chain^.next);
    end;


end.
