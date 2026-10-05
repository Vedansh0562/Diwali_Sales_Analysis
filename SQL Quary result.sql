SELECT * FROM diwali_sales;
--EASY LEVEL

--Business Problem are as Follow

--1.The new data analyst has joined the Diwali sales team. Before doing any analysis, she wants to have a quick look at the first 10 records of the sales table to understand what kind of data is available.
SELECT COUNT(*) AS total_records
FROM diwali_sales;

--2.The manager wants to know how many transaction records are present in the Diwali sales table, so that he can validate the data with the finance team.
SELECT COUNT(*) AS total_records
FROM diwali_sales;

--3.The marketing team wants to know how many unique customers have shopped during Diwali. Note that one customer may have made multiple purchases.
SELECT COUNT(DISTINCT user_id) AS unique_customers
FROM diwali_sales;


--4.The CFO wants to know the total revenue generated in this Diwali season.
SELECT SUM(amount) AS total_sales
FROM diwali_sales;

--5.The business head wants to know the average transaction value, rounded off to two decimal places, to set the target for next year.
SELECT ROUND(AVG(amount)::numeric, 2) AS avg_order_value
FROM diwali_sales;

--6. The sales head wants to see the highest and the lowest transaction amount recorded during the festival season.
SELECT MAX(amount) AS highest_amount,
 MIN(amount) AS lowest_amount
FROM diwali_sales;

--7.The marketing team is planning a special 'Diwali Gift for Her' campaign. Please list the user ID, name, state and amount of all female customers
SELECT user_id, cust_name, state, amount
FROM diwali_sales
WHERE gender = 'F';

--8.The regional manager of Uttar Pradesh wants to see all the transactions made by customers from his state.
SELECT user_id, cust_name, product_category, amount
FROM diwali_sales
WHERE state = 'Uttar Pradesh'
ORDER BY amount DESC;

--9.The premium services team wants to contact customers whose single transaction amount is more than Rs. 10,000.
Kindly list them in descending order of amount.
SELECT user_id, cust_name, state, amount
FROM diwali_sales
WHERE amount > 10000
ORDER BY amount DESC;

--10.The inventory team wants to know all the different product categories sold during Diwali, without any repetition.
SELECT DISTINCT product_category
FROM diwali_sales
ORDER BY product_category;

--11.The head office wants to know in how many zones the company has customers. Please provide the list of unique zones.
SELECT DISTINCT zone
FROM diwali_sales;
 
--12.The CRM team wants to understand how many male and female customers are there in the data
SELECT gender,
 COUNT(DISTINCT user_id) AS customers
FROM diwali_sales
GROUP BY gender;

--13.The management wants to know whether male or female customers contributed more to the total sales.
SELECT gender, SUM(amount) AS total_sales
FROM diwali_sales
GROUP BY gender
ORDER BY total_sales DESC;

--14.The logistics team wants to know state-wise total number of orders so that they can plan delivery vehicles accordingly.
SELECT state, SUM(orders) AS total_orders
FROM diwali_sales
GROUP BY state
ORDER BY total_orders DESC;
--15.The CEO wants to know the top 5 states that generated the highest revenue in Diwali.
SELECT state, SUM(amount) AS total_sales
FROM diwali_sales
GROUP BY state
ORDER BY total_sales DESC
LIMIT 5;
--16.The zonal heads want to compare the total sales of all zones (North, South, East, West and Central).
SELECT zone,
 SUM(orders) AS total_orders,
 SUM(amount) AS total_sales
FROM diwali_sales
GROUP BY zone
ORDER BY total_sales DESC;

--17.The product team wants to know which age group spends the most on an average, so that targeted offers can be designed.
SELECT age_group,
 ROUND(AVG(amount)::numeric, 2) AS avg_spend
FROM diwali_sales
GROUP BY age_group
ORDER BY avg_spend DESC;
--18.The marketing team wants to see the count of married and unmarried customers with proper labels. (In this dataset, marital_status = 1 means Married and 0 means Unmarried.)
SELECT CASE WHEN marital_status = 1 THEN 'Married'
 ELSE 'Unmarried' END AS marital_label,
 COUNT(DISTINCT user_id) AS customers
FROM diwali_sales
GROUP BY 1;
--19.SELECT CASE WHEN marital_status = 1 THEN 'Married'
SELECT user_id, cust_name, age, state, amount
FROM diwali_sales
WHERE age BETWEEN 26 AND 35
ORDER BY age;
--20.SELECT state, COUNT(*) AS transactions, SUM(amount) AS total_sales
FROM diwali_sales
WHERE state IN ('Maharashtra', 'Delhi', 'Karnataka')
GROUP BY state;
--21.The customer care team wants to send personalised greetings to customers whose names start with the letter 'A'. Please extract the list
SELECT DISTINCT user_id, cust_name
FROM diwali_sales
WHERE cust_name LIKE 'A%';
--22.HR-focused corporate gifting team wants to know which occupations have the highest number of customers.
SELECT occupation, COUNT(DISTINCT user_id) AS customers
FROM diwali_sales
GROUP BY occupation
ORDER BY customers DESC;
--23.The category head wants to identify the product category with the lowest number of orders, so that a clearance sale can be planned.
SELECT product_category, SUM(orders) AS total_orders
FROM diwali_sales
GROUP BY product_category
ORDER BY total_orders ASC
LIMIT 1;
--24.The data quality team suspects that some transactions do not have the amount value. Kindly find how many such records are there.
SELECT COUNT(*) AS missing_amount_rows
FROM diwali_sales
WHERE amount IS NULL;
--25.For reporting purpose, the finance team wants missing amounts to be treated as zero. Please show user ID, product ID and cleaned amount.
SELECT user_id, product_id,
COALESCE(amount, 0) AS clean_amount
FROM diwali_sales;
--26.The CRM team wants to tag every transaction as 'High' (above Rs. 10,000), 'Medium' (Rs. 5,000 to Rs. 10,000) or 'Low' (below Rs. 5,000).
SELECT user_id, amount,
 CASE WHEN amount > 10000 THEN 'High'
 WHEN amount >= 5000 THEN 'Medium'
 ELSE 'Low' END AS spend_label
FROM diwali_sales;
--27.The leadership team wants to see the top 10 highest-value transactions along with customer name, state and product category.
SELECT cust_name, state, product_category, amount
FROM diwali_sales
ORDER BY amount DESC NULLS LAST
LIMIT 10;
--28The demographics team wants to know the youngest and the oldest customer age in the dataset.
SELECT MIN(age) AS youngest_age,
 MAX(age) AS oldest_age
FROM diwali_sales;
--29.The regional strategy team wants to know how many states are covered under each zone.
SELECT zone, COUNT(DISTINCT state) AS states_covered
FROM diwali_sales
GROUP BY zone
ORDER BY states_covered DESC;
--30The sales team wants to find all male customers from the Central zone who have spent between Rs. 5,000 and Rs.15,000 in a single transaction.
SELECT user_id, cust_name, state, amount
FROM diwali_sales
WHERE gender = 'M'
 AND zone = 'Central'
 AND amount BETWEEN 5000 AND 15000
ORDER BY amount DESC;