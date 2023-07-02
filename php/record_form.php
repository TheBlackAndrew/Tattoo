<?php
// Подключение к базе данных MySQL
$servername = "localhost"; // Имя сервера базы данных (обычно "localhost")
$username = "root"; // Имя пользователя базы данных
$password = ""; // Пароль пользователя базы данных
$dbname = "tattoo_salon"; // Имя базы данных

// Создание соединения
$conn = new mysqli($servername, $username, $password, $dbname);

// Проверка соединения на ошибки
if ($conn->connect_error) {
    die("Ошибка подключения к базе данных: " . $conn->connect_error);
}

// Получение значений из POST-запроса
$phoneNumber = isset($_POST["phone_number"]) ? $_POST["phone_number"] : "";
$text = isset($_POST["FIO"]) ? $_POST["FIO"] : "";
$email = isset($_POST["email"]) ? $_POST["email"] : "";

// Подготовка SQL-запроса для вставки данных в таблицу orders
$stmt = $conn->prepare("INSERT INTO records_on_training (FIO, phone_number, email) VALUES (?, ?, ?)");
$stmt->bind_param("ss", $phoneNumber, $text, $email);
$stmt->execute();

// Проверка результата выполнения запроса
if ($stmt->affected_rows > 0) {
    // Данные успешно добавлены
    echo "Данные успешно добавлены в базу данных.";

    // Отображение браузерного сообщения
    echo '<script>alert("Данные успешно добавлены в базу данных.");</script>';

    // Перенаправление на страницу index.html
    echo '<script>window.location.href = "../index.html";</script>';
    exit(); // Завершение скрипта
} else {
    // Возникла ошибка при добавлении данных
    echo "Ошибка при добавлении данных в базу данных.";
}

$stmt->close();
$conn->close();
?>
