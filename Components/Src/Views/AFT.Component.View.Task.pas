unit AFT.Component.View.Task;

interface

uses
  Winapi.Windows,
  Winapi.Messages,

  System.SysUtils,
  System.Variants,
  System.Classes,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.WinXCtrls,

  AFT.Component.ViewInterface.Task;

type
  TAftCustomTaskView = class(TFrame,
                             TaskViewInterface)
    RelativePanel1: TRelativePanel;
    TitleLabel: TLabel;
    CategoryLabel: TLabel;
    TimeLabel: TLabel;
  private
    function GetCategoryFont: TFont;
    function GetTimeFont: TFont;
    function GetTitleFont: TFont;
    procedure SetCategoryFont(const Value: TFont);
    procedure SetTimeFont(const Value: TFont);
    procedure SetTitleFont(const Value: TFont);

    function GetTitle: string;
    procedure SetTitle(const Value: string);
    function GetCategory: string;
    procedure SetCategory(const Value: string);
    function GetTimeSpent: string;
    procedure SetTimeSpent(const Value: string);
  public
    property TitleFont: TFont
      read   GetTitleFont
      write  SetTitleFont;
    property CategoryFont: TFont
      read   GetCategoryFont
      write  SetCategoryFont;
    property TimeFont: TFont
      read   GetTimeFont
      write  SetTimeFont;
  end;

  [ComponentPlatformsAttribute(pidWin32 or pidWin64)]
  TAftTaskView = class(TAftCustomTaskView)
  published
    property TitleFont;
    property CategoryFont;
    property TimeFont;
    property ParentFont;
  end;

implementation

{$R *.dfm}
{ TAftCustomTaskView }

function TAftCustomTaskView.GetCategory: string;
begin
  Result := CategoryLabel.Caption;
end;

function TAftCustomTaskView.GetCategoryFont: TFont;
begin
  Result := CategoryLabel.Font;
end;

function TAftCustomTaskView.GetTimeFont: TFont;
begin
  Result := TimeLabel.Font;
end;

function TAftCustomTaskView.GetTimeSpent: string;
begin
  Result := TimeLabel.Caption;
end;

function TAftCustomTaskView.GetTitle: string;
begin
  Result := TitleLabel.Caption;
end;

function TAftCustomTaskView.GetTitleFont: TFont;
begin
  Result := TitleLabel.Font;
end;

procedure TAftCustomTaskView.SetCategory(const Value: string);
begin
  CategoryLabel.Caption := Value;
end;

procedure TAftCustomTaskView.SetCategoryFont(const Value: TFont);
begin
  CategoryLabel.Font := Value;
end;

procedure TAftCustomTaskView.SetTimeFont(const Value: TFont);
begin
  TimeLabel.Font := Value;
end;

procedure TAftCustomTaskView.SetTimeSpent(const Value: string);
begin
  TimeLabel.Caption := Value;
end;

procedure TAftCustomTaskView.SetTitle(const Value: string);
begin
  TitleLabel.Caption := Value;
end;

procedure TAftCustomTaskView.SetTitleFont(const Value: TFont);
begin
  TitleLabel.Font := Value;
end;

end.
