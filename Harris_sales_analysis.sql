Select * 
From store_locations 
inner join management  
on store_locations.State = management.State 
Where region = 'east' LIMIT 0, 1000;

Select Sum(Sale_Amount) as rev 
From store_sales 
Inner join store_locations  
  on store_sales.Store_ID = store_locations.StoreId    
order by Transaction_Date ASC LIMIT 0, 1000;
-- The total revenue from 01-01-2022 till 12-31-2025 is $2,392,222.44

Select Sum(Sale_Amount) as rev, Transaction_Date
From store_sales 
Inner join store_locations  
  on store_sales.Store_ID = store_locations.StoreId   
  Where Store_ID between 865 and 871
  group by Transaction_Date
order by Transaction_Date ASC ;

Select Distinct * 
From store_sales 
Inner join store_locations  
on store_sales.Store_ID = store_locations.StoreId     
Where State like 'connecticut%'      
order by Transaction_Date ASC LIMIT 0, 50;

Select year(transaction_date), month(transaction_date), Sum(Sale_Amount)     
From store_sales      
Where Store_ID between 865 and 871   
Group by Transaction_Date;

Select  Region, Sum(Sale_Amount)
From management
join store_sales
on store_sales.id
Where region like 'east%' 
and Store_ID between 865 and 871  
Group by Region;
-- The Region Sales is $4,193,142.54

Select products.Categoryid, Product,  Avg(store_sales.Sale_Amount) as Daily_Income , month(Transaction_date), Count(month(Transaction_Date)) as Monthly_Transactions
From products
Join store_sales
On products.ProdNum = store_sales.Prod_Num
Where store_sales.Store_ID between 865 and 871 
Group by products.Categoryid, Transaction_Date, Product
Order by 2 ASC;

Select  store_locations.StoreLocation, store_locations.StoreId,  Sum(Sale_Amount) as Revenue 
From store_sales
Inner join store_locations
on store_locations.StoreId = store_sales.Store_ID
Where store_locations.StoreId between 865 and 871 
group by store_locations.StoreLocation, store_locations.StoreId
order by 3 ASC;
