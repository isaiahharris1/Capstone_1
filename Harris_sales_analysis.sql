Select * 
From store_locations 
join management  
on store_locations.State = management.State 
Where region = 'east' ;

Select Sum(Sale_Amount) as rev 
From store_sales 
Inner join store_locations  
  on store_sales.Store_ID = store_locations.StoreId   
  Where Store_ID between 865 and 872
order by Transaction_Date ASC ;
-- The total revenue from 01-01-2022 till 12-31-2025 is $2,392,222.44

Select Distinct * 
From store_sales 
Inner join store_locations  
on store_sales.Store_ID = store_locations.StoreId     
Where State like 'connecticut%'      
order by Transaction_Date ASC LIMIT 0, 50;

Select Category , Sum(Sale_Amount)     
From store_sales 
join inventory_categories
on store_sales.id = inventory_categories.Categoryid  
Group by  category;

Select  Region, State, sum(Sale_Amount)
From management
join store_sales
on store_sales.id
Where region like 'east%' 
and Store_ID between 865 and 872  
Group by Region, State
-- The Region Sales is $4,193,142.54 which is 2x my territory sales 
;

Select Category, Store_ID, products.Categoryid, Product,  Avg(store_sales.Sale_Amount) as Daily_Income , month(Transaction_date), Count(month(Transaction_Date)) as Monthly_Transactions
From products
Join store_sales
On products.ProdNum = store_sales.Prod_Num
join inventory_categories
on products.Categoryid = inventory_categories.Categoryid
Where store_sales.Store_ID between 865 and 872 
Group by Category, Store_ID, products.Categoryid, Transaction_Date, Product
Order by 2 ASC;

Select  store_locations.StoreLocation, store_locations.StoreId,  Sum(Sale_Amount) as Revenue , count(Sale_Amount) as Total_transaction 
From store_sales
Inner join store_locations
on store_locations.StoreId = store_sales.Store_ID
Where store_locations.StoreId between 865 and 872
group by store_locations.StoreLocation, store_locations.StoreId 
order by 3 ASC;

Select Category ,Sum(Sale_Amount), year(transaction_date)
From inventory_categories
join store_sales
on inventory_categories.Categoryid = store_sales.id
Group by Category, Transaction_Date, Sale_Amount 
Order by 2 ASC; 

Select Distinct Category, Store_ID, products.Categoryid, Product,  sum(store_sales.Sale_Amount) as Daily_Income , month(Transaction_date), year(transaction_date), count(Sale_Amount)
From products
Join store_sales
On products.ProdNum = store_sales.Prod_Num
join inventory_categories
on products.Categoryid = inventory_categories.Categoryid
Group by Category, Store_ID, products.Categoryid, Transaction_Date, Product
Order by 2 ASC;
