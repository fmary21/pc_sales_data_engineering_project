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
