unit AFT.Model.TaskIntf;

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

    function GetTimeSpan: TTimeSpan;
    procedure SetTimeSpan(const aValue: TTimeSpan);
    { public }
    property Title: string
      read   GetTitle
      write  SetTitle;
    property Category: TAftCategory
      read   GetCategory
      write  SetCategory;
    property isActive: boolean
      read   GetisActive
      write  SetisActive;
    property TimeSpan: TTimeSpan
      read   GetTimeSpan
      write  SetTimeSpan;
  end;

implementation

end.
