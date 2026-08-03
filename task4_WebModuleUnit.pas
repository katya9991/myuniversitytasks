unit WebModuleUnit;

interface

uses
  System.SysUtils, System.Classes, Web.HTTPApp, Data.DB, Data.Win.ADODB;

type
  TWebModule1 = class(TWebModule)
    // Компоненты базы данных
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    procedure WebModule1DefaultHandlerAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WebModule1Class: TWebModuleClass = TWebModule1;

implementation

{$R *.dfm}

procedure TWebModule1.WebModule1DefaultHandlerAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  HtmlText: string;
begin
  // 1. Подключаемся к MS SQL Server (база TourismWebDB)
  ADOConnection1.ConnectionString := 'Provider=SQLOLEDB.1;Integrated Security=SSPI;Initial Catalog=TourismWebDB;Data Source=localhost;';
  ADOConnection1.Connected := True;
  
  // 2. SQL-запрос
  ADOQuery1.SQL.Text := 'SELECT hotel_name, stars, price_per_night FROM Hotels';
  ADOQuery1.Open;

  // 3. Создаем HTML-страничку
  HtmlText := '<html><head><meta charset="utf-8"><title>Список отелей</title></head><body>';
  HtmlText := HtmlText + '<h2>Список отелей из базы данных MS SQL Server:</h2>';
  HtmlText := HtmlText + '<table border="1">';
  HtmlText := HtmlText + '<tr><th>Название отеля</th><th>Звезды</th><th>Цена за ночь</th></tr>';

  // 4. Цикл для вывода строк таблицы
  while not ADOQuery1.Eof do
  begin
    HtmlText := HtmlText + '<tr>';
    HtmlText := HtmlText + '<td>' + ADOQuery1.FieldByName('hotel_name').AsString + '</td>';
    HtmlText := HtmlText + '<td>' + ADOQuery1.FieldByName('stars').AsString + '</td>';
    HtmlText := HtmlText + '<td>' + ADOQuery1.FieldByName('price_per_night').AsString + ' руб.</td>';
    HtmlText := HtmlText + '</tr>';
    
    ADOQuery1.Next; -- Переходим к следующей строке в базе
  end;

  HtmlText := HtmlText + '</table>';
  HtmlText := HtmlText + '</body></html>';

  // 5. Выводим результат в браузер
  Response.Content := HtmlText;
  Handled := True;
end;

end.
