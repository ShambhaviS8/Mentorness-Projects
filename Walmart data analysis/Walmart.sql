
ALTER TABLE walmart.data
MODIFY COLUMN Date date;

ALTER TABLE walmart.data
MODIFY COLUMN Time time;


****1.  Retrieve all columns for sales made in a specific branch (e.g., Branch 'A').***********

Select * 
from walmart.data
where Branch ='A';

***********2. Find the total sales for each product line ***********

Select 
Product_line, sum(Quantity* Unit_price) as Total_Sales
from walmart.data
group by Product_line;


****************3. List all sales transactions where the payment method was 'Cash'. **********************

Select 
Product_line, sum(Quantity*Unit_price) as Total_Sales, Payment
from walmart.data
where Payment ='Cash'
group by Product_line;



******************4.  Calculate the total gross income generated in each city. *************************

Select 
City, sum(gross_income) as Total_gross_income
from walmart.data
group by City ;



*****************5. Find the average rating given by customers in each branch.  ****************************

Select 
Branch, avg(Rating) as Avg_Rating
from walmart.data
group by Branch ;


****************6. Determine the total quantity of each product line sold. ******************

Select 
Product_line, sum(Quantity) as Total_quantity
from walmart.data
group by Product_line;


***********7. List the top 5 products by unit price. ***********

Select
Product_line, Unit_price
from walmart.data
Order by Unit_price desc limit 5;



*************8. Find sales transactions with a gross income greater than 30 ******************


Select
Product_line, Total as sales, gross_income
from walmart.data
where gross_income > 30;


********9.  Retrieve sales transactions that occurred on weekends. **********

Select
Product_line, Total as sales , weekday(Date) as weekends
from walmart.data
where weekday(Date) in (5,6);

****10.  Calculate the total sales and gross income for each month. ***

select 
monthname(Date) as month, sum(Total) as Total_sales, sum(gross_income) as gross_income
from walmart.data
group by monthname(Date) ;

***** 11. Find the number of sales transactions that occurred after 6 PM. ******

Select 
Invoice_ID, Product_line, Total, Payment,Time
from walmart.data
where hour(Time)= '18';

******12. List the sales transactions that have a higher total than the average total of all transactions.********

Select 
avg(Total)
from walmart.data;

Select 
Invoice_ID,Product_line, Total
from walmart.data
where  Total > 322.967
order by Product_line desc;



*****13. Calculate the cumulative gross income for each branch by date. ****

SELECT 
Date, Branch, gross_income, 
sum(gross_income)
OVER (ORDER BY Date) as Cumulative_gross_income
from walmart.data;

****14. Find the total cogs for each customer type in each city.******

Select
City, Customer_type, cogs
from walmart.data
order by Customer_type asc;
