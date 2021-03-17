IF (NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Addresses' AND COLUMN_NAME = 'Address2')) 
BEGIN
	 ALTER TABLE Addresses ADD Address2 NVARCHAR(100) NULL
END