-- PRODUCT SALES ANALYSIS I
-- +-------------+-------+
-- | Column Name | Type  |
-- +-------------+-------+
-- | sale_id     | int   |
-- | product_id  | int   |
-- | year        | int   |
-- | quantity    | int   |
-- | price       | int   |
-- +-------------+-------+
-- (sale_id, year) is the primary key of this table.
-- product_id is a foreign key to Product table.
-- Each row of this table shows a sale on the product product_id in a certain year.
-- Note that the price is per unit.

-- Table: Product

-- +--------------+---------+
-- | Column Name  | Type    |
-- +--------------+---------+
-- | product_id   | int     |
-- | product_name | varchar |
-- +--------------+---------+
-- product_id is the primary key of this table.
-- Each row of this table indicates the product name of each product.

-- Write an SQL query that reports the product_name, year, and price for each sale_id in the Sales table.

-- Return the resulting table in any order.

-- MY SOLUTION
SELECT p.product_name, s.year, s.price
FROM Product AS p
RIGHT JOIN Sales AS s
ON p.product_id = s.product_id;

-- OTHER CLEVER SOLUTION
SELECT p.product_name, s.year, s.price
FROM Sales s
JOIN Product p ON s.product_id = p.product_id
GROUP BY s.sale_id;