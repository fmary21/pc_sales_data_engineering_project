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
