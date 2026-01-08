CREATE TABLE zepto (
  sku_id SERIAL PRIMARY KEY,
  category VARCHAR(120),
  name VARCHAR(150) NOT NULL,
  mrp NUMERIC(8,2),
  discountPercent NUMERIC(5,2),
  availableQuantity INTEGER,
  discountedSellingPrice NUMERIC(8,2),
  weightInGms INTEGER,
  outOfStock BOOLEAN,
  quantity INTEGER
);

--data exploration

--count of rows
select count(*) from zepto;

--sample data 
select * from zepto
limit 10;

--null values
select * from zepto
where name is null
or
category is null
or
mrp is null
or
discountPercent is null
or
discountedsellingprice is null
or
weightInGms is null
or
availablequantity is null
or
outOfStock is null
or
quantity is null;

--different product category
select DISTINCT category
from zepto
order by category;

--products in stock vs out of stock
select outOfstock, count(sku_id)
from zepto
group by outOfstock;

--product names present multiple times
select name, count(sku_id) as "Number of SKUs"
from zepto
group by name
having count(sku_id) > 1
order by count(sku_id) desc;

--data cleaning

--products with price = 0
select * from zepto
where mrp = 0 or discountedsellingprice = 0;

delete from zepto
where mrp = 0;

--convert paise to rupees
update zepto
set mrp = mrp/100.0,
discountedsellingPrice = discountedsellingPrice/100.0;

select mrp, discountedsellingPrice from zepto

--Q1. find the top 10 best-value products based on the discount percentage.
select DISTINCT name, mrp, discountPercent
from zepto
order by discountPercent desc
limit 10;

--Q2. What are the products with high mrp but out of stock.
select DISTINCT name, mrp
from zepto
where outOfstock = TRUE AND MRP > 300
order by mrp desc;

--Q3. Calculate Estimated Revenue for each category.
select category,
sum(discountedsellingPrice * availableQuantity) as total_revenue
from zepto
group by category
order by total_revenue;

--Q4. Find all products where mrp is greater than 500 and discount is less than 10%.
select DISTINCT name, mrp, discountPercent
from zepto
where mrp > 500 and discountPercent < 10
order by mrp desc, discountPercent desc;

--Q5. Identify the top 5 category offering the highest average discount percentage.
select category,
ROUND(avg(discountPercent),2) as avg_discount
FROM zepto
group by category
 order by avg_discount desc
 limit 5;

--Q6. Find the price per gram for peoducts above 100g and sort by best value.
select DISTINCT name, weightInGms, discountedSellingPrice,
ROUND(discountedSellingPrice/weightInGms,2) as price_per_gram
from zepto
where weightInGms >= 100
order by price_per_gram;

--Q7. Group the products into categories like low, Medium, bulk.
select DISTINCT name, weightInGms,
CASE WHEN weightInGms < 1000 THEN 'Low'
    WHEN weightInGms < 5000 THEN 'Medium'
	ELSE 'Bulk'
	END AS weight_category 
	from zepto;

--Q8. What is the Total Inventory weight per category.
select category,
sum(weightInGms * availableQuantity) as total_weight
from zepto 
group by category 
order by total_weight;

--
