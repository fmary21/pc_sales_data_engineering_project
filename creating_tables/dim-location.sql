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
