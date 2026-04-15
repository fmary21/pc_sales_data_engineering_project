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
