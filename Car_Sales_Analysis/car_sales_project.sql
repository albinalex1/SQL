SELECT * FROM car_sales.car_sales;
use car_sales;
/*display all items in the table car sales */
select * from car_sales;

 /* rename column */
 alter table car_sales rename column  __Year_resale_value to year_resale_value;
 
/* Display all models of Toyota */
 select Model from car_sales where Manufacturer='Toyota';
 
/* Display all details of vehicle has highest Sales_in_thousands */
 select * from car_sales where Sales_in_thousands=(select max(Sales_in_thousands) from car_sales);
 
/* Display Manufacturer,Model of vehicle has Least Sales_in_thousands */
 select Manufacturer,Model from car_sales where Sales_in_thousands=(select min(Sales_in_thousands) from car_sales);
 
/* Display 10 Manufacturer,Model of vehicle has Least Year Resale Value */
 select Manufacturer,Model,Year_resale_value from car_sales order by Year_resale_value limit 10; 
 
/* Display Manufacturer,Model of vehicle has Highest engine size (Top 5) */
 select  Manufacturer,Model,Engine_size from car_sales order by Engine_size desc limit 5; 
 
/* count of vehicle type */
 select Vehicle_type,count(Vehicle_type) from car_sales group by Vehicle_type;
 
/* Manufacturer & count Number of Models */
 select Manufacturer,count(Model) from car_sales group by Manufacturer order by count(Model) desc;
 
/* Fuel_efficiency */
 select Model,Fuel_efficiency from car_sales order by  Fuel_efficiency ;
 
/* Vehicle with high Fuel_efficiency */
 select Manufacturer,Model,Fuel_efficiency from car_sales where Fuel_efficiency=(select max(Fuel_efficiency) from car_sales );
 
/* Vehicle with Least Fuel_efficiency */
 select Manufacturer,Model,Fuel_efficiency from car_sales where Fuel_efficiency=(select min(Fuel_efficiency) from car_sales );
 
/* Average Fuel_efficiency */
  select avg(Fuel_efficiency) from car_sales; 
 
/* Fuel_capacity */
 select  Manufacturer,Model,Fuel_capacity from car_sales order by Fuel_capacity desc ; 
 
/* Average Fuel_capacity */
  select avg(Fuel_capacity) from car_sales; 
  
/* Vehicle with heighest Length and Width */
 select Manufacturer,Model from car_sales where Length =(select max(Length) from car_sales ) or Width=(select max(Width) from car_sales);
 
/* Biggesht vechicle */ 
 WITH temp_tbl AS
(
  SELECT
    Manufacturer,
    Model,
    (length*width) AS area
  FROM car_sales
  
)
SELECT *
FROM temp_tbl
WHERE area = (SELECT MAX(area) FROM temp_tbl);

/* Compact vechicle */ 
 WITH temp_tbl AS
(
  SELECT
    Manufacturer,
    Model,
    (length*width) AS area
  FROM car_sales
  
)
SELECT *
FROM temp_tbl
WHERE area = (SELECT min(area) FROM temp_tbl);



