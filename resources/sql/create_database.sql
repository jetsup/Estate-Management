DROP DATABASE IF EXISTS estate;
-- create a databse
CREATE DATABASE IF NOT EXISTS estate;
-- select the databse
USE estate;
-- populate the databse with the respective tables
CREATE TABLE IF NOT EXISTS counties(
	county_id INT(2) PRIMARY KEY,
	county_name VARCHAR(20) NOT NULL
);
CREATE TABLE IF NOT EXISTS towns(
	town_id INT(2) PRIMARY KEY,
	town_name VARCHAR(20) NOT NULL,
	county_id INT(2),
	FOREIGN KEY(county_id) REFERENCES counties(county_id) ON DELETE SET NULL
);
CREATE TABLE IF NOT EXISTS locations(
	location_id INT,
	location_name VARCHAR(20) NOT NULL UNIQUE,
	county_id INT(2) NOT NULL,
	town_id INT(2) NOT NULL,
	PRIMARY KEY(location_id, county_id, town_id),
	FOREIGN KEY(county_id) REFERENCES counties(county_id) ON DELETE CASCADE,
	FOREIGN KEY(town_id) REFERENCES towns(town_id) ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS account_type(
	type_id INT(1) PRIMARY KEY AUTO_INCREMENT,
	account_type VARCHAR(12) NOT NULL
);
CREATE TABLE IF NOT EXISTS access_level(
	access_id INT(2) PRIMARY KEY AUTO_INCREMENT,
	access_name VARCHAR(20) NOT NULL,
	ac_type_id INT(1) NOT NULL,
	FOREIGN KEY(ac_type_id) REFERENCES account_type(type_id) ON DELETE CASCADE
);
-- users table, both employees and clients
CREATE TABLE IF NOT EXISTS user_details(
	user_id INT(6) PRIMARY KEY AUTO_INCREMENT,
	first_name VARCHAR(15) NOT NULL,
	last_name VARCHAR(15) NOT NULL,
	id_passport_number INT(8) NOT NULL UNIQUE,
	phone_number V(13) NOT NULL,
	user_email VARCHAR(40) DEFAULT NULL,
	profile_pic VARCHAR(17) DEFAULT NULL,
	date_added DATE DEFAULT (CURRENT_DATE()),
	time_added TIME DEFAULT (CURRENT_TIME()),
	residence_county INT(2),-- county_id of residence
	residence_town INT(2), -- town of residence of the user
	user_location VARCHAR(20),
	FOREIGN KEY(residence_county) REFERENCES counties(county_id) ON DELETE SET NULL,
	FOREIGN KEY(residence_town) REFERENCES towns(town_id) ON DELETE SET NULL
-- 	FOREIGN KEY(property_id) REFERENCES property(prop_id) ON DELETE SET NULL ON UPDATE CASCADE
);
CREATE TABLE IF NOT EXISTS logins(
	id_passport_number INT(8) PRIMARY KEY,
	username VARCHAR(12) NOT NULL UNIQUE,
	password VARCHAR(12) NOT NULL,
	acc_type_id INT(1) DEFAULT 2,
	access_id INT(1) DEFAULT 5,
	FOREIGN KEY(id_passport_number) REFERENCES user_details(id_passport_number) ON DELETE CASCADE,
	FOREIGN KEY(acc_type_id) REFERENCES account_type(type_id) ON DELETE SET NULL,
	FOREIGN KEY(access_id) REFERENCES access_level(access_id) ON DELETE SET NULL
);
-- Property data
CREATE TABLE IF NOT EXISTS property_type(
	prop_type_id INT(1) PRIMARY KEY AUTO_INCREMENT,
	prop_name VARCHAR(20) NOT NULL UNIQUE
);
CREATE TABLE IF NOT EXISTS property_size(
	prop_size_id INT(1) PRIMARY KEY AUTO_INCREMENT,
	prop_name VARCHAR(50) NOT NULL
);
CREATE TABLE IF NOT EXISTS property(
	property_id INT AUTO_INCREMENT,
	user_id_number INT(8),
	prop_type_id INT(1),
	prop_size_id INT(1),
	location_id INT, -- we can have multiple properties in the same area
	price INT(9) NOT NULL,
	PRIMARY KEY(property_id, user_id_number, prop_type_id, prop_size_id, location_id),
	FOREIGN KEY(user_id_number) REFERENCES user_details(id_passport_number) ON DELETE CASCADE,
	FOREIGN KEY(prop_type_id) REFERENCES property_type(prop_type_id) ON DELETE CASCADE,
	FOREIGN KEY(prop_size_id) REFERENCES property_size(prop_size_id) ON DELETE CASCADE
-- 	FOREIGN KEY(county_id) REFERENCES counties(county_id) ON UPDATE CASCADE,
-- 	FOREIGN KEY(town_id) REFERENCES towns(town_id) ON UPDATE CASCADE
);
-- mode of payments
CREATE TABLE IF NOT EXISTS payment_modes(
	mode_id INT(1) PRIMARY KEY AUTO_INCREMENT,
	mode_name VARCHAR(20) NOT NULL UNIQUE
);
-- create a table that will store the user ID and all the properties associated with that user
CREATE TABLE IF NOT EXISTS ownership(
	user_id_number INT(8) PRIMARY KEY,
	property_id INT NOT NULL UNIQUE,
	payment_method INT(1) NOT NULL UNIQUE,
	transaction_code VARCHAR(12) NOT NULL UNIQUE, -- unique number sent to you by your BANK or your NSP (Network Service Provider) for money transfer
	date_of_purchase DATE DEFAULT (CURRENT_DATE()),
	time_of_purchase TIME DEFAULT  (CURRENT_TIME())
);



