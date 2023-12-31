unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, System.Math, MathExpParser;

type
  TForm1 = class(TForm)
    lb_calculadora: TLabel;
    sbt_divide: TSpeedButton;
    sbt_multiply: TSpeedButton;
    sbt_minus: TSpeedButton;
    sbt_plus: TSpeedButton;
    sbt_0: TSpeedButton;
    sbt_5: TSpeedButton;
    sbt_6: TSpeedButton;
    sbt_7: TSpeedButton;
    sbt_8: TSpeedButton;
    sbt_9: TSpeedButton;
    sbt_1: TSpeedButton;
    sbt_2: TSpeedButton;
    sbt_3: TSpeedButton;
    sbt_4: TSpeedButton;
    sbt_equals: TSpeedButton;
    sbt_c: TSpeedButton;
    txt_result: TEdit;
    Edit1: TEdit;
    procedure sbt_8Click(Sender: TObject);
    procedure sbt_7Click(Sender: TObject);
    procedure sbt_9Click(Sender: TObject);
    procedure sbt_4Click(Sender: TObject);
    procedure sbt_5Click(Sender: TObject);
    procedure sbt_6Click(Sender: TObject);
    procedure sbt_1Click(Sender: TObject);
    procedure sbt_2Click(Sender: TObject);
    procedure sbt_3Click(Sender: TObject);
    procedure sbt_0Click(Sender: TObject);
    procedure sbt_divideClick(Sender: TObject);
    procedure sbt_multiplyClick(Sender: TObject);
    procedure sbt_minusClick(Sender: TObject);
    procedure sbt_plusClick(Sender: TObject);
    procedure sbt_equalsClick(Sender: TObject);
    procedure sbt_cClick(Sender: TObject);
  private
    { Private declarations }
    ResultDisplayed: Boolean;
    procedure OnClick(const Value: string);
    function Result(Expression: string): Double;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

constructor TForm1.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ResultDisplayed := False;
end;

function TForm1.Result(Expression: string): Double;
var
  Parser: TExpressionParser;
begin
  Parser := TExpressionParser.Create;
  try
    Parser.DecimalSeperator := '.';
    Result := Parser.ParseExpressionToFloat(Expression);
  finally
    Parser.Free;
  end;
end;

procedure TForm1.OnClick(const Value: string);
var
  resultValue: Double;
begin
   if txt_result.Text = '0' then
    txt_result.Text := '';

  case Value[1] of
    '+', '-', '*', '/':
    begin
      if ResultDisplayed then
      begin
        txt_result.Text := FloatToStr(Result(txt_result.Text));
        ResultDisplayed := False;
      end;
      txt_result.Text := txt_result.Text + ' ' + Value + ' ';
    end;
    '=':
    begin
      resultValue := Result(txt_result.Text);
      if not IsNan(resultValue) then
        txt_result.Text := FloatToStr(resultValue)
      else
        txt_result.Text := 'Erro na express�o';
      ResultDisplayed := True;
    end
  else
    begin
      if ResultDisplayed then
      begin
        txt_result.Text := Value;
        ResultDisplayed := False;
      end
      else
        txt_result.Text := txt_result.Text + Value;
    end;
  end;
end;

procedure TForm1.sbt_0Click(Sender: TObject);
begin
  OnClick((Sender as TSpeedButton).Caption);
end;

procedure TForm1.sbt_1Click(Sender: TObject);
begin
  OnClick((Sender as TSpeedButton).Caption);
end;                  

procedure TForm1.sbt_2Click(Sender: TObject);
begin
  OnClick((Sender as TSpeedButton).Caption);
end;

procedure TForm1.sbt_3Click(Sender: TObject);
begin
  OnClick((Sender as TSpeedButton).Caption);
end;

procedure TForm1.sbt_4Click(Sender: TObject);
begin
  OnClick((Sender as TSpeedButton).Caption);
end;

procedure TForm1.sbt_5Click(Sender: TObject);
begin
  OnClick((Sender as TSpeedButton).Caption);
end;

procedure TForm1.sbt_6Click(Sender: TObject);
begin
  OnClick((Sender as TSpeedButton).Caption);
end;

procedure TForm1.sbt_7Click(Sender: TObject);
begin
  OnClick((Sender as TSpeedButton).Caption);
end;

procedure TForm1.sbt_8Click(Sender: TObject);
begin
  OnClick((Sender as TSpeedButton).Caption);
end;

procedure TForm1.sbt_9Click(Sender: TObject);
begin
OnClick((Sender as TSpeedButton).Caption);
end;

procedure TForm1.sbt_cClick(Sender: TObject);
begin
  txt_result.Text := '0';
end;

procedure TForm1.sbt_divideClick(Sender: TObject);
begin
  OnClick((Sender as TSpeedButton).Caption);
end;

procedure TForm1.sbt_equalsClick(Sender: TObject);
begin
  OnClick((Sender as TSpeedButton).Caption);
end;

procedure TForm1.sbt_minusClick(Sender: TObject);
begin
  OnClick((Sender as TSpeedButton).Caption);
end;

procedure TForm1.sbt_multiplyClick(Sender: TObject);
begin
  OnClick((Sender as TSpeedButton).Caption);
end;

procedure TForm1.sbt_plusClick(Sender: TObject);
begin
  OnClick((Sender as TSpeedButton).Caption);
end;

end.
