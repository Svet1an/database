-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 30 2023 г., 22:02
-- Версия сервера: 8.0.24
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `restaurant_v2.0`
--

-- --------------------------------------------------------

--
-- Структура таблицы `hours`
--

CREATE TABLE `hours` (
  `id` int NOT NULL COMMENT 'id',
  `hours` int NOT NULL COMMENT 'Время нахождения гостя в ресторане'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='В данной таблице вносится время нахождения гостя в ресторане';

-- --------------------------------------------------------

--
-- Структура таблицы `main`
--

CREATE TABLE `main` (
  `id` int NOT NULL COMMENT 'id',
  `id_visitor` int NOT NULL COMMENT 'идентификационный номер гостя',
  `id_table` int NOT NULL COMMENT 'идентификационный номер стола',
  `time_of_coming` datetime NOT NULL COMMENT 'время прихода',
  `id_hours_of_stay` int NOT NULL COMMENT 'Время пребывания'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Главная таблица, на которой собрана информация для хостес';

-- --------------------------------------------------------

--
-- Структура таблицы `table001`
--

CREATE TABLE `table001` (
  `id` int NOT NULL COMMENT 'id',
  `number_of_table` int NOT NULL COMMENT 'Номер стола',
  `seats` int NOT NULL COMMENT 'Кол-во посадочных мест'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='В данной таблице находится информация о столах';

-- --------------------------------------------------------

--
-- Структура таблицы `visitor`
--

CREATE TABLE `visitor` (
  `id` int NOT NULL COMMENT 'id',
  `FIO_of_visitor` int NOT NULL COMMENT 'ФИО гостя',
  `number_of_people` int NOT NULL COMMENT 'Кол-во человек'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `hours`
--
ALTER TABLE `hours`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hours` (`hours`);

--
-- Индексы таблицы `main`
--
ALTER TABLE `main`
  ADD PRIMARY KEY (`id`),
  ADD KEY `visit` (`id_visitor`) USING BTREE,
  ADD KEY `hou` (`id_hours_of_stay`) USING BTREE,
  ADD KEY `tab` (`id_table`) USING BTREE;

--
-- Индексы таблицы `table001`
--
ALTER TABLE `table001`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seats` (`seats`) USING BTREE;

--
-- Индексы таблицы `visitor`
--
ALTER TABLE `visitor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `peop` (`number_of_people`);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `main`
--
ALTER TABLE `main`
  ADD CONSTRAINT `main_ibfk_1` FOREIGN KEY (`id_hours_of_stay`) REFERENCES `hours` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `main_ibfk_2` FOREIGN KEY (`id_table`) REFERENCES `table001` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `main_ibfk_3` FOREIGN KEY (`id_visitor`) REFERENCES `visitor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `table001`
--
ALTER TABLE `table001`
  ADD CONSTRAINT `table001_ibfk_1` FOREIGN KEY (`seats`) REFERENCES `visitor` (`number_of_people`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
