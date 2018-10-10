CREATE DEFINER=`ecobay`@`%` PROCEDURE `USP_auctionDeadline`()
    COMMENT ' description :  USP_auction_deadline => 경매종료일이 넘은 상품 마감처리하기 -- call USP_auction_deadline();\n		** 경매종료일이 현재날짜보다 작거나 같은 상품의 개수 구하기\n		 => 1개 이상인 경우에 select해서 해당 상품의 상품코드 리스트 구하기\n		  1. 해당 상품에 입찰내역에서 최대 입찰가 구하기\n		  1.1. 0원인 경우 -> 입찰내역이 없는 경우이므로 (6 - 유찰) 처리하기\n		  1.2. 0원보다 큰 경우 -> 입찰내역이 있는 경우이므로 (5 - 낙찰) 처리하기.\n			 - 최대 입찰가로 해당 회원정보 구하여 낙찰처리할 정보 생성하기. '
BEGIN
	DECLARE m_Done INT DEFAULT 0;
	DECLARE productcd VARCHAR(50) DEFAULT '';

	DECLARE nowdate datetime DEFAULT now();
	DECLARE totalcnt INT DEFAULT 0;
	DECLARE maxmoney BIGINT DEFAULT 0;
	DECLARE memberid VARCHAR(100) DEFAULT '';

	DECLARE m_Cursor CURSOR FOR 
			SELECT product_cd
			  FROM auctioninfo
			 WHERE ACUTDATE_END <= nowdate
               AND PAYMENT_PROC_CD = '0';

	DECLARE CONTINUE HANDLER FOR NOT FOUND SET m_Done=1; /* 데이터가 없으면 m_Done에 1 */
    
	SET m_Done = 0;
	SET nowdate = now();
	SET totalcnt = 0;

	SET productcd = '';
	SET maxmoney = 0;
	SET memberid = '';

	SELECT count(product_cd) 
	  INTO totalcnt
	  FROM auctioninfo 
	 WHERE ACUTDATE_END <= nowdate
       AND PAYMENT_PROC_CD = '0';
	
	IF totalcnt > 0 THEN
		OPEN m_Cursor;
			curRepeat : REPEAT
				FETCH m_Cursor INTO productcd; -- /* 반환된 필드값을 변수에 담습니다. */
					IF NOT m_Done THEN -- /* 조회된 값이 있다면 */
						SELECT IFNULL(max(MONEY_BID), 0)
						  INTO maxmoney
						  FROM bidinfo
						 WHERE PRODUCT_CD = productcd;
						
						IF maxmoney > 0 THEN -- /* 입찰내역이 하나라도 있는 경우임(0원이면 입찰내역이 없는 경우임). */
							/* 낙찰처리시 필요한 정보 가져오기 - 상품코드, 최고입찰가, 낙찰자id */
							SELECT MEMBER_ID
							  INTO memberid
							  FROM bidinfo
							 WHERE PRODUCT_CD = productcd
							   AND MONEY_BID = maxMoney;
							
							/* auctioninfo 낙찰자 정보 update */
							UPDATE auctioninfo
							   SET MONEY_LAST = maxmoney
								 , BAY_MEMBER_ID = memberid
								 , PAYMENT_PROC_CD = '1'
							 WHERE PRODUCT_CD = productcd;
							 
							/* product 상품 정보 update */
							UPDATE product
							   SET STATE_CD = '5'
								 , STATE_NM = '낙찰'
								 , MODDATE = now()
							 WHERE PRODUCT_CD = productcd;
						ELSE /* 입찰내역이 없는 경우이므로 유찰처리해야 함. */
							/* product 상품 정보 update */
							UPDATE product
							   SET STATE_CD = '6'
								 , STATE_NM = '유찰'
								 , MODDATE = now()
							 WHERE PRODUCT_CD = productcd;
						END IF;
					END IF;
			UNTIL m_Done END REPEAT; -- /* => m_Done이 1이 될때까지 반복 합니다. */
		CLOSE m_Cursor; -- /* 커서 종료 */
	END IF;
END