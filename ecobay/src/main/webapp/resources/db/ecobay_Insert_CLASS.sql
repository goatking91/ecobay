﻿-- 분류
INSERT INTO CLASS VALUES ('FS', 'XX', '패션', 'B', now(), now(), NULL, TRUE);
INSERT INTO CLASS VALUES ('FS', 'CL', '의류', 'M', now(), now(), NULL, TRUE);
INSERT INTO CLASS VALUES ('FS', 'SH', '신발', 'M', now(), now(), NULL, TRUE);
INSERT INTO CLASS VALUES ('FS', 'BA', '가방', 'M', now(), now(), NULL, TRUE);
INSERT INTO CLASS VALUES ('FS', 'HA', '모자', 'M', now(), now(), NULL, TRUE);
INSERT INTO CLASS VALUES ('FS', 'AC', '악세서리', 'M', now(), now(), NULL, TRUE);
INSERT INTO CLASS VALUES ('FS', 'ZZ', '기타', 'M', now(), now(), NULL, TRUE);
INSERT INTO CLASS VALUES ('LV', 'XX', '리빙', 'B', now(), now(), NULL, TRUE);
INSERT INTO CLASS VALUES ('LV', 'FV', '가구', 'M', now(), now(), NULL, TRUE);
INSERT INTO CLASS VALUES ('LV', 'LT', '조명', 'M', now(), now(), NULL, TRUE);
INSERT INTO CLASS VALUES ('LV', 'PR', '소품', 'M', now(), now(), NULL, TRUE);
INSERT INTO CLASS VALUES ('LV', 'ZZ', '기타', 'M', now(), now(), NULL, TRUE);
INSERT INTO CLASS VALUES ('LG', 'XX', '가전', 'B', now(), now(), NULL, TRUE);
INSERT INTO CLASS VALUES ('LG', 'BI', '대형가전', 'M', now(), now(), NULL, TRUE);
INSERT INTO CLASS VALUES ('LG', 'KI', '주방가전', 'M', now(), now(), NULL, TRUE);
INSERT INTO CLASS VALUES ('LG', 'LI', '생활가전', 'M', now(), now(), NULL, TRUE);
INSERT INTO CLASS VALUES ('LG', 'ZZ', '기타(음향/건강)', 'M', now(), now(), NULL, TRUE);
INSERT INTO CLASS VALUES ('DG', 'XX', '디지털', 'B', now(), now(), NULL, TRUE);
INSERT INTO CLASS VALUES ('DG', 'PH', '휴대폰', 'M', now(), now(), NULL, TRUE);
INSERT INTO CLASS VALUES ('DG', 'CM', '카메라', 'M', now(), now(), NULL, TRUE);
INSERT INTO CLASS VALUES ('DG', 'PC', '노트북/PC/태블릿', 'M', now(), now(), NULL, TRUE);
INSERT INTO CLASS VALUES ('DG', 'GA', '게임용품', 'M', now(), now(), NULL, TRUE);
INSERT INTO CLASS VALUES ('DG', 'ZZ', '기타', 'M', now(), now(), NULL, TRUE);
INSERT INTO CLASS VALUES ('CT', 'XX', '문화', 'B', now(), now(), NULL, TRUE);
INSERT INTO CLASS VALUES ('CT', 'KB', '국내도서', 'M', now(), now(), NULL, TRUE);
INSERT INTO CLASS VALUES ('CT', 'FB', '해외도서', 'M', now(), now(), NULL, TRUE);
INSERT INTO CLASS VALUES ('CT', 'DV', 'DVD', 'M', now(), now(), NULL, TRUE);
INSERT INTO CLASS VALUES ('CT', 'LP', '음반', 'M', now(), now(), NULL, TRUE);
INSERT INTO CLASS VALUES ('CT', 'ZZ', '기타', 'M', now(), now(), NULL, TRUE);
INSERT INTO CLASS VALUES ('SP', 'XX', '스포츠', 'B', now(), now(), NULL, TRUE);
INSERT INTO CLASS VALUES ('SP', 'MT', '자동차', 'M', now(), now(), NULL, TRUE);
INSERT INTO CLASS VALUES ('SP', 'BA', '구기용품', 'M', now(), now(), NULL, TRUE);
INSERT INTO CLASS VALUES ('SP', 'OT', '아웃도어', 'M', now(), now(), NULL, TRUE);
INSERT INTO CLASS VALUES ('SP', 'ZZ', '기타', 'M', now(), now(), NULL, TRUE);
INSERT INTO CLASS VALUES ('CA', 'XX', '수집/예술', 'B', now(), now(), NULL, TRUE);
INSERT INTO CLASS VALUES ('CA', 'CO', '수집품', 'M', now(), now(), NULL, TRUE);
INSERT INTO CLASS VALUES ('CA', 'OA', '동양예술품', 'M', now(), now(), NULL, TRUE);
INSERT INTO CLASS VALUES ('CA', 'WA', '서양예술품', 'M', now(), now(), NULL, TRUE);
INSERT INTO CLASS VALUES ('CA', 'ZZ', '기타', 'M', now(), now(), NULL, TRUE);


--카테고리
INSERT INTO CATEGORY VALUES ('MI', '회원정보', now());
INSERT INTO CATEGORY VALUES ('BI', '구매', now());
INSERT INTO CATEGORY VALUES ('SI', '판매', now());
INSERT INTO CATEGORY VALUES ('AI', '경매진행', now());
INSERT INTO CATEGORY VALUES ('OT', '기타', now());