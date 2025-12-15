-- Tạo database
CREATE DATABASE worker_manage;
USE worker_manage;

-- Bảng hometown
CREATE TABLE hometown (
                          id CHAR(36) NOT NULL,       -- UUID dạng chuỗi
                          code VARCHAR(10) NOT NULL,  -- Mã tỉnh
                          name VARCHAR(100) NOT NULL, -- Tên tỉnh
                          PRIMARY KEY (id),
                          UNIQUE KEY (code)
);

-- Bảng worker
CREATE TABLE worker (
                        id CHAR(36) NOT NULL,          -- UUID dạng chuỗi
                        name VARCHAR(100) NOT NULL,    -- Tên công nhân
                        birth_year INT,                -- Năm sinh
                        hometown_id VARCHAR(10),          -- FK -> hometown.code
                        salary DECIMAL(18,2),          -- Lương
                        PRIMARY KEY (id),
                        CONSTRAINT fk_worker_hometown
                            FOREIGN KEY (hometown_id) REFERENCES hometown(code)
                                ON DELETE SET NULL
                                ON UPDATE CASCADE
);