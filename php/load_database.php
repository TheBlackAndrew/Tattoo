<?php
// Подключение к базе данных MySQL
$servername = "localhost"; // Имя сервера базы данных (обычно "localhost")
$username = "root"; // Имя пользователя базы данных
$password = ""; // Пароль пользователя базы данных
$dbname = "tattoo_salon"; // Имя базы данных

// Получение выбранной таблицы из параметра запроса
$table = isset($_GET["table"]) ? $_GET["table"] : "";

// Создание соединения
$conn = new mysqli($servername, $username, $password, $dbname);

// Проверка соединения на ошибки
if ($conn->connect_error) {
    die("Ошибка подключения к базе данных: " . $conn->connect_error);
}

// Запрос на выборку данных из выбранной таблицы
$query = "SELECT * FROM " . $table;
$result = $conn->query($query);

if ($result->num_rows > 0) {
    echo "<table>";
    echo "<tr>";
    // Вывод заголовков столбцов
    $fieldNames = $result->fetch_fields();
    foreach ($fieldNames as $field) {
        echo "<th>" . $field->name . "</th>";
    }
    echo "</tr>";
    // Вывод данных таблицы
    while ($row = $result->fetch_assoc()) {
        echo "<tr>";
        foreach ($row as $value) {
            echo "<td>" . $value . "</td>";
        }
        echo "</tr>";
    }
    echo "</table>";
} else {
    echo "Нет данных в выбранной таблице.";
}

$conn->close();
?>