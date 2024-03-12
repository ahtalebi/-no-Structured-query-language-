SELECT * FROM "Cleaning_Automation_Example"



--- prints the name of columns 
	
SELECT column_name
FROM information_schema.columns
WHERE table_name = 'Cleaning_Automation_Example';

--- print number of rows 
select COUNT(*) as number_ofrows
from "Cleaning_Automation_Example"

--- let's remove empty or 'null' rows and check the new number of rows
DROP TABLE IF EXISTS New_Cleaning_Automation_Example;
CREATE TABLE New_Cleaning_Automation_Example AS
SELECT *
FROM "Cleaning_Automation_Example"
WHERE "Equipment Class" IS NOT NULL AND "Equipment Class" != '';

--- removing indentaiton in the new table
UPDATE "New_Cleaning_Automation_Example"
SET 
	"Equipment Class" = TRIM("Equipment Class"),
    "Department" = TRIM("Department");

SELECT * FROM New_Cleaning_Automation_Example
