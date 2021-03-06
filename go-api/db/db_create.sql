DROP TABLE IF EXISTS SHOPS;
DROP TABLE IF EXISTS MEALS;
DROP TABLE IF EXISTS USERS;

CREATE TABLE SHOPS (
   ID INT PRIMARY KEY NOT NULL,
   NAME CHAR(25) NOT NULL,
   LOCATION CHAR(100) NOT NULL,
   DESCRIPTION TEXT
);

CREATE TABLE MEALS (
   ID INT PRIMARY KEY NOT NULL,
   NAME CHAR(25) NOT NULL,
   TYPE CHAR(25) NOT NULL,
   PRICE REAL NOT NULL,
   DESCRIPTION TEXT,
   SHOP_ID INT REFERENCES SHOPS NOT NULL
);

CREATE TABLE USERS (
   ID INT PRIMARY KEY NOT NULL,
   EMAIL CHAR(50) UNIQUE NOT NULL,
   PASSWORD TEXT NOT NULL,
   SHOP_ID INT REFERENCES SHOPS
);
