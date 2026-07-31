#include <iostream>
#include <vector> // Подключаем вектор, аналог массива динамического размера

using namespace std;

int main() {
    setlocale(LC_ALL, "Russian"); // Чтобы консоль не выдавала иероглифы

    int n;
    cout << "Введите размер массива N: ";
    cin >> n;

    // Создаем массив (вектор) на N элементов
    vector<int> A(n);

    cout << "Введите элементы массива по очереди:" << endl;
    for (int i = 0; i < n; i++) {
        cout << "A[" << i << "] = ";
        cin >> A[i];
    }

    // Ищем индексы минимального и максимального элементов
    // Самый первый элемент (индекс 0) и есть мин/макс
    int max_idx = 0;
    int min_idx = 0;

    for (int i = 1; i < n; i++) {
        if (A[i] > A[max_idx]) {
            max_idx = i; // Нашли число побольше, запоминаем его индекс
        }
        if (A[i] < A[min_idx]) {
            min_idx = i; // Нашли число поменьше, запоминаем его индекс
        }
    }

    // Какой индекс левее (меньше), а какой правее
    int start, end;
    if (min_idx < max_idx) {
        start = min_idx;
        end = max_idx;
    } else {
        start = max_idx;
        end = min_idx;
    }

    // Считаем сумму отрицательных чисел строго МЕЖДУ ними
    int sum = 0;
    // Начинаем со start + 1, чтобы не включать сам минимум/максимум
    for (int i = start + 1; i < end; i++) {
        if (A[i] < 0) {
            sum += A[i];
        }
    }

    // Выводим результаты для проверки
    cout << "\nИндекс минимума: " << min_idx << " (значение: " << A[min_idx] << ")" << endl;
    cout << "Индекс максимума: " << max_idx << " (значение: " << A[max_idx] << ")" << endl;
    cout << "Сумма отрицательных между ними: " << sum << endl;

    return 0;
}
