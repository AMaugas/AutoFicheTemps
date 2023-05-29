unit AFT.Model.Task;

interface

uses
  System.Messaging,
  System.TimeSpan,

  AFT.TaskCategory;

type
  TTaskModelUpdate               = class(TMessage);
  TTaskModelUpdateListener       = reference to procedure(const aMsg: TTaskModelUpdate);
  TTaskModelUpdateListenerMethod = procedure(const aMsg: TTaskModelUpdate) of object;

  TaskModelInterface = interface
    ['{0B8134BA-3E1C-46F0-8601-FDEFF1201E4C}']
    { private }
    function GetTitle: string;
    procedure SetTitle(const aValue: string);

    function GetCategory: TAftCategory;
    procedure SetCategory(const aValue: TAftCategory);

    function GetisActive: boolean;
    procedure SetisActive(const aValue: boolean);

    { public }
    function TotalTimeSpentOnTask: TTimeSpan;
    function TimeSpentOnTaskByWeek(const aWeekNumber: Int32): TTimeSpan;
    procedure IncreaseTimeSpentOnTask(const aSpan: TTimeSpan);

    function AddUpdateCallback(const aCallBack: TTaskModelUpdateListener): Integer; overload;
    function AddUpdateCallback(const aCallBack: TTaskModelUpdateListenerMethod): Integer; overload;
    procedure RemoveUpdateCallback(const aSubId: Integer);

    property Title: string
      read   GetTitle
      write  SetTitle;
    property Category: TAftCategory
      read   GetCategory
      write  SetCategory;
    property isActive: boolean
      read   GetisActive
      write  SetisActive;
  end;

implementation

end.
