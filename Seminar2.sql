CREATE TABLE sales
(
id INT PRIMARY KEY AUTO_INCREMENT,
order_date DATE NOT NULL,
count_product INT NOT NULL
);

INSERT INTO sales (order_date, count_product) VALUES
("2022-01-01", 156),
("2022-01-02", 180),
("2022-01-03", 21),
("2022-01-04", 124),
("2022-01-05", 341);

SELECT ID,
IF (count_product < 100, "Маленький заказ", 
	IF (count_product < 200, "Средний заказ заказ", 
		"Большой заказ")) as "Тип заказа" FROM sales;
        
CREATE TABLE orders
(
id INT PRIMARY KEY AUTO_INCREMENT,
employee_id VARCHAR(15) NOT NULL,
amount DOUBLE NOT NULL,orders
order_status VARCHAR(45) NOT NULL
);
