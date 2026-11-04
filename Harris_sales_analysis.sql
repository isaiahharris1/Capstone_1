Select *
From store_locations inner join management
               on store_locations.State = management.State
Where region = 'east';

Select *
From store_sales Inner join store_locations
	on store_sales.Store_ID = store_locations.StoreId
    Where State like 'connecticut%' 
    order by Transaction_Date ASC;
    -- The total revenue From 01-01-2022 till 12-31-2025 is $2,392,222.44
