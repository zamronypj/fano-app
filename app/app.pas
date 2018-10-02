program app;

uses fano;

type
    TWebApp = class(TFanoApplication)
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
