CREATE TYPE user_role_type AS ENUM ('Admin', 'Customer');
CREATE TYPE vehicle_type_e AS ENUM ('car','bike','truck');
CREATE TYPE availability_status_e AS ENUM('available','rented','maintenance');

CREATE TYPE booking_status_e AS ENUM('pending','confirmed','completed','cancelled');

CREATE table Users(
  user_id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  password VARCHAR (40) NOT NULL,
  phone VARCHAR(20),
  role user_role_type NOT NULL
)
CREATE VIEW users_public AS
SELECT 
  user_id,
  role,
  name,
  email,
  phone
FROM Users;

select * from users_public
select * from users


INSERT INTO Users (role, name, email, password, phone) VALUES
('Admin', 'Super Admin', 'asdmin1@example.com', 'admin123', '01710000001'),
('Admin', 'System Admin', 'sadmin2@example.com', 'admin123', '01710000002'),
('Admin', 'Support Admin', 'asdmin3@example.com', 'admin123', '01710000003'),
('Customer', 'Rahim Uddin', 'rahim@example.com', 'pass123', '01711000004'),
('Customer', 'Karim Hossain', 'karim@example.com', 'pass123', '01711000005'),
('Customer', 'Sabbir Khan', 'sabbir@example.com', 'pass123', '01711000006'),
('Customer', 'Rakib Ahmed', 'rakib@example.com', 'pass123', '01711000007'),
('Customer', 'Nayeem Hasan', 'nayeem@example.com', 'pass123', '01711000008'),
('Customer', 'Fahim Islam', 'fahim@example.com', 'pass123', '01711000009'),
('Customer', 'Tanjil Rahman', 'tanjil@example.com', 'pass123', '01711000010'),
('Customer', 'Hasan Ali', 'hasan@example.com', 'pass123', '01711000011'),
('Customer', 'Mahmud Hasan', 'mahmud@example.com', 'pass123', '01711000012'),
('Customer', 'Imran Hossain', 'imran@example.com', 'pass123', '01711000013'),
('Customer', 'Shanto Mia', 'shanto@example.com', 'pass123', '01711000014'),
('Customer', 'Jahid Hasan', 'jahid@example.com', 'pass123', '01711000015'),
('Customer', 'Rasel Ahmed', 'rasel@example.com', 'pass123', '01711000016'),
('Customer', 'Naim Sheikh', 'naim@example.com', 'pass123', '01711000017'),
('Customer', 'Tamim Islam', 'tamim@example.com', 'pass123', '01711000018'),
('Customer', 'Arif Hossain', 'arif@example.com', 'pass123', '01711000019'),
('Customer', 'Sajid Khan', 'sajid@example.com', 'pass123', '01711000020');


  

CREATE TABLE Vehicles  (
  vehicle_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  type vehicle_type_e NOT NULL ,
  model VARCHAR(100),
  registration_number VARCHAR(50) UNIQUE NOT NULL,
  rental_price DECIMAL(10,2) NOT NULL,
  status availability_status_e
  
)

INSERT INTO Vehicles 
(name, type, model, registration_number, rental_price, status)
VALUES
('Toyota Corolla', 'car', '2019', 'REG-1001', 3500.00, 'available'),
('Honda Civic', 'car', '2020', 'REG-1002', 4000.00, 'rented'),
('Hyundai Elantra', 'car', '2021', 'REG-1003', 3800.00, 'available'),
('Suzuki Swift', 'car', '2018', 'REG-1004', 3000.00, 'maintenance'),
('BMW X3', 'car', '2022', 'REG-1005', 9000.00, 'available'),

('Honda CBR', 'bike', '2019', 'REG-2001', 1200.00, 'available'),
('Yamaha R15', 'bike', '2020', 'REG-2002', 1500.00, 'rented'),
('Bajaj Pulsar', 'bike', '2018', 'REG-2003', 1000.00, 'available'),
('TVS Apache', 'bike', '2021', 'REG-2004', 1300.00, 'maintenance'),
('Royal Enfield', 'bike', '2022', 'REG-2005', 2000.00, 'available'),

('TATA Truck', 'truck', '2018', 'REG-3001', 7000.00, 'available'),
('Ashok Leyland', 'truck', '2019', 'REG-3002', 7500.00, 'rented'),
('Volvo Cargo', 'truck', '2021', 'REG-3003', 9000.00, 'available'),
('Isuzu Heavy', 'truck', '2020', 'REG-3004', 8000.00, 'maintenance'),
('Hino Truck', 'truck', '2019', 'REG-3005', 8500.00, 'available'),

('Nissan Sunny', 'car', '2017', 'REG-1006', 2800.00, 'available'),
('Audi A4', 'car', '2021', 'REG-1007', 9500.00, 'rented'),
('KTM Duke', 'bike', '2022', 'REG-2006', 2200.00, 'available'),
('Hero Splendor', 'bike', '2017', 'REG-2007', 900.00, 'available'),
('Ford Ranger', 'truck', '2022', 'REG-3006', 9500.00, 'available');

  select * from vehicles

CREATE TABLE bookings(
  booking_id SERIAL PRIMARY KEY,
  
  user_id INTEGER NOT NULL,
  vehicle_id INTEGER NOT NULL,

  start_date DATE NOT NULL,
  end_date DATE NOT NULL,

  status booking_status_e ,
  total_cost DECIMAL(10,2) NOT NULL,

  FOREIGN KEY(user_id) REFERENCES users(user_id),
  FOREIGN KEY (vehicle_id) REFERENCES vehicles(vehicle_id)
);
INSERT INTO bookings (user_id, vehicle_id,start_date, end_date,status, total_cost)
VALUES (4, 1, '2025-12-23', '2025-12-25', 'pending', 10500),
  (3, 2, '2025-12-23', '2025-12-25', 'pending', 10500),
  (5, 2, '2025-12-23', '2025-12-25', 'pending', 10500),
  (7, 2, '2025-12-23', '2025-12-25', 'pending', 10500),
  (4, 6, '2025-12-23', '2025-12-25', 'pending', 10500),
  (3, 6, '2025-12-23', '2025-12-25', 'pending', 10500),
  (5, 6, '2025-12-23', '2025-12-25', 'pending', 10500),
  (7, 1, '2025-12-23', '2025-12-25', 'pending', 10500),
  (3, 2, '2025-12-23', '2025-12-25', 'pending', 10500),
  (5, 2, '2025-12-23', '2025-12-25', 'pending', 10500),
  (7, 12, '2025-12-23', '2025-12-25', 'pending', 10500),
  (4, 10, '2025-12-23', '2025-12-25', 'pending', 10500),
  (3, 10, '2025-12-23', '2025-12-25', 'pending', 10500),
  (5, 6, '2025-12-23', '2025-12-25', 'pending', 10500),
  (7, 1, '2025-12-23', '2025-12-25', 'pending', 10500);
  
select * from  bookings



--   Query 1: JOIN  
  SELECT 
    bookings.booking_id,
    users.name AS customer_name,
    vehicles.name as vahicle_name,
    bookings.start_date,
  bookings.end_date,
    bookings.status
FROM bookings
JOIN users ON bookings.user_id = users.user_id
JOIN vehicles ON bookings.vehicle_id = vehicles.vehicle_id;

 


  -- Query 2: EXISTS
  select * from vehicles 
  where not  exists(
  select from bookings 
  where bookings.vehicle_id= vehicles.vehicle_id
  )

-- Query 3: WHERE

  select * from vehicles
  where  status= 'available' and  type = 'car'

  
  
-- Query 4: GROUP BY and HAVING
select vehicles.name,
count(bookings.booking_id) as total_bookings
from bookings join vehicles on bookings.vehicle_id= vehicles.vehicle_id
group by vehicles.name
having count (bookings.booking_id)>2
