CREATE TABLE `notes` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NOTE_TEXT` varchar(255) DEFAULT NULL,
  `DONE` tinyint(4) DEFAULT '0',
  `CREATED_DATE` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
INSERT INTO `notes` (`NOTE_TEXT`, `CREATED_DATE`, `DONE`) VALUES ('Первая запись', '2018-01-30', 1);
INSERT INTO `notes` (`NOTE_TEXT`, `CREATED_DATE`, `DONE`) VALUES ('Два часа ушло на то, чтобы просто настроить окружение: Tomcat, Maven, Spring.', '2018-01-30', 1);
INSERT INTO `notes` (`NOTE_TEXT`, `CREATED_DATE`, `DONE`) VALUES ('Попалось отличное видео по созданию CRUD приложения с помощью Spring MVC', '2018-01-30', 1);
INSERT INTO `notes` (`NOTE_TEXT`, `CREATED_DATE`, `DONE`) VALUES ('Пересмотрел его три раза, прежде чем понял структуру приложения: Controller, Service, DAO, Model, JSP', '2018-01-30', 0);
INSERT INTO `notes` (`NOTE_TEXT`, `CREATED_DATE`, `DONE`) VALUES ('Готов CRUD функционал. Теперь можно приступать к обзор инструментов для пэйджинга, сортировки и фильтрации.', '2018-02-01', 0);
INSERT INTO `notes` (`NOTE_TEXT`, `CREATED_DATE`, `DONE`) VALUES ('Пауза, туго опять втягиваться после недельного перерыва.', '2018-02-07', 0);
INSERT INTO `notes` (`NOTE_TEXT`, `CREATED_DATE`, `DONE`) VALUES ('С пэйджингом интересно получается. Есть классы репозитории, от которых можно наследовать DAO. Фактически в этих классах есть все, для реализации CRUD.', '2018-02-10', 1);
INSERT INTO `notes` (`NOTE_TEXT`, `CREATED_DATE`, `DONE`) VALUES ('Сделал в итоге на скорую руку. Просто протаскиваю параметры из GET-запроса в контроллер, сервис и далее в DAO.', '2018-02-10', 1);
INSERT INTO `notes` (`NOTE_TEXT`, `CREATED_DATE`, `DONE`) VALUES ('В теме про стажировку посоветовали PageRequest и PagingAndSortingRepository, обязательно их попробую.', '2018-02-11', 1);
INSERT INTO `notes` (`NOTE_TEXT`, `CREATED_DATE`, `DONE`) VALUES ('Опять пауза, вынужденная. Еще труднее втягиваться обратно, кода-то больше стало :)', '2018-02-18', 1);
INSERT INTO `notes` (`NOTE_TEXT`, `CREATED_DATE`, `DONE`) VALUES ('Ну что там у нас с PagingAndSortingRepository. Подошел бы JpaRepository, но что-то нет пока желания с ним разбираться. По найденным примерам не завелся, не получается сходу имплементировать интерфейс.', '2018-02-18', 0);
INSERT INTO `notes` (`NOTE_TEXT`, `CREATED_DATE`, `DONE`) VALUES ('Сегодня просто чтение возможных вариантов реализации фильтров и сортировки. Все больше склоняюсь к реализации через HQL', '2018-02-19', 0);
INSERT INTO `notes` (`NOTE_TEXT`, `CREATED_DATE`, `DONE`) VALUES ('Такс, ну все готово и красиво на фронте. Надо написать скрипт на SQL', '2018-02-20', 0);
INSERT INTO `notes` (`NOTE_TEXT`, `CREATED_DATE`, `DONE`) VALUES ('ЧЕРТ! Заявки же только до 14:00 принимаются, похоже не успел...', '2018-02-20', 0);
INSERT INTO `notes` (`NOTE_TEXT`, `CREATED_DATE`, `DONE`) VALUES ('Эх...', '2018-02-20', 0);
INSERT INTO `notes` (`NOTE_TEXT`, `CREATED_DATE`, `DONE`) VALUES ('Тест проекта, стянуть его с гитхаба и создать клон.', '2018-02-20', 0);
INSERT INTO `notes` (`NOTE_TEXT`, `CREATED_DATE`, `DONE`) VALUES ('Еще пара заметок для проверок пейджинга и тестов', '2018-02-20', 1);
INSERT INTO `notes` (`NOTE_TEXT`, `CREATED_DATE`, `DONE`) VALUES ('Еще пара-тройка заметок для проверок пейджинга и тестов', '2018-02-20', 1);
INSERT INTO `notes` (`NOTE_TEXT`, `CREATED_DATE`, `DONE`) VALUES ('Еще несколько заметок для проверок пейджинга и тестов', '2018-02-20', 1);
INSERT INTO `notes` (`NOTE_TEXT`, `CREATED_DATE`, `DONE`) VALUES ('Ну вот, добавил заметок побольше и вылез в пагинаторе на 3ей странице', '2018-02-20', 1);
INSERT INTO `notes` (`NOTE_TEXT`, `CREATED_DATE`, `DONE`) VALUES ('Ну, конечно. Надо было заморочиться сейчас с переписыванием JSP пагинатора', '2018-02-20 21:59:49.0', 1);