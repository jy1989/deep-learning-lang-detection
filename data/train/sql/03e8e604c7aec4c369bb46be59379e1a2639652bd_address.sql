SET DEFINE OFF;
CREATE TABLE D_ADDRESS
(
  ADDRESS_ID  VARCHAR2(150 BYTE),
  ADDRESS1    VARCHAR2(150 BYTE),
  ADDRESS2    VARCHAR2(150 BYTE),
  CITY        VARCHAR2(100 BYTE),
  STATE       VARCHAR2(50 BYTE),
  ZIP         VARCHAR2(50 BYTE),
  COUNTRY     VARCHAR2(50 BYTE),
  WHOSTAMP    VARCHAR2(50 BYTE),
  DATESTAMP   DATE
)
TABLESPACE DTW_ADV_TABLES
RESULT_CACHE (MODE DEFAULT)
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          80K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
            FLASH_CACHE      DEFAULT
            CELL_FLASH_CACHE DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


CREATE UNIQUE INDEX D_ADDRESS_PK ON D_ADDRESS
(ADDRESS_ID)
LOGGING
TABLESPACE DTW_ADV_TABLES
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
            FLASH_CACHE      DEFAULT
            CELL_FLASH_CACHE DEFAULT
           )
NOPARALLEL;


ALTER TABLE D_ADDRESS ADD (
  CONSTRAINT D_ADDRESS_PK
  PRIMARY KEY
  (ADDRESS_ID)
  USING INDEX D_ADDRESS_PK
  ENABLE VALIDATE);