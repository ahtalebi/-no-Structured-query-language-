SELECT * FROM "Cleaning_Automation_Example"



--- prints the name of columns 
	
SELECT column_name
FROM information_schema.columns
WHERE table_name = 'Cleaning_Automation_Example';


select COUNT(*) as number_ofrows
from "Cleaning_Automation_Example"

---
	
DROP TABLE IF EXISTS New_Cleaning_Automation_Example;
CREATE TABLE New_Cleaning_Automation_Example AS
SELECT *
FROM "Cleaning_Automation_Example"
WHERE "Equipment Class" IS NOT NULL AND "Equipment Class" != '';


SELECT * FROM New_Cleaning_Automation_Example
