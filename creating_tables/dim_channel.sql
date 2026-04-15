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
