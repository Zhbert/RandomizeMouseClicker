unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    StartButton: TButton;
    StopButton: TButton;
    GroupBox2: TGroupBox;
    HelpButton: TBitBtn;
    Label1: TLabel;
    RadioGroup1: TRadioGroup;
    IntervalEdit: TEdit;
    RadioGroup2: TRadioGroup;
    RadioPixels: TRadioButton;
    RadioScreen: TRadioButton;
    Label2: TLabel;
    PosotionInterval: TEdit;
    RandomIntervalCheck: TCheckBox;
    RadioGroup3: TRadioGroup;
    RadioGroup4: TRadioGroup;
    TimeEdit: TEdit;
    ComboBox1: TComboBox;
    CheckBox1: TCheckBox;
    LogMemo: TMemo;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    WorkTimeLabel: TLabel;
    ClickedLabel: TLabel;
    TimeLeftLabel: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
