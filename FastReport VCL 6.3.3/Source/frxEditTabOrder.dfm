object frxTabOrderEditorForm: TfrxTabOrderEditorForm
  Left = 179
  Top = 110
  BorderStyle = bsDialog
  Caption = 'Tab Order'
  ClientHeight = 215
  ClientWidth = 303
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnHide = FormHide
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 131
    Height = 13
    Caption = 'Controls listed in tab order:'
  end
  object OkB: TButton
    Left = 220
    Top = 28
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object CancelB: TButton
    Left = 220
    Top = 56
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object UpB: TButton
    Left = 220
    Top = 100
    Width = 75
    Height = 25
    Caption = 'Move up'
    TabOrder = 2
    OnClick = UpBClick
  end
  object DownB: TButton
    Left = 220
    Top = 128
    Width = 75
    Height = 25
    Caption = 'Move down'
    TabOrder = 3
    OnClick = DownBClick
  end
  object ControlsLB: TListBox
    Left = 8
    Top = 28
    Width = 201
    Height = 177
    ItemHeight = 13
    TabOrder = 4
  end
end
