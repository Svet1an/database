-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 01 2023 г., 19:30
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
-- База данных: `restaurant_v3.0`
--

-- --------------------------------------------------------

--
-- Структура таблицы `info_for_hostes`
--

CREATE TABLE `info_for_hostes` (
  `id` int NOT NULL COMMENT 'id',
  `id_visitor` int NOT NULL COMMENT 'id гостя',
  `id_стола` int NOT NULL COMMENT 'id стола',
  `date_time` datetime NOT NULL COMMENT 'Дата и время'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Таблица, на которой собрана информация для хостес';

-- --------------------------------------------------------

--
-- Структура таблицы `stol`
--

CREATE TABLE `stol` (
  `id` int NOT NULL COMMENT 'id',
  `number_of_table` int NOT NULL COMMENT 'Номер стола',
  `seats` int NOT NULL COMMENT 'Кол-во посадочных мест'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='В данной таблице вносится номер стола';

-- --------------------------------------------------------

--
-- Структура таблицы `visitor`
--

CREATE TABLE `visitor` (
  `id` int NOT NULL COMMENT 'id',
  `FIO_of_visitor` text NOT NULL COMMENT 'ФИО гостя',
  `number_of_people` text NOT NULL COMMENT 'Кол-во человек'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='В данной таблице вносятся данные гостя';

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `info_for_hostes`
--
ALTER TABLE `info_for_hostes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `human` (`id_visitor`),
  ADD KEY `tab` (`id_стола`);

--
-- Индексы таблицы `stol`
--
ALTER TABLE `stol`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `visitor`
--
ALTER TABLE `visitor`
  ADD PRIMARY KEY (`id`);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `info_for_hostes`
--
ALTER TABLE `info_for_hostes`
  ADD CONSTRAINT `info_for_hostes_ibfk_1` FOREIGN KEY (`id_стола`) REFERENCES `stol` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `info_for_hostes_ibfk_2` FOREIGN KEY (`id_visitor`) REFERENCES `visitor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
