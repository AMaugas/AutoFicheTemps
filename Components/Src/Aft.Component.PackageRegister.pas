unit Aft.Component.PackageRegister;

interface

procedure Register;

implementation

uses
  System.Classes,
  TreeIntf,

  Aft.Component.View.Task;

procedure Register;
begin
  RegisterComponents(
    'AftComponents',
    [TAftTaskView]);
  RegisterSprigType(
    TAftTaskView,
    TComponentSprig);
end;

end.
