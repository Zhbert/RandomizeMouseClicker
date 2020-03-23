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
  //Устанавливаем триггер в дефолт
  TriggerLeft := false;
  //Обнуляем показатели
  Form1.WorkTimeLabel.Caption := '0 мин.';
  Form1.ClickedLabel.Caption := '0';
  Form1.TimeLeftLabel.Caption := '0';
  //  Обвязка логики кнопок управления
  Form1.StartButton.Enabled := false;
  Form1.StopButton.Enabled := true;
  // Добавляем запись в лог
  Form1.LogMemo.Lines.Add(DateTimeToStr(now) + ' Запущен кликер');
  WorkingTime := 0; // Обнуляем время работы
  Form1.TimeTimer.Enabled := true; //Активируем таймер времени работы
  // Устанавливаем интервал работы таймера и запускаем его
  Form1.SystemTimer.Interval := StrToInt(Form1.IntervalEdit.Text) * 1000;
  Form1.SystemTimer.Enabled := true;
  //Записываем оставшееся время
  Form1.TimeLeftLabel.Caption := Form1.TimeEdit.Text + ' мин.';
end;

procedure TForm1.StopButtonClick(Sender: TObject);
begin
  //  Обвязка логики кнопок управления
  Form1.StartButton.Enabled := true;
  Form1.StopButton.Enabled := false;
  // Добавляем запись в лог
  Form1.LogMemo.Lines.Add(DateTimeToStr(now) + ' Остановка');
  // Останавливаем таймеры
  Form1.SystemTimer.Enabled := false;
  Form1.TimeTimer.Enabled := false;
end;

procedure TForm1.SystemTimerTimer(Sender: TObject);
begin
  //Проверяем установку разброса
  if Form1.RadioScreen.Checked = true then //Установка на рандомный экран
    begin
      Randomize; // Обнуляем рандомайзер на текущее время
      //Устанавливаем позицию курсора  в случайные координаты
      SetCursorPos(Random(Screen.Width), Random(Screen.Height));
      GetCursorPos(foo); //получаем установленные координаты
      //Эмулируем клик мышкой
      mouse_event(MOUSEEVENTF_LEFTDOWN, foo.X, foo.Y, 0, 0); // - нажать левую кнопку мыши
      sleep(200); //пауза между нажатием и отпусканием
      mouse_event(MOUSEEVENTF_LEFTUP, foo.X, foo.Y, 0, 0); // - отпустить левую кнопку
      //Показываем координаты в логе
      Form1.LogMemo.Lines.Add(DateTimeToStr(now) + ' | ' + IntToStr(foo.X) +
                                                      ' ; ' + IntToStr(foo.Y));
      Form1.ClickedLabel.Caption := IntToStr(StrToInt(Form1.ClickedLabel.Caption) + 1);
    end else //Установка на движение по пикселям туда-сюда
    begin
      GetCursorPos(foo); //получаем координаты курсора
      if TriggerLeft = false then  //двигаем курсор направо
        begin
          SetCursorPos(foo.X + StrToInt(Form1.PositionInterval.Text), foo.Y);
          GetCursorPos(foo); //получаем установленные координаты
          //Эмулируем клик мышкой
          mouse_event(MOUSEEVENTF_LEFTDOWN, foo.X, foo.Y, 0, 0); // - нажать левую кнопку мыши
          sleep(200); //пауза между нажатием и отпусканием
          mouse_event(MOUSEEVENTF_LEFTUP, foo.X, foo.Y, 0, 0); // - отпустить левую кнопку
          //Показываем координаты в логе
          Form1.LogMemo.Lines.Add(DateTimeToStr(now) + ' | ' + IntToStr(foo.X) +
                                                      ' ; ' + IntToStr(foo.Y));
          Form1.ClickedLabel.Caption := IntToStr(StrToInt(Form1.ClickedLabel.Caption) + 1);
          TriggerLeft := true;
        end else
        begin
          SetCursorPos(foo.X - StrToInt(Form1.PositionInterval.Text), foo.Y);
          GetCursorPos(foo); //получаем установленные координаты
          //Эмулируем клик мышкой
          mouse_event(MOUSEEVENTF_LEFTDOWN, foo.X, foo.Y, 0, 0); // - нажать левую кнопку мыши
          sleep(200); //пауза между нажатием и отпусканием
          mouse_event(MOUSEEVENTF_LEFTUP, foo.X, foo.Y, 0, 0); // - отпустить левую кнопку
          //Показываем координаты в логе
          Form1.LogMemo.Lines.Add(DateTimeToStr(now) + ' | ' + IntToStr(foo.X) +
                                                      ' ; ' + IntToStr(foo.Y));
          Form1.ClickedLabel.Caption := IntToStr(StrToInt(Form1.ClickedLabel.Caption) + 1);
          TriggerLeft := false;
        end;
    end;
end;

procedure TForm1.TimeTimerTimer(Sender: TObject);
begin
  WorkingTime := WorkingTime + 1; //Считаем минуты
  Form1.WorkTimeLabel.Caption := IntToStr(WorkingTime) + ' мин.';  // Пишем время работы
  //Считаем оставшееся время работы
  Form1.TimeLeftLabel.Caption := IntToStr(StrToInt(Form1.TimeEdit.Text) - WorkingTime) + ' мин.';
  //При срабатываении останавливаем системный таймер
  if WorkingTime = StrToInt(Form1.TimeEdit.Text) then
    begin
      Form1.SystemTimer.Enabled := false;
      Form1.TimeTimer.Enabled := false;
      // Добавляем запись в лог
      Form1.LogMemo.Lines.Add(DateTimeToStr(now) + ' Остановка');
      Form1.StopButton.Enabled := false;
      Form1.StartButton.Enabled := true;
    end;
end;

end.
