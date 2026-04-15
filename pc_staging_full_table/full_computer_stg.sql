/* 1. dim_location   */

DROP TABLE[Computer_std].[dbo].[dim_location]
CREATE TABLE[Computer_std].[dbo].[dim_location](
       [location_id] int identity(1,1) primary key,
       [Continent] varchar (250) NOT NULL,
       [Country_or_State] varchar(250) NOT NULL,
       [Province_or_City] Varchar(250) NOt NULL
       )
INSERT INTO [Computer_std].[dbo].[dim_location](continent,country_or_state,province_or_city)
SELECT DISTINCT continent,
                Country_or_State,
                Province_or_City
  FROM [Computer_std].[dbo].[raw_pc_data];

  SELECT * FROM[Computer_std].[dbo].[dim_location]


------------------------------------------------------------------------------------

/* 2. Create dim_customer */

DROP TABLE [Computer_std].[dbo].[dim_customer]
CREATE TABLE [Computer_std].[dbo].[dim_customer] ( 
       [customer_id] int identity(1,1) primary key,
       [Customer_Name] NVarchar(250) NOT NULL
      ,[Customer_Surname]NVarchar(250)NOT NULL
      ,[Customer_Contact_Number] NVARCHAR (50) NOT NULL
      ,[Customer_Email_Address] NVARCHAR(255) NOT NULL
      
      )
 INSERT INTO [Computer_std].[dbo].[dim_customer]( customer_name,customer_surname,Customer_Contact_Number,
             Customer_Email_Address)
SELECT DISTINCT Customer_name,
                Customer_surname,
                Customer_Contact_number,
                Customer_Email_Address
FROM [Computer_std].[dbo].[raw_pc_data]
         

SELECT * FROM[Computer_std].[dbo].[dim_customer]


--------------------------------------------------------------------------------

/* 3. Create dim_date */

DROP TABLE [Computer_std].[dbo].[dim_date]
CREATE TABLE [Computer_std].[dbo].[dim_date] ( 
       [Date_id] int identity(1,1) primary key,
       [purchase_date] Date NOT NULL
      ,[ship_date] DATE NOT NULL
      ,[year] int NOT NULL
      ,[Month] int NOT NULL
      )
 INSERT INTO [Computer_std].[dbo].[dim_date]( purchase_date,Ship_date, year,month )
SELECT DISTINCT purchase_date,
               coalesce(try_cast( ship_date as date),'2025-04-12'),
               Year(Purchase_Date),
               Month(Purchase_Date)
FROM [Computer_std].[dbo].[raw_pc_data]
         

SELECT * FROM[Computer_std].[dbo].[dim_date]

--------------------------------------------------------------------------------------
/* 4.CREATING DIM_PAYMENT */

DROP TABLE [Computer_std].[dbo].[dim_payment]
CREATE TABLE[Computer_std].[dbo].[dim_payment](
       [payment_id] int  identity(1,1) primary key,
      [payment_method] NVARCHAR(255) NOT NULL
     )
INSERT INTO [Computer_std].[dbo].[dim_payment] ( payment_method)
SELECT DISTINCT  payment_method
 FROM [Computer_std].[dbo].[dim_payment]

 SELECT * FROM [Computer_std].[dbo].[dim_payment]

 ---------------------------------------------------------------------------

 /* 5. creating Dim_product */

 DROP TABLE[Computer_std].[dbo].[dim_product]   
 CREATE TABLE [Computer_std].[dbo].[dim_product](
       [Product_id] int identity (1,1) primary key,
      [PC_make] nvarchar(250) NOT NULL,
      [PC_model] nvarchar(250) NOT NULL,
      [storage_type] nvarchar (250) NOT NULL,
      [storage_capacity] text,
     )
INSERT INTO [Computer_std].[dbo].[dim_product]( PC_make, PC_model, storage_type, storage_capacity)
SELECT DISTINCT PC_make,
                PC_model,
                Storage_type,
                Storage_capacity
 FROM [Computer_std].[dbo].[raw_pc_data]

 SELECT * FROM[Computer_std].[dbo].[dim_product]
-------------------------------------------------------------------------------------------

/* 6. Creating dim_salesperson  */
       
  DROP TABLE [Computer_std].[dbo].[dim_salesperson]
  CREATE TABLE [Computer_std].[dbo].[dim_salesperson](
       [salesperson_id] int identity (1,1) primary key,
       [sales_person_name] nvarchar (250) NOT NULL,
       [sales_person_department] nvarchar(250) NOT NULL
       )

INSERT INTO [Computer_std].[dbo].[dim_salesperson](sales_person_name, sales_person_department)
SELECT DISTINCT sales_person_name,
                sales_person_department
 FROM [Computer_std].[dbo].[raw_pc_data]

 SELECT * FROM [Computer_std].[dbo].[dim_salesperson]

 -----------------------------------------------------------------------------------------
 /* 7. creating dim_shop */     
     
 DROP TABLE [Computer_std].[dbo].[dim_shop]
 CREATE TABLE [Computer_std].[dbo].[dim_shop](
       [Shop_id] int identity (1,1) primary key,
       [Shop_Name] nvarchar (250) NOT NULL,
       [Shop_Age] int 
       )

INSERT INTO [Computer_std].[dbo].[dim_shop] (Shop_Name,Shop_Age)
SELECT DISTINCT Shop_Name,
                Shop_Age
FROM [Computer_std].[dbo].[raw_pc_data]

 SELECT * FROM [Computer_std].[dbo].[dim_shop]

 ------------------------------------------------------------------------------------

 /* 8. creating dim_channel */     
     
 DROP TABLE [Computer_std].[dbo].[dim_channel]
 CREATE TABLE [Computer_std].[dbo].[dim_channel](
       [channel_id] int identity (1,1) primary key,
       [channel] nvarchar (250) NOT NULL,
       )

INSERT INTO [Computer_std].[dbo].[dim_channel](channel)
SELECT DISTINCT Channel               
FROM [Computer_std].[dbo].[raw_pc_data]

 SELECT * FROM [Computer_std].[dbo].[dim_channel]
--------------------------------------------------------------------------------------

/* 9. creating dim_priority */     
     
 DROP TABLE [Computer_std].[dbo].[dim_priority]
 CREATE TABLE [Computer_std].[dbo].[dim_priority](
       [priority_id] int identity (1,1) primary key,
       [priority] nvarchar (250) NOT NULL,
       )

INSERT INTO [Computer_std].[dbo].[dim_priority](priority)
SELECT DISTINCT Priority              
FROM [Computer_std].[dbo].[raw_pc_data]

 SELECT * FROM [Computer_std].[dbo].[dim_priority]

 --------------------------------------------------------------------------------------------
 /*Creating the fact table ,fact_sales */

DROP TABLE [Computer_std].[dbo].[fact_pc_sales]
CREATE TABLE [Computer_std].[dbo].[fact_pc_sales](
        [sale_id] int identity (1,1) primary key,
        [location_id] int NOT NULL,
        [customer_id] int NOT NULL,
        [date_id] int NOT NULL,
        [payment_id] int NOT NULL,
        [product_id] int NOT NULL,
        [salesperson_id] int NOT NULL,
        [shop_id]  int NOT NULL,
        [channel_id] int NOT NULL,
        [priority_id] int NOT NULL,

        [Cost_price] decimal(18,2) NOT NULL,
        [Sale_price] decimal(18,2) NOT NULL,
        [Cost_of_repairs] decimal(18,2) NOT NULL,
        [Finance_amount] decimal(18,2) NOT NULL,
        [Discount_amount] decimal(18,2) NOT NULL,
        [PC_market_price] decimal(18,2) NOT NULL,
        [Credit_score]  decimal(18,2) NOT NULL,
        [Total_Sales_per_employee] decimal(18,2) NOT NULL,
        )

INSERT INTO [Computer_std].[dbo].[fact_pc_sales](location_id,customer_id,date_id,payment_id
                                    ,product_id,salesperson_id,shop_id,channel_id, priority_id,
                                   
                                    
                                    Cost_price,Sale_price,Cost_of_repairs,Finance_amount,Discount_amount,
                                    PC_market_price,Credit_score,Total_Sales_per_employee)

SELECT l.location_id,
	c.customer_id,
	d.date_id,
	e.employee_id,
	m.payment_id,
	p.product_id,
	s.shop_id,
	h.channel_id,
	f.priority_id,
	
	CAST(stg.sale_price AS DECIMAL(18,2))              AS sale_price,
CAST(stg.cost_price AS DECIMAL(18,2))              AS cost_price,
CAST(stg.discount_amount AS DECIMAL(18,2))         AS discount_amount,
CAST(stg.finance_amount AS DECIMAL(18,2))          AS finance_amount,
CAST(stg.cost_of_repairs AS DECIMAL(18,2))         AS cost_of_repairs,
CAST(stg.total_sales_per_employee AS DECIMAL(18,2)) AS total_sales_per_employee,
CAST(stg.pc_market_price AS DECIMAL(18,2))         AS pc_market_price,
CAST(stg.credit_score AS DECIMAL(18,2))            AS credit_score

FROM [Computer_std].[dbo].[raw_pc_data] stg

LEFT JOIN dim_location l
    ON stg.continent = l.continent
   AND stg.province_or_city = l.province_or_city
   AND stg.country_or_state = l.country_or_state

LEFT JOIN dim_customer c
    ON stg.customer_name = c.first_name
   AND stg.customer_surname = c.last_name
   AND stg.customer_contact_number = c.contact_number
   AND stg.customer_email_address = c.email_address

LEFT JOIN dim_date d
    ON stg.purchase_date = d.purchase_date
   AND COALESCE(TRY_CAST(stg.ship_date AS DATE), '2024-04-12') = d.dim_date


LEFT JOIN dim_employee e
    ON stg.sales_person_name = e.employee_name
   AND stg.sales_person_department = e.department

LEFT JOIN dim_product p
    ON stg.pc_model = p.pc_model
   AND stg.pc_make = p.pc_make
   AND stg.storage_capacity = p.storage_capacity
   AND stg.storage_type = p.storage_type
  

 LEFT JOIN dim_payment m
    ON stg.payment_method = m.payment_method

LEFT JOIN dim_shop s
    ON stg.shop_name = s.shop_name
   AND stg.shop_age = s.shop_age

LEFT JOIN dim_payment m
    ON stg.payment_method = m.payment_method

LEFT JOIN dim_channel h
    ON stg.channel = h.channel

LEFT JOIN dim_priority f
    ON stg.priority = f.priority;



------------------------------------------------------------------------------------------

	--validating the insert
		select * from [Computer_std].[dbo].[fact_pc_sales]

--------------------------------------------------------


