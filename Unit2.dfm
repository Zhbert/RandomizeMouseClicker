object Form2: TForm2
  AlignWithMargins = True
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'HelpForm'
  ClientHeight = 207
  ClientWidth = 272
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 8
    Width = 209
    Height = 19
    Caption = 'Randomize Mouse Clicker'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Button1: TButton
    Left = 71
    Top = 176
    Width = 124
    Height = 23
    Caption = #1054#1050
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 8
    Top = 33
    Width = 256
    Height = 137
    Alignment = taCenter
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      #1055#1088#1086#1075#1088#1072#1084#1084#1072' '#1076#1083#1103' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1086#1075#1086' '#1082#1083#1080#1082#1072#1085#1100#1103' '#1087#1086' '
      #1101#1082#1088#1072#1085#1091' '#1074' '#1088#1072#1083#1080#1095#1085#1099#1093' '#1088#1077#1078#1080#1084#1072#1093' '#1076#1083#1103' '
      #1087#1088#1077#1076#1086#1090#1074#1088#1072#1097#1077#1085#1080#1103' '#1087#1077#1088#1077#1093#1086#1076#1072' '#1087#1086#1089#1083#1077#1076#1085#1077#1075#1086' '#1074' '
      #1088#1077#1078#1080#1084' "'#1054#1090#1086#1096#1105#1083'".'
      ''
      #1051#1080#1094#1077#1085#1079#1080#1103': GNU General Public License v. 3'
      #1040#1074#1090#1086#1088' - Zhbert'
      'GitHub '#1087#1088#1086#1077#1082#1090#1072': '
      'https://github.com/Zhbert/RandomizeMouseClicker')
    ParentFont = False
    TabOrder = 1
  end
end
