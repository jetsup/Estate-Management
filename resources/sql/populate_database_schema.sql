-- this script will populate essential data to the database
USE estate;
DESC county;
INSERT IGNORE INTO county VALUES
	(1, 'MOMBASA'),
	(2, 'KWALE'),
	(3, 'KILIFI'),
	(4, 'TANA RIVER'),
	(5, 'LAMU'),
	(6, 'TAITA TAVETA'),
	(7, 'GARISSA'),
	(8, 'WAJIR'),
	(9, 'MANDERA'),
	(10, 'MARSABIT'),
	(11, 'ISIOLO'),
	(12, 'MERU'),
	(13, 'THARAKA-NITHI'),
	(14, 'EMBU'),
	(15, 'KITUI'),
	(16, 'MACHAKOS'),
	(17, 'MAKUENI'),
	(18, 'NYANDARUA'),
	(19, 'NYERI'),
	(20, 'KIRINYAGA'),
	(21, 'MURANG\'A'),
	(22, 'KIAMBU'),
	(23, 'TURKANA'),
	(24, 'WEST POKOT'),
	(25, 'SAMBURU'),
	(26, 'TRANS-NZOIA'),
	(27, 'UASING GISHU'),
	(28, 'ELGEYO-MARAKWET'),
	(29, 'NANDI'),
	(30, 'BARINGO'),
	(31, 'LAIKIPIA'),
	(32, 'NAKURU'),
	(33, 'NAROK'),
	(34, 'KAJIADO'),
	(35, 'KERICHO'),
	(36, 'BOMET'),
	(37, 'KAKAMEGA'),
	(38, 'VIGIA'),
	(39, 'BUNGOMA'),
	(40, 'BUSIA'),
	(41, 'SIAYA'),
	(42, 'KISUMU'),
	(43, 'HOMABAY'),
	(44, 'MIGORI'),
	(45, 'KISII'),
	(46, 'NYAMIRA'),
	(47, 'NAIROBI');
-- auto generated file the counties won't match
INSERT IGNORE INTO town VALUES
	(1, 'Bungoma', 12),
	(2, 'Busia', 38),
	(3, 'Butere', 12),
	(4, 'Dadaab', 41),
	(5, 'Diani Beach', 17),
	(6, 'Eldoret', 10),
	(7, 'Emali', 44),
	(8, 'Embu', 22),
	(9, 'Garissa', 35),
	(10, 'Gede', 34),
	(11, 'Hola', 43),
	(12, 'Homa Bay', 33),
	(13, 'Isiolo', 12),
	(14, 'Kitui', 34),
	(15, 'Kibwezi', 31),
	(16, 'Kajiado', 13),
	(17, 'Kakamega', 19),
	(18, 'Kakuma', 2),
	(19, 'Kapenguria', 44),
	(20, 'Kericho', 17),
	(21, 'Keroka', 12),
	(22, 'Kiambu', 26),
	(23, 'Kilifi', 16),
	(24, 'Kisii', 45),
	(25, 'Kisumu', 47),
	(26, 'Kitale', 45),
	(27, 'Lamu', 15),
	(28, 'Langata', 35),
	(29, 'Litein', 16),
	(30, 'Lodwar', 11),
	(31, 'Lokichoggio', 25),
	(32, 'Londiani', 30),
	(33, 'Loyangalani', 12),
	(34, 'Machakos', 46),
	(35, 'Makindu', 42),
	(36, 'Malindi', 2),
	(37, 'Mandera', 8),
	(38, 'Maralal', 26),
	(39, 'Marsabit', 31),
	(40, 'Meru', 11),
	(41, 'Mombasa', 37),
	(42, 'Moyale', 18),
	(43, 'Mumias', 28),
	(44, 'Muranga', 41),
	(45, 'Mutomo', 17),
	(46, 'Nairobi', 40),
	(47, 'Naivasha', 7),
	(48, 'Nakuru', 22),
	(49, 'Namanga', 46),
	(50, 'Nanyuki', 14),
	(51, 'Naro Moru', 19),
	(52, 'Narok', 41),
	(53, 'Nyahururu', 16),
	(54, 'Nyeri', 10),
	(55, 'Ruiru', 10),
	(56, 'Shimoni', 17),
	(57, 'Takaungu', 17),
	(58, 'Thika', 34),
	(59, 'Vihiga', 32),
	(60, 'Voi', 14),
	(61, 'Wajir', 25),
	(62, 'Watamu', 45),
	(63, 'Webuye', 8),
	(64, 'Wote', 10),
	(65, 'Wundanyi', 30);
-- 
DESC property_type;
INSERT IGNORE INTO property_type VALUES
	(1, "LAND"),
	(2, "HOUSE");
DESC property_size;
INSERT IGNORE INTO property_size VALUES
	(1, "SINGLE-FAMILY HOME"),
	(2, "APARTMENT"),
	(3, "BUNGALOW"),
	(4, "RANCH"),
	(5, "MANSION"),
	(6, "1/8 ACRE"),
	(7, "1/4 ACRE"),
	(8, "1/2 ACRE"),
	(9, "1 ACRE"),
	(10, "2 ACRES"),
	(11, "2.5 ACRES"),
	(12, "5 ACRES");
DESC property;
INSERT IGNORE INTO property VALUES
	(1, 2, 2, 22, 48, NULL, 5000000);
-- 
DESC user_details;
INSERT IGNORE INTO user_details VALUES
	(1, "Admin", "Admin",27624532, 123456789, "admin@domain.ac.ke", NULL, DEFAULT, DEFAULT, 30, 65, "Sokomoko", 1);
DESC account_type;
INSERT IGNORE INTO account_type VALUES
	(1, "BUSINESS"),
	(2, "CLIENT");
desc access_level;
INSERT IGNORE INTO access_level VALUES
	(1, "DATABASE ADMIN", 1),
	(2, "MANAGER", 1),
	(3, "SUPERVISOR", 1),
	(4, "EMPLOYEE", 1),
	(5, "CLIENT", 2);
DESC logins;
INSERT IGNORE INTO logins VALUES(1, "admin", "root", 1, 1);




	
	
	