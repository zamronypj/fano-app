unit AppConfigFactoryImpl;

interface

uses
    ConfigIntf,
    ConfigFactoryIntf,
    DependencyAwareIntf,
    DependencyContainerIntf,
    DependencyFactoryIntf;

type
    {------------------------------------------------
     interface for any class having capability to
     get config
     @author Zamrony P. Juhara <zamronypj@yahoo.com>
    -----------------------------------------------}
    TWebAppConfigFactory = class (TInterfacedObject, IWebConfigurationFactory, IDependencyFactory)
    private
        configFilename : string;
        dependencyContainer : IDependencyContainer;
    public
        constructor create(const dc : IDependencyContainer; const configFile :string);
        destructor destroy(); override;
        function build() : IDependencyAware;
    end;

implementation

uses
    AppConfig;

    constructor TWebAppConfigFactory.create(const dc : IDependencyContainer; const configFile : string);
    begin
        dependencyContainer := dc;
        configFilename := configFile;
    end;

    destructor TWebAppConfigFactory.destroy();
    begin
        dependencyContainer := nil;
    end;

    function TWebAppConfigFactory.build() : IDependencyAware;
    begin
        result := TWebAppConfig.create(configFilename);
    end;

end.
