use shoping_management;

create table customers (
    Customer_Id  int  auto_increment primary key,
    Customer_name varchar (50) not null,
    Phone_number varchar (10) not null,
    Email  varchar (100) unique,
    Age tinyint check(Age > 0),
    Gender Enum( 'Male' , 'Female' , 'other'),
    Country varchar (50) Default 'India',
    City varchar (50) not null,
    Pincode varchar (6) default '201301',
    Registration_Date  DAte default (current_date),
    Registration_Time  Time default (current_time),
    Created_At datetime default current_timestamp,
    Address varchar (200),
    Customer_status Enum ('Active', 'Inactive', 'Blocked') Default 'Active',
    Custumer_Notes TEXT
);

Alter table Customers
Modify Column Customer_Name Varchar (100) not null;   

create table Orders (
     Order_Id  int auto_increment primary key,
     Customer_Id int not null,
     Order_Date Date default (current_date),
     Order_Amount Decimal (10,2) not null,
     Order_Status Enum( 'Pending' , 'Processing' , 'shipped' , 'Cancelled') default 'Pending', 
     Payment_Method enum( 'Cash' , 'Card' , 'UPI', 'Net Banking' ),
     Payment_Status Enum( 'Pending' , 'Paid', 'Faild') Default 'Pending',
     Shipping_Address varchar (250) not null,
     Delivery_pincode varchar (6) ,
     Quality int not null check (Quality > 0),
     Discount_Amount Decimal (10,2) default 0.00,
     Delivery_Date Date default null,
     Created_At Datetime default Current_timestamp,
     Tracking_number varchar (30) unique ,
     Delivery_Status ENUM('Not Dispatched', 'In Transit', 'Delivered', 'Returned'),
     Order_Notes Text,
     Constraint fk_orders_customers
       Foreign key (Customer_Id)
       References customers (Customer_Id)
       ON Delete cascade
       On update cascade
);

select *from customer_orders;
     
     
    
    