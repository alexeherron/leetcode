-- TRIANGLE JUDGEMENT
-- Table: Triangle

-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | x           | int  |
-- | y           | int  |
-- | z           | int  |
-- +-------------+------+
-- In SQL, (x, y, z) is the primary key column for this table.
-- Each row of this table contains the lengths of three line segments.

-- Report for every three line segments whether they can form a triangle.

-- Return the result table in any order.

-- The result format is in the following example.

-- Example 1:

-- Input: 
-- Triangle table:
-- +----+----+----+
-- | x  | y  | z  |
-- +----+----+----+
-- | 13 | 15 | 30 |
-- | 10 | 20 | 15 |
-- +----+----+----+
-- Output: 
-- +----+----+----+----------+
-- | x  | y  | z  | triangle |
-- +----+----+----+----------+
-- | 13 | 15 | 30 | No       |
-- | 10 | 20 | 15 | Yes      |

-- MY SOLUTION
SELECT x, y, z, (
    CASE 
        WHEN (
            (x + y) > z
            AND (y + z) > x
            AND (z + x) > y
        ) THEN 'Yes' ELSE 'No'
        END
) AS triangle
FROM Triangle;

-- OTHER CLEVER SOLUTION
select x, y, z, 
    case when abs(x-y) < z and z < x+y then 'Yes' 
    else 'No' end triangle
from Triangle