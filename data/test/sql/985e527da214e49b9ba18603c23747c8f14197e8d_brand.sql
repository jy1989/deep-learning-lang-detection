SET DEFINE OFF;
CREATE TABLE D_BRAND
(
  BRAND_ID          VARCHAR2(10 BYTE),
  BRAND_NAME        VARCHAR2(50 BYTE),
  SELLING_METHODS   VARCHAR2(500 BYTE),
  FMMARKET          VARCHAR2(10 BYTE),
  QCURRENCY         VARCHAR2(20 BYTE),
  CREATED_BY        VARCHAR2(50 BYTE),
  CREATED_DATETIME  DATE
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


CREATE UNIQUE INDEX D_BRAND_PK ON D_BRAND
(BRAND_ID)
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


ALTER TABLE D_BRAND ADD (
  CONSTRAINT D_BRAND_PK
  PRIMARY KEY
  (BRAND_ID)
  USING INDEX D_BRAND_PK
  ENABLE VALIDATE);
