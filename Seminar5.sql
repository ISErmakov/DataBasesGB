CREATE TABLE cars
(
	id INT NOT NULL PRIMARY KEY,
    name VARCHAR(45),
    cost INT
);

INSERT cars
VALUES
	(1, "Audi", 52642),
    (2, "Mercedes", 57127 ),
    (3, "Skoda", 9000 ),
    (4, "Volvo", 29000),
	(5, "Bentley", 350000),
    (6, "Citroen ", 21000 ), 
    (7, "Hummer", 41400), 
    (8, "Volkswagen ", 21600);
    
SELECT *
FROM cars;

CREATE VIEW view1 as (
SELECT c.* FROM cars c WHERE c.cost < 25000);

ALTER VIEW view1 AS (
SELECT c.* FROM cars c WHERE c.cost < 35000);

SELECT * FROM view1;

CREATE VIEW view2 as (
SELECT c.* FROM cars c 
WHERE name like 'SKODA' or name like 'AUDI');

select * FROM view2;

select c.*,
DENSE_RANK() OVER(ORDER BY cost ASC) AS `dense_rank`
from cars c;

CREATE VIEW view3 as (select c.*,
DENSE_RANK() OVER(ORDER BY cost DESC) AS `dense_rank`,
ntile(3) over (order by cost DESC) AS 'grouop'
from cars c);

select *,
sum(cost) over (partition by grouop)
from view3
LIMIT 3;

SELECT *,
SUM(cost) over (order by cost DESC)
from cars
LIMIT 3;

create view view4 as (select *,
LAG(cost, 1) over (order by id) as 'lag1'
from cars);

select *,
cost-lag1 from view4
where cost-lag1 < 0;

select *,
cost-lag1 from view4
where cost-lag1 > 0;

create view view5 as (select *,
LAG(cost, 1) over (order by cost) as 'lag_cost'
from cars);

select *,
cost-lag_cost from view5;

