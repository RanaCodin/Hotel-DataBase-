drop schema MoonlitMarvela;
create schema MoonlitMarvela;
use MoonlitMarvela;

CREATE TABLE IF NOT EXISTS Customer  (
    CustomerID INT PRIMARY KEY,
    fname VARCHAR(50) NOT NULL,
    lname VARCHAR(50) NOT NULL,
    Phone_number VARCHAR(15) NOT NULL,
    Email VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS Room (
    RoomID INT PRIMARY KEY CHECK (RoomID BETWEEN 1 AND 500),
    RoomType ENUM('Single', 'Double', 'Suite') NOT NULL,
    RoomStatus ENUM('Available', 'Reserved', 'Under Maintenance') DEFAULT 'Available',
    Price DECIMAL(6, 2) NOT NULL
);

CREATE TABLE IF NOT EXISTS Reservation (
    ReservationID INT AUTO_INCREMENT PRIMARY KEY,
    CheckinDate DATE NOT NULL,
    CheckoutDate DATE NOT NULL,
    CustomerID INT NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE IF NOT EXISTS ReservationRoom (
    ReservationID INT NOT NULL,
    RoomID INT NOT NULL,
    PRIMARY KEY (ReservationID, RoomID),
    FOREIGN KEY (ReservationID) REFERENCES Reservation(ReservationID),
    FOREIGN KEY (RoomID) REFERENCES Room(RoomID)
);


CREATE TABLE IF NOT EXISTS Bill (
    BillID INT AUTO_INCREMENT PRIMARY KEY,
    ReservationID INT NOT NULL,
    RoomCharges DECIMAL(6, 2) NOT NULL,
    ServiceCharges DECIMAL(6, 2) DEFAULT 0.00,
    PaymentDetails VARCHAR(11) NOT NULL CHECK (PaymentDetails IN ('Cash', 'Credit Card')),
    FOREIGN KEY (ReservationID) REFERENCES Reservation(ReservationID)
);




CREATE TABLE IF NOT EXISTS Staff (
    StaffID INT PRIMARY KEY,
    fname VARCHAR(50) NOT NULL,
    lname VARCHAR(50) NOT NULL,
    Position VARCHAR(50) NOT NULL,
    Phone_number VARCHAR(15) NOT NULL,
    Email VARCHAR(50) UNIQUE NOT NULL,
    WorkingHours INT NOT NULL,
    Salary DECIMAL(7, 2) NOT NULL
); 


CREATE TABLE IF NOT EXISTS Services (
    ServiceID INT AUTO_INCREMENT PRIMARY KEY,
    Description VARCHAR(50) NOT NULL,
    Price DECIMAL(6, 2) NOT NULL
);

CREATE TABLE IF NOT EXISTS Includes (
    BillID INT NOT NULL,
    ServiceID INT NOT NULL,
    PRIMARY KEY (BillID, ServiceID),
    FOREIGN KEY (BillID) REFERENCES Bill(BillID),
    FOREIGN KEY (ServiceID) REFERENCES Services(ServiceID)
);

CREATE TABLE IF NOT EXISTS Requests (
    CustomerID INT NOT NULL,
    ServiceID INT NOT NULL,
    PRIMARY KEY (CustomerID, ServiceID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (ServiceID) REFERENCES Services(ServiceID)
);

CREATE TABLE IF NOT EXISTS Review (
    ReviewID INT AUTO_INCREMENT PRIMARY KEY,
    ReservationID INT NOT NULL,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    FOREIGN KEY (ReservationID) REFERENCES Reservation(ReservationID)
);



INSERT INTO Customer (CustomerID, fname, lname, Phone_number, Email)
VALUES
(1000000001, 'Rana', 'Alnefaie', '0501234567', 'rana.Alnefaie@gmail.com'),
(1000000002, 'Sarah', 'Almatrafi', '0512345678', 'sarah.Almatrafi@gmail.com'),
(1000000003, 'Tahani', 'Albarqi', '0523456789', 'tahani.Albarqi@gmail.com'),
(1000000004, 'Rawan', 'Almitiri', '0534567890', 'rawan.Almitiri@gmail.com'),
(1000000005, 'Doha', 'Alnabati', '0545678901', 'doha.Alnabati@gmail.com'),
(1000000006, 'Mihad', 'Alahdal', '0556789012', 'mihad.Alahdal@gmail.com'),
(1000000007, 'Shouq', 'Alharbi', '0545678913', 'Shouq.Alharbi@gmail.com');

INSERT INTO Room (RoomID, RoomType, RoomStatus, Price)
VALUES
(101, 'Single', 'Reserved', 350.00),
(102, 'Double', 'Reserved', 500.00),
(103, 'Suite', 'Reserved', 750.00),
(104, 'Single', 'Reserved', 350.00),
(105, 'Double', 'Reserved', 500.00),
(106, 'Suite', 'Reserved', 750.00),
(107, 'Single', 'Reserved', 350.00),
(108, 'Double', 'Reserved', 500.00),
(201, 'Single', 'Reserved', 350.00),
(202, 'Double', 'Reserved', 500.00),
(203, 'Suite', 'Available', 750.00),
(204, 'Suite', 'Available', 750.00),
(301, 'Single', 'Under Maintenance', 350.00),
(302, 'Double', 'Under Maintenance', 500.00),
(303, 'Suite', 'Under Maintenance', 750.00),
(304, 'Suite', 'Under Maintenance', 750.00);

INSERT INTO Reservation (CheckinDate, CheckoutDate, CustomerID)
VALUES
('2025-02-01', '2025-02-05', 1000000001),
('2025-03-05', '2025-03-10', 1000000001),
('2025-02-10', '2025-02-15', 1000000002),
('2025-03-01', '2025-03-05', 1000000003),
('2025-03-10', '2025-03-12', 1000000004),
('2025-04-01', '2025-04-03', 1000000005),
('2025-04-05', '2025-04-08', 1000000006);

INSERT INTO ReservationRoom (ReservationID, RoomID)
VALUES 
(1, 101),
(1, 102),
(2, 201),
(2, 202),
(3, 104),
(4, 105),
(4, 106),
(5, 107),
(6, 108),
(7,103);

INSERT INTO Bill (ReservationID, RoomCharges, ServiceCharges, PaymentDetails)
VALUES
(1, 850.00, 350.00, 'Credit Card'),
(2, 850.00, 150.00, 'Cash'),
(3, 350.00, 50.00, 'Credit Card'),
(4, 1250.00, 145.00, 'Cash'),
(5, 350.00, 200.00, 'Credit Card'),
(6, 500.00, 50.00, 'Cash'),
(7, 750.00, 0.00, 'Credit Card');


INSERT INTO Staff (StaffID, fname, lname, Position, Phone_number, Email, WorkingHours, Salary)
VALUES
(2000000001, 'Lama', 'Alghamdi', 'Receptionist', '0591234567', 'lama.alghamdi@gmail.com', 40, 4000.00),
(2000000002, 'Noura', 'Alotaibi', 'Housekeeping', '0592345678', 'noura.alotaibi@hotmail.com', 38, 1500.00),
(2000000003, 'Reem', 'Alzahrani', 'Gyn coach', '0593456789', 'reem.alzahrani@yahoo.com', 45, 5000.00),
(2000000004, 'Aseel', 'Alqahtani', 'Chef', '0594567890', 'aseel.alqahtani@outlook.com', 40, 8000.00),
(2000000005, 'Raghad', 'Alshahrani', 'Driver', '0595678901', 'raghad.alshahrani@gmail.com', 35, 3500.00),
(2000000006, 'Sarah', 'Alshehri', 'Spa Specialist', '0596789012', 'sarah.alshehri@hotmail.com', 30, 2500.00);

INSERT INTO Services (Description, Price)
VALUES
('Spa treatment', 200.00),
('Buffet', 150.00),
('Buffet for kids', 50.00),
('Laundry', 50.00),
('Gym', 75.00),
('Food Delivery', 70.00);

INSERT INTO Includes (BillID, ServiceID)
VALUES
(1, 1), 
(1, 2),
(2, 3), 
(4, 4), 
(4, 5),
(5, 6); 


INSERT INTO Requests (CustomerID, ServiceID)
VALUES
(1000000001, 1), 
(1000000001, 2), 
(1000000002, 3), 
(1000000003, 4),
(1000000003, 5), 
(1000000004, 5), 
(1000000005, 6); 

INSERT INTO Review (ReservationID, Rating)
VALUES
(1, 5),
(2, 4),
(3, 5),
(4, 3),
(5, 4),
(6, 5);


UPDATE Room 
SET Price = 550
WHERE RoomID = 105;


UPDATE staff 
SET Salary = Salary * 1.10
WHERE StaffID = 2000000005;


DELETE FROM Review 
WHERE ReviewID = 6;


SELECT * FROM Room 
WHERE RoomStatus = 'Available'
OR RoomStatus = 'Under Maintenance';

SELECT 
	RoomStatus, COUNT(RoomID) AS TotalRooms 
	FROM Room
GROUP BY RoomStatus;

SELECT 
StaffID,
CONCAT (s.fname ,' ',s.lname) as Full_Name,
    WorkingHours
FROM 
    Staff as s
HAVING 
    WorkingHours >= 35
    ORDER BY WorkingHours DESC;
    
    
SELECT -- Select (Order BY)
	CONCAT (s.fname ,' ',s.lname) as Full_Name,
	StaffID,
	Salary,
	Position
FROM Staff as s
ORDER BY Salary DESC; 


    
SELECT 
CONCAT (c.fname ,' ', c.lname) as Full_Name,
c.Phone_number AS PhoneNumber
FROM 
    Customer AS c
WHERE 
	c.CustomerID IN (
        SELECT 
            r.CustomerID
        FROM 
            Reservation AS r
         JOIN 
            ReservationRoom AS rR ON r.ReservationID = rR .ReservationID
        WHERE 
            rR .RoomID = 101
    );



SELECT 
    CONCAT(c.fname, ' ', c.lname) AS FullName,
    c.Phone_number AS PhoneNumber,
    r.ReservationID,
    DATEDIFF(r.CheckoutDate, r.CheckinDate) AS DurationInDays,
    SUM(ro.Price * DATEDIFF(r.CheckoutDate, r.CheckinDate)) AS FinalAmount
FROM 
    Customer AS c
JOIN 
    Reservation AS r ON c.CustomerID = r.CustomerID
JOIN 
    ReservationRoom AS rr ON r.ReservationID = rr.ReservationID
JOIN 
    Room AS ro ON rr.RoomID = ro.RoomID
GROUP BY 
    r.ReservationID, c.CustomerID, c.fname, c.lname, r.CheckinDate, r.CheckoutDate;



SELECT 
    BillID,
    RoomCharges,
    ServiceCharges,
    
    (RoomCharges + ServiceCharges) AS TotalCharges,
    (RoomCharges + ServiceCharges) * 0.15 AS Taxes,
    (RoomCharges + ServiceCharges) + ((RoomCharges + ServiceCharges ) * 0.15 ) AS Price
FROM Bill;




