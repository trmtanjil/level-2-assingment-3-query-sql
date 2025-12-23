Vehicle Booking Management System

This project is a Vehicle Booking Management System where users can register, browse available vehicles, and make bookings.
Admins can manage users, vehicles, and bookings.

 Features

Role Based Access: Admin & Customer

Book a vehicle with start & end date

Calculate total booking cost

Booking Status: pending, confirmed, completed, cancelled

Customer can view own bookings

 Technologies Used
 

Database: PostgreSQL

 Database Main Tables

users

vehicles

bookings

 Relationships

A user can make multiple bookings

A vehicle can be booked multiple times

Booking links:

user_id → users.user_id

vehicle_id → vehicles.vehicle_id

 How to Run

1️ Clone the project
2️ Install dependencies
3️ Configure database
4️ Run server

 Learning Outcome

SQL Relations

FOREIGN KEY

JOIN, GROUP BY, HAVING

Real-life booking logic