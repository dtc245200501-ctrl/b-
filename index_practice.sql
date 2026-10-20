-- =========================================================
-- BÀI THỰC HÀNH: THAO TÁC VỚI INDEX TRONG MYSQL
-- Cơ sở dữ liệu sử dụng: classicmodels
-- =========================================================

-- 1. Chọn cơ sở dữ liệu mẫu classicmodels
USE classicmodels;

-- 2. Kiểm tra hiệu năng truy vấn khi CHƯA tạo Index
-- Quan sát các thông số: type = ALL (duyệt toàn bộ bảng), rows lớn
EXPLAIN SELECT * FROM customers WHERE customerName = 'Land of Toys Inc.';

-- 3. Tạo Index cho cột customerName
ALTER TABLE customers ADD INDEX idx_customerName(customerName);

-- 4. Kiểm tra lại hiệu năng truy vấn SAU KHI đã tạo Index
-- Quan sát sự thay đổi: type chuyển thành 'ref', rows giảm xuống đáng kể
EXPLAIN SELECT * FROM customers WHERE customerName = 'Land of Toys Inc.';

-- 5. Tạo Index kết hợp (Composite Index) cho 2 cột contactFirstName và contactLastName
ALTER TABLE customers ADD INDEX idx_full_name(contactFirstName, contactLastName);

-- 6. Kiểm tra truy vấn tìm kiếm với Index kết hợp vừa tạo
EXPLAIN SELECT * FROM customers WHERE contactFirstName = 'Jean' OR contactFirstName = 'King';

-- 7. Xóa Index kết hợp khỏi bảng customers
ALTER TABLE customers DROP INDEX idx_full_name;
