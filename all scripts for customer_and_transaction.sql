-- Таблица jobs
CREATE TABLE jobs (
    job_id SERIAL PRIMARY KEY, -- Автоинкрементный первичный ключ
    job_title VARCHAR(100),
    job_industry_category VARCHAR(100),
    CONSTRAINT unique_job_combination UNIQUE (job_title, job_industry_category)
);

-- Таблица addresses
CREATE TABLE addresses (
    address_id SERIAL PRIMARY KEY, -- Автоинкрементный первичный ключ
    address VARCHAR(255) NOT NULL,
    postcode VARCHAR(20) NOT NULL,
    state VARCHAR(50) NOT NULL,
    country VARCHAR(50) NOT NULL,
    property_valuation INTEGER NOT NULL,
    CONSTRAINT unique_address_combination UNIQUE (address, postcode, state, country, property_valuation)
);

-- Таблица customers_info
CREATE TABLE customers_info (
    customer_id INTEGER PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50),
    gender VARCHAR(10) NOT NULL,
    DOB DATE,
    job_id INTEGER NOT NULL, -- job_id НЕ МОЖЕТ БЫТЬ NULL
    wealth_segment VARCHAR(50),
    deceased_indicator BOOLEAN NOT NULL,
    owns_car BOOLEAN NOT NULL,
    address_id INTEGER NOT NULL
);

-- Таблица products
CREATE TABLE products (
    product_id INTEGER PRIMARY KEY,
    brand VARCHAR(50) NOT NULL,
    product_line VARCHAR(50) NOT NULL,
    product_class VARCHAR(50) NOT NULL,
    product_size VARCHAR(20) NOT NULL,
    list_price NUMERIC(10, 2) NOT NULL,
    standard_cost NUMERIC(10, 2) NOT NULL
);
-- Таблица transactions_info
CREATE TABLE transactions_info (
    transaction_id INTEGER PRIMARY KEY,
    customer_id INTEGER NOT NULL, -- Убрана ссылка на таблицу customers_info
    product_id INTEGER NOT NULL, -- Убрана ссылка на таблицу products
    transaction_date TIMESTAMP NOT NULL,
    online_order BOOLEAN,
    order_status VARCHAR(50) NOT NULL
);

-- Вставка в jobs
INSERT INTO jobs (job_title, job_industry_category)
VALUES
    ('Executive Secretary', 'Health'),
    ('Administrative Officer', 'Financial Services'),
    ('Recruiting Manager', 'Property'),
    ('Senior Editor', NULL),
    ('Media Manager I', NULL),
    ('Business Systems Development Analyst', 'Argiculture'),
    ('Senior Quality Engineer', 'Financial Services'),
    ('Nuclear Power Engineer', 'Manufacturing'),
    ('Developer I', 'Financial Services'),
    ('Account Executive', 'Financial Services'),
    ('Junior Executive', 'Manufacturing'),
    ('Media Manager IV', NULL),
    ('Sales Associate', NULL),
    ('Professor', NULL);

-- Вставка в addresses
INSERT INTO addresses (address, postcode, state, country, property_valuation)
VALUES
    ('060 Morning Avenue', '2016', 'New South Wales', 'Australia', 10),
    ('6 Meadow Vale Court', '2153', 'New South Wales', 'Australia', 10),
    ('0 Holy Cross Court', '4211', 'QLD', 'Australia', 9),
    ('17979 Del Mar Point', '2448', 'New South Wales', 'Australia', 4),
    ('9 Oakridge Court', '3216', 'VIC', 'Australia', 9),
    ('4 Delaware Trail', '2210', 'New South Wales', 'Australia', 9),
    ('49 Londonderry Lane', '2650', 'New South Wales', 'Australia', 4),
    ('97736 7th Trail', '2023', 'New South Wales', 'Australia', 12),
    ('93405 Ludington Park', '3044', 'VIC', 'Australia', 8),
    ('44339 Golden Leaf Alley', '4557', 'QLD', 'Australia', 4),
    ('2 Sutherland Street', '3799', 'VIC', 'Australia', 6),
    ('9 Mcbride Trail', '2760', 'New South Wales', 'Australia', 8),
    ('9861 New Castle Avenue', '2428', 'New South Wales', 'Australia', 9),
    ('52 Moland Street', '3331', 'VIC', 'Australia', 4),
    ('82391 Kensington Lane', '3058', 'VIC', 'Australia', 9),
    ('092 2nd Alley', '2135', 'New South Wales', 'Australia', 12),
    ('59 Spaight Circle', '2233', 'New South Wales', 'Australia', 9),
    ('032 Bartelt Crossing', '2444', 'New South Wales', 'Australia', 8);

-- -- Вставка в customers_info
INSERT INTO customers_info (customer_id, first_name, last_name, gender, DOB, job_id, wealth_segment, deceased_indicator, owns_car, address_id)
VALUES
    (1, 'Laraine', 'Medendorp', 'F', '1953-10-12', 1, 'Mass Customer', FALSE, TRUE, 1),
    (2, 'Eli', 'Bockman', 'Male', '1980-12-16', 2, 'Mass Customer', FALSE, TRUE, 2),
    (3, 'Arlin', 'Dearle', 'Male', '1954-01-20', 3, 'Mass Customer', FALSE, TRUE, 3),
    (4, 'Talbot', NULL, 'Male', '1961-10-03', NULL, 'Mass Customer', FALSE, FALSE, 4),
    (5, 'Sheila-kathryn', 'Calton', 'Female', '1977-05-13', 4, 'Affluent Customer', FALSE, TRUE, 5),
    (6, 'Curr', 'Duckhouse', 'Male', '1966-09-16', NULL, 'High Net Worth', FALSE, TRUE, 6),
    (7, 'Fina', 'Merali', 'Female', '1976-02-23', NULL, 'Affluent Customer', FALSE, TRUE, 7),
    (8, 'Rod', 'Inder', 'Male', '1962-03-30', 5, 'Mass Customer', FALSE, FALSE, 8),
    (9, 'Mala', 'Lind', 'Female', '1973-03-10', 6, 'Affluent Customer', FALSE, TRUE, 9),
    (10, 'Fiorenze', 'Birdall', 'Female', '1988-10-11', 7, 'Mass Customer', FALSE, TRUE, 10),
    (11, 'Uriah', 'Bisatt', 'Male', '1954-04-30', NULL, 'Mass Customer', FALSE, FALSE, 11),
    (12, 'Sawyere', 'Flattman', 'Male', '1994-07-21', 8, 'Mass Customer', FALSE, FALSE, 12),
    (13, 'Gabriele', '0rcross', 'Male', '1955-02-15', 9, 'High Net Worth', FALSE, TRUE, 13),
    (14, 'Rayshell', 'Kitteman', 'Female', '1983-03-25', 10, 'Affluent Customer', FALSE, FALSE, 14),
    (15, 'Erroll', 'Radage', 'Male', '2000-07-13', 11, 'Mass Customer', FALSE, FALSE, 15),
    (16, 'Harlin', 'Parr', 'Male', '1977-02-27', 12, 'Mass Customer', FALSE, TRUE, 16),
    (17, 'Heath', 'Faraday', 'Male', '1962-03-19', 13, 'Affluent Customer', FALSE, TRUE, 17),
    (18, 'Marjie', 'Neasham', 'Female', '1967-07-06', 14, 'Affluent Customer', FALSE, FALSE, 18);

-- Вставка в products
INSERT INTO products (product_id, brand, product_line, product_class, product_size, list_price, standard_cost)
VALUES
    (2, 'Solex', 'Standard', 'medium', 'medium', 71.49, 53.62),
    (3, 'Trek Bicycles', 'Standard', 'medium', 'large', 2091.47, 388.92),
    (37, 'OHM Cycles', 'Standard', 'low', 'medium', 1793.43, 248.82),
    (88, 'Norco Bicycles', 'Standard', 'medium', 'medium', 1198.46, 381.10),
    (78, 'Giant Bicycles', 'Standard', 'medium', 'large', 1765.30, 709.48),
    (25, 'Giant Bicycles', 'Road', 'medium', 'medium', 1538.99, 829.65),
    (22, 'WeareA2B', 'Standard', 'medium', 'medium', 60.34, 45.26),
    (15, 'WeareA2B', 'Standard', 'medium', 'medium', 1292.84, 13.44),
    (67, 'Solex', 'Standard', 'medium', 'large', 1071.23, 380.74),
    (12, 'WeareA2B', 'Standard', 'medium', 'medium', 1231.15, 161.60),
    (5, 'Trek Bicycles', 'Mountain', 'low', 'medium', 574.64, 459.71),
    (61, 'OHM Cycles', 'Standard', 'low', 'medium', 71.16, 56.93),
    (35, 'Trek Bicycles', 'Standard', 'low', 'medium', 1057.51, 154.40),
    (16, 'Norco Bicycles', 'Standard', 'high', 'small', 1661.92, 1479.11),
    (12, 'Giant Bicycles', 'Standard', 'medium', 'large', 1765.30, 709.48),
    (3, 'Trek Bicycles', 'Standard', 'medium', 'large', 2091.47, 388.92),
    (79, 'Norco Bicycles', 'Standard', 'medium', 'medium', 1555.58, 818.01),
    (33, 'Giant Bicycles', 'Standard', 'medium', 'small', 1311.44, 1167.18);

-- -- Вставка в transactions_info
INSERT INTO transactions_info (transaction_id, customer_id, product_id, transaction_date, online_order, order_status)
VALUES
    (1, 2950, 2, '2017-02-25', FALSE, 'Approved'),
    (2, 3120, 3, '2017-05-21', TRUE, 'Approved'),
    (3, 402, 37, '2017-10-16', FALSE, 'Approved'),
    (4, 3135, 88, '2017-08-31', FALSE, 'Approved'),
    (5, 787, 78, '2017-10-01', TRUE, 'Approved'),
    (6, 2339, 25, '2017-03-08', TRUE, 'Approved'),
    (7, 1542, 22, '2017-04-21', TRUE, 'Approved'),
    (8, 2459, 15, '2017-07-15', FALSE, 'Approved'),
    (9, 1305, 67, '2017-08-10', FALSE, 'Approved'),
    (10, 3262, 12, '2017-08-30', TRUE, 'Approved'),
    (11, 1986, 5, '2017-01-17', FALSE, 'Approved'),
    (12, 2783, 61, '2017-01-05', TRUE, 'Approved'),
    (13, 1243, 35, '2017-02-26', TRUE, 'Approved'),
    (14, 2717, 16, '2017-09-10', FALSE, 'Approved'),
    (15, 247, 12, '2017-06-11', FALSE, 'Approved'),
    (16, 2961, 3, '2017-10-10', FALSE, 'Approved'),
    (17, 2426, 79, '2017-04-03', FALSE, 'Approved'),
    (18, 1842, 33, '2017-06-02', FALSE, 'Approved');