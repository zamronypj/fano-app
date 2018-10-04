unit AppConfigFactoryImpl;

interface

uses
    ConfigFactoryIntf,
    DependencyAwareIntf,
    DependencyContainerIntf,
    DependencyFactoryIntf,
    FactoryImpl;

type
    {------------------------------------------------
     interface for any class having capability to
     get config
     @author Zamrony P. Juhara <zamronypj@yahoo.com>
    -----------------------------------------------}
    TWebAppConfigFactory = class (TFactory, IWebConfigurationFactory, IDependencyFactory)
    private
        configFilename : string;
    public
        constructor create(const dc : IDependencyContainer; const configFile :string);
        function build() : IDependencyAware; override;
    end;

implementation

uses
    AppConfig;

    constructor TWebAppConfigFactory.create(const dc : IDependencyContainer; const configFile : string);
    begin
        inherited create(dc);
        configFilename := configFile;
    end;

    function TWebAppConfigFactory.build() : IDependencyAware;
    begin
        result := TWebAppConfig.create(configFilename);
    end;

end.
