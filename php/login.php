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

// Переменные для хранения значений
$email = isset($_POST["email"]) ? $_POST["email"] : "";
$password = isset($_POST["pswd"]) ? $_POST["pswd"] : "";

// Отладочный вывод
$file = fopen("debug.txt", "a");
fwrite($file, "Email: " . $email . PHP_EOL);
fwrite($file, "Password: " . $password . PHP_EOL);
fclose($file);

// Переменные для хранения сообщений об ошибках
$errors = array();

// Обработка отправленных данных входа
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Подготовка и выполнение SQL-запроса для проверки введенных данных
    $stmt = $conn->prepare("SELECT * FROM `users` WHERE email = ? AND password = ?");
    $stmt->bind_param("ss", $email, $password);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        // Вход успешен, формирование JSON-ответа
        $response = array(
            "success" => true,
            "message" => "Успешный вход."
        );
        header('Content-Type: application/json');
        echo json_encode($response);
    } else {
        $errors[] = "Неверные данные для входа.";

        // Формирование JSON-ответа с сообщением об ошибке
        $response = array(
            "success" => false,
            "message" => "Ошибка входа: " . implode(", ", $errors)
        );
        header('Content-Type: application/json');
        echo json_encode($response);
    }
    $stmt->close();
}
$conn->close();
?>
