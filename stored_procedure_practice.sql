-- =========================================================
-- BÀI THỰC HÀNH: SỬ DỤNG STORED PROCEDURE TRONG MYSQL
-- Cơ sở dữ liệu sử dụng: classicmodels
-- =========================================================

USE classicmodels;

-- 1. Thay đổi ký tự kết thúc lệnh từ dấu chấm phẩy (;) sang (//)
DELIMITER //

-- 2. Tạo Stored Procedure để lấy toàn bộ thông tin từ bảng customers
CREATE PROCEDURE findAllCustomers()
BEGIN
    SELECT * FROM customers;
END //

-- Khôi phục lại ký tự kết thúc lệnh mặc định
DELIMITER ;

-- Gọi Stored Procedure
CALL findAllCustomers();

-- 3. Sửa/Cập nhật Stored Procedure (Xóa đi tạo lại bằng DROP)
DELIMITER //

DROP PROCEDURE IF EXISTS findAllCustomers//

CREATE PROCEDURE findAllCustomers()
BEGIN
    SELECT * FROM customers WHERE customerNumber = 175;
END //

DELIMITER ;

-- Gọi lại Stored Procedure sau khi sửa
CALL findAllCustomers();
