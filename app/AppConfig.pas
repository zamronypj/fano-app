unit AppConfig;

interface

uses
    AppImpl,
    ConfigImpl,
    DependencyAwareIntf,
    di;

type
    {-----------------------------------------------
    Application global configuration
    @author Zamrony P. Juhara <zamronypj@yahoo.com>
    ------------------------------------------------}
    TWebAppConfig = class(TFanoConfig)
    public
    end;

implementation
end.
