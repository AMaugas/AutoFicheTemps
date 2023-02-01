// JCL_DEBUG_EXPERT_GENERATEJDBG ON
// JCL_DEBUG_EXPERT_INSERTJDBG ON
// JCL_DEBUG_EXPERT_DELETEMAPFILE ON
program AutoFicheTemps;

uses
  Vcl.Forms,
  AFT.View.Main in 'Views\AFT.View.Main.pas' {AppView},
  AFT.Main in 'Src\AFT.Main.pas',
  AFT.TaskCategory in 'Src\AFT.TaskCategory.pas',
  AFT.Model.Task in 'Models\AFT.Model.Task.pas',
  AFT.Model.TaskIntf in 'Models\Interfaces\AFT.Model.TaskIntf.pas';

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
