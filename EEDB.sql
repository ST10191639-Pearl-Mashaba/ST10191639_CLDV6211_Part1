use master
IF EXISTS(SELECT * FROM sys.databases WHERE name = 'EEDB')
DROP DATABASE EEDB
CREATE DATABASE EEDB 
use EEDB 

--TABLE CREATION SECTION
CREATE TABLE Venue (
VenueId INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
VenueName VARCHAR(50) NOT NULL, 
[Location] VARCHAR(150) NOT NULL,
Capacity INT NOT NULL,
ImageUrl VARCHAR(200) NOT NULL,
);

CREATE TABLE [Event] (
EventId INT IDENTITY(1,1) PRIMARY KEY NOT NULL, 
EventName VARCHAR(50) NOT NULL, 
EventDate DATE NOT NULL,
[Description] VARCHAR(250) NOT NULL,
);

CREATE TABLE Booking (
BookingId INT IDENTITY(1,1) PRIMARY KEY NOT NULL, 
EventId INT FOREIGN KEY REFERENCES [Event](EventId), 
VenueId INT FOREIGN KEY REFERENCES Venue(VenueId), 
BookingDate DATE NOT NULL
);

--TABLE INSERTION SECTION, insert data into tables.
Insert into Venue (VenueName, [Location], Capacity, ImageURL)
VALUES('Waterfall', 'Denver', 25,'https://images.unsplash.com/photo-1595171250522-ae1c060c288d?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D' ),
	('Rainbow Desserts', 'New York City', 10,'https://images.unsplash.com/photo-1571942948809-74637bfc59b9?q=80&w=1948&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D' )

Insert into [Event] (EventName,EventDate, [Description])
VALUES('Big Birthday Bash', '2025-03-18', 'Celebrating birthday for Client X'),
	('Sweet Sixteen Birthday Party', '2025-04-15', 'Celebrating birthday for Client Y')

Insert into Booking (EventID, VenueID, BookingDate)
Values (1,1, '2025-03-18'),
	(2,2, '2025-03-18')

--TABLE ALTERATION SECTION 

--TABLE MANIPULATION SECTION, joining tables, making calculations, whatever with that data

SELECT * FROM Venue
SELECT * FROM [Event]
SELECT * FROM Booking
