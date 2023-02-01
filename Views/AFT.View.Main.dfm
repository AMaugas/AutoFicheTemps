object AppView: TAppView
  Left = 0
  Top = 0
  Caption = 'AppView'
  ClientHeight = 643
  ClientWidth = 964
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -21
  Font.Name = 'Fira Code'
  Font.Style = [fsBold]
  KeyPreview = True
  OldCreateOrder = False
  Scaled = False
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 25
  object Splitter1: TSplitter
    AlignWithMargins = True
    Left = 771
    Top = 3
    Width = 5
    Height = 637
    Align = alRight
    Beveled = True
    ResizeStyle = rsUpdate
    ExplicitLeft = 691
  end
  object Panel1: TPanel
    Left = 779
    Top = 0
    Width = 185
    Height = 643
    Align = alRight
    TabOrder = 0
    ExplicitLeft = 657
    ExplicitTop = -3
    object LogMemo: TMemo
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 177
      Height = 635
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Fira Code'
      Font.Style = [fsBold]
      ParentColor = True
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 0
      ExplicitLeft = 712
      ExplicitTop = 3
      ExplicitWidth = 249
      ExplicitHeight = 637
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 768
    Height = 643
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 1
    ExplicitLeft = 400
    ExplicitTop = 320
    ExplicitWidth = 185
    ExplicitHeight = 41
    object SpeedButton1: TSpeedButton
      AlignWithMargins = True
      Left = 4
      Top = 597
      Width = 760
      Height = 42
      Align = alBottom
      Caption = 'Add task'
      ExplicitLeft = 1
      ExplicitTop = 600
      ExplicitWidth = 766
    end
    object ControlList1: TControlList
      Left = 1
      Top = 1
      Width = 766
      Height = 593
      Align = alClient
      ItemMargins.Left = 0
      ItemMargins.Top = 0
      ItemMargins.Right = 0
      ItemMargins.Bottom = 0
      ParentColor = False
      TabOrder = 0
      ExplicitLeft = -1
      ExplicitTop = -5
      ExplicitHeight = 599
    end
  end
  object NotificationCenter1: TNotificationCenter
    Left = 480
    Top = 328
  end
  object TrayIcon1: TTrayIcon
    Left = 720
    Top = 272
  end
end
