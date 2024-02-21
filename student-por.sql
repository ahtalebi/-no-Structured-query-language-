SELECT * FROM "student-por";

SELECT school, sex, age, address FROM "student-por";

SELECT DISTINCT school FROM "student-por"; --- Select unique values from a column:

SELECT * FROM "student-por" WHERE age > 16;

SELECT COUNT(*) FROM "student-por"; --- calculate total count of rows

SELECT AVG(age) AS average_age FROM "student-por";

SELECT sex, COUNT(*) AS count FROM "student-por" GROUP BY sex; --- Group rows based on a column and count occurrences (e.g., count of each value in the 'sex' column)

SELECT age, SUM(absences) AS total_absences FROM "student-por" GROUP BY age;

SELECT * FROM "student-por" WHERE age BETWEEN 15 AND 17 AND failures > 0;

---  group rows by reason and count number of each group's type

SELECT reason, COUNT(*) AS count
FROM "student-por"
GROUP BY reason;

--- Here we can print the top 3 reasons why pupuls attend schooling

SELECT reason, COUNT(*) AS count
FROM "student-por"
GROUP BY reason
ORDER BY count DESC
LIMIT 3;

--- average of G3

SELECT AVG("student-por"."G3") AS avg_grade
FROM "student-por";


--- percentage of rows in the "student-por" table where both schoolsup and internet columns have the value 'yes'.
SELECT COUNT(*) * 100.0 / (SELECT COUNT(*) FROM "student-por") AS percentage
FROM "student-por"
WHERE schoolsup = 'yes' AND internet = 'yes';




--- age group with the highest average number of absences

SELECT age, AVG(absences) AS avg_absences
FROM "student-por"
GROUP BY age
ORDER BY avg_absences DESC
LIMIT 3;

--- total number of absences for students whose parents are both teachers

SELECT SUM(absences) AS total_absences
FROM "student-por"
WHERE "student-por"."Mjob" = 'teacher' AND "student-por"."Fjob" = 'teacher';


--- calculates the Pearson correlation coefficient between the final grades (G3) and the sum of parents' education levels (Medu and Fedu) for female students from urban areas who have not failed any subject
SELECT CORR("student-por"."G3", "student-por"."Medu" + "student-por"."Fedu") AS correlation_coefficient
FROM "student-por"
WHERE "student-por"."sex" = 'F'
  AND "student-por"."address" = 'U'
  AND "student-por"."failures" = 0;
  
--- Identify Students Showing Improvement

SELECT "school", "sex", "age"
FROM "student-por"
WHERE "failures" = 0
  AND "schoolsup" = 'yes'
  AND "G3" > "G1"
  AND "G2" > "G1";







