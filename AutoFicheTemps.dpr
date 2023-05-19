// JCL_DEBUG_EXPERT_GENERATEJDBG ON
// JCL_DEBUG_EXPERT_INSERTJDBG ON
// JCL_DEBUG_EXPERT_DELETEMAPFILE ON
program AutoFicheTemps;

uses
  Vcl.Forms,
  AFT.View.Main in 'Src\Views\AFT.View.Main.pas' {AppView},
  AFT.AppMain in 'Src\AFT.AppMain.pas',
  AFT.TaskCategory in 'Src\Types\AFT.TaskCategory.pas',
  AFT.Model.Task in 'Src\Models\AFT.Model.Task.pas',
  AFT.Model.Task.Intf in 'Src\Models\Interfaces\AFT.Model.Task.Intf.pas';

{$R *.res}
{$APPTYPE CONSOLE}

var
  AppView: TAppView;
  AppMain: TAftMainApp;

begin
  System.ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.CreateForm(TAppView, AppView);
  AppMain := TAftMainApp.Create(AppView);

  Application.Run;

  AppMain.Free;

end.
