USE practice2;

SELECT * FROM practice2.`walmartsalesdata.csv`;

SELECT
 Time FROM  practice2.`walmartsalesdata.csv`;
SELECT time,
	CASE 
	WHEN time BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
	WHEN time BETWEEN "12:01:00" AND "4:00:00" THEN "Afternoon"
	ELSE "Evening"
    END AS time_of_the_day
	FROM practice2.`walmartsalesdata.csv`;
    
ALTER Table `walmartsalesdata.csv` ADD COLUMN time_of_the_day VARCHAR(20);
UPDATE `walmartsalesdata.csv` 
SET time_of_the_day = (
	CASE 
		WHEN time BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
		WHEN time BETWEEN "12:01:00" AND "4:00:00" THEN "Afternoon"
		ELSE "Evening"
		END   );
        
ALTER TABLE `walmartsalesdata.csv` ADD COLUMN day_name VARCHAR (10);
UPDATE `walmartsalesdata.csv`
SET day_name = (
dayname(date));

ALTER TABLE `walmartsalesdata.csv` ADD COLUMN month_name VARCHAR(10);
UPDATE `walmartsalesdata.csv`
SET month_name = (
monthname(date));


SELECT 
DISTINCT City
FROM practice2.`walmartsalesdata.csv`;

SELECT 
DISTINCT City, Branch
FROM practice2.`walmartsalesdata.csv`;

SELECT 
COUNT(DISTINCT product_line)
FROM practice2.`walmartsalesdata.csv`;

SELECT 
Payment,
COUNT(Payment) AS Total_Cnt
FROM practice2.`walmartsalesdata.csv`
GROUP BY Payment;

SELECT 
Product_line,
COUNT(Product_line) AS Total_Count
FROM practice2.`walmartsalesdata.csv`
GROUP BY Product_line 
ORDER BY Total_Count DESC;

SELECT month_name AS Month,
Round(SUM(Total),2) AS Total_Revenue
FROM practice2.`walmartsalesdata.csv`
GROUP BY Month
ORDER BY Total_Revenue DESC;

SELECT month_name AS Month,
Round(SUM(cogs),2) AS Cogs
FROM practice2.`walmartsalesdata.csv`
GROUP BY Month
ORDER BY Cogs DESC;


SELECT product_line,
Round(SUM(Total),2) AS Total_Revenue
FROM practice2.`walmartsalesdata.csv`
GROUP BY product_line
ORDER BY Total_Revenue DESC;

SELECT City, Branch,
Round(SUM(Total),2) AS Total_Revenue
FROM practice2.`walmartsalesdata.csv`
GROUP BY City, Branch
ORDER BY Total_Revenue DESC;

SELECT product_line,
ROUND(AVG(Tax_5),2) AS VAT
FROM practice2.`walmartsalesdata.csv`
GROUP BY product_line
ORDER BY VAT DESC;

SELECT ROUND(AVG(Total),2) AS AVG_Sales,
Product_line ,
	CASE
    WHEN ROUND(AVG(Total),2) > 322 THEN "GOOD"
    ElSE "BAD"
	END AS Sales_review
FROM practice2.`walmartsalesdata.csv`
GROUP BY product_line
ORDER BY AVG_Sales DESC ;




