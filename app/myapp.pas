unit myapp;

interface

type

    TMyApp = class(TFanoWebApplication)
    protected
        function buildRoutes(const container : IDependencyContainer) : IRunnable; override;

    end;

implementation

    function TMyApp.buildRoutes(const container : IDependencyContainer) : IRunnable; override;
    begin

    end;

end.