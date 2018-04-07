CREATE TABLE RATER(
USER_ID INT(6) PRIMARY KEY,
EMAIL VARCHAR(40) NOT NULL,
NAME VARCHAR(30),
JOIN_DATE DATE,
RATER_TYPE VARCHAR(10),
REP DECIMAL(1,0) DEFAULT 1,
CHECK(REP>0 AND REP<=5),
CHECK(JOIN_DATE<=CURRENT_DATE),
CHECK(RATER_TYPE='BLOG' OR RATER_TYPE='CRITIC' OR RATER_TYPE='ONLINE')
);

CREATE TABLE RATING(
USER_ID INT(6),
RATE_DATE DATE,
PRICE DECIMAL(1,0) DEFAULT 1,
FOOD DECIMAL(1,0) DEFAULT 1,
MOOD DECIMAL (1,0) DEFAULT 1,
STAFF DECIMAL (1,0) DEFAULT 1,
COMMENTS TEXT,
RESTAURANT_ID INT(4),
PRIMARY KEY(USER_ID,RATE_DATE),
CHECK(PRICE>0 AND PRICE<=5 AND
	FOOD>0 AND FOOD<=5 AND
	MOOD>0 AND MOOD<=5 AND
	STAFF>0 AND STAFF<=5)
);

CREATE TABLE RESTAURANT(
RESTAURANT_ID INT(4) PRIMARY KEY,
NAME VARCHAR(20),
RES_TYPE VARCHAR(15),
URL VARCHAR(100)
);

CREATE TABLE LOCATION(
LOCATION_ID INT(4) PRIMARY KEY,
FIRST_OPENED DATE,
MANAGER VARCHAR(20),
PHONE_NO INT(10),
ADDRESS VARCHAR(20),
HOUR_OPEN TIME(5),
HOUR_CLOSE TIME(5),
RESTAURANT_ID INT(4)
);

CREATE TABLE MENU_ITEM(
ITEM_ID INT(6) PRIMARY KEY,
NAME VARCHAR(20),
CATEGORY VARCHAR(1),
TYPE VARCHAR(1),
DESCRIPTION TEXT,
PRICE DECIMAL (4,2),
RESTAURANT_ID INT(4),
CHECK (CATEGORY='S' OR CATEGORY= 'M' OR CATEGORY = 'D'),
CHECK (TYPE='B' OR TYPE = 'F')
);

CREATE TABLE RATING_ITEM(
USER_ID INT(6),
RATE_DATE DATE,
ITEM_ID VARCHAR(6),
RATING DECIMAL(1,0),
COMMENT TEXT,
PRIMARY KEY (USER_ID, RATE_DATE, ITEM_ID),
CHECK(RATING>0 AND RATING <=5)
);

