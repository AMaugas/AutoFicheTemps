unit AFT.Model.Task;

interface

uses
  System.TimeSpan,

  AFT.Model.TaskIntf,
  AFT.TaskCategory;

type
  TAftTask = class(TInterfacedObject,
                   ITask)
  private
    fTitle   : string;
    fCategory: TAftCategory;
    fIsActive: boolean;
    fTimeSpan: TTimeSpan;

    function GetTitle: string;
    procedure SetTitle(const aValue: string);

    function GetCategory: TAftCategory;
    procedure SetCategory(const aValue: TAftCategory);

    function GetisActive: boolean;
    procedure SetisActive(const aValue: boolean);

    function GetTimeSpan: TTimeSpan;
    procedure SetTimeSpan(const aValue: TTimeSpan);
  public
    constructor Create(const aTitle: string; const aCategory: TAftCategory; const aTimeSpan: TTimeSpan);
  end;

implementation

{ TAftTask }

constructor TAftTask.Create(const aTitle: string; const aCategory: TAftCategory; const aTimeSpan: TTimeSpan);
begin
  fTitle    := aTitle;
  fCategory := aCategory;
  fIsActive := False;
  fTimeSpan := aTimeSpan;
end;

function TAftTask.GetCategory: TAftCategory;
begin
  Result := fCategory;
end;

function TAftTask.GetisActive: boolean;
begin
  Result := fIsActive;
end;

function TAftTask.GetTimeSpan: TTimeSpan;
begin
  Result := fTimeSpan;
end;

function TAftTask.GetTitle: string;
begin
  Result := fTitle;
end;

procedure TAftTask.SetCategory(const aValue: TAftCategory);
begin
  fCategory := aValue;
end;

procedure TAftTask.SetisActive(const aValue: boolean);
begin
  fIsActive := aValue;
end;

procedure TAftTask.SetTimeSpan(const aValue: TTimeSpan);
begin
  fTimeSpan := aValue;
end;

procedure TAftTask.SetTitle(const aValue: string);
begin
  fTitle := aValue;
end;

end.
