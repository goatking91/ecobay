CREATE EVENT ecobay.event_usp_exec
    ON SCHEDULE
       EVERY 3 MINUTE
       STARTS CURRENT_TIMESTAMP
       ENABLE
	DO CALL ecobay.USP_exec();
