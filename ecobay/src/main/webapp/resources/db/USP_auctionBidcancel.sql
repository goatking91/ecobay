CREATE DEFINER=`ecobay`@`%` PROCEDURE `USP_auctionBidcancel`(OUT retVal INT)
    COMMENT ' \n	parameter : OUT retVal INT                    -- 리턴 값\n	return value :\n			 0 = 에러가 없습니다.\n			-1 = 예상하지 않은 런 타임 오류가 발생하였습니다.\n	description :  USP_auction_bidcancel => 낙찰처리된 상품의 미결제시 유찰처리하기 -- call USP_auction_bidcancel();\n			** 낙찰처리된 상품의 처리구분코드가 ‘(1:대기)’이면서 정해진 결제마감시간이 초과된 상품의 개수 구하기\n			 => 1개 이상인 경우엔 해당 상품의 상품코드 리스트 구하기.\n			  1. 해당 상품의 상태코드(6:낙찰) 정보를 유찰로 변경함.\n			  2. 경매설정에서 처리구분코드를 (3:취소)로 변경함. '
BEGIN
	DECLARE m_Done INT DEFAULT 0;
	DECLARE productcd VARCHAR(50) DEFAULT '';

	DECLARE nowdate datetime DEFAULT now();
	DECLARE totalcnt INT DEFAULT 0;

	DECLARE m_Cursor CURSOR FOR 
		SELECT product_cd
		  FROM auctioninfo
		 WHERE PAYMENT_PROC_CD = '1'
		   AND date_add(ACUTDATE_END, interval 1 day) <= nowdate;

	DECLARE CONTINUE HANDLER FOR NOT FOUND SET m_Done=1; # /* 데이터가 없으면 m_Done에 1 */

	SET m_Done = 0;
	SET nowdate = now();
	SET totalcnt = 0;
	SET productcd = '';

	SELECT count(product_cd) 
	  INTO totalcnt
	  FROM auctioninfo 
	 WHERE PAYMENT_PROC_CD = '1'
       AND date_add(ACUTDATE_END, interval 1 day) <= nowdate;
	 
	IF ( totalcnt > 0 ) THEN
		OPEN m_Cursor;
			curRepeat : REPEAT
				FETCH m_Cursor INTO productcd;
					IF NOT m_Done THEN
						/* 해당 상품의 상태코드(6:낙찰) 정보를 유찰로 변경함 */
						UPDATE product
						   SET STATE_CD = '6'
							 , STATE_NM = '유찰'
							 , MODDATE = now()
						 WHERE PRODUCT_CD = productcd;
						
						-- /* 경매설정에서 처리구분코드를 (3:취소)로 변경함. */
						UPDATE auctioninfo
						   SET PAYMENT_PROC_CD = '3' -- 취소
						 WHERE PRODUCT_CD = productcd;
			
						IF M_ERR > 0 THEN -- /* SQL에러가 발생하면 반복 종료하기 */
							SET retVal = -1;
							LEAVE curRepeat;
						END IF;
					END IF;
					SET retVal = 0;
			UNTIL m_Done END REPEAT; # /* => m_Done이 1이 될때까지 반복 합니다. */
		CLOSE m_Cursor; # /* 커서 종료 */
	END IF;
END
