
Alter table AspNetUsers
Add AddressId bigint,
FOREIGN KEY(AddressId) REFERENCES Addresses(Id);