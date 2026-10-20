-- =========================================================
-- BÀI THỰC HÀNH: THAM SỐ TRONG STORED PROCEDURE (IN, OUT, INOUT)
-- Cơ sở dữ liệu sử dụng: classicmodels
-- =========================================================

USE classicmodels;

------------------------------------------------------------
-- 1. THAM SỐ LOẠI IN (Truyền giá trị vào Procedure)
------------------------------------------------------------
DELIMITER //

DROP PROCEDURE IF EXISTS getCusById //

CREATE PROCEDURE getCusById
(
    IN cusNum INT(11)
)
BEGIN
    SELECT * FROM customers WHERE customerNumber = cusNum;
END //

DELIMITER ;

-- Cách gọi procedure với tham số IN:
CALL getCusById(175);


------------------------------------------------------------
-- 2. THAM SỐ LOẠI OUT (Lấy dữ liệu từ Procedure ra bên ngoài)
------------------------------------------------------------
DELIMITER //

DROP PROCEDURE IF EXISTS GetCustomersCountByCity //

CREATE PROCEDURE GetCustomersCountByCity
(
    IN in_city VARCHAR(50),
    OUT total INT
)
BEGIN
    SELECT COUNT(customerNumber)
    INTO total
    FROM customers
    WHERE city = in_city;
END //

DELIMITER ;

-- Cách gọi procedure với tham số OUT:
CALL GetCustomersCountByCity('Lyon', @total);
SELECT @total;


------------------------------------------------------------
-- 3. THAM SỐ LOẠI INOUT (Vừa truyền vào, vừa nhận kết quả thay đổi)
------------------------------------------------------------
DELIMITER //

DROP PROCEDURE IF EXISTS SetCounter //

CREATE PROCEDURE SetCounter
(
    INOUT counter INT,
    IN inc INT
)
BEGIN
    SET counter = counter + inc;
END //

DELIMITER ;

-- Cách gọi procedure với tham số INOUT:
SET @counter = 1;

CALL SetCounter(@counter, 1); -- Kết quả: 2
CALL SetCounter(@counter, 1); -- Kết quả: 3
CALL SetCounter(@counter, 5); -- Kết quả: 8

SELECT @counter;
