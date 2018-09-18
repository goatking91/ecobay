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
, JOIN_YN BOOLEAN NOT NULL default FALSE 
, USE_YN BOOLEAN NOT NULL default TRUE
, M_TYPE  VARCHAR(50) NOT NULL default 'ROLE_USER'
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
, USE_YN BOOLEAN NOT NULL default TRUE
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
, FILENAME_THUMB VARCHAR(250) NOT NULL 
, REGDATE DATETIME NOT NULL default now()
, PRIMARY KEY(IMG_CD, IMG_IDX)
);

ALTER TABLE PRODUCTIMG 
	ADD CONSTRAINT fk_productimg_productcd
	Foreign KEY ( PRODUCT_CD ) 
	REFERENCES PRODUCT ( PRODUCT_CD )
	ON DELETE CASCADE;


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

ALTER TABLE PRODUCTQNA 
	ADD CONSTRAINT fk_productqna_productcd
	Foreign KEY ( PRODUCT_CD ) 
	REFERENCES PRODUCT ( PRODUCT_CD )
	ON DELETE CASCADE;


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
, BAYNOW_YN BOOLEAN NOT NULL default FALSE
, BAYNOW_MONEY BIGINT NULL 
, REGDATE DATETIME NOT NULL default now()
, BAY_MEMBER_ID VARCHAR(100) NULL 
);

ALTER TABLE AUCTIONINFO 
	ADD CONSTRAINT fk_auctioninfo_productcd
	Foreign KEY ( PRODUCT_CD ) 
	REFERENCES PRODUCT ( PRODUCT_CD )
	ON DELETE CASCADE;


-- 입찰내역
CREATE TABLE BIDINFO
( 
  PRODUCT_CD VARCHAR(14) NOT NULL PRIMARY KEY
, MEMBER_ID VARCHAR(100) NOT NULL 
, MONEY_BID BIGINT NOT NULL 
, REGDATE DATETIME NOT NULL default now()
);

ALTER TABLE BIDINFO 
	ADD CONSTRAINT fk_bidinfo_productcd
	Foreign KEY ( PRODUCT_CD ) 
	REFERENCES PRODUCT ( PRODUCT_CD )
	ON DELETE CASCADE;


-- 배송정보
CREATE TABLE DELIVERYINFO
( 
  PRODUCT_CD VARCHAR(14) NOT NULL PRIMARY KEY
, DELI_DIV_CD VARCHAR(5) NOT NULL 
, DELI_DIV_NM VARCHAR(50) NOT NULL 
, REGDATE DATETIME NOT NULL default now()
);

ALTER TABLE DELIVERYINFO 
	ADD CONSTRAINT fk_deliveryinfo_productcd
	Foreign KEY ( PRODUCT_CD ) 
	REFERENCES PRODUCT ( PRODUCT_CD )
	ON DELETE CASCADE;


-- 분류
CREATE TABLE CLASS
( 
  CLASS_BIG_CD VARCHAR(5) NOT NULL
, CLASS_MID_CD VARCHAR(5)NOT NULL default 'XX'
, CLASS_NM VARCHAR(100) NOT NULL 
, CLASS_DIV VARCHAR(5) NOT NULL 
, REGDATE DATETIME NOT NULL default now()
, MODDATE DATETIME NOT NULL default now()
, DELDATE DATETIME NULL 
, USE_YN BOOLEAN NOT NULL default TRUE
, PRIMARY KEY(CLASS_BIG_CD, CLASS_MID_CD)
);


-- 상품결제
CREATE TABLE PAYMENT
( 
  PRODUCT_CD VARCHAR(14) NOT NULL PRIMARY KEY
, MONEY_PAY BIGINT NOT NULL 
, APPR_YN BOOLEAN NOT NULL default FALSE
, PROC_YN BOOLEAN NOT NULL default FALSE
, REGDATE DATETIME NOT NULL default now()
);

ALTER TABLE PAYMENT 
	ADD CONSTRAINT fk_payment_productcd
	Foreign KEY ( PRODUCT_CD ) 
	REFERENCES PRODUCT ( PRODUCT_CD )
	ON DELETE CASCADE;


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

ALTER TABLE DELIVERY 
	ADD CONSTRAINT fk_delivery_productcd
	Foreign KEY ( PRODUCT_CD ) 
	REFERENCES PRODUCT ( PRODUCT_CD )
	ON DELETE CASCADE;


-- 공지시항
CREATE TABLE NOTICE
( 
  NOTICE_IDX INT(6) NOT NULL AUTO_INCREMENT PRIMARY KEY
, TITLE VARCHAR(500) NOT NULL
, CONTENT TEXT NULL 
, REGDATE DATETIME NOT NULL default now()
, MODDATE DATETIME NOT NULL default now()
, DELDATE DATETIME NULL 
, VIEWCNT INT(6) NOT NULL default 0
, USE_YN BOOLEAN NOT NULL default TRUE
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

ALTER TABLE NOTICEIMG 
	ADD CONSTRAINT fk_noticeimg_notice_idx
	Foreign KEY ( NOTICE_IDX ) 
	REFERENCES NOTICE ( NOTICE_IDX )
	ON DELETE CASCADE;


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

ALTER TABLE QNAIMG
	ADD CONSTRAINT fk_qnaimg_qna_idx
	Foreign KEY ( QNA_IDX ) 
	REFERENCES QNA ( QNA_IDX )
	ON DELETE CASCADE;


-- QNA답변
CREATE TABLE QNAREPLY 
( 
  QNARP_IDX INT(6) NOT NULL
, QNA_IDX INT(6) NOT NULL
, CONTENT TEXT NULL 
, ADMIN_ID VARCHAR(100) NOT NULL
, REGDATE DATETIME NOT NULL default now()
, PRIMARY KEY(QNARP_IDX, QNA_IDX)
);

ALTER TABLE QNAREPLY
	ADD CONSTRAINT fk_qnareply_qna_idx
	Foreign KEY ( QNA_IDX ) 
	REFERENCES QNA ( QNA_IDX )
	ON DELETE CASCADE;


-- 관리자
CREATE TABLE ADMINS 
( 
 ADMIN_ID VARCHAR(100) NOT NULL PRIMARY KEY
, ADMIN_PWD VARCHAR(100) NOT NULL 
);

