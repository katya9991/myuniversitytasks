CREATE DATABASE TourismWebDB;
GO

-- Переключаемся на работу с созданной базой
USE TourismWebDB;
GO

-- ТАБЛИЦЫ-СПРАВОЧНИКИ

-- 1. Справочник стран
CREATE TABLE Countries (
    country_id INT IDENTITY(1,1) PRIMARY KEY, -- Первичный ключ с автоинкрементом
    country_name NVARCHAR(100) NOT NULL,       -- Название страны (юникод)
    visa_required NVARCHAR(10) NOT NULL        -- Значение "Да" или "Нет"
);
GO

-- 2. Справочник отелей
CREATE TABLE Hotels (
    hotel_id INT IDENTITY(1,1) PRIMARY KEY,
    hotel_name NVARCHAR(100) NOT NULL,
    stars INT,
    price_per_night INT NOT NULL
);
GO

-- 3. Справочник клиентов
CREATE TABLE Clients (
    client_id INT IDENTITY(1,1) PRIMARY KEY,
    last_name NVARCHAR(50) NOT NULL,
    first_name NVARCHAR(50) NOT NULL,
    passport_data NVARCHAR(30) NOT NULL,
    phone NVARCHAR(20)
);
GO

-- 4. Справочник дополнительных услуг
CREATE TABLE Services (
    service_id INT IDENTITY(1,1) PRIMARY KEY,
    service_name NVARCHAR(150) NOT NULL,
    service_price INT NOT NULL
);
GO

-- ТАБЛИЦА ПЕРЕМЕННОЙ ИНФОРМАЦИИ (Журнал заказов)

-- 5. Главная таблица заказов туров со всеми внешними ключами
CREATE TABLE Orders (
    order_id INT IDENTITY(1,1) PRIMARY KEY,
    order_date DATE NOT NULL,
    departure_date DATE NOT NULL,
    duration_days INT NOT NULL,
    total_price INT NOT NULL,
    
    -- Атрибуты для связи со справочниками
    client_id INT,
    country_id INT,
    hotel_id INT,
    service_id INT,
    
    -- Создание внешних ключей (связи между таблицами)
    FOREIGN KEY (client_id) REFERENCES Clients(client_id),
    FOREIGN KEY (country_id) REFERENCES Countries(country_id),
    FOREIGN KEY (hotel_id) REFERENCES Hotels(hotel_id),
    FOREIGN KEY (service_id) REFERENCES Services(service_id)
);
GO
