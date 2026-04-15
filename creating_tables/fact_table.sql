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

------------------------------------------------------------------------------------------

