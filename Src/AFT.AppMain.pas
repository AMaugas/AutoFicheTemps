unit AFT.AppMain;

interface

uses
  System.TimeSpan,
  System.Generics.Collections,
  System.Types,

  Vcl.ExtCtrls,
  Vcl.Graphics,
  Vcl.StdCtrls,

  AFT.View.Main,
  AFT.Model.Task;

type
  TAftMainApp = class
  private
    fAppDir: string;

    fTimer: TTimer;

    fView: TAppView;

    fTasks     : TList<TaskModelInterface>;
    fActiveTask: TaskModelInterface;

    procedure OnTimer(Sender: TObject);

    procedure RenderTask(AIndex: Integer; ACanvas: TCanvas; ARect: TRect; AState: TOwnerDrawState);
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
  AFT.Task,
  AFT.Presenter.Task;

constructor TAftMainApp.Create(const aView: TAppView);
begin
  fView   := aView;
  fAppDir := TPath.Combine(
    TPath.GetCachePath,
    'AutoFicheTemps');

  if not TDirectory.Exists(fAppDir) then begin
    TDirectory.CreateDirectory(fAppDir);
  end;

  fTasks := TList<TaskModelInterface>.Create;
  fTasks.Add(TAftTask.Create('TEST TASK n°01', AFT_CATEGORY_ADMINISTRATIF));
  fTasks.Add(TAftTask.Create('TEST TASK n°02', AFT_CATEGORY_REPPORTING));

  fActiveTask          := fTasks.First;
  fActiveTask.isActive := True;

  CreateTaskPresenter(
    fView.ActiveTaskView,
    fActiveTask);

  fView.TaskControlList.ItemCount        := fTasks.Count;
  fView.TaskControlList.OnBeforeDrawItem := RenderTask;

  fTimer          := TTimer.Create(nil);
  fTimer.Interval := 5000;
  fTimer.OnTimer  := OnTimer;
  fTimer.Enabled  := True;

  fView.Log('App started');
end;

procedure TAftMainApp.OnTimer(Sender: TObject);
begin
  fActiveTask.IncreaseTimeSpentOnTask(TTimeSpan.FromMilliseconds(fTimer.Interval));

  fView.Log(Format('Time spent on task %s this week: %.3f hours',
    [fActiveTask.Title, fActiveTask.TimeSpentOnTaskByWeek(WeekOfTheYear(Today)).TotalHours]));

  fView.Log(Format('Total time spent on the task %s: %.3f hours',
    [fActiveTask.Title, fActiveTask.TotalTimeSpentOnTask.TotalHours]));

  fView.TaskControlList.Refresh;
end;

procedure TAftMainApp.RenderTask(AIndex: Integer; ACanvas: TCanvas; ARect: TRect; AState: TOwnerDrawState);
var
  lTask: TaskModelInterface;
begin
  lTask                           := fTasks[AIndex];
  fView.TaskTitleLabel.Caption    := lTask.Title;
  fView.TaskCategoryLabel.Caption := TAftCategoryConverter.ToNiceString(lTask.Category);
  fView.TaskTimeLabel.Caption     := lTask.TotalTimeSpentOnTask.TotalSeconds.ToString(
    TFloatFormat.ffFixed,
    5,
    5);

  WriteLn(Format('Rendering task %s (Index= %d)', [lTask.Title, AIndex]));
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
