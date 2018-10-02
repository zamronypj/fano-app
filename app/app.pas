{-----------------------------------------------
 Bootstrap application
 @author Zamrony P. Juhara <zamronypj@yahoo.com>
------------------------------------------------}
program app;

uses fano, ConfigImpl, di;

type
    TWebApp = class(TFanoWebApplication)
    end;

    TWebAppConfig = class(TFanoConfig)
    end;
var
    appInstance : IWebApplication;
    appConfig : IWebAppConfiguration;

begin
   try
       appConfig := TWebAppConfig.create('../config/config.json');
       appDI := TDependencyContainer.create('../config/config.json');
       appInstance := TWebApp.create(appConfig);
       appInstance.run();
   finally
       appConfig := nil;
       appInstance := nil;
   end;
end.
