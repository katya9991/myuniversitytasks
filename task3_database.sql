CREATE DATABASE TourismBase;
USE TourismBase;

-- ТАБЛИЦЫ-СПРАВОЧНИКИ

-- 1. Справочник стран
CREATE TABLE Countries (
    country_id INT AUTO_INCREMENT PRIMARY KEY, -- Главный ключ
    country_name VARCHAR(100) NOT NULL,        -- Название страны
    visa_required VARCHAR(10)                  -- Нужна виза или нет ("Да"/"Нет")
);

-- 2. Справочник отелей
CREATE TABLE Hotels (
    hotel_id INT AUTO_INCREMENT PRIMARY KEY,   -- Главный ключ
    hotel_name VARCHAR(100) NOT NULL,          -- Название отеля
    stars INT,                                 -- Количество звезд
    price_per_night INT NOT NULL               -- Цена за сутки в рублях
);

-- 3. Справочник клиентов
CREATE TABLE Clients (
    client_id INT AUTO_INCREMENT PRIMARY KEY,  -- Главный ключ
    last_name VARCHAR(50) NOT NULL,            -- Фамилия
    first_name VARCHAR(50) NOT NULL,           -- Имя
    passport_data VARCHAR(30) NOT NULL,        -- Серия и номер паспорта одной строкой
    phone VARCHAR(20)                          -- Телефон
);

-- 4. Справочник доп. услуг
CREATE TABLE Services (
    service_id INT AUTO_INCREMENT PRIMARY KEY, -- Главный ключ
    service_name VARCHAR(150) NOT NULL,        -- Название услуги (например, Страховка)
    service_price INT NOT NULL                 -- Стоимость этой услуги
);


-- ТАБЛИЦА ПЕРЕМЕННОЙ ИНФОРМАЦИИ (Журнал заказов)

-- 5. Главная таблица, куда пишется каждый оформленный тур
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,   -- Номер заказа (Главный ключ)
    order_date DATE NOT NULL,                  -- Когда купили тур
    departure_date DATE NOT NULL,              -- Дата вылета
    duration_days INT NOT NULL,                -- На сколько дней тур
    total_price INT NOT NULL,                  -- Общая стоимость всего тура
    
    -- Поля-связи (Внешние ключи)
    client_id INT,
    country_id INT,
    hotel_id INT,
    service_id INT, -- Связь с перечнем услуг
    
    -- Настраиваем связи
    FOREIGN KEY (client_id) REFERENCES Clients(client_id),
    FOREIGN KEY (country_id) REFERENCES Countries(country_id),
    FOREIGN KEY (hotel_id) REFERENCES Hotels(hotel_id),
    FOREIGN KEY (service_id) REFERENCES Services(service_id)
);
