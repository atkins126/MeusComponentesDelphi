object frxStringsEditorForm: TfrxStringsEditorForm
  Left = 219
  Top = 111
  Width = 432
  Height = 226
  Caption = 'Lines'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  ShowHint = True
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar: TToolBar
    Left = 0
    Top = 0
    Width = 416
    Height = 35
    AutoSize = True
    BorderWidth = 2
    ButtonHeight = 23
    EdgeBorders = [ebTop, ebBottom]
    Flat = True
    TabOrder = 0
    object CancelB: TToolButton
      Left = 0
      Top = 0
      Hint = 'Cancel'
      ImageIndex = 55
      OnClick = CancelBClick
    end
    object OkB: TToolButton
      Left = 23
      Top = 0
      Hint = 'OK'
      ImageIndex = 56
      OnClick = OkBClick
    end
  end
  object Memo: TMemo
    Left = 0
    Top = 35
    Width = 416
    Height = 153
    Align = alClient
    TabOrder = 1
    WordWrap = False
    OnKeyDown = MemoKeyDown
  end
end
