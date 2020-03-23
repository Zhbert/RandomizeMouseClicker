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
    HelpForm: TBitBtn;
    Label1: TLabel;
    RadioGroup1: TRadioGroup;
    IntervalEdit: TEdit;
    RadioGroup2: TRadioGroup;
    RadioPixels: TRadioButton;
    RadioScreen: TRadioButton;
    Label2: TLabel;
    PositionInterval: TEdit;
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
    SystemTimer: TTimer;
    TimeTimer: TTimer;
    procedure StartButtonClick(Sender: TObject);
    procedure StopButtonClick(Sender: TObject);
    procedure SystemTimerTimer(Sender: TObject);
    procedure TimeTimerTimer(Sender: TObject);
    procedure HelpFormClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  foo: TPoint;
  TriggerLeft : Boolean;
  WorkingTime : Integer;

implementation
  uses Unit2;

{$R *.dfm}

procedure TForm1.HelpFormClick(Sender: TObject);
begin
  Form2.Show;
end;

procedure TForm1.StartButtonClick(Sender: TObject);
begin
  //������������� ������� � ������
  TriggerLeft := false;
  //�������� ����������
  Form1.WorkTimeLabel.Caption := '0 ���.';
  Form1.ClickedLabel.Caption := '0';
  Form1.TimeLeftLabel.Caption := '0';
  //  ������� ������ ������ ����������
  Form1.StartButton.Enabled := false;
  Form1.StopButton.Enabled := true;
  // ��������� ������ � ���
  Form1.LogMemo.Lines.Add(DateTimeToStr(now) + ' ������� ������');
  WorkingTime := 0; // �������� ����� ������
  Form1.TimeTimer.Enabled := true; //���������� ������ ������� ������
  // ������������� �������� ������ ������� � ��������� ���
  Form1.SystemTimer.Interval := StrToInt(Form1.IntervalEdit.Text) * 1000;
  Form1.SystemTimer.Enabled := true;
  //���������� ���������� �����
  Form1.TimeLeftLabel.Caption := Form1.TimeEdit.Text + ' ���.';
end;

procedure TForm1.StopButtonClick(Sender: TObject);
begin
  //  ������� ������ ������ ����������
  Form1.StartButton.Enabled := true;
  Form1.StopButton.Enabled := false;
  // ��������� ������ � ���
  Form1.LogMemo.Lines.Add(DateTimeToStr(now) + ' ���������');
  // ������������� �������
  Form1.SystemTimer.Enabled := false;
  Form1.TimeTimer.Enabled := false;
end;

procedure TForm1.SystemTimerTimer(Sender: TObject);
begin
  //��������� ��������� ��������
  if Form1.RadioScreen.Checked = true then //��������� �� ��������� �����
    begin
      Randomize; // �������� ����������� �� ������� �����
      //������������� ������� �������  � ��������� ����������
      SetCursorPos(Random(Screen.Width), Random(Screen.Height));
      GetCursorPos(foo); //�������� ������������� ����������
      //��������� ���� ������
      mouse_event(MOUSEEVENTF_LEFTDOWN, foo.X, foo.Y, 0, 0); // - ������ ����� ������ ����
      sleep(200); //����� ����� �������� � �����������
      mouse_event(MOUSEEVENTF_LEFTUP, foo.X, foo.Y, 0, 0); // - ��������� ����� ������
      //���������� ���������� � ����
      Form1.LogMemo.Lines.Add(DateTimeToStr(now) + ' | ' + IntToStr(foo.X) +
                                                      ' ; ' + IntToStr(foo.Y));
      Form1.ClickedLabel.Caption := IntToStr(StrToInt(Form1.ClickedLabel.Caption) + 1);
    end else //��������� �� �������� �� �������� ����-����
    begin
      GetCursorPos(foo); //�������� ���������� �������
      if TriggerLeft = false then  //������� ������ �������
        begin
          SetCursorPos(foo.X + StrToInt(Form1.PositionInterval.Text), foo.Y);
          GetCursorPos(foo); //�������� ������������� ����������
          //��������� ���� ������
          mouse_event(MOUSEEVENTF_LEFTDOWN, foo.X, foo.Y, 0, 0); // - ������ ����� ������ ����
          sleep(200); //����� ����� �������� � �����������
          mouse_event(MOUSEEVENTF_LEFTUP, foo.X, foo.Y, 0, 0); // - ��������� ����� ������
          //���������� ���������� � ����
          Form1.LogMemo.Lines.Add(DateTimeToStr(now) + ' | ' + IntToStr(foo.X) +
                                                      ' ; ' + IntToStr(foo.Y));
          Form1.ClickedLabel.Caption := IntToStr(StrToInt(Form1.ClickedLabel.Caption) + 1);
          TriggerLeft := true;
        end else
        begin
          SetCursorPos(foo.X - StrToInt(Form1.PositionInterval.Text), foo.Y);
          GetCursorPos(foo); //�������� ������������� ����������
          //��������� ���� ������
          mouse_event(MOUSEEVENTF_LEFTDOWN, foo.X, foo.Y, 0, 0); // - ������ ����� ������ ����
          sleep(200); //����� ����� �������� � �����������
          mouse_event(MOUSEEVENTF_LEFTUP, foo.X, foo.Y, 0, 0); // - ��������� ����� ������
          //���������� ���������� � ����
          Form1.LogMemo.Lines.Add(DateTimeToStr(now) + ' | ' + IntToStr(foo.X) +
                                                      ' ; ' + IntToStr(foo.Y));
          Form1.ClickedLabel.Caption := IntToStr(StrToInt(Form1.ClickedLabel.Caption) + 1);
          TriggerLeft := false;
        end;
    end;
end;

procedure TForm1.TimeTimerTimer(Sender: TObject);
begin
  WorkingTime := WorkingTime + 1; //������� ������
  Form1.WorkTimeLabel.Caption := IntToStr(WorkingTime) + ' ���.';  // ����� ����� ������
  //������� ���������� ����� ������
  Form1.TimeLeftLabel.Caption := IntToStr(StrToInt(Form1.TimeEdit.Text) - WorkingTime) + ' ���.';
  //��� ������������� ������������� ��������� ������
  if WorkingTime = StrToInt(Form1.TimeEdit.Text) then
    begin
      Form1.SystemTimer.Enabled := false;
      Form1.TimeTimer.Enabled := false;
      // ��������� ������ � ���
      Form1.LogMemo.Lines.Add(DateTimeToStr(now) + ' ���������');
      Form1.StopButton.Enabled := false;
      Form1.StartButton.Enabled := true;
    end;
end;

end.
