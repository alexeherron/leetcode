-- THE NUMBER OF EMPLOYEES WHICH REPORT TO EACH EMPLOYEE
-- Table: Employees

-- +-------------+----------+
-- | Column Name | Type     |
-- +-------------+----------+
-- | employee_id | int      |
-- | name        | varchar  |
-- | reports_to  | int      |
-- | age         | int      |
-- +-------------+----------+
-- employee_id is the column with unique values for this table.
-- This table contains information about the employees and the id of the manager they report to. Some employees do not report to anyone (reports_to is null). 
-- For this problem, we will consider a manager an employee who has at least 1 other employee reporting to them.
-- Write a solution to report the ids and the names of all managers, the number of employees who report directly to them, and the average age of the reports rounded to the nearest integer.
-- Return the result table ordered by employee_id.
-- The result format is in the following example.

-- Example 1:

-- Input: 
-- Employees table:
-- +-------------+---------+------------+-----+
-- | employee_id | name    | reports_to | age |
-- +-------------+---------+------------+-----+
-- | 9           | Hercy   | null       | 43  |
-- | 6           | Alice   | 9          | 41  |
-- | 4           | Bob     | 9          | 36  |
-- | 2           | Winston | null       | 37  |
-- +-------------+---------+------------+-----+
-- Output: 
-- +-------------+-------+---------------+-------------+
-- | employee_id | name  | reports_count | average_age |
-- +-------------+-------+---------------+-------------+
-- | 9           | Hercy | 2             | 39          |
-- +-------------+-------+---------------+-------------+
-- Explanation: Hercy has 2 people report directly to him, Alice and Bob. Their average age is (41+36)/2 = 38.5, which is 39 after rounding it to the nearest integer.

-- MY SOLUTION
SELECT a.employee_id, a.name, COUNT(b.reports_to) AS reports_count, ROUND(AVG(b.age), 0) AS average_age
FROM Employees AS a
JOIN Employees AS b
ON a.employee_id = b.reports_to
GROUP BY a.employee_id
HAVING reports_count > 0
ORDER BY a.employee_id;

-- OTHER CLEVER SOLUTION

select 
em2.employee_id, 
em2.name,
count(*) as reports_count,
round(avg(em1.age)) as average_age
from 
employees em1
inner join
employees em2 
on em1.reports_to = em2.employee_id 
group by em2.employee_id, em2.name
order by em2.employee_id