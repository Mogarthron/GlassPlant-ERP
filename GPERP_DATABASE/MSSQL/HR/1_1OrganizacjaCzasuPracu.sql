

IF NOT EXISTS
(    
    SELECT [name]
FROM sys.tables
WHERE [name] = 'OrganizacjaCzasuPracy'
)  

create table OrganizacjaCzasuPracy(
	id int primary key identity(1,1) not null,
	przebiegZmian nvarchar(31),
	opis nvarchar(50)
);
