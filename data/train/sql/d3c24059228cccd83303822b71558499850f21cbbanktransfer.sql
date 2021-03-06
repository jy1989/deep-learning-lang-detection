--------------------------------------------------------
--  ÆÄÀÏÀÌ »ý¼ºµÊ - ¸ñ¿äÀÏ-2¿ù-02-2017   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table BANKTRANSFER
--------------------------------------------------------

  CREATE TABLE "SCOTT"."BANKTRANSFER" 
   (	"BTID" NUMBER, 
	"BTNAME" VARCHAR2(20 BYTE), 
	"BTBANK" VARCHAR2(20 BYTE), 
	"BTACCOUNTNUM" VARCHAR2(30 BYTE), 
	"TOTALMONEY" NUMBER, 
	"ORDERNUMBER" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index BANKTRANSFER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."BANKTRANSFER_PK" ON "SCOTT"."BANKTRANSFER" ("BTID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table BANKTRANSFER
--------------------------------------------------------

  ALTER TABLE "SCOTT"."BANKTRANSFER" ADD CONSTRAINT "BANKTRANSFER_PK" PRIMARY KEY ("BTID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SCOTT"."BANKTRANSFER" MODIFY ("BTID" NOT NULL ENABLE);
