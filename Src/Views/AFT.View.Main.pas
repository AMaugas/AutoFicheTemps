unit AFT.View.Main;

interface

uses
    Winapi.Windows,
    Winapi.Messages,

    System.SysUtils,
    System.Variants,
    System.Classes,
    System.Notification,

    Vcl.Graphics,
    Vcl.Controls,
    Vcl.Forms,
    Vcl.Dialogs,
    Vcl.StdCtrls,
    Vcl.ExtCtrls,
    Vcl.ControlList,
    Vcl.WinXCtrls,
    Vcl.Buttons,

    AFT.Component.View.Task;

type
    TAppView = class(TForm)
        LogMemo: TMemo;
        NotificationCenter1: TNotificationCenter;
        TrayIcon1: TTrayIcon;
        TaskControlList: TControlList;
        Splitter1: TSplitter;
        Panel1: TPanel;
        AddTaskSpeedButton: TSpeedButton;
        Panel2: TPanel;
        TaskTitleLabel: TLabel;
        TaskCategoryLabel: TLabel;
        TaskTimeLabel: TLabel;
        NoActiveTaskPanel: TPanel;
        NoActiveTaskLabel: TLabel;
        ActiveTaskView: TAftTaskView;
        procedure FormKeyPress(Sender: TObject; var Key: Char);
    private

    protected
        procedure CreateWnd; override;

    public
        constructor Create(AOwner: TComponent); override;

        procedure Log(const s: string);
    end;

implementation

{$R *.dfm}
{ TForm1 }

constructor TAppView.Create(AOwner: TComponent);
begin
    inherited;
end;

procedure TAppView.CreateWnd;
begin
    inherited;

    TaskControlList.Invalidate;
end;

procedure TAppView.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if (Key = 'q') or (Key = 'Q') then begin
        Application.Terminate;
    end;
end;

procedure TAppView.Log(const s: string);
begin
    LogMemo.Lines.Add(FormatDateTime('"[" dd/mm/yyyy hh:nn:ss:zzz "] "', Now) + s);
end;

end.
