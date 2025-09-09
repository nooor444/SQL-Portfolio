-- Problem: Select students whose total marks across 3 subjects are less than 100
-- Source: Practice SQL queries
-- Difficulty: Medium
-- Approach: 
--   1. Use a subquery to calculate total marks per student.
--   2. Filter using HAVING to select those with total < 100.

SELECT name, roll_number 
FROM student_information
GROUP BY roll_number 
HAVING (SELECT roll_number 
        FROM examination_marks 
        WHERE subject_one + subject_two + subject_three < 100);
