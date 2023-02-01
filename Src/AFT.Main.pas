unit AFT.Main;

interface

uses
  AFT.View.Main,

  System.TimeSpan,

  Vcl.ExtCtrls;

type
  TAftMainApp = class
  private
    fAppDir         : string;
    fTimeSpendOnTask: TTimeSpan;

    fTimer: TTimer;

    fView: TAppView;
    procedure OnTimer(Sender: TObject);
  public
    constructor Create(const aView: TAppView);
    destructor Destroy; override;
  end;

implementation

uses
  System.DateUtils,
  System.SysUtils,
  System.IOUtils;

constructor TAftMainApp.Create(const aView: TAppView);
begin
  fView   := aView;
  fAppDir := TPath.Combine(
    TPath.GetCachePath,
    'AutoFicheTemps');

  fTimeSpendOnTask := TTimeSpan.Create(0);

  if not TDirectory.Exists(fAppDir) then begin
    TDirectory.CreateDirectory(fAppDir);
  end;

  fTimer          := TTimer.Create(nil);
  fTimer.Interval := 5000;
  fTimer.OnTimer  := OnTimer;
  fTimer.Enabled  := True;

  fView.Log('App started');
end;

procedure TAftMainApp.OnTimer(Sender: TObject);
var
  toAdd: TTimeSpan;
begin
  toAdd            := TTimeSpan.FromMilliseconds(fTimer.Interval);
  fTimeSpendOnTask := fTimeSpendOnTask.Add(toAdd);

  fView.Log('Minutes spent on task: ' + fTimeSpendOnTask.TotalMinutes.ToString(ffFixed, 3, 3) + ', this represents ' +
    fTimeSpendOnTask.ToString);
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
