-- 회원
CREATE TABLE MEMBER
( 
 MEMBER_ID VARCHAR(100) NOT NULL PRIMARY KEY 
, MEMBER_NAME VARCHAR(100) NOT NULL 
, PWD VARCHAR(50) NOT NULL 
, BIRTH VARCHAR(20) NOT NULL 
, ZIPCODE VARCHAR(10) NOT NULL 
, ADDR1 VARCHAR(500) NOT NULL 
, ADDR2 VARCHAR(500) NOT NULL 
, GENDER VARCHAR(5) NOT NULL default 'M' 
, PHONE VARCHAR(20) NOT NULL 
, JOIN_YN VARCHAR(5) NOT NULL default 'N' 
, USE_YN VARCHAR(5) NOT NULL default 'Y' 
, REGDATE DATETIME NOT NULL default now() 
, MODDATE DATETIME NOT NULL default now() 
, DELDATE DATETIME NULL 
); 


-- 상품
CREATE TABLE PRODUCT
( 
 PRODUCT_CD VARCHAR(14) NOT NULL PRIMARY KEY
, PRODUCT_NM VARCHAR(500) NOT NULL 
, MEMBER_ID VARCHAR(100) NOT NULL 
, CLASS_BIG_CD VARCHAR(5) NOT NULL 
, CLASS_MID_CD VARCHAR(5) NOT NULL 
, CONTENT TEXT NULL 
, STATE_CD VARCHAR(5) NOT NULL 
, STATE_NM VARCHAR(20) NOT NULL 
, REGDATE DATETIME NOT NULL default now()
, MODDATE DATETIME NOT NULL default now()
, DELDATE DATETIME NULL 
, USE_YN VARCHAR(5) NOT NULL default 'Y'
, VIEWCNT INT(6) NOT NULL default 0
);


-- 상품이미지
CREATE TABLE PRODUCTIMG
( 
 IMG_CD INT(6) NOT NULL
, IMG_IDX INT(6) NOT NULL
, PRODUCT_CD VARCHAR(14) NOT NULL
, FILENAME VARCHAR(250) NOT NULL 
, FILENAME_ORG VARCHAR(200) NOT NULL 
, REGDATE DATETIME NOT NULL default now()
, PRIMARY KEY(IMG_CD, IMG_IDX)
);


-- 상품문의
CREATE TABLE PRODUCTQNA
( 
 QNA_IDX INT(6) NOT NULL
, PRODUCT_CD VARCHAR(14) NOT NULL
, QNA_DIV VARCHAR(5) NOT NULL
, MEMBER_ID VARCHAR(100) NOT NULL 
, TITLE VARCHAR(500) NOT NULL 
, CONTENT TEXT NULL 
, REGDATE DATETIME NOT NULL default now()
, PRIMARY KEY(QNA_IDX, PRODUCT_CD, QNA_DIV)
);


-- 경매정보
CREATE TABLE AUCTIONINFO
( 
 PRODUCT_CD VARCHAR(14) NOT NULL PRIMARY KEY
, MONEY_FIRST BIGINT NOT NULL 
, MONEY_LAST BIGINT NULL 
, MONEY_UNIT BIGINT NOT NULL 
, AUCTDATE_UNIT INT(6) NOT NULL 
, ACUTDATE_START DATETIME NULL 
, ACUTDATE_END DATETIME NULL 
, BAYNOW_YN VARCHAR(5) NOT NULL default 'N'
, BAYNOW_MONEY BIGINT NULL 
, REGDATE DATETIME NOT NULL default now()
, BAY_MEMBER_ID VARCHAR(100) NULL 
);


-- 입찰내역
CREATE TABLE BIDINFO
( 
 PRODUCT_CD VARCHAR(14) NOT NULL PRIMARY KEY
, MEMBER_ID VARCHAR(100) NOT NULL 
, MONEY_BID BIGINT NOT NULL 
, REGDATE DATETIME NOT NULL default now()
);


-- 배송정보
CREATE TABLE DELIVERYINFO
( 
 PRODUCT_CD VARCHAR(14) NOT NULL PRIMARY KEY
, DELI_DIV_CD VARCHAR(5) NOT NULL 
, DELI_DIV_NM VARCHAR(50) NOT NULL 
, REGDATE DATETIME NOT NULL default now()
);


-- 분류
CREATE TABLE CLASS
( 
 CLASS_BIG_CD VARCHAR(5) NOT NULL
, CLASS_MID_CD VARCHAR(5)NOT NULL default '00'
, CLASS_BIG_NM VARCHAR(100) NOT NULL 
, CLASS_MID_NM VARCHAR(100) NOT NULL 
, CLASS_DIV VARCHAR(5) NOT NULL 
, REGDATE DATETIME NOT NULL default now()
, MODDATE DATETIME NOT NULL default now()
, DELDATE DATETIME NULL 
, USE_YN VARCHAR(5) NOT NULL default 'Y'
, PRIMARY KEY(CLASS_BIG_CD, CLASS_MID_CD)
);


-- 상품결제
CREATE TABLE PAYMENT
( 
 PRODUCT_CD VARCHAR(14) NOT NULL PRIMARY KEY
, MONEY_PAY BIGINT NOT NULL 
, APPR_YN VARCHAR(5) NOT NULL default 'N'
, PROC_YN VARCHAR(5) NOT NULL default 'N'
, REGDATE DATETIME NOT NULL default now()
);


-- 상품배송
CREATE TABLE DELIVERY
( 
 PRODUCT_CD VARCHAR(14) NOT NULL PRIMARY KEY
, DELI_NM VARCHAR(100) NOT NULL 
, DELI_ZIPCODE VARCHAR(10) NOT NULL 
, DELI_ADDR1 VARCHAR(500) NOT NULL 
, DELI_ADDR2 VARCHAR(500) NOT NULL 
, REGDATE DATETIME NOT NULL default now()
);


-- 공지시항
CREATE TABLE NOTICE
( 
 NOTICE_IDX INT(6) NOT NULL AUTO_INCREMENT PRIMARY KEY
, TITLE VARCHAR(500) NOT NULL
, CONTENT TEXT NULL 
, REGDATE DATETIME NOT NULL default now()
, MODDATE DATETIME NOT NULL default now()
, DELDATE DATETIME NULL 
, USE_YN VARCHAR(5) NOT NULL default 'Y'
);


-- 공지시항이미지
CREATE TABLE NOTICEIMG 
( 
 IMG_CD INT(6) NOT NULL
, IMG_IDX INT(6) NOT NULL
, NOTICE_IDX INT(6) NOT NULL
, FILENAME VARCHAR(250) NULL 
, FILENAME_ORG VARCHAR(200) NULL 
, REGDATE DATETIME NULL default now()
, PRIMARY KEY(IMG_CD, IMG_IDX, NOTICE_IDX)
);


-- FAQ
CREATE TABLE FAQ 
( 
 FAQ_IDX INT(6) NOT NULL AUTO_INCREMENT PRIMARY KEY 
, TITLE VARCHAR(500) NOT NULL 
, CONTENT TEXT NULL 
, REGDATE DATETIME NOT NULL default now()
, MODDATE DATETIME NOT NULL default now()
);


-- QNA
CREATE TABLE QNA 
( 
 QNA_IDX INT(6) NOT NULL AUTO_INCREMENT PRIMARY KEY 
, MEMBER_ID VARCHAR(100) NOT NULL 
, TITLE VARCHAR(500) NOT NULL 
, CONTENT TEXT NULL 
, REGDATE DATETIME NOT NULL default now()
);


-- QNA이미지
CREATE TABLE QNAIMG 
( 
 IMG_CD INT(6) NOT NULL 
, IMG_IDX INT(6) NOT NULL
, QNA_IDX INT(6) NOT NULL
, FILENAME VARCHAR(250) NOT NULL 
, FILENAME_ORG VARCHAR(200) NOT NULL 
, REGDATE DATETIME NOT NULL default now()
, PRIMARY KEY(IMG_CD, IMG_IDX)
);


-- 관리자
CREATE TABLE ADMINS 
( 
 ADMIN_ID VARCHAR(100) NOT NULL PRIMARY KEY
, ADMIN_PWD VARCHAR(100) NOT NULL 
);

