unit AFT.Component.ViewInterface.Task;

interface

type

  TaskViewInterface = interface
    ['{13FBBBE6-5455-4605-A253-9815B88DAC7E}']
    { private }
    function GetTitle: string;
    procedure SetTitle(const Value: string);
    function GetCategory: string;
    procedure SetCategory(const Value: string);
    function GetTimeSpent: string;
    procedure SetTimeSpent(const Value: string);
    { public }
    property Title: string
      read   GetTitle
      write  SetTitle;
    property Category: string
      read   GetCategory
      write  SetCategory;
    property TimeSpent: string
      read   GetTimeSpent
      write  SetTimeSpent;
  end;

implementation

end.
