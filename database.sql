CREATE database movie;
use movie;
CREATE TABLE Customer(
 CustomerID INT PRIMARY KEY,
 CustomerName VARCHAR(255),
 PhoneNo VARCHAR(255),
 DateOfBirth DATE,
 EmailID VARCHAR(255) 
);
drop table Customer;

INSERT INTO Customer VALUES (100, 'John', '9911991199', '1998-10-20', 'john@gmail.com');
INSERT INTO Customer VALUES (102, 'Smith', '9911223344', '2000-09-21', 'alice@gmail.com');
INSERT INTO Customer VALUES (103, 'Bob', '6677889911', '2001-02-20', 'bob@mail.com');
INSERT INTO Customer VALUES (104, 'Jack', '8099112233', '1995-01-25', 'jack@gmail.com');
INSERT INTO Customer VALUES (105, 'Shaq', '9919223344', '2002-12-19', 'shaq@gmail.com');
INSERT INTO Customer VALUES (106, 'Bard', '6687889911', '2010-10-29', 'bard@mail.com');

select * from Customer; 

CREATE TABLE Movie (
    MovieID INT PRIMARY KEY,
    MovieName VARCHAR(255),
    Language VARCHAR(255),
    MovieCast VARCHAR(100),
    Description VARCHAR(300),
    Runtime INT
);
INSERT INTO Movie (MovieID, MovieName, Language, MovieCast, Description, Runtime)
VALUES
    (1000, 'WOLF', 'English', 'DON,BRAD', 'ACTION', 120),
    (1002, 'NARCOS', 'Spanish', 'PIT,SELENA', 'ADVENTURE', 135),
    (1003, 'PATRO', 'French', 'MAX,KIM', 'ROMCOM', 110),
    (1004, 'HITLER', 'German', 'HOLA,SAKA', 'SITCOM', 125),
    (1005, 'SUII', 'Italian', 'PELE,KANTE', 'ROMANCE', 140),
    (1006, 'ONE', 'Japanese', 'JOKER,NISA', 'HORROR', 115);
select * from movie;

CREATE TABLE Theater (
    TheaterID INT PRIMARY KEY,
    TheaterLocation VARCHAR(255),
    City VARCHAR(255),
    TheaterName VARCHAR(255)
);

INSERT INTO Theater VALUES
    (11, 'UPPAL', 'HYD', 'INOX'),
    (12, 'BANDRA', 'CST', 'CINEPOLIS'),
    (13, 'ENDADA', 'VIZAG', 'NEETRA'),
    (14, 'KAROLBAGH', 'DELHI', 'SUDHARSHAN'),
    (15, 'WORLI', 'MUMBAI', 'IMAX'),
    (16, 'NADA', 'YANAM', 'PVR');
    
SELECT * FROM Theater;

CREATE TABLE ShowTime (
    ShowID INT PRIMARY KEY,
    ShowDate DATE,
    ShowTime TIME,
    TheaterID INT,
    FOREIGN KEY (TheaterID) REFERENCES Theater(TheaterID)
);

INSERT INTO showTime VALUES
    (1, '2023-10-20', '14:00:00', 11),
    (2, '2023-01-11', '16:00:00', 12),
    (3, '2023-10-01', '15:00:00', 11),
    (4, '2023-12-08', '18:00:00', 13),
    (5, '2023-09-28', '17:00:00', 15),
    (6, '2023-02-3', '20:00:00', 16);

SELECT * FROM ShowTime;

CREATE TABLE Ticket (
    TicketID INT PRIMARY KEY,
    NumberOfTickets INT,
    TicketNumbers VARCHAR(255),
    ScreenNumber INT,
    TotalCost DECIMAL(10, 2),
	ShowID INT,
    CustomerID INT,
    FOREIGN KEY (ShowID) REFERENCES showtime(ShowID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

INSERT INTO Ticket VALUES
    (211, 2, 'A1, A2', 1, 200.00, 1, 100),
    (112, 3, 'B3, B4, B5', 2, 300.00, 2, 102),
    (223, 1, 'C1', 3, 100.00, 3, 103),
    (334, 4, 'D1, D2, D3, D4', 1, 400.00, 4, 104),
    (355, 2, 'E5, E6', 2, 220.00, 5, 105),
    (556, 3, 'F3, F4, F5', 3, 330.00, 5, 106);

SELECT * FROM Ticket;

CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY,
    TotalCost DECIMAL(10, 2),
    PaymentDate DATE,
    PaymentType VARCHAR(255),
    TicketID INT,
    FOREIGN KEY (TicketID) REFERENCES Ticket(TicketID)
);

INSERT INTO Payment VALUES
    (21, 200.00, '2023-10-20', 'Credit Card', 211),
    (22, 300.00, '2023-01-11', 'PhonePay', 112),
    (32, 100.00, '2023-10-01', 'Debit Card', 223),
    (42, 400.00, '2023-12-08', 'Paytm', 334),
    (52, 220.00, '2023-09-28', 'GPay', 223),
    (62, 330.00, '2023-12-22', 'Debit Card', 556);


SELECT * FROM Payment;



/*1.Print Payment Id, Payment Date , Payment Time where Pid is in between 22 and 52.*/
SELECT PaymentID, PaymentDate, PaymentType
FROM Payment
WHERE PaymentID >= 22 AND PaymentID <= 52;

/*2.Print MovieName , Movie cast and description where runtime is less than 130 mins..*/
SELECT MovieName, MovieCast, Description
FROM Movie
WHERE Runtime < 130;

/*1.Print Customer Name where Ticket Id is 355.*/
SELECT CustomerName
FROM Customer c
WHERE EXISTS (
    SELECT *
    FROM Ticket T
    WHERE TicketID = 355 AND T.CustomerID = c.CustomerID
);

/*1.Print the average cost of tickets sold..*/
SELECT AVG(TotalCost) FROM Ticket;

/*2.Print the movie name and runtime where the runtime is the highest.*/
SELECT MovieName, Runtime
FROM Movie
WHERE Runtime = (SELECT MAX(Runtime) FROM Movie);


/*3.Print the number of customers in the database.*/
SELECT COUNT(CustomerID) FROM Customer;
















