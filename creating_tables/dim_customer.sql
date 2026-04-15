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
