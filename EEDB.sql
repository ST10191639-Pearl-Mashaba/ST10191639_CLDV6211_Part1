use master
IF EXISTS(SELECT * FROM sys.databases WHERE name = 'EEDB')
DROP DATABASE EEDB
CREATE DATABASE EEDB 
use EEDB 

--TABLE CREATION SECTION, after creating the database/making it the active database to work on, make sure to not work on the master database
CREATE TABLE Venue (
VenueId INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
VenueName VARCHAR(25) NOT NULL, 
[Location] VARCHAR(150) NOT NULL,
Capacity INT NOT NULL,
ImageUrl VARCHAR(150) NOT NULL,
);

CREATE TABLE [Event] (
EventId INT IDENTITY(1,1) PRIMARY KEY NOT NULL, --index so number always
EventName VARCHAR(50) NOT NULL, 
EventDate DATE NOT NULL,
[Description] VARCHAR(150) NOT NULL,
VenueId INT FOREIGN KEY REFERENCES Venue(VenueId) NOT NULL,
);

CREATE TABLE Booking (
BookingId INT IDENTITY(1,1) PRIMARY KEY NOT NULL, --index so number always
EventId INT FOREIGN KEY REFERENCES [Event](EventId) NOT NULL, -- varchar = string
VenueId INT FOREIGN KEY REFERENCES Venue(VenueId) NOT NULL, --the blue highlight means that name is used as a function word so slap some square brackets on em
BookingDate DATE NOT NULL
);

--TABLE INSERTION SECTION, insert data into tables.
Insert into Venue (VenueName, [Location], Capacity, ImageURL)
VALUES('Waterfall', 'Denver', 5,'www.cat.png' ),
	('Rainbow Desserts', 'New York City', 10,'www.dog.png' )

Insert into [Event] (EventName,EventDate, [Description], VenueID)
VALUES('Big Birthday Bash', '2025-03-18', 'Celebrating birthday for Client X', 1),
	('Sweet Sixteen Birthday Party', '2025-04-15', 'Celebrating birthday for Client Y', 2)

Insert into Booking (EventID, VenueID, BookingDate)
Values (1,1, '2025-03-18'),
	(2,2, '2025-03-18')

--TABLE ALTERATION SECTION (can be between creation insertion or insertion, manipulation) your databases at the moment aren't used by anyone, the minute you add them in and stuff, 
--people start using it and now you cant delete it so now you have to alter post table creation

--TABLE MANIPULATION SECTION, joining tables, making calculations, whatever with that data

SELECT * FROM Venue
SELECT * FROM [Event]
SELECT * FROM Booking
