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
  Vcl.ExtCtrls, Vcl.ControlList, Vcl.WinXCtrls, Vcl.Buttons;

type
  TAppView = class(TForm)
    LogMemo: TMemo;
    NotificationCenter1: TNotificationCenter;
    TrayIcon1: TTrayIcon;
    ControlList1: TControlList;
    Splitter1: TSplitter;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    Panel2: TPanel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private

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
