unit MiddlewareIntf;

interface

uses

type
    {------------------------------------------------
     interface for any class having capability to
     handler route
     @author Zamrony P. Juhara <zamronypj@yahoo.com>
    -----------------------------------------------}
    IMiddleware = interface
        ['{E0ECB41C-8D8F-41C1-9FAC-7DFBD06ED8D4}']
        function handleChainedRequest(
            const request : IRequest;
            const response : IResponse;
            const nextMiddleware : IMiddleware
        ) : IResponse;
    end;

implementation
end.
