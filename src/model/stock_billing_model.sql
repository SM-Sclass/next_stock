CREATE DATABASE next_stock;
use next_stock;


CREATE TABLE users (
  id INT UNSIGNED NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
  username varchar(225) NOT NULL UNIQUE,
  email varchar(225) UNIQUE,
  phoneNumber INT UNSIGNED UNIQUE
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
 
CREATE TABLE ENTRIES (
  id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  UID INT UNSIGNED  NOT NULL,
  date date NOT NULL,
  item varchar(45) NOT NULL,
  expiry date NOT NULL,
  lot_size INT UNSIGNED NOT NULL,
  no_of_lot INT UNSIGNED NOT NULL,
  buy_qty INT UNSIGNED NOT NULL,
  buy_price DECIMAL(11, 5) NOT NULL,
  buy_net_price DECIMAL(11, 5) NOT NULL,
  sell_qty INT DEFAULT NULL,
  sell_price DECIMAL(11, 5) DeFAULT NULL,
  sell_net_price DECIMAL(11, 5) DEFAULT NULL,
  pnl DOUBLE(20,5) DEFAULT NULL,
  net_qty DECIMAL(11, 5) DEFAULT NULL,
  cmp DECIMAL(11, 5) ,
  mtm DECIMAL(11, 5),
  FOREIGN KEY(UID) REFERENCES users(id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci; 
 
 
CREATE TABLE one_entry_bill(
id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  UID INT UNSIGNED  NOT NULL,
  EID INT UNSIGNED NOT NULL,
  weekNumber INT UNSIGNED NOT NULL,
  billAmount DOUBLE(20,5) NOT NULL,
  FOREIGN KEY(UID) REFERENCES users(id),
  FOREIGN KEY(EID) REFERENCES ENTRIES(id)
);
CREATE TABLE week_bill(
id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  UID INT UNSIGNED  NOT NULL,
  EID INT UNSIGNED NOT NULL,
  weekNumber INT UNSIGNED NOT NULL,
  total_days INT UNSIGNED NOT NULL,
  billAmount DOUBLE(20,5) NOT NULL,
  FOREIGN KEY(UID) REFERENCES users(id)
  
);
CREATE TABLE Total_till_now(
id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  UID INT UNSIGNED  NOT NULL,
  Total_amount DOUBLE(20,5) NOT NULL,
  FOREIGN KEY(UID) REFERENCES users(id)
);


