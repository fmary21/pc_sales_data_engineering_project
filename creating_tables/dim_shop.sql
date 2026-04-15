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
