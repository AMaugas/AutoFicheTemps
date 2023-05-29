object AftCustomTaskView: TAftCustomTaskView
  Left = 0
  Top = 0
  Width = 463
  Height = 105
  DoubleBuffered = True
  ParentDoubleBuffered = False
  TabOrder = 0
  object RelativePanel1: TRelativePanel
    Left = 0
    Top = 0
    Width = 463
    Height = 105
    ControlCollection = <
      item
        Control = TitleLabel
        AlignBottomWithPanel = False
        AlignHorizontalCenterWithPanel = True
        AlignLeftWithPanel = False
        AlignRightWithPanel = False
        AlignTopWithPanel = True
        AlignVerticalCenterWithPanel = False
      end
      item
        Control = CategoryLabel
        AlignBottomWithPanel = True
        AlignHorizontalCenterWithPanel = False
        AlignLeftWithPanel = True
        AlignRightWithPanel = False
        AlignTopWithPanel = False
        AlignVerticalCenterWithPanel = False
      end
      item
        Control = TimeLabel
        AlignBottomWithPanel = True
        AlignHorizontalCenterWithPanel = False
        AlignLeftWithPanel = False
        AlignRightWithPanel = True
        AlignTopWithPanel = False
        AlignVerticalCenterWithPanel = False
      end>
    Align = alClient
    UseDockManager = False
    ParentColor = True
    ShowCaption = False
    TabOrder = 0
    ExplicitLeft = 3
    ExplicitTop = -32
    ExplicitHeight = 165
    DesignSize = (
      463
      105)
    object TitleLabel: TLabel
      AlignWithMargins = True
      Left = 208
      Top = 4
      Width = 45
      Height = 13
      Anchors = []
      Caption = 'TitleLabel'
      ShowAccelChar = False
      WordWrap = True
    end
    object CategoryLabel: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 88
      Width = 70
      Height = 13
      Anchors = []
      Caption = 'CategoryLabel'
      ShowAccelChar = False
      WordWrap = True
    end
    object TimeLabel: TLabel
      AlignWithMargins = True
      Left = 412
      Top = 88
      Width = 47
      Height = 13
      Anchors = []
      Caption = 'TimeLabel'
      ShowAccelChar = False
      WordWrap = True
    end
  end
end
