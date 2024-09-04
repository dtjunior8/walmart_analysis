UPDATE WalmartSalesData 
SET 'Time of Day' = (
CASE 
	WHEN Time BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
	WHEN Time BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
	ELSE "Night"
	END
);

SELECT 
*
FROM 
WalmartSalesData wsd 

-- add column called "day_name" -- 
-- extracts the day name from the date

ALTER TABLE WalmartSalesData 
ADD "day_name" VARCHAR(30);


UPDATE WalmartSalesData 
SET "day_name" = (
CASE 
	WHEN strftime('%w',Date) = '0' THEN "Sunday"
	WHEN strftime('%w',date) = '1' THEN "Monday"
	WHEN strftime('%w',date) = '2' THEN "Tuesday"
	WHEN strftime('%w',date) = '3' THEN "Wednesday"
	WHEN strftime('%w',date) = '4' THEN "Thursday"
	WHEN strftime('%w',date) = '5' THEN "Friday"
	ELSE "Saturday"
END
);


-- add column called "month_name" -- 
-- Like previous column but with month -- 

ALTER TABLE WalmartSalesData 
ADD "month_name" VARCHAR(30);


SELECT 
strftime('%m',Date)
FROM 
WalmartSalesData wsd  



UPDATE WalmartSalesData 
SET "month_name" = (
CASE 
	WHEN strftime('%m',Date) = '01' THEN "Jan"
	WHEN strftime('%m',date) = '02' THEN "Feb"
	WHEN strftime('%m',date) = '03' THEN "Mar"
	WHEN strftime('%m',date) = '04' THEN "Apr"
	WHEN strftime('%m',date) = '05' THEN "May"
	WHEN strftime('%m',date) = '06' THEN "Jun"
	WHEN strftime('%m',date) = '07' THEN "Jul"
	WHEN strftime('%m',date) = '08' THEN "Aug"
	WHEN strftime('%m',date) = '09' THEN "Sep"
	WHEN strftime('%m',date) = '10' THEN "Oct"
	WHEN strftime('%m',date) = '11' THEN "Nov"
	ELSE "Dec"
END
);

-- EDA --

-- 1) How many unique cities does the data have?

SELECT 
COUNT(DISTINCT(City))
FROM 
WalmartSalesData wsd

-- 2) In whih city is each branch?

SELECT 
Branch,
City 
FROM
WalmartSalesData wsd
GROUP BY
Branch 


-- 3) How many unique product lines does the data have?

SELECT 
DISTINCT(Branch),
COUNT(DISTINCT("Product line"))
FROM
WalmartSalesData wsd
GROUP BY
Branch 


SELECT 
branch, 
"Product line" 
FROM
WalmartSalesData wsd
Group By
branch, "Product line" 


-- 4) What is the most common payment method?

SELECT 
Payment,
COUNT(Payment) as "Payment Count"
FROM
WalmartSalesData wsd
GROUP BY
Payment 
ORDER BY 
"Payment Count" DESC

-- 5) What is the most selling product line?


SELECT 
"Product line",
COUNT("Product line") AS "Product Line Count"
FROM
WalmartSalesData wsd 
GROUP BY 
"Product line"
ORDER BY 
"Product Line Count" DESC
LIMIT 1;

-- 6) What is the total revenue by month

SELECT
"month_name",
SUM(Total) as "Total Revenue"
FROM
WalmartSalesData wsd
GROUP BY
"month_name"
ORDER BY 
"Total Revenue" DESC

-- 7) What month had the largest COGS?

SELECT 
month_name, 
SUM(cogs) AS "COGS"
FROM
WalmartSalesData wsd
GROUP BY
month_name 
ORDER BY 
"COGS" DESC;

-- 8) What product line has the largest revenue?

SELECT 
"Product line",
SUM(total) AS "Total Revenue"
FROM
WalmartSalesData wsd 
GROUP BY
"Product line"
ORDER BY
"Total Revenue" DESC
LIMIT 1;

-- 9) What is the city with the largest revenue?

SELECT 
"City",
SUM(Total) as "Total Revenue"
FROM
WalmartSalesData wsd 
GROUP BY 
"City"
ORDER BY 
"Total Revenue" DESC;

-- 10) 








