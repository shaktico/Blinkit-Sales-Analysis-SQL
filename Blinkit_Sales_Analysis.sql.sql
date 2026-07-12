select * from [BlinkIT Grocery Data]

select cast(sum(B.Total_Sales)/1000000 as decimal(10,2)) as total_sales from [BlinkIT Grocery Data] B
where Outlet_Establishment_Year = 2022
select cast(AVg(B.Total_Sales)as decimal(10,0)) as Average_sales from [BlinkIT Grocery Data] b
where Outlet_Establishment_Year = 2022

select count(*) as Num_of_Items from [BlinkIT Grocery Data]
where Outlet_Establishment_Year = 2022

 select [BlinkIT Grocery Data].Item_Fat_Content, cast(sum(total_sales) as decimal(10,2)) as total_sales,
 [BlinkIT Grocery Data].Item_Fat_Content, cast(avg(total_sales) as decimal(10,1)) as Avg_sales,
 [BlinkIT Grocery Data].Item_Fat_Content, cast(avg(Rating) as decimal(10,2)) as Avg_rating,
 count(*) as Num_of_orders
 from [BlinkIT Grocery Data]
 group by [BlinkIT Grocery Data].Item_Fat_Content
 order by total_sales desc

 select top 5 Item_type,
 cast(sum(total_sales) as decimal(10,2)) as Total_sales,
  cast(avg(total_sales)as decimal(10,1)) as Avg_sales,
  count(*) as Num_of_Items,
  cast(avg(rating) as decimal(10,2)) as Avg_rating
 from [BlinkIT Grocery Data]
 group by Item_Type
 order by Total_sales
  
   select Outlet_Location_Type ,Item_Fat_Content,
   cast(sum(total_sales) as decimal(10,2)) as total_sales,
cast(avg(total_sales) as decimal(10,1)) as Avg_sales,
cast(avg(Rating) as decimal(10,2)) as Avg_rating,
 count(*) as Num_of_orders
 from [BlinkIT Grocery Data]
 group by Outlet_Location_Type ,Item_Fat_Content
 order by total_sales


SELECT Outlet_Location_Type, 
       ISNULL([Low Fat], 0) AS Low_Fat, 
       ISNULL([Regular], 0) AS Regular
FROM 
(
    SELECT Outlet_Location_Type, Item_Fat_Content, 
           CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales
    FROM [BlinkIT Grocery Data]
    GROUP BY Outlet_Location_Type, Item_Fat_Content
) AS SourceTable
PIVOT 
(
    SUM(Total_Sales) 
    FOR Item_Fat_Content IN ([Low Fat], [Regular])
) AS PivotTable
ORDER BY Outlet_Location_Type;


select * from [BlinkIT Grocery Data]

select Outlet_establishment_year,
 CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
cast(avg(total_sales) as decimal(10,1)) as Avg_sales,
count(*) as Num_of_orders,
cast(avg(rating) as decimal(10,2)) as Avg_rating
 from [BlinkIT Grocery Data]
 group by Outlet_establishment_year
 order by  Total_Sales desc

 select Outlet_size,
 CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
  CAST((SUM(Total_Sales)*100.0/ sum(sum(total_sales))over()) AS DECIMAL(10,2)) AS sales_persentage
 from [BlinkIT Grocery Data]
 group by Outlet_size
 order by  Total_Sales desc


 select Outlet_Location_Type,
 CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
   CAST((SUM(Total_Sales)*100.0/ sum(sum(total_sales))over()) AS DECIMAL(10,2)) AS sales_persentage,
cast(avg(total_sales) as decimal(10,1)) as Avg_sales,
count(*) as Num_of_orders,
cast(avg(rating) as decimal(10,2)) as Avg_rating
 from [BlinkIT Grocery Data]
 where Outlet_Establishment_Year = 2020
 group by Outlet_Location_Type
 order by  Total_Sales desc


 
 

