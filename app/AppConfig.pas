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
    TWebAppConfig = class(TFanoConfig, IDependencyAware)
    public
    end;

    TWebAppConfigFactory = class(TFanoConfigFactory)
    public
        function build() : IDependencyAware;
    end;

implementation

    function TWebAppConfigFactory.build() : IDependencyAware;
    begin
        result := TWebAppConfig.create('../config/config.json');
    end;
end.
