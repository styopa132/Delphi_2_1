unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMXTee.Engine, FMXTee.Procs,
  FMXTee.Chart, FMXTee.Series, FMX.Edit, FMX.EditBox, FMX.SpinBox, FMX.Layouts;

type
  TForm3 = class(TForm)
    ToolBar1: TToolBar;
    ToolBar2: TToolBar;
    Chart1: TChart;
    SpeedButton1: TSpeedButton;
    Series1: TLineSeries;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    Layout1: TLayout;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    SpinBox1: TSpinBox;
    SpinBox2: TSpinBox;
    SpinBox3: TSpinBox;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpinBox1Change(Sender: TObject);
  private
    { Private declarations }
     xb, xe : single;
     n : integer;
     a, b, c : single;
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}

function MyFunction(xi, ai, bi, ci: single):single;
var
yi : single;
begin
  yi := ai*xi*xi +bi*xi + ci;
  result := yi;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
    xb := 0;
    xe := 4;
    n := 5;
    a := 1;
    b := 0;
    c := 2;
end;

procedure TForm3.SpeedButton1Click(Sender: TObject);
var
 d : single;
 x, y    : single;
 i : integer;
begin
  d := (xe - xb) / (n-1);
  for i := 1 to n do
  begin
     x := xb + d * (i -1);
     y := MyFunction(x, a, b, c);
     Chart1.Series[0].AddXY(x, y);
  end;
end;
procedure TForm3.SpeedButton2Click(Sender: TObject);
begin
   Chart1.Axes[0].Maximum := Chart1.Axes[0].Maximum - 1;
end;

procedure TForm3.SpeedButton3Click(Sender: TObject);
begin
Chart1.Axes[0].Maximum := Chart1.Axes[0].Maximum + 1;
end;

procedure TForm3.SpeedButton4Click(Sender: TObject);
begin
  Chart1.Series[0].Clear; // удаляем точки линии
  n := n + 1; // увеличиваем кол-во точек
  xe := xe + 1; // увеличиваем интервал
  SpeedButton1Click(Sender); // перестраиваем график
end;

procedure TForm3.SpeedButton5Click(Sender: TObject);
begin
  Chart1.Series[0].Clear; // удаляем точки линии
  n := n - 1; // увеличиваем кол-во точек
  xe := xe - 1; // увеличиваем интервал
  SpeedButton1Click(Sender); // перестраиваем график
end;

procedure TForm3.SpeedButton6Click(Sender: TObject);
begin
Chart1.Axes[0].Minimum := Chart1.Axes[0].Minimum - 1;
end;

procedure TForm3.SpeedButton7Click(Sender: TObject);
begin
Chart1.Series[0].Clear; // удаляем точки линии
  n := n - 1; // увеличиваем кол-во точек
  xb := xb + 1; // увеличиваем интервал
  SpeedButton1Click(Sender); // перестраиваем график
end;

procedure TForm3.SpeedButton8Click(Sender: TObject);
begin
  Chart1.Series[0].Clear; // удаляем точки линии
  n := n + 1; // увеличиваем кол-во точек
  xb := xb - 1; // увеличиваем интервал
  SpeedButton1Click(Sender); // перестраиваем график
end;

procedure TForm3.SpeedButton9Click(Sender: TObject);
begin
Chart1.Axes[0].Minimum := Chart1.Axes[0].Minimum + 1;
end;

procedure TForm3.SpinBox1Change(Sender: TObject);
begin
    a := SpinBox1.Value; // новое значение а
    b := SpinBox2.Value; // новое значение b
    c := SpinBox3.Value; // новое значение c
    Chart1.Series[0].Clear; // удаляем точки линии
    SpeedButton1.OnClick(Sender);
end;

end.
