-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июн 25 2023 г., 17:52
-- Версия сервера: 10.4.27-MariaDB
-- Версия PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `tattoo_salon`
--

-- --------------------------------------------------------

--
-- Структура таблицы `body_area`
--

CREATE TABLE `body_area` (
  `id_body_area` int(11) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `body_area`
--

INSERT INTO `body_area` (`id_body_area`, `name`) VALUES
(1, 'Плечо'),
(2, 'Спина'),
(3, 'Бедро'),
(4, 'Нога'),
(5, 'Пальцы');

-- --------------------------------------------------------

--
-- Структура таблицы `client`
--

CREATE TABLE `client` (
  `id_client` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `client`
--

INSERT INTO `client` (`id_client`, `name`, `phone`) VALUES
(1, 'Иванов Петр Сергеевич', '89199382718'),
(2, 'Репина Евгения Юрьевна', '89851673639'),
(3, 'Серов Петр Владимирович', '89102839947'),
(4, 'Савченко Григорий Олегович', '89163785939'),
(5, 'Домоседов Анатолий Степанович', '89145671020');

-- --------------------------------------------------------

--
-- Структура таблицы `master`
--

CREATE TABLE `master` (
  `id_master` int(11) NOT NULL,
  `id_style` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `phone` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `master`
--

INSERT INTO `master` (`id_master`, `id_style`, `name`, `phone`) VALUES
(1, 3, 'Аваров Леонид Васильевич', '89995162054'),
(2, 5, 'Кузнецова Татьяна Викторовна', '89150016371'),
(3, 2, 'Быков Андрей Евгеньевич', '89151823483'),
(4, 1, 'Юла Ксения Анатольевна', '89102857384'),
(5, 4, 'Томченко Лидия Степановна', '89137583959'),
(6, 2, 'Аваров Леонид Васильевич', '89995162054'),
(7, 2, 'Кузнецова Татьяна Викторовна', '89150016371'),
(8, 4, 'Быков Андрей Евгеньевич', '89151823483');

-- --------------------------------------------------------

--
-- Структура таблицы `registration`
--

CREATE TABLE `registration` (
  `id_registration` int(11) NOT NULL,
  `id_master` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  `id_sketch` int(11) NOT NULL,
  `id_body_area` int(11) NOT NULL,
  `id_tattoo_status` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `price` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `registration`
--

INSERT INTO `registration` (`id_registration`, `id_master`, `id_client`, `id_sketch`, `id_body_area`, `id_tattoo_status`, `date`, `time`, `price`) VALUES
(1, 1, 4, 2, 5, 1, '2023-03-08', '12:30:00', 7600),
(2, 2, 4, 3, 4, 3, '2023-01-05', '10:40:00', 10200),
(3, 1, 2, 1, 3, 2, '2023-08-10', '18:00:00', 9200),
(4, 5, 4, 5, 1, 1, '2023-10-09', '15:20:00', 12300),
(5, 4, 2, 4, 2, 2, '2023-11-17', '17:10:00', 7500),
(6, 1, 5, 5, 2, 1, '2023-09-25', '19:00:00', 16000),
(7, 3, 3, 3, 1, 2, '2023-01-18', '12:40:00', 11000),
(8, 2, 4, 4, 3, 2, '2023-06-06', '10:10:00', 8700),
(9, 3, 2, 2, 4, 1, '2023-12-16', '13:00:00', 15100),
(10, 4, 1, 1, 5, 3, '2023-07-11', '14:30:00', 3500);

-- --------------------------------------------------------

--
-- Структура таблицы `tattoo_sketch`
--

CREATE TABLE `tattoo_sketch` (
  `id_sketch` int(11) NOT NULL,
  `id_style` int(11) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `tattoo_sketch`
--

INSERT INTO `tattoo_sketch` (`id_sketch`, `id_style`, `name`) VALUES
(1, 3, 'Дракон'),
(2, 1, 'Пионы'),
(3, 2, 'Портрет'),
(4, 4, 'Узоры'),
(5, 5, 'Скелет'),
(6, 3, 'Сакура'),
(7, 4, 'Фигуры');

-- --------------------------------------------------------

--
-- Структура таблицы `tattoo_status`
--

CREATE TABLE `tattoo_status` (
  `id_tattoo_status` int(11) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `tattoo_status`
--

INSERT INTO `tattoo_status` (`id_tattoo_status`, `name`) VALUES
(1, 'Новая'),
(2, 'Обновление'),
(3, 'Кавер-ап');

-- --------------------------------------------------------

--
-- Структура таблицы `tattoo_style`
--

CREATE TABLE `tattoo_style` (
  `id_style` int(11) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `tattoo_style`
--

INSERT INTO `tattoo_style` (`id_style`, `name`) VALUES
(1, 'Old school'),
(2, 'Реализм'),
(3, 'Японские'),
(4, 'Графика'),
(5, 'Blackwork');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `body_area`
--
ALTER TABLE `body_area`
  ADD PRIMARY KEY (`id_body_area`);

--
-- Индексы таблицы `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`);

--
-- Индексы таблицы `master`
--
ALTER TABLE `master`
  ADD PRIMARY KEY (`id_master`),
  ADD KEY `id_style` (`id_style`);

--
-- Индексы таблицы `registration`
--
ALTER TABLE `registration`
  ADD PRIMARY KEY (`id_registration`),
  ADD KEY `id_body_area` (`id_body_area`),
  ADD KEY `id_sketch` (`id_sketch`),
  ADD KEY `id_tattoo_client` (`id_client`),
  ADD KEY `id_tattoo_master` (`id_master`),
  ADD KEY `id_tattoo_status` (`id_tattoo_status`);

--
-- Индексы таблицы `tattoo_sketch`
--
ALTER TABLE `tattoo_sketch`
  ADD PRIMARY KEY (`id_sketch`),
  ADD KEY `id_style` (`id_style`);

--
-- Индексы таблицы `tattoo_status`
--
ALTER TABLE `tattoo_status`
  ADD PRIMARY KEY (`id_tattoo_status`);

--
-- Индексы таблицы `tattoo_style`
--
ALTER TABLE `tattoo_style`
  ADD PRIMARY KEY (`id_style`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `body_area`
--
ALTER TABLE `body_area`
  MODIFY `id_body_area` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `client`
--
ALTER TABLE `client`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `master`
--
ALTER TABLE `master`
  MODIFY `id_master` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `registration`
--
ALTER TABLE `registration`
  MODIFY `id_registration` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `tattoo_sketch`
--
ALTER TABLE `tattoo_sketch`
  MODIFY `id_sketch` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `tattoo_status`
--
ALTER TABLE `tattoo_status`
  MODIFY `id_tattoo_status` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `tattoo_style`
--
ALTER TABLE `tattoo_style`
  MODIFY `id_style` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `master`
--
ALTER TABLE `master`
  ADD CONSTRAINT `master_ibfk_1` FOREIGN KEY (`id_style`) REFERENCES `tattoo_style` (`id_style`);

--
-- Ограничения внешнего ключа таблицы `registration`
--
ALTER TABLE `registration`
  ADD CONSTRAINT `registration_ibfk_1` FOREIGN KEY (`id_body_area`) REFERENCES `body_area` (`id_body_area`),
  ADD CONSTRAINT `registration_ibfk_2` FOREIGN KEY (`id_sketch`) REFERENCES `tattoo_sketch` (`id_sketch`),
  ADD CONSTRAINT `registration_ibfk_3` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`),
  ADD CONSTRAINT `registration_ibfk_4` FOREIGN KEY (`id_master`) REFERENCES `master` (`id_master`),
  ADD CONSTRAINT `registration_ibfk_5` FOREIGN KEY (`id_tattoo_status`) REFERENCES `tattoo_status` (`id_tattoo_status`);

--
-- Ограничения внешнего ключа таблицы `tattoo_sketch`
--
ALTER TABLE `tattoo_sketch`
  ADD CONSTRAINT `tattoo_sketch_ibfk_1` FOREIGN KEY (`id_style`) REFERENCES `tattoo_style` (`id_style`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
