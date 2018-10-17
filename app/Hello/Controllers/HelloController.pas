unit HelloController;

interface

uses

    DependencyIntf,
    ControllerImpl;

type

    THelloController = class(TController, IDependency)
    end;

implementation

end.
