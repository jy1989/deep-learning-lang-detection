--Netezza external table

CREATE EXTERNAL TABLE YZ_EX_CHURN_SAMPLE_FLAGS_20140423 (
	ID VARCHAR(100),
	DISCLOSURE VARCHAR(100),
	SVC_IDNTY VARCHAR(100)
)
USING (
	DATAOBJECT('C:\RSC\churn sample flags to append\Optus Churn Jan-Mar 2014 Service Numbers.csv')
	DELIMITER ','
	REMOTESOURCE 'ODBC'
	SKIPROWS 1
	MAXERRORS 1
);

CREATE TABLE YZ_CHURN_SAMPLE_FLAGS_20140423
AS ( SELECT * FROM YZ_EX_CHURN_SAMPLE_FLAGS_20140423)
DISTRIBUTE ON (SVC_IDNTY);


-- SEARCH TABLE

SELECT	*
FROM
    _V_OBJ_RELATION_XDB
WHERE
    OBJNAME LIKE 'FPC_INDIVIDUAL%'
;