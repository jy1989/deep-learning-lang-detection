CREATE USER read_20140401
 IDENTIFIED by 123
 DEFAULT TABLESPACE USERS
 TEMPORARY TABLESPACE TEMP
 PROFILE DEFAULT
 ACCOUNT UNLOCK;
 -- 1 Role for MULTUM_20120131
 GRANT CONNECT TO read_20140401;
 ALTER USER read_20140401 DEFAULT ROLE ALL;
 -- 5 System Privileges for MULTUM_20120131
 GRANT CREATE PROCEDURE TO read_20140401;
 GRANT CREATE SEQUENCE TO read_20140401;
 GRANT CREATE ANY INDEX TO read_20140401;
 GRANT CREATE DATABASE LINK TO read_20140401;
 GRANT CREATE TABLE TO read_20140401;
 -- 1 Tablespace Quotas for MULTUM_20120131
 ALTER USER read_20140401 QUOTA UNLIMITED ON USERS;
 
 -- 6 Dev Privileges for MULTUM_20120131
 GRANT SELECT, INSERT, UPDATE, DELETE ON DEV.CONCEPT TO read_20140401;            
 GRANT SELECT, INSERT, UPDATE, DELETE ON DEV.CONCEPT_RELATIONSHIP TO read_20140401;
 GRANT SELECT, INSERT, UPDATE, DELETE ON DEV.CONCEPT_ANCESTOR TO read_20140401;
 GRANT SELECT, INSERT, UPDATE, DELETE ON DEV.RELATIONSHIP TO read_20140401;
 GRANT SELECT, INSERT, UPDATE, DELETE ON DEV.SOURCE_TO_CONCEPT_MAP TO read_20140401;
 GRANT SELECT, INSERT, UPDATE, DELETE ON DEV.VOCABULARY TO read_20140401;
 GRANT SELECT ON DEV.SEQ_CONCEPT  TO read_20140401;

--DROP TABLE read_20140401.CONCEPT_STAGE;
CREATE TABLE read_20140401.CONCEPT_STAGE(
CONCEPT_ID      INTEGER     NULL,
CONCEPT_NAME        VARCHAR2(256)   NOT NULL,
VOCABULARY_ID INTEGER NOT NULL,
CONCEPT_LEVEL       NUMBER(3)   NULL,
CONCEPT_CODE        VARCHAR2(20)    NOT NULL,
CONCEPT_CLASS       VARCHAR2(60)    NULL);

--DROP TABLE read_20140401.CONCEPT_ANCESTOR_STAGE;
CREATE TABLE read_20140401.CONCEPT_ANCESTOR_STAGE(
CONCEPT_ANCESTOR_MAP_ID     INTEGER     NULL,
ANCESTOR_CONCEPT_ID     INTEGER     NOT NULL,
DESCENDANT_CONCEPT_ID       INTEGER     NOT NULL,
MAX_LEVELS_OF_SEPARATION    NUMBER(3)   NULL,
MIN_LEVELS_OF_SEPARATION    NUMBER(3)   NULL);

--DROP TABLE read_20140401.CONCEPT_RELATIONSHIP_STAGE;
CREATE TABLE read_20140401.CONCEPT_RELATIONSHIP_STAGE(
REL_ID     INTEGER     NULL,
CONCEPT_ID_1        INTEGER     NOT NULL,
CONCEPT_ID_2        INTEGER     NOT NULL,
RELATIONSHIP_ID     INTEGER NOT NULL);

--DROP TABLE read_20140401.CONCEPT_SYNONYM_STAGE;
CREATE TABLE read_20140401.CONCEPT_SYNONYM_STAGE(
CONCEPT_SYNONYM_ID  INTEGER     NULL,
CONCEPT_ID      INTEGER     NOT NULL,
CONCEPT_SYNONYM_NAME    VARCHAR2(1000)  NOT NULL);

--DROP TABLE read_20140401.RELATIONSHIP_TYPE_STAGE;
CREATE TABLE read_20140401.RELATIONSHIP_TYPE_STAGE(
RELATIONSHIP_ID       INTEGER NOT NULL,
RELATIONSHIP_DESCRIPTION    VARCHAR2(256)   NULL);

--DROP TABLE read_20140401.SOURCE_TO_CONCEPT_MAP_STAGE;
CREATE TABLE read_20140401.SOURCE_TO_CONCEPT_MAP_STAGE(
SOURCE_TO_CONCEPT_MAP_ID    NUMBER(9)   NULL,
SOURCE_CODE         VARCHAR2(20)    NOT NULL,
SOURCE_CODE_DESCRIPTION     VARCHAR2(256)   NULL,
MAPPING_TYPE            VARCHAR2(20)    NOT NULL,
TARGET_CONCEPT_ID       INTEGER    NOT NULL,
TARGET_VOCABULARY_ID      INTEGER NOT NULL,
SOURCE_VOCABULARY_ID      INTEGER NOT NULL,
 PRIMARY_MAP              CHAR(1 BYTE));

--DROP TABLE read_20140401.VOCABULARY_REF_STAGE;
CREATE TABLE read_20140401.VOCABULARY_REF_STAGE(
VOCABULARY_NAME     VARCHAR2(256)   NOT NULL,
VOCABULARY_CODE     VARCHAR2(3) NOT NULL);

CREATE TABLE read_20140401.CONCEPT_TREE_STAGE
(
  CONCEPT_ANCESTOR_MAP_ID   INTEGER,
  ANCESTOR_CONCEPT_ID       INTEGER             NOT NULL,
  DESCENDANT_CONCEPT_ID     INTEGER             NOT NULL,
  MAX_LEVELS_OF_SEPARATION  NUMBER(3),
  MIN_LEVELS_OF_SEPARATION  NUMBER(3)
)
;


CREATE INDEX read_20140401.XAC ON read_20140401.CONCEPT_TREE_STAGE
(DESCENDANT_CONCEPT_ID, ANCESTOR_CONCEPT_ID)
;


CREATE INDEX read_20140401.XF_CONCEPT_STAGE_ID ON read_20140401.CONCEPT_STAGE (
        CONCEPT_ID                       ASC);

CREATE INDEX read_20140401.XF_CONCEPT_STAGE_CODE2 ON read_20140401.CONCEPT_STAGE (
        VOCABULARY_ID          ASC,
        CONCEPT_CODE                     ASC);

CREATE INDEX read_20140401.XF_CONCEPT_STAGE_CODE ON read_20140401.CONCEPT_STAGE (
        VOCABULARY_ID          ASC,
        CONCEPT_LEVEL                    ASC,
        CONCEPT_CODE                     ASC);

CREATE INDEX read_20140401.XF_CR_STAGE_IDS ON read_20140401.CONCEPT_RELATIONSHIP_STAGE (
        CONCEPT_ID_1                     ASC,
        CONCEPT_ID_2                     ASC);

CREATE INDEX read_20140401.XF_CR_STAGE_ID ON read_20140401.CONCEPT_RELATIONSHIP_STAGE (
        RELATIONSHIP_ID                  ASC);

CREATE INDEX read_20140401.xrel_STAGE_3cd ON read_20140401.CONCEPT_RELATIONSHIP_STAGE (
        CONCEPT_ID_1, RELATIONSHIP_ID,  CONCEPT_ID_2);

CREATE INDEX read_20140401.xrel_STAGE_2cd ON read_20140401.CONCEPT_RELATIONSHIP_STAGE (
        CONCEPT_ID_2, CONCEPT_ID_1);

CREATE INDEX read_20140401.xmap_STAGE_4cd ON read_20140401.SOURCE_TO_CONCEPT_MAP_STAGE (
    SOURCE_CODE 
   ,SOURCE_VOCABULARY_ID 
   ,MAPPING_TYPE           
   ,TARGET_VOCABULARY_ID);

CREATE INDEX read_20140401.XAN_2CD_ ON read_20140401.CONCEPT_ANCESTOR_STAGE
(ANCESTOR_CONCEPT_ID, DESCENDANT_CONCEPT_ID);   

---------------------
-- drop table read_20140401.rcsctmap_uk;
CREATE  table read_20140401.rcsctmap_uk
-- input definition acording to RctSctMap_uk_documentation_20140401000001.pdf, page 7
(
  MapId  varchar(38), -- Unique Identifier 
  ReadCode  varchar(5), -- Read Code 
  TermCode  varchar(2), -- Term Code or Term Id 
  ConceptId  varchar(18), -- SNOMED ConceptID 
  EffectiveDate  date, -- YYYYMMDD e.g. 20061218 
  MapStatus  varchar(1) -- 0 = Inactive 1 = Active. 
);

-- drop table read_20140401.rcsctmap2_uk;
CREATE  table read_20140401.rcsctmap2_uk
-- input definition acording to RctSctMap_uk_documentation_20140401000001.pdf, page 7
(
  MapId varchar(38), -- Unique Identifier 
  ReadCode varchar(5), -- Read Code 
  TermCode varchar(2), -- Term Code or Term Id 
  ConceptId varchar(18), -- SNOMED ConceptID 
  DescriptionId varchar(18), -- SNOMED DescriptionID 
  IS_ASSURED varchar(1), -- 0 = Not assured, 1 = Assured 
  EffectiveDate date, -- YYYYMMDD e.g. 20061218 
  MapStatus varchar(1) -- 0 = Inactive 1 = Active. 
);

drop table read_20140401.keyv2;
create table read_20140401.keyv2
-- all Read V2 codes with description
(
  termclass varchar(10),
  classnumber varchar(2),
  description_short varchar(30),
  description varchar(60),
  description_long varchar(200),
  termcode varchar(2),
  lang varchar(2),
  readcode varchar(5),
  digit varchar(1)
);
  

/* End 