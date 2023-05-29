unit AFT.Task;

interface

uses
  System.TimeSpan,
  System.Generics.Collections,
  System.Messaging,

  AFT.Model.Task,
  AFT.TaskCategory;

type
  TAftTask = class(TInterfacedObject,
                   TaskModelInterface)
  private
    fId              : TGUID;
    fTitle           : string;
    fCategory        : TAftCategory;
    fIsActive        : boolean;
    fTimeSpentPerWeek: TDictionary<Int32, TTimeSpan>;

    fMsgManager: TMessageManager;

    function GetTitle: string;
    procedure SetTitle(const aValue: string);

    function GetCategory: TAftCategory;
    procedure SetCategory(const aValue: TAftCategory);

    function GetisActive: boolean;
    procedure SetisActive(const aValue: boolean);

  public
    constructor Create(const aId: TGUID; const aTitle: string; const aCategory: TAftCategory); overload;
    constructor Create(const aTitle: string; const aCategory: TAftCategory); overload;
    destructor Destroy; override;

    function AddUpdateCallback(const aCallBack: TTaskModelUpdateListener): Integer; overload;
    function AddUpdateCallback(const aCallBack: TTaskModelUpdateListenerMethod): Integer; overload;
    procedure RemoveUpdateCallback(const aSubId: Integer);

    function TotalTimeSpentOnTask: TTimeSpan;
    function TimeSpentOnTaskByWeek(const aWeekNumber: Int32): TTimeSpan;
    procedure IncreaseTimeSpentOnTask(const aSpan: TTimeSpan);
  end;

implementation

uses
  System.SysUtils,
  System.DateUtils;

{ TAftTask }

constructor TAftTask.Create(const aId: TGUID; const aTitle: string; const aCategory: TAftCategory);
begin
  fId               := aId;
  fTitle            := aTitle;
  fCategory         := aCategory;
  fIsActive         := False;
  fTimeSpentPerWeek := TDictionary<Int32, TTimeSpan>.Create;
end;

function TAftTask.AddUpdateCallback(const aCallBack: TTaskModelUpdateListener): Integer;
begin
  Result := fMsgManager.SubscribeToMessage(TTaskModelUpdate,
    procedure(const Sender: TObject; const M: TMessage)
    begin
      aCallBack(TTaskModelUpdate(M));
    end);
end;

function TAftTask.AddUpdateCallback(const aCallBack: TTaskModelUpdateListenerMethod): Integer;
begin
  Result := fMsgManager.SubscribeToMessage(TTaskModelUpdate,
    procedure(const Sender: TObject; const M: TMessage)
    begin
      aCallBack(TTaskModelUpdate(M));
    end);
end;

constructor TAftTask.Create(const aTitle: string; const aCategory: TAftCategory);
begin
  if CreateGUID(fId) <> 0 then begin
    raise Exception.Create('Could not create a task GUID');
  end;
  fTitle            := aTitle;
  fCategory         := aCategory;
  fIsActive         := False;
  fTimeSpentPerWeek := TDictionary<Int32, TTimeSpan>.Create;
  fTimeSpentPerWeek.Add(
    WeekOfTheYear(Today),
    TTimeSpan.Zero);

  fMsgManager := TMessageManager.Create;
end;

destructor TAftTask.Destroy;
begin
  fMsgManager.Free;
  inherited;
end;

function TAftTask.GetCategory: TAftCategory;
begin
  Result := fCategory;
end;

function TAftTask.GetisActive: boolean;
begin
  Result := fIsActive;
end;

function TAftTask.GetTitle: string;
begin
  Result := fTitle;
end;

procedure TAftTask.IncreaseTimeSpentOnTask(const aSpan: TTimeSpan);
begin
  fTimeSpentPerWeek.Items[WeekOfTheYear(Today)] := fTimeSpentPerWeek.Items[WeekOfTheYear(Today)] + aSpan;

  fMsgManager.SendMessage(
    Self,
    TTaskModelUpdate.Create);
end;

procedure TAftTask.RemoveUpdateCallback(const aSubId: Integer);
begin
  fMsgManager.Unsubscribe(
    TTaskModelUpdate,
    aSubId);
end;

procedure TAftTask.SetCategory(const aValue: TAftCategory);
begin
  fCategory := aValue;
end;

procedure TAftTask.SetisActive(const aValue: boolean);
begin
  fIsActive := aValue;
end;

procedure TAftTask.SetTitle(const aValue: string);
begin
  fTitle := aValue;
end;

function TAftTask.TimeSpentOnTaskByWeek(const aWeekNumber: Int32): TTimeSpan;
begin
  if not fTimeSpentPerWeek.TryGetValue(aWeekNumber, Result) then begin
    Result := TTimeSpan.Zero;
  end;
end;

function TAftTask.TotalTimeSpentOnTask: TTimeSpan;
begin
  Result := TTimeSpan.Zero;

  for var lTs: TTimeSpan in fTimeSpentPerWeek.Values do begin
    Result := Result + lTs;
  end;
end;

end.
