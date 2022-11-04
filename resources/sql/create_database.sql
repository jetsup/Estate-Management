DROP DATABASE IF EXISTS estate;
-- create a databse
CREATE DATABASE IF NOT EXISTS estate;
-- select the databse
USE estate;
-- populate the databse with the respective tables
CREATE TABLE IF NOT EXISTS county(
	county_id INT(2) PRIMARY KEY,
	county_name VARCHAR(20) NOT NULL
);
CREATE TABLE IF NOT EXISTS town(
	town_id INT(2) PRIMARY KEY,
	town_name VARCHAR(20) NOT NULL,
	county_id INT(2),
	FOREIGN KEY(county_id) REFERENCES county(county_id) ON DELETE SET NULL
);
CREATE TABLE IF NOT EXISTS location(
	county_id INT(2) NOT NULL,
	town_id INT(2) NOT NULL,
	FOREIGN KEY(county_id) REFERENCES county(county_id) ON DELETE CASCADE,
	FOREIGN KEY(town_id) REFERENCES town(town_id) ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS account_type(
	type_id INT(1) PRIMARY KEY,
	account_type VARCHAR(12) NOT NULL
);
CREATE TABLE IF NOT EXISTS access_level(
	access_id INT(2) PRIMARY KEY,
	access_name VARCHAR(20) NOT NULL,
	ac_type_id INT(1) NOT NULL,
	FOREIGN KEY(ac_type_id) REFERENCES account_type(type_id) ON DELETE CASCADE
);

-- Property data
CREATE TABLE IF NOT EXISTS property_type(
	prop_type_id INT(1) PRIMARY KEY,
	prop_name VARCHAR(20) NOT NULL UNIQUE
);
CREATE TABLE IF NOT EXISTS property_size(
	prop_size_id INT(1) PRIMARY KEY,
	prop_name VARCHAR(50) NOT NULL
);
CREATE TABLE IF NOT EXISTS property(
	prop_id INT(2) PRIMARY KEY,
	prop_type_id INT(1),
	prop_size_id INT(1),
	county_id INT(2) NOT NULL,
	town_id INT(2) NOT NULL,
	Location VARCHAR(20),
	price INT(9) NOT NULL,
	FOREIGN KEY(prop_type_id) REFERENCES property_type(prop_type_id) ON DELETE SET NULL,
	FOREIGN KEY(prop_size_id) REFERENCES property_size(prop_size_id) ON DELETE SET NULL,
	FOREIGN KEY(county_id) REFERENCES county(county_id) ON UPDATE CASCADE,
	FOREIGN KEY(town_id) REFERENCES town(town_id) ON UPDATE CASCADE
);
-- users table, both employees and clients
CREATE TABLE IF NOT EXISTS user_details(
	user_id INT(6) PRIMARY KEY,
	first_name VARCHAR(15) NOT NULL,
	last_name VARCHAR(15) NOT NULL,
	id_passport_number INT(8) NOT NULL UNIQUE,
	phone_number INT(9) NOT NULL,
	user_email VARCHAR(40) DEFAULT NULL,
	profile_pic MEDIUMBLOB DEFAULT NULL,
	date_added DATE DEFAULT (CURRENT_DATE()),
	time_added TIME DEFAULT (CURRENT_TIME()),
	residence_county INT(2),-- county_id of residence
	residence_town INT(2), -- town of residence of the user
	location VARCHAR(20),
	property_id INT(8),
	FOREIGN KEY(residence_county) REFERENCES county(county_id) ON DELETE SET NULL,
	FOREIGN KEY(residence_town) REFERENCES town(town_id) ON DELETE SET NULL,
	FOREIGN KEY(property_id) REFERENCES property(prop_id) ON DELETE SET NULL ON UPDATE CASCADE
);
CREATE TABLE IF NOT EXISTS logins(
	user_id int(8) PRIMARY KEY,
	username VARCHAR(12) NOT NULL UNIQUE,
	password VARCHAR(12) NOT NULL,
	acc_type_id INT(1),
	access_id INT(1),
	FOREIGN KEY(acc_type_id) REFERENCES account_type(type_id) ON DELETE SET NULL,
	FOREIGN KEY(access_id) REFERENCES access_level(access_id) ON DELETE SET NULL
);




