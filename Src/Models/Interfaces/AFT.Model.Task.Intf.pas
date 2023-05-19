unit AFT.Model.Task.Intf;

interface

uses
  System.TimeSpan,

  AFT.TaskCategory;

type

  ITask = interface
    { private }
    function GetTitle: string;
    procedure SetTitle(const aValue: string);

    function GetCategory: TAftCategory;
    procedure SetCategory(const aValue: TAftCategory);

    function GetisActive: boolean;
    procedure SetisActive(const aValue: boolean);

    { public }
    function TotalTimeSpentOnTask : TTimeSpan;
    function TimeSpentOnTaskByWeek(const aWeekNumber : Int32): TTimeSpan;
    procedure IncreaseTimeSpentOnTask(const aSpan :TTimeSpan);

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
