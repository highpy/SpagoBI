ALTER TABLE SBI_META_MODELS ADD CATEGORY_ID INTEGER NULL;

CREATE TABLE  SBI_EXT_ROLES_CATEGORY (
  EXT_ROLE_ID INTEGER NOT NULL,
  CATEGORY_ID INTEGER NOT NULL,
  PRIMARY KEY (EXT_ROLE_ID,CATEGORY_ID),
  KEY FK_SB_EXT_ROLES_META_MODEL_CATEGORY_2 (CATEGORY_ID),
  CONSTRAINT FK_SB_EXT_ROLES_META_MODEL_CATEGORY_1 FOREIGN KEY (EXT_ROLE_ID) REFERENCES SBI_EXT_ROLES (EXT_ROLE_ID),
  CONSTRAINT FK_SB_EXT_ROLES_META_MODEL_CATEGORY_2 FOREIGN KEY (CATEGORY_ID) REFERENCES SBI_DOMAINS (VALUE_ID)
) ;

ALTER TABLE SBI_DATA_SET_HISTORY ADD COLUMN IS_PERSISTED SMALLINT DEFAULT 0;
ALTER TABLE SBI_DATA_SET_HISTORY ADD COLUMN DATA_SOURCE_PERSIST_ID INTEGER NULL;
ALTER TABLE SBI_DATA_SET_HISTORY ADD COLUMN IS_FLAT_DATASET SMALLINT DEFAULT 0;
ALTER TABLE SBI_DATA_SET_HISTORY ADD COLUMN FLAT_TABLE_NAME VARCHAR2(50) NULL;
ALTER TABLE SBI_DATA_SET_HISTORY ADD COLUMN DATA_SOURCE_FLAT_ID INTEGER NULL;

ALTER TABLE SBI_DATA_SET_HISTORY ADD CONSTRAINT FK_SBI_DATA_SET_DS3 FOREIGN KEY ( DATA_SOURCE_PERSIST_ID ) REFERENCES SBI_DATA_SOURCE( DS_ID ) ON DELETE CASCADE;
ALTER TABLE SBI_DATA_SET_HISTORY ADD CONSTRAINT FK_SBI_DATA_SET_DS4 FOREIGN KEY ( DATA_SOURCE_FLAT_ID ) REFERENCES SBI_DATA_SOURCE( DS_ID ) ON DELETE CASCADE;

CREATE TABLE SBI_DATA_SET_TEMP (
	   DS_ID 		   		  INTEGER NOT NULL ,
	   VERSION_NUM	   		  INTEGER NOT NULL,
	   ACTIVE		   		  SMALLINT NOT NULL,
	   DESCR 		   		  VARCHAR2(160), 
	   LABEL	 	   		  VARCHAR2(50) NOT NULL,
	   NAME	   	   			  VARCHAR2(50) NOT NULL,   	   
	   OBJECT_TYPE   		  VARCHAR2(50),
	   DS_METADATA    		  CLOB,
	   PARAMS         		  VARCHAR2(4000),
	   CATEGORY_ID    		  INTEGER,
	   TRANSFORMER_ID 		  INTEGER,
       PIVOT_COLUMN   		  VARCHAR2(50),
	   PIVOT_ROW      		  VARCHAR2(50),
	   PIVOT_VALUE   		  VARCHAR2(50),
	   NUM_ROWS	   		 	  SMALLINT DEFAULT 0,	
	   IS_PERSISTED  		  SMALLINT DEFAULT 0,
	   DATA_SOURCE_PERSIST_ID INTEGER NULL,
	   IS_FLAT_DATASET 		  SMALLINT DEFAULT 0,
	   FLAT_TABLE_NAME 		  VARCHAR2(50) NULL,
	   DATA_SOURCE_FLAT_ID 	  INTEGER NULL,	   
	   CONFIGURATION          CLOB NULL,    	   	   
	   USER_IN                VARCHAR2(100) NOT NULL,
	   USER_UP                VARCHAR2(100),
	   USER_DE                VARCHAR2(100),
	   TIME_IN                TIMESTAMP NOT NULL,
	   TIME_UP                TIMESTAMP NULL,
	   TIME_DE                TIMESTAMP NULL,
	   SBI_VERSION_IN         VARCHAR2(10),
	   SBI_VERSION_UP         VARCHAR2(10),
	   SBI_VERSION_DE         VARCHAR2(10),
	   META_VERSION           VARCHAR2(100),
	   ORGANIZATION           VARCHAR2(20), 
     CONSTRAINT XAK2SBI_DATA_SET UNIQUE (LABEL,VERSION_NUM, ORGANIZATION),
     PRIMARY KEY (DS_ID, VERSION_NUM)
) ;

INSERT INTO SBI_DATA_SET_TEMP 
(DS_ID, VERSION_NUM, ACTIVE,  LABEL, DESCR, NAME, OBJECT_TYPE, DS_METADATA, PARAMS, CATEGORY_ID, TRANSFORMER_ID, PIVOT_COLUMN, PIVOT_ROW, PIVOT_VALUE, NUM_ROWS, IS_PERSISTED, 
DATA_SOURCE_PERSIST_ID, IS_FLAT_DATASET, FLAT_TABLE_NAME, DATA_SOURCE_FLAT_ID, USER_IN, USER_UP, USER_DE, TIME_IN, TIME_UP, TIME_DE, SBI_VERSION_IN, SBI_VERSION_UP, SBI_VERSION_DE,
META_VERSION, ORGANIZATION, CONFIGURATION)  
SELECT DS.DS_ID, ds_h.VERSION_NUM, ds_h.ACTIVE, ds.LABEL, ds.DESCR, ds.name,
ds_h.OBJECT_TYPE, ds_h.DS_METADATA,
ds_h.PARAMS, ds_h.CATEGORY_ID, ds_h.TRANSFORMER_ID, ds_h.PIVOT_COLUMN, ds_h.PIVOT_ROW,
ds_h.PIVOT_VALUE, ds_h.NUM_ROWS,
ds_h.IS_PERSISTED, ds_h.DATA_SOURCE_PERSIST_ID, ds_h.IS_FLAT_DATASET, ds_h.FLAT_TABLE_NAME, ds_h.DATA_SOURCE_FLAT_ID,
ds_h.USER_IN, 
null as USER_UP,null as USER_DE, ds_h.TIME_IN, null as TIME_UP, null as TIME_DE,
ds_h.SBI_VERSION_IN, null as SBI_VERSION_UP,  null as SBI_VERSION_DE, ds_h.META_VERSION,
ds_h.ORGANIZATION,
CASE WHEN ds_h.OBJECT_TYPE = 'SbiQueryDataSet' THEN 
TO_CLOB('{"Query":"' || REPLACE(ds_h.QUERY,'"','\\"') || '","queryScript":"' || REPLACE(NVL(DS_H.QUERY_SCRIPT,''),'"','\\"' || '","queryScriptLanguage":"' || REPLACE(NVL(QUERY_SCRIPT_LANGUAGE,''),'"','\\"') || '","dataSource":"' || NVL((SELECT LABEL FROM SBI_DATA_SOURCE WHERE DS_ID = DATA_SOURCE_ID),'') || '"}' )
WHEN ds_h.OBJECT_TYPE = 'SbiFileDataSet' THEN 
TO_CLOB('{"fileName":"' || NVL(DS_H.FILE_NAME,'') || '"}')
WHEN ds_h.OBJECT_TYPE = 'SbiFileDataSet' THEN 
TO_CLOB('{"SbiJClassDataSet":"' || NVL(DS_H.JCLASS_NAME,'') || '"}')
WHEN ds_h.OBJECT_TYPE = 'SbiFileDataSet' THEN 
TO_CLOB('{"wsAddress":"' || NVL(DS_H.ADRESS,'') || '","wsOperation":"' || NVL(DS_H.OPERATION,'') || '"}')
WHEN ds_h.OBJECT_TYPE = 'SbiScriptDataSet' THEN 
TO_CLOB('{"Script":"' || REPLACE(NVL(DS_H.SCRIPT,''),'"','\\"') || '","scriptLanguage":"' || NVL(DS_H.LANGUAGE_SCRIPT,'') || '"}')
WHEN ds_h.OBJECT_TYPE = 'SbiCustomDataSet' THEN 
TO_CLOB('{"customData":"' || REPLACE(NVL(DS_H.CUSTOM_DATA,'"{}"'),'"','\\"') || '","jClassName":"' || NVL(DS_H.JCLASS_NAME,'') || '"}')
WHEN ds_h.OBJECT_TYPE = 'SbiQbeDataSet' THEN 
TO_CLOB('{"qbeDatamarts":"' || NVL(DS_H.DATAMARTS,'') || '","qbeDataSource":"' || NVL((SELECT LABEL FROM SBI_DATA_SOURCE WHERE DS_ID = DATA_SOURCE_ID),'') || '","qbeJSONQuery":"' || REPLACE()NVL(DS_H.JSON_QUERY,''),'"','\\"') || '"}')
end AS CONFIGURATION
FROM SBI_DATA_SET DS INNER JOIN SBI_DATA_SET_HISTORY DS_H ON (DS.DS_ID = DS_H.DS_ID)
order by ds_id, version_num ;

commit;
--DROP OLDER FK TO SBI_DATA_SET
--ALTER TABLE SBI_LOV DROP CONSTRAINT SBI_LOV_2;
--ALTER TABLE SBI_OBJECTS DROP CONSTRAINT SBI_OBJECTS_7;
--ALTER TABLE SBI_KPI DROP CONSTRAINT SBI_KPI_1;

-- to do at the end, when all it's ended correctly!
--DROP TABLE SBI_DATA_SET_HISTORY CASCADE CONSTRAINTS;
--DROP TABLE SBI_DATA_SET CASCADE CONSTRAINTS;    
-- to do only after drop stmt
--ALTER TABLE SBI_DATA_SET ADD CONSTRAINT FK_SBI_DATA_SET_T  FOREIGN KEY ( TRANSFORMER_ID ) REFERENCES SBI_DOMAINS ( VALUE_ID ) ON DELETE CASCADE;
--ALTER TABLE SBI_DATA_SET ADD CONSTRAINT FK_SBI_DATA_SET_CAT  FOREIGN KEY (CATEGORY_ID) REFERENCES SBI_DOMAINS (VALUE_ID) ON DELETE CASCADE ON UPDATE RESTRICT;
--ALTER TABLE SBI_DATA_SET ADD CONSTRAINT FK_SBI_DATA_SET_DS3 FOREIGN KEY ( DATA_SOURCE_PERSIST_ID ) REFERENCES SBI_DATA_SOURCE( DS_ID ) ON DELETE CASCADE;
--ALTER TABLE SBI_DATA_SET ADD CONSTRAINT FK_SBI_DATA_SET_DS4 FOREIGN KEY ( DATA_SOURCE_FLAT_ID ) REFERENCES SBI_DATA_SOURCE( DS_ID ) ON DELETE CASCADE;

ALTER TABLE SBI_DATA_SET RENAME TO SBI_DATA_SET_OLD;
ALTER TABLE SBI_DATA_SET_HISTORY TO SBI_DATA_SET_HISTORY_OLD;
ALTER TABLE SBI_DATA_SET_TEMP TO SBI_DATA_SET;


UPDATE SBI_ENGINES SET USE_DATASET = 1 WHERE DRIVER_NM = 'it.eng.spagobi.engines.drivers.worksheet.WorksheetDriver';
COMMIT;