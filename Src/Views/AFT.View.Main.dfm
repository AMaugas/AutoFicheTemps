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
    TabOrder = 1
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
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 768
    Height = 643
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 0
    object AddTaskSpeedButton: TSpeedButton
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
    object TaskControlList: TControlList
      Left = 1
      Top = 177
      Width = 766
      Height = 417
      Align = alClient
      ItemHeight = 80
      ItemMargins.Left = 0
      ItemMargins.Top = 0
      ItemMargins.Right = 0
      ItemMargins.Bottom = 0
      ParentColor = False
      TabOrder = 0
      object TaskTitleLabel: TLabel
        Left = 13
        Top = 1
        Width = 280
        Height = 40
        Caption = 'TaskTitleLabel'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -32
        Font.Name = 'Fira Code'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object TaskCategoryLabel: TLabel
        Left = 13
        Top = 47
        Width = 221
        Height = 25
        Anchors = [akLeft, akBottom]
        Caption = 'TaskCategoryLabel'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Fira Code'
        Font.Style = []
        ParentFont = False
      end
      object TaskTimeLabel: TLabel
        Left = 561
        Top = 48
        Width = 169
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'TaskTimeLabel'
      end
    end
    object NoActiveTaskPanel: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 760
      Height = 80
      Align = alTop
      UseDockManager = False
      ParentColor = True
      ShowCaption = False
      TabOrder = 1
      Visible = False
      object NoActiveTaskLabel: TLabel
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 752
        Height = 72
        Align = alClient
        Alignment = taCenter
        AutoSize = False
        Caption = 'NoActiveTaskLabel'
        ShowAccelChar = False
        Layout = tlCenter
        WordWrap = True
        ExplicitLeft = 368
        ExplicitTop = 32
        ExplicitWidth = 78
        ExplicitHeight = 25
      end
    end
    object ActiveTaskView: TAftTaskView
      Left = 1
      Top = 87
      Width = 766
      Height = 90
      Align = alTop
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 2
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -32
      TitleFont.Name = 'Fira Code'
      TitleFont.Style = [fsBold]
      CategoryFont.Charset = ANSI_CHARSET
      CategoryFont.Color = clWindowText
      CategoryFont.Height = -21
      CategoryFont.Name = 'Fira Code'
      CategoryFont.Style = [fsBold]
      TimeFont.Charset = ANSI_CHARSET
      TimeFont.Color = clWindowText
      TimeFont.Height = -21
      TimeFont.Name = 'Fira Code'
      TimeFont.Style = [fsBold]
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
