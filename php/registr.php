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

// Получение данных из AJAX-запроса
$email = $_POST["email"];
$password = $_POST["pswd"];

// Проверка маски пароля
if (!preg_match("/^(?=.*[A-Z])(?=.*[!@#$%^&*])(?=.*[0-9])(?=.*[a-z]).{8,}$/", $password)) {
    $response = array(
        'success' => false,
        'message' => 'Пароль должен содержать как минимум одну заглавную букву, одну цифру, один специальный символ и быть не менее 8 символов в длину.'
    );
} else {
    // Проверка наличия пользователя с такой же почтой
    $sql = "SELECT * FROM `users` WHERE email = '$email'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $response = array(
            'success' => false,
            'message' => 'Пользователь с такой почтой уже существует.'
        );
    } else {
        // Подготовка и выполнение SQL-запроса для вставки данных в таблицу
        $sql = "INSERT INTO `users` (email, password) VALUES ('$email', '$password')";

        if ($conn->query($sql) === TRUE) {
            $response = array(
                'success' => true,
                'message' => 'Регистрация успешно завершена.'
            );
        } else {
            $response = array(
                'success' => false,
                'message' => 'Ошибка при регистрации: ' . $conn->error
            );
        }
    }
}

// Отправка ответа в формате JSON
echo json_encode($response);

// Закрытие соединения с базой данных
$conn->close();
?>

