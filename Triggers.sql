-- TRIGGERS

CREATE TRIGGER trgProductAudit ON DBO.PRODUCT
FOR UPDATE, DELETE
AS
IF EXISTS ( SELECT 0 FROM Deleted )
BEGIN
   IF EXISTS ( SELECT 0 FROM Inserted )
   BEGIN
      INSERT INTO DBO.PRODUCT_LOG
      ( 
		PRODUCTNAME
	   ,[WEIGHT]
	   ,HEIGHT
	   ,PRODUCTIMAGE
	   ,BARCODE
	   ,SKU
	   ,QTY_INSTOCK
	   ,PRICE
	   ,OPERATION
	   ,UPDATED_ON 
	   ,UPDATED_BY
      )
      SELECT  
		PRODUCTNAME
	   ,[WEIGHT]
	   ,HEIGHT
	   ,PRODUCTIMAGE
	   ,BARCODE
	   ,SKU
	   ,QTY_INSTOCK
	   ,PRICE
       ,'Updated'
       ,GETDATE()
       ,SUSER_NAME()
      FROM deleted
   END
ELSE
   BEGIN
      INSERT INTO DBO.PRODUCT_LOG
      ( 
		PRODUCTNAME
	   ,[WEIGHT]
	   ,HEIGHT
	   ,PRODUCTIMAGE
	   ,BARCODE
	   ,SKU
	   ,QTY_INSTOCK
	   ,PRICE
	   ,OPERATION
	   ,UPDATED_ON 
	   ,UPDATED_BY
      )
      SELECT  
		PRODUCTNAME
	   ,[WEIGHT]
	   ,HEIGHT
	   ,PRODUCTIMAGE
	   ,BARCODE
	   ,SKU
	   ,QTY_INSTOCK
	   ,PRICE
       ,'Deleted'
       ,GETDATE()
       ,SUSER_NAME()
      FROM deleted
   END
   END
   
GO

-----------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TRIGGER trgCustomerAudit ON DBO.CUSTOMER
FOR UPDATE, DELETE
AS
IF EXISTS ( SELECT 0 FROM Deleted )
BEGIN
   IF EXISTS ( SELECT 0 FROM Inserted )
   BEGIN
      INSERT INTO DBO.CUSTOMER_LOG
      ( 
		CUSTOMERID 
	   ,USERNAME 
	   ,[PASSWORD] 
	   ,TITLE  
	   ,FIRSTNAME  
	   ,MIDDLENAME
	   ,LASTNAME    
	   ,USERROLEID   
	   ,CREATED_AT   
	   ,MODIFIED_AT  
	   ,OPERATION
       ,UPDATED_ON 
       ,UPDATED_BY 
      )
      SELECT  
		CUSTOMERID 
	   ,USERNAME 
	   ,[PASSWORD] 
	   ,TITLE  
	   ,FIRSTNAME  
	   ,MIDDLENAME
	   ,LASTNAME    
	   ,USERROLEID   
	   ,CREATED_AT   
	   ,MODIFIED_AT
       ,'Updated'
       ,GETDATE()
       ,SUSER_NAME()
      FROM deleted
   END
ELSE
   BEGIN
      INSERT INTO DBO.CUSTOMER_LOG
      ( 
		CUSTOMERID 
	   ,USERNAME 
	   ,[PASSWORD] 
	   ,TITLE  
	   ,FIRSTNAME  
	   ,MIDDLENAME
	   ,LASTNAME    
	   ,USERROLEID   
	   ,CREATED_AT   
	   ,MODIFIED_AT  
	   ,OPERATION
       ,UPDATED_ON 
       ,UPDATED_BY 
      )
      SELECT  
		CUSTOMERID 
	   ,USERNAME 
	   ,[PASSWORD] 
	   ,TITLE  
	   ,FIRSTNAME  
	   ,MIDDLENAME
	   ,LASTNAME    
	   ,USERROLEID   
	   ,CREATED_AT   
	   ,MODIFIED_AT
       ,'Deleted'
       ,GETDATE()
       ,SUSER_NAME()
      FROM deleted
   END
   END
   
GO

-----------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TRIGGER trgOrderAudit ON DBO.ORDERS
FOR UPDATE, DELETE
AS
IF EXISTS ( SELECT 0 FROM Deleted )
BEGIN
   IF EXISTS ( SELECT 0 FROM Inserted )
   BEGIN
      INSERT INTO DBO.ORDERS_LOG
      ( 
		ORDER_ID 
	   ,CUSTOMERID  
	   ,ORDERDATE 
	   ,ADDRESSID  
	   ,CREATED_AT 
	   ,MODIFIED_AT 
	   ,OPERATION 
	   ,UPDATED_ON 
	   ,UPDATED_BY
      )
      SELECT  
		ORDER_ID 
	   ,CUSTOMERID  
	   ,ORDERDATE 
	   ,ADDRESSID  
	   ,CREATED_AT 
	   ,MODIFIED_AT 
       ,'Updated'
       ,GETDATE()
       ,SUSER_NAME()
      FROM deleted
   END
ELSE
   BEGIN
      INSERT INTO DBO.ORDERS_LOG
      ( 
		ORDER_ID 
	   ,CUSTOMERID  
	   ,ORDERDATE 
	   ,ADDRESSID  
	   ,CREATED_AT 
	   ,MODIFIED_AT 
	   ,OPERATION 
	   ,UPDATED_ON 
	   ,UPDATED_BY
      )
      SELECT  
		ORDER_ID 
	   ,CUSTOMERID  
	   ,ORDERDATE 
	   ,ADDRESSID  
	   ,CREATED_AT 
	   ,MODIFIED_AT
       ,'Deleted'
       ,GETDATE()
       ,SUSER_NAME()
      FROM deleted
   END
   END
   
GO