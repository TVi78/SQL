CREATE schema tasks;
USE tasks;

/*
1. Создайте функцию, которая принимает кол-во сек и форматирует их в кол-во дней, часов, минут и секунд.
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds ' 
*/

DROP FUNCTION format_day;
DELIMITER $$
CREATE FUNCTION format_day (n INT)
RETURNS VARCHAR(200)
DETERMINISTIC
	BEGIN
		DECLARE f_day INT DEFAULT 0;
		DECLARE f_hours INT DEFAULT 0;
        DECLARE f_minutes INT DEFAULT 0;
        DECLARE f_second INT DEFAULT 0;
        DECLARE temp INT DEFAULT 0;
        DECLARE res VARCHAR(300) DEFAULT 0;
		SET f_day=n/60/60/24;
        SET temp=n-f_day*60*60*24;
        SET f_hours=temp/60/60;
        SET temp=temp-f_hours*60*60;
        SET f_minutes=FLOOR(temp/60);
        SET f_second=temp-(f_minutes*60);
        SET res=concat(f_day, " days ", f_hours, " hours ", f_minutes, " minutes ", f_second,  " seconds");
        RETURN res;
	END$$
DELIMITER ;
    
SELECT format_day(123456) AS data;

/*
Выведите только четные числа от 1 до 10 включительно (через процедуру)
Пример: 2,4,6,8,10 (можно сделать через шаг + 2: х = 2, х+=2)
*/

DROP PROCEDURE even_number;
DELIMITER $$
CREATE PROCEDURE even_number (n INT)
	BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE res VARCHAR(300) DEFAULT "";
    WHILE i < n + 1 DO
		IF(i % 2 = 0) THEN
			SET res = concat(res, " ", i);
		END IF;
		SET i = i + 1;
	END WHILE;
        SELECT res;
	END$$
DELIMITER ;
    
CALL even_number(10);