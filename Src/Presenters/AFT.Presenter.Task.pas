unit AFT.Presenter.Task;

interface

uses
  AFT.Component.ViewInterface.Task,
  AFT.Model.Task;

type

  TTaskPresenter = class
  private
    fView : TaskViewInterface;
    fModel: TaskModelInterface;

    fSubNbr: Integer;
  private
    procedure OnModelUpdate(const aMsg: TTaskModelUpdate);
  public
    constructor Create(const aView: TaskViewInterface; const aModel: TaskModelInterface);
    destructor Destroy; override;
  end;

function CreateTaskPresenter(const aView: TaskViewInterface; const aModel: TaskModelInterface): TTaskPresenter;

implementation

uses
  System.TimeSpan,
  System.SysUtils,

  AFT.TaskCategory;

function CreateTaskPresenter(const aView: TaskViewInterface; const aModel: TaskModelInterface): TTaskPresenter;
begin
  Result := TTaskPresenter.Create(
    aView,
    aModel);
end;

{ TTaskPresenter }

constructor TTaskPresenter.Create(const aView: TaskViewInterface; const aModel: TaskModelInterface);
begin
  fModel  := aModel;
  fSubNbr := fModel.AddUpdateCallback(OnModelUpdate);

  fView := aView;
end;

destructor TTaskPresenter.Destroy;
begin
  fModel.RemoveUpdateCallback(fSubNbr);

  inherited;
end;

procedure TTaskPresenter.OnModelUpdate(const aMsg: TTaskModelUpdate);
begin
  fView.Title     := fModel.Title;
  fView.Category  := TAftCategoryConverter.ToNiceString(fModel.Category);
  fView.TimeSpent := fModel.TotalTimeSpentOnTask.TotalSeconds.ToString(
    TFloatFormat.ffFixed,
    5,
    5);
end;

end.
