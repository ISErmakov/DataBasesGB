DROP FUNCTION toTime;
DELIMITER //
CREATE FUNCTION toTime(sec INT)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
	-- 123456 ->'1 days 10 hours 17 minutes 36 seconds 24*60*60
    DECLARE res varchar(50) DEFAULT '';
    IF (sec DIV 86400) > 0 THEN 
		SET res = CONCAT(sec DIV 86400, ' days ');
        SET sec = sec MOD 86400;
	END IF;
	IF (sec DIV 3600) > 0 THEN 
		SET res = CONCAT(res, sec DIV 3600, ' hours ');
        SET sec = sec MOD 3600;
	END IF;
	IF (sec DIV 60) > 0 THEN 
		SET res = CONCAT(res, sec DIV 60, ' minutes ');
        SET sec = sec MOD 60;
	END IF;
	IF sec > 0 THEN 
		SET res = CONCAT(res, sec, ' seconds');
	END IF;
	IF sec <0 THEN SET res = 'wrong number';
    END IF;
    RETURN res;
END //
DELIMITER ;

SELECT toTime(123456); 

-- Создайте процедуру, которая выводит только четные числа от 1 до 10. Пример: 2,4,6,8,10

DROP PROCEDURE eneven;
DELIMITER //
CREATE PROCEDURE eneven()
BEGIN
	DECLARE n INT DEFAULT 3;
    DECLARE res VARCHAR(50) DEFAULT '2';
	WHILE n<=10  DO
		IF (n mod 2) = 0 THEN
			SET res = CONCAT(res, ',', n); 
		END IF;
		SET n = n + 1;
    END WHILE;
    SELECT res;
END //
DELIMITER ;

CALL eneven();
