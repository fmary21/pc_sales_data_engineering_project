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