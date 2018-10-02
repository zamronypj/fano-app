{-----------------------------------------------
 Bootstrap application
 @author Zamrony P. Juhara <zamronypj@yahoo.com>
------------------------------------------------}
unit di;

interface

uses
    DependencyAwareIntf,
    DependencyContainerIntf,
    DependencyContainerImpl;

type

    TServiceContainer = class(TDependencyContainer)
    end;

var
    appDI : IDependencyContainer;

implementation

uses
    RouteCollectionFactoryImpl;

initialization

    appDI := TServiceContainer.create();
    appDI.add('router', TRouterCollectionFactory.create());

finalization
    appDI := nil;
end.
