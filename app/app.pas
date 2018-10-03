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

    {------------------------------------
    Base application Bootstrap
    @author Zamrony P. Juhara <zamronypj@yahoo.com>
    -------------------------------------}
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
        appInstance := nil;
    end;
end.
