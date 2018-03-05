CREATE TABLE RATER(
USER_ID CHAR(6) PRIMARY KEY,
EMAIL CHAR(20) NOT NULL,
NAME CHAR(15),
JOIN_DATE DATE,
RATER_TYPE CHAR(2),
REP DECIMAL(1,0) DEFAULT 1,
CHECK(REP>0 AND REP<=5),
CHECK(JOIN_DATE<=CURRENT_DATE),
CHECK(RATER_TYPE='BLOG' OR RATER_TYPE='CRITIC' OR RATER_TYPE='ONLINE')
);

CREATE TABLE RATING(
USER_ID CHAR(6),
RATE_DATE DATE,
PRICE DECIMAL(1,0) DEFAULT 1,
FOOD DECIMAL(1,0) DEFAULT 1,
MOOD DECIMAL (1,0) DEFAULT 1,
STAFF DECIMAL (1,0) DEFAULT 1,
COMMENTS TEXT,
RESTAURANT_ID CHAR(6),
PRIMARY KEY(USER_ID,RATE_DATE),
CHECK(PRICE>0 AND PRICE<=5 AND
	FOOD>0 AND FOOD<=5 AND
	MOOD>0 AND MOOD<=5 AND
	STAFF>0 AND STAFF<=5)
);

CREATE TABLE RESTAURANT(
RESTAURANT_ID CHAR(4) PRIMARY KEY,
NAME CHAR(20),
RES_TYPE CHAR(15),
URL CHAR(100)
);

CREATE TABLE LOCATION(
LOCATION_ID CHAR(6) PRIMARY KEY,
FIRST_OPENED DATE,
MANAGER CHAR(20),
PHONE_NO CHAR(10),
ADDRESS CHAR(20),
HOUR_OPEN TIME(5),
HOUR_CLOSE TIME(5),
RESTAURANT_ID CHAR(4)
);

CREATE TABLE MENU_ITEM(
ITEM_ID CHAR(6) PRIMARY KEY,
NAME CHAR(20),
TYPE CHAR(1),
CATEGORY CHAR(1),
DESCRIPTION TEXT,
PRICE DECIMAL (3,2),
RESTAURANT_ID CHAR(6),
CHECK (CATEGORY='F' OR CATEGORY ='B')
);

CREATE TABLE RATING_ITEM(
USER_ID CHAR(6),
RATE_DATE DATE,
ITEM_ID CHAR(6),
RATING DECIMAL(1,0),
COMMENT TEXT,
PRIMARY KEY (USER_ID, RATE_DATE, ITEM_ID),
CHECK(RATING>0 AND RATING <=5)
);