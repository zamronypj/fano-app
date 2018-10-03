{-----------------------------------------------
 Bootstrap application
 @author Zamrony P. Juhara <zamronypj@yahoo.com>
------------------------------------------------}
program app;

uses
    AppImpl,
    ConfigImpl,
    AppConfig,
    di;

type
    TWebApp = class(TFanoWebApplication)
    end;

var
    appInstance : IWebApplication;

begin
    try
        appInstance := TWebApp.create(
            appDI.get('config'),
            appDI.get('dispatcher'),
            appDI.get('environment'),
            appDI.get('router'),
            appDI
        );
        appInstance.run();
    finally
        appConfig := nil;
        appInstance := nil;
    end;
end.
