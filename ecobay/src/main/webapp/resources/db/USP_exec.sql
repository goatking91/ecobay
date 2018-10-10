CREATE DEFINER=`ecobay`@`%` PROCEDURE `USP_exec`()
BEGIN
	CALL ecobay.USP_auctionDeadline();
	CALL ecobay.USP_auctionBidcancel();
END