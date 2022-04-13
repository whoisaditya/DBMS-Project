create database dbms_medicine;
use dbms_medicine;

DROP TABLE IF EXISTS medicine;
CREATE TABLE medicine (
  medicine_id VARCHAR(4) NOT NULL,
  medicine_name VARCHAR(10) NULL,
  medicine_cost INT NULL,
  medicine_brand VARCHAR(10) NULL,
  PRIMARY KEY (medicine_id));
  
INSERT INTO medicine VALUES 
('1001', 'Ranbaxy', '50', 'Aimway'),
('1002', 'Mifoxine', '40', 'Pargua');

DROP TABLE IF EXISTS batch;
CREATE TABLE batch (
  batch_no VARCHAR(4) NOT NULL,
  medicine_stock INT NULL,
  manufacture_date DATETIME NULL,
  expiry_date DATETIME NULL,
  med_id varchar(4) NOT NULL,
  PRIMARY KEY (batch_no));

INSERT INTO batch (batch_no, medicine_stock, manufacture_date, expiry_date,med_id) VALUES ('B101', '20', '2023-09-16', '2023-03-16','1001');
INSERT INTO batch (batch_no, medicine_stock, manufacture_date, expiry_date,med_id) VALUES ('B201', '30', '2022-09-24', '2023-03-24','1002');

DROP TABLE IF EXISTS sales;
CREATE TABLE sales (
    sale_id VARCHAR(4) NOT NULL,
    medicine_id VARCHAR(4) NULL,
    medicine_cost INT NULL,
    batch_id VARCHAR(4) NULL,
    quantity INT NULL,
    amount INT NULL,
    PRIMARY KEY (sale_id)
);

INSERT INTO sales (sale_id, medicine_id, medicine_cost, batch_id, quantity) VALUES ('S101', '1001', '50', 'B101', '20');

DROP TABLE IF EXISTS sale_details;
CREATE TABLE sale_details (
  sale_date DATE NOT NULL,
  sale_id VARCHAR(4) NOT NULL,
  user_id VARCHAR(8) NOT NULL,
  org_id VARCHAR(4) NOT NULL,
  PRIMARY KEY (sale_id, user_id, org_id));

INSERT INTO sale_details (sale_date, sale_id, user_id, org_id) VALUES (curdate(), 'S101', 'Adi', 'O101');

DROP TABLE IF EXISTS organisation;
CREATE TABLE organisation (
  org_id VARCHAR(4) NOT NULL,
  org_name VARCHAR(10) NULL,
  org_type VARCHAR(10) NULL,
  contact_no INT NULL,
  PRIMARY KEY (org_id));

INSERT INTO organisation VALUES ('O101', 'Texas med', 'purchase', '990293928'),
('O102', 'Filla Co', 'purchase', '622114488');

DROP TABLE IF EXISTS user_info;
CREATE TABLE user_info (
  username VARCHAR(30) NOT NULL,
  phone_number VARCHAR(10) NULL,
  email VARCHAR(30) NULL,
  street_user VARCHAR(25) NULL,
  user_city VARCHAR(20) NULL,
  user_state VARCHAR(20) NULL,
  pincode VARCHAR(6) NULL,
  PRIMARY KEY (username));

INSERT INTO user_info VALUES 
('Aditya', '7057648283', 'mitraaditya1357@gmail.com', 'Keshav', 'Pune', 'Mahashtra', '411036'),
('Ritu', '7992454046', 'ritu.raj2020@vitstudent.ac.in', 'JP Nagar', 'Bokaro', 'Jharkand','827013');

DROP TABLE IF EXISTS login;
CREATE TABLE login (
  Login_id VARCHAR(4) NOT NULL,
  Login_username VARCHAR(20) NULL,
  Login_password VARCHAR(20) NULL,
  PRIMARY KEY (Login_id));

INSERT INTO login VALUES 
('L101', 'Aditya', 'aditya.mitra'),
('L102', 'Ritu', 'ritu.raj'),
('L103', 'Sanjna', 'sanjna.sub'),
('L104', 'Monalisa', 'monalisa.mm');

DROP TABLE IF EXISTS role;
CREATE TABLE role (
  Role_id VARCHAR(20) NOT NULL,
  role_type VARCHAR(10) NULL,
  role_user_id VARCHAR(20) NULL,
  PRIMARY KEY (Role_id));

INSERT INTO role VALUES 
('R101', 'Manager', 'L101'),
('R102', 'Employee', 'L102');
