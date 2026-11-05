Select * 
From store_locations 
inner join management  
on store_locations.State = management.State 
Where region = 'east' LIMIT 0, 1000;

Select Sum(Sale_Amount) as rev , FORMAT(2392222.44, 'C') as currencyformat 
From store_sales 
Inner join store_locations  
  on store_sales.Store_ID = store_locations.StoreId    
order by Transaction_Date ASC LIMIT 0, 1000;
-- The total revenue from 01-01-2022 till 12-31-2025 is $2,392,222.44

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
