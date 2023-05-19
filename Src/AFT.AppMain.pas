unit AFT.AppMain;

interface

uses
  System.TimeSpan,

  Vcl.ExtCtrls,

  AFT.View.Main,
  AFT.Model.Task.Intf;

type
  TAftMainApp = class
  private
    fAppDir: string;

    fTimer: TTimer;

    fView: TAppView;

    fTask: ITask;
    procedure OnTimer(Sender: TObject);
  public
    constructor Create(const aView: TAppView);
    destructor Destroy; override;
  end;

implementation

uses
  System.DateUtils,
  System.SysUtils,
  System.IOUtils,

  AFT.TaskCategory,
  AFT.Model.Task;

constructor TAftMainApp.Create(const aView: TAppView);
begin
  fView   := aView;
  fAppDir := TPath.Combine(
    TPath.GetCachePath,
    'AutoFicheTemps');

  if not TDirectory.Exists(fAppDir) then begin
    TDirectory.CreateDirectory(fAppDir);
  end;

  fTask := TAftTask.Create(
    'TEST TASK',
    AFT_CATEGORY_ADMINISTRATIF);

  fTimer          := TTimer.Create(nil);
  fTimer.Interval := 5000;
  fTimer.OnTimer  := OnTimer;
  fTimer.Enabled  := True;

  fView.Log('App started');
end;

procedure TAftMainApp.OnTimer(Sender: TObject);
begin
  fTask.IncreaseTimeSpentOnTask(TTimeSpan.FromMilliseconds(fTimer.Interval));

  fView.Log(Format('Time spent on task %s this week: %.3f minutes',
    [TAftCategoryConverter.ToString(fTask.Category), 
      fTask.TimeSpentOnTaskByWeek(WeekOfTheYear(Today)).TotalMinutes]));

  fView.Log(Format('Total time spent on the task %s: %.3f',[TAftCategoryConverter.ToString(fTask.Category), fTask.TotalTimeSpentOnTask.TotalMinutes]));
end;

destructor TAftMainApp.Destroy;
begin
  if assigned(fView) then begin
    FreeAndNil(fView);
  end;

  if assigned(fTimer) then begin
    fTimer.Enabled := False;
    FreeAndNil(fTimer);
  end;
end;

end.
