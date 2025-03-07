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
VenueId INT FOREIGN KEY REFERENCES Venue(VenueId)
);

CREATE TABLE Booking (
BookingId INT IDENTITY(1,1) PRIMARY KEY NOT NULL, --index so number always
EventID INT FOREIGN KEY REFERENCES [Event](EventID) NOT NULL, -- varchar = string
VenueID INT FOREIGN KEY REFERENCES Venue(VenueID) NOT NULL, --the blue highlight means that name is used as a function word so slap some square brackets on em
BookingDate DATE NOT NULL
);


--TABLE INSERTION SECTION, insert data into tables.
Insert into Venue (VenueName, [Location])
VALUES('Waterfall', 'Denver')

Insert into [Event] (EventName,[Description])
VALUES('Pearl', 'Mashaba')

Insert into Booking (EventID, VenueID)
Values (1,1)

--TABLE ALTERATION SECTION (can be between creation insertion or insertion, manipulation) your databases at the moment aren't used by anyone, the minute you add them in and stuff, 
--people start using it and now you cant delete it so now you have to alter post table creation

--TABLE MANIPULATION SECTION, joining tables, making calculations, whatever with that data

SELECT * FROM Venue
SELECT * FROM [Event]
SELECT * FROM Booking
