/* 8. creating dim_priority */     
     
 DROP TABLE [Computer_std].[dbo].[dim_priority]
 CREATE TABLE [Computer_std].[dbo].[dim_priority](
       [priority_id] int identity (1,1) primary key,
       [priority] nvarchar (250) NOT NULL,
       )

INSERT INTO [Computer_std].[dbo].[dim_priority](priority)
SELECT DISTINCT Priority              
FROM [Computer_std].[dbo].[raw_pc_data]

 SELECT * FROM [Computer_std].[dbo].[dim_priority]
