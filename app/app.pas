{-----------------------------------------------
 Bootstrap application
 @author Zamrony P. Juhara <zamronypj@yahoo.com>
------------------------------------------------}
program app;

uses fano, ConfigImpl;

type
    TWebApp = class(TFanoWebApplication)
    end;

    TWebAppConfig = class(TFanoConfig)
    end;
var
    appInstance : TWebApp;
    appConfig : TWebAppConfig;

begin
   try
       appConfig := TWebAppConfig.create('../config/config.json');
       appInstance := TWebApp.create(appConfig);
       appInstance.run();
   finally
       appConfig.free();
       appInstance.free();
   end;
end.
