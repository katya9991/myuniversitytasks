#include <iostream>
#include <string>

using namespace std;

// БАЗОВЫЙ КЛАСС (Родитель)
class Shape {
public: 
    string name; // Тут храним имя фигуры

    // Обычный конструктор: записывает имя при создании
    Shape(string n) {
        name = n;
    }

    // Метод родителя: выводит имя на экран
    void printName() {
        cout << "Это фигура: " << name << endl;
    }
};

// ПРОИЗВОДНЫЙ КЛАСС (Потомок)
class Rectangle : public Shape {
public:
    double width;  // Ширина
    double height; // Высота

    // Конструктор: принимает имя и размеры. 
    // Название фигуры отдает наверх конструктору Shape.
    Rectangle(string n, double w, double h) : Shape(n) {
        width = w;
        height = h;
    }

    // Метод потомка: выводит инфу и сам считает площадь в переменную
    void showInfo() {
        printName(); // Вызываем метод родителя (наследование)
        
        double area = width * height; // Считаем площадь
        
        cout << "Размеры прямоугольника: " << width << " на " << height << endl;
        cout << "Площадь равна: " << area << endl;
    }
};

int main() {
    setlocale(LC_ALL, "Russian"); // Для русского текста в консоли

    cout << "=== Тестируем работу методов ===" << endl;
    
    // Создаем объект прямоугольника с именем и размерами 5.0 на 4.0
    Rectangle rect("Мой Прямоугольник", 5.0, 4.0);
    
    // Вызываем метод вывода инфы
    rect.showInfo(); 

    return 0;
}
