alter table SBI_AUDIT  ADD CONSTRAINT FK_SBI_AUDIT_1 foreign key (ENGINE_REF) references SBI_ENGINES (ENGINE_ID) ON DELETE SET NULL;\p\g
alter table SBI_AUDIT  ADD CONSTRAINT FK_SBI_AUDIT_2 foreign key (DOC_REF) references SBI_OBJECTS (BIOBJ_ID) ON DELETE SET NULL;\p\g
alter table SBI_AUDIT  ADD CONSTRAINT FK_SBI_AUDIT_3 foreign key (SUBOBJ_REF) references SBI_SUBOBJECTS (SUBOBJ_ID) ON DELETE SET NULL;\p\g
alter table SBI_CHECKS  ADD CONSTRAINT FK_SBI_CHECKS_1 foreign key (VALUE_TYPE_ID) references SBI_DOMAINS (VALUE_ID);\p\g
alter table SBI_DATA_SOURCE ADD CONSTRAINT FK_SBI_DATA_SOURCE_1 foreign key (DIALECT_ID) references SBI_DOMAINS (VALUE_ID);\p\g
alter table SBI_DIST_LIST_OBJECTS  ADD CONSTRAINT FK_SBI_DIST_LIST_OBJECTS_1 foreign key (DL_ID) references SBI_DIST_LIST (DL_ID) ON DELETE CASCADE;\p\g
alter table SBI_DIST_LIST_OBJECTS ADD CONSTRAINT FK_SBI_DIST_LIST_OBJECTS_2 foreign key (DOC_ID) references SBI_OBJECTS (BIOBJ_ID) ON DELETE CASCADE;\p\g
alter table SBI_DIST_LIST_USER ADD CONSTRAINT FK_SBI_DIST_LIST_USER_1 foreign key (LIST_ID) references SBI_DIST_LIST (DL_ID) ON DELETE CASCADE;\p\g
alter table SBI_DOMAINS ADD CONSTRAINT FK_SBI_DOMAINS_1 foreign key (PARENT_ID) references SBI_DOMAINS (VALUE_ID);\p\g
alter table SBI_DOSSIER_BIN_TEMP ADD CONSTRAINT FK_SBI_DOSSIER_BIN_TEMP_1 foreign key (PART_ID) references SBI_DOSSIER_TEMP (PART_ID) ON DELETE CASCADE;\p\g
alter table SBI_DOSSIER_PRES ADD CONSTRAINT FK_SBI_DOSSIER_PRES_1 foreign key (BIN_ID) references SBI_BINARY_CONTENTS (BIN_ID);\p\g
alter table SBI_DOSSIER_PRES ADD CONSTRAINT FK_SBI_DOSSIER_PRES_2 foreign key (BIOBJ_ID) references SBI_OBJECTS (BIOBJ_ID);\p\g
alter table SBI_DOSSIER_TEMP ADD CONSTRAINT FK_SBI_DOSSIER_TEMP_1 foreign key (BIOBJ_ID) references SBI_OBJECTS (BIOBJ_ID);\p\g
alter table SBI_ENGINES ADD CONSTRAINT FK_SBI_ENGINES_1 foreign key (DEFAULT_DS_ID) references SBI_DATA_SOURCE (DS_ID);\p\g
alter table SBI_ENGINES ADD CONSTRAINT FK_SBI_ENGINES_2 foreign key (BIOBJ_TYPE) references SBI_DOMAINS (VALUE_ID);\p\g
alter table SBI_ENGINES ADD CONSTRAINT FK_SBI_ENGINES_3 foreign key (ENGINE_TYPE) references SBI_DOMAINS (VALUE_ID);\p\g
alter table SBI_EVENTS_ROLES ADD CONSTRAINT FK_SBI_EVENTS_ROLES_1 foreign key (EVENT_ID) references SBI_EVENTS_LOG (ID);\p\g
alter table SBI_EVENTS_ROLES ADD CONSTRAINT FK_SBI_EVENTS_ROLES_2 foreign key (ROLE_ID) references SBI_EXT_ROLES (EXT_ROLE_ID);\p\g
alter table SBI_EXT_ROLES ADD CONSTRAINT FK_SBI_EXT_ROLES_1 foreign key (ROLE_TYPE_ID) references SBI_DOMAINS (VALUE_ID);\p\g
alter table SBI_FUNCTIONS ADD CONSTRAINT FK_SBI_FUNCTIONS_1 foreign key (FUNCT_TYPE_ID) references SBI_DOMAINS (VALUE_ID);\p\g
alter table SBI_FUNCTIONS ADD CONSTRAINT FK_SBI_FUNCTIONS_2 foreign key (PARENT_FUNCT_ID) references SBI_FUNCTIONS (FUNCT_ID);\p\g
alter table SBI_FUNC_ROLE ADD CONSTRAINT FK_SBI_FUNC_ROLE_1 foreign key (STATE_ID) references SBI_DOMAINS (VALUE_ID);\p\g
alter table SBI_FUNC_ROLE ADD CONSTRAINT FK_SBI_FUNC_ROLE_2 foreign key (ROLE_ID) references SBI_EXT_ROLES (EXT_ROLE_ID);\p\g
alter table SBI_FUNC_ROLE ADD CONSTRAINT FK_SBI_FUNC_ROLE_3 foreign key (FUNCT_ID) references SBI_FUNCTIONS (FUNCT_ID);\p\g
alter table SBI_GEO_MAPS ADD CONSTRAINT FK_SBI_GEO_MAPS_1 foreign key (BIN_ID) references SBI_BINARY_CONTENTS(BIN_ID);\p\g
alter table SBI_GEO_MAP_FEATURES ADD CONSTRAINT FK_SBI_GEO_MAP_FEATURES_1 foreign key (FEATURE_ID) references SBI_GEO_FEATURES (FEATURE_ID);\p\g
alter table SBI_GEO_MAP_FEATURES ADD CONSTRAINT FK_SBI_GEO_MAP_FEATURES_2 foreign key (MAP_ID) references SBI_GEO_MAPS (MAP_ID);\p\g
alter table SBI_MENU_ROLE ADD CONSTRAINT FK_SBI_MENU_ROLE_1 foreign key (EXT_ROLE_ID) references SBI_EXT_ROLES (EXT_ROLE_ID) ON DELETE CASCADE;\p\g
alter table SBI_MENU_ROLE ADD CONSTRAINT FK_SBI_MENU_ROLE_2 foreign key (MENU_ID) references SBI_MENU (MENU_ID) ON DELETE CASCADE;\p\g
alter table SBI_OBJECTS ADD CONSTRAINT FK_SBI_OBJECTS_1 foreign key (DATA_SOURCE_ID) references SBI_DATA_SOURCE (DS_ID);\p\g
alter table SBI_OBJECTS ADD CONSTRAINT FK_SBI_OBJECTS_2 foreign key (STATE_CONS_ID) references SBI_DOMAINS (VALUE_ID);\p\g
alter table SBI_OBJECTS ADD CONSTRAINT FK_SBI_OBJECTS_3 foreign key (STATE_ID) references SBI_DOMAINS (VALUE_ID);\p\g
alter table SBI_OBJECTS ADD CONSTRAINT FK_SBI_OBJECTS_4 foreign key (BIOBJ_TYPE_ID) references SBI_DOMAINS (VALUE_ID);\p\g
alter table SBI_OBJECTS ADD CONSTRAINT FK_SBI_OBJECTS_5 foreign key (EXEC_MODE_ID) references SBI_DOMAINS (VALUE_ID);\p\g
alter table SBI_OBJECTS ADD CONSTRAINT FK_SBI_OBJECTS_6 foreign key (ENGINE_ID) references SBI_ENGINES (ENGINE_ID);\p\g
alter table SBI_OBJECTS_RATING ADD CONSTRAINT FK_SBI_OBJECTS_RATING_1 foreign key (OBJ_ID) references SBI_OBJECTS (BIOBJ_ID) ON DELETE CASCADE ON UPDATE CASCADE;\p\g
alter table SBI_OBJECT_NOTES ADD CONSTRAINT FK_SBI_OBJECT_NOTES_1 foreign key (BIN_ID) references SBI_BINARY_CONTENTS (BIN_ID);\p\g
alter table SBI_OBJECT_NOTES ADD CONSTRAINT FK_SBI_OBJECT_NOTES_2 foreign key (BIOBJ_ID) references SBI_OBJECTS (BIOBJ_ID);\p\g
alter table SBI_OBJECT_TEMPLATES ADD CONSTRAINT FK_SBI_OBJECT_TEMPLATES_1 foreign key (BIN_ID) references SBI_BINARY_CONTENTS (BIN_ID);\p\g
alter table SBI_OBJECT_TEMPLATES ADD CONSTRAINT FK_SBI_OBJECT_TEMPLATES_2 foreign key (BIOBJ_ID) references SBI_OBJECTS (BIOBJ_ID);\p\g
alter table SBI_OBJ_PAR ADD CONSTRAINT FK_SBI_OBJ_PAR_1 foreign key (BIOBJ_ID) references SBI_OBJECTS (BIOBJ_ID);\p\g
alter table SBI_OBJ_PAR ADD CONSTRAINT FK_SBI_OBJ_PAR_2 foreign key (PAR_ID) references SBI_PARAMETERS (PAR_ID);\p\g
alter table SBI_OBJ_FUNC ADD CONSTRAINT FK_SBI_OBJ_FUNC_1 foreign key (FUNCT_ID) references SBI_FUNCTIONS (FUNCT_ID);\p\g
alter table SBI_OBJ_FUNC ADD CONSTRAINT FK_SBI_OBJ_FUNC_2 foreign key (BIOBJ_ID) references SBI_OBJECTS (BIOBJ_ID);\p\g
alter table SBI_OBJ_PARUSE ADD CONSTRAINT FK_SBI_OBJ_PARUSE_1 foreign key (OBJ_PAR_ID) references SBI_OBJ_PAR (OBJ_PAR_ID);\p\g
alter table SBI_OBJ_PARUSE ADD CONSTRAINT FK_SBI_OBJ_PARUSE_2 foreign key (OBJ_PAR_FATHER_ID) references SBI_OBJ_PAR (OBJ_PAR_ID);\p\g
alter table SBI_OBJ_PARUSE ADD CONSTRAINT FK_SBI_OBJ_PARUSE_3 foreign key (USE_ID) references SBI_PARUSE (USE_ID);\p\g
alter table SBI_OBJ_STATE ADD CONSTRAINT FK_SBI_OBJ_STATE_1 foreign key (STATE_ID) references SBI_DOMAINS (VALUE_ID);\p\g
alter table SBI_OBJ_STATE ADD CONSTRAINT FK_SBI_OBJ_STATE_2 foreign key (BIOBJ_ID) references SBI_OBJECTS (BIOBJ_ID);\p\g
alter table SBI_PARAMETERS ADD CONSTRAINT FK_SBI_PARAMETERS_1 foreign key (PAR_TYPE_ID) references SBI_DOMAINS (VALUE_ID);\p\g
alter table SBI_PARUSE  ADD CONSTRAINT FK_SBI_PARUSE_1 foreign key (LOV_ID) references SBI_LOV (LOV_ID);\p\g
alter table SBI_PARUSE  ADD CONSTRAINT FK_SBI_PARUSE_2 foreign key (PAR_ID) references SBI_PARAMETERS (PAR_ID);\p\g
alter table SBI_PARUSE_CK ADD CONSTRAINT FK_SBI_PARUSE_CK_1 foreign key (CHECK_ID) references SBI_CHECKS (CHECK_ID);\p\g
alter table SBI_PARUSE_CK ADD CONSTRAINT FK_SBI_PARUSE_CK_2 foreign key (USE_ID) references SBI_PARUSE (USE_ID);\p\g
alter table SBI_PARUSE_DET  ADD CONSTRAINT FK_SBI_PARUSE_DET_1 foreign key (EXT_ROLE_ID) references SBI_EXT_ROLES (EXT_ROLE_ID);\p\g
alter table SBI_PARUSE_DET  ADD CONSTRAINT FK_SBI_PARUSE_DET_2 foreign key (USE_ID) references SBI_PARUSE (USE_ID);\p\g
alter table SBI_REMEMBER_ME ADD CONSTRAINT FK_SBI_REMEMBER_ME_1 foreign key (BIOBJ_ID) references SBI_OBJECTS (BIOBJ_ID) ON DELETE CASCADE;\p\g
alter table SBI_REMEMBER_ME ADD CONSTRAINT FK_SBI_REMEMBER_ME_2 foreign key (SUBOBJ_ID) references SBI_SUBOBJECTS (SUBOBJ_ID) ON DELETE CASCADE;\p\g
alter table SBI_ROLE_TYPE_USER_FUNC ADD CONSTRAINT FK_SBI_ROLE_TYPE_USER_FUNC_1 foreign key (ROLE_TYPE_ID) references SBI_DOMAINS (VALUE_ID);\p\g
alter table SBI_ROLE_TYPE_USER_FUNC ADD CONSTRAINT FK_SBI_ROLE_TYPE_USER_FUNC_2 foreign key (USER_FUNCT_ID) references SBI_USER_FUNC (USER_FUNCT_ID);\p\g
alter table SBI_SNAPSHOTS ADD CONSTRAINT FK_SBI_SNAPSHOTS_1 foreign key (BIN_ID) references SBI_BINARY_CONTENTS (BIN_ID);\p\g
alter table SBI_SNAPSHOTS ADD CONSTRAINT FK_SBI_SNAPSHOTS_2 foreign key (BIOBJ_ID) references SBI_OBJECTS (BIOBJ_ID);\p\g
alter table SBI_SUBOBJECTS ADD CONSTRAINT FK_SBI_SUBOBJECTS_1 foreign key (BIN_ID) references SBI_BINARY_CONTENTS (BIN_ID);\p\g
alter table SBI_SUBOBJECTS ADD CONSTRAINT FK_SBI_SUBOBJECTS_2 foreign key (BIOBJ_ID) references SBI_OBJECTS (BIOBJ_ID);\p\g
alter table SBI_SUBREPORTS ADD CONSTRAINT FK_SBI_SUBREPORTS_1 foreign key (MASTER_RPT_ID) references SBI_OBJECTS (BIOBJ_ID);\p\g
alter table SBI_SUBREPORTS ADD CONSTRAINT FK_SBI_SUBREPORTS_2 foreign key (SUB_RPT_ID) references SBI_OBJECTS (BIOBJ_ID);\p\g
alter table SBI_VIEWPOINTS ADD CONSTRAINT FK_SBI_VIEWPOINTS_1 foreign key (BIOBJ_ID) references SBI_OBJECTS (BIOBJ_ID);\p\g
alter table SBI_KPI_ROLE ADD CONSTRAINT FK_SBI_KPI_ROLE_1 foreign key (KPI_ID) references SBI_KPI (KPI_ID);\p\g
alter table SBI_KPI_ROLE ADD CONSTRAINT FK_SBI_KPI_ROLE_2 foreign key (EXT_ROLE_ID) references SBI_EXT_ROLES (EXT_ROLE_ID);\p\g
alter table SBI_KPI ADD CONSTRAINT FK_SBI_KPI_1 foreign key (id_measure_unit) references SBI_MEASURE_UNIT (id_measure_unit);\p\g
alter table SBI_KPI ADD CONSTRAINT FK_SBI_KPI_2 foreign key (id_kpi_parent) references SBI_KPI (KPI_ID);\p\g
alter table SBI_KPI ADD CONSTRAINT FK_SBI_KPI_3 foreign key (DS_ID) references SBI_DATA_SET (DS_ID);\p\g
alter table SBI_KPI_DOCUMENTS ADD CONSTRAINT FK_SBI_KPI_DOC_1 foreign key (BIOBJ_ID) references SBI_OBJECTS (BIOBJ_ID) ;\p\g
alter table SBI_KPI_DOCUMENTS ADD CONSTRAINT FK_SBI_KPI_DOC_2 foreign key (KPI_ID) references SBI_KPI (KPI_ID);\p\g
alter table SBI_MEASURE_UNIT ADD CONSTRAINT FK_SBI_MEASURE_UNIT_1 foreign key (SCALE_TYPE_ID) references SBI_DOMAINS (VALUE_ID);\p\g
alter table SBI_THRESHOLD ADD CONSTRAINT FK_SBI_THRESHOLD_1 foreign key (THRESHOLD_TYPE_ID) references SBI_DOMAINS (VALUE_ID);\p\g
alter table SBI_THRESHOLD_VALUE ADD CONSTRAINT FK_SBI_THRESHOLD_VALUE_1 foreign key (SEVERITY_ID) references SBI_DOMAINS (VALUE_ID);\p\g
alter table SBI_THRESHOLD_VALUE ADD CONSTRAINT FK_SBI_THRESHOLD_VALUE_2 foreign key (THRESHOLD_ID) references SBI_THRESHOLD (THRESHOLD_ID) ON DELETE CASCADE;\p\g
alter table SBI_KPI_MODEL ADD CONSTRAINT FK_SBI_KPI_MODEL_1 foreign key (KPI_PARENT_MODEL_ID) references SBI_KPI_MODEL (KPI_MODEL_ID);\p\g
alter table SBI_KPI_MODEL ADD CONSTRAINT FK_SBI_KPI_MODEL_2 foreign key (KPI_MODEL_TYPE_ID) references SBI_DOMAINS (VALUE_ID);\p\g
alter table SBI_KPI_MODEL ADD CONSTRAINT FK_SBI_KPI_MODEL_3 foreign key (KPI_ID) references SBI_KPI (KPI_ID);\p\g
alter table SBI_KPI_MODEL_ATTR ADD CONSTRAINT FK_SBI_KPI_MODEL_ATTR_1 foreign key (KPI_MODEL_ATTR_TYPE_ID) references SBI_DOMAINS (VALUE_ID);\p\g
alter table SBI_KPI_MODEL_ATTR_VAL ADD CONSTRAINT FK_SBI_KPI_MODEL_ATTR_VAL_1 foreign key (KPI_MODEL_ATTR_ID) references SBI_KPI_MODEL_ATTR (KPI_MODEL_ATTR_ID);\p\g
alter table SBI_KPI_MODEL_ATTR_VAL ADD CONSTRAINT FK_SBI_KPI_MODEL_ATTR_VAL_2 foreign key (KPI_MODEL_ID) references SBI_KPI_MODEL (KPI_MODEL_ID);\p\g
alter table SBI_KPI_INSTANCE ADD CONSTRAINT FK_SBI_KPI_INSTANCE_1 foreign key (KPI_ID) references SBI_KPI (KPI_ID);\p\g
alter table SBI_KPI_INSTANCE ADD CONSTRAINT FK_SBI_KPI_INSTANCE_2 foreign key (THRESHOLD_ID) references SBI_THRESHOLD (THRESHOLD_ID);\p\g
alter table SBI_KPI_INSTANCE ADD CONSTRAINT FK_SBI_KPI_INSTANCE_3 foreign key (id_measure_unit) references SBI_MEASURE_UNIT (id_measure_unit);\p\g
alter table SBI_KPI_INSTANCE ADD CONSTRAINT FK_SBI_KPI_INSTANCE_4 foreign key (CHART_TYPE_ID) references SBI_DOMAINS (VALUE_ID);\p\g
alter table SBI_KPI_INST_PERIOD ADD CONSTRAINT FK_SBI_KPI_INST_PERIOD_1 foreign key (PERIODICITY_ID) references SBI_KPI_PERIODICITY (ID_KPI_PERIODICITY)  ON DELETE RESTRICT ON UPDATE RESTRICT;\p\g
alter table SBI_KPI_INST_PERIOD ADD CONSTRAINT FK_SBI_KPI_INST_PERIOD_2 foreign key (KPI_INSTANCE_ID) references SBI_KPI_INSTANCE (ID_KPI_INSTANCE) ON DELETE RESTRICT ON UPDATE RESTRICT;\p\g
alter table SBI_KPI_INSTANCE_HISTORY ADD CONSTRAINT FK_SBI_KPI_INSTANCE_HISTORY_1 foreign key (id_kpi_instance) references SBI_KPI_INSTANCE (id_kpi_instance);\p\g
alter table SBI_KPI_INSTANCE_HISTORY ADD CONSTRAINT FK_SBI_KPI_INSTANCE_HISTORY_2 foreign key (THRESHOLD_ID) references SBI_THRESHOLD (THRESHOLD_ID);\p\g
alter table SBI_KPI_INSTANCE_HISTORY ADD CONSTRAINT FK_SBI_KPI_INSTANCE_HISTORY_3 foreign key (id_measure_unit) references SBI_MEASURE_UNIT (id_measure_unit);\p\g
alter table SBI_KPI_INSTANCE_HISTORY ADD CONSTRAINT FK_SBI_KPI_INSTANCE_HISTORY_4 foreign key (CHART_TYPE_ID) references SBI_DOMAINS (VALUE_ID);\p\g
alter table SBI_KPI_VALUE ADD CONSTRAINT FK_SBI_KPI_VALUE_1 foreign key (id_kpi_instance) references SBI_KPI_INSTANCE (id_kpi_instance);\p\g
alter table SBI_KPI_VALUE ADD CONSTRAINT FK_SBI_KPI_VALUE_2 foreign key (RESOURCE_ID) references SBI_RESOURCES (RESOURCE_ID);\p\g
alter table SBI_KPI_MODEL_INST ADD CONSTRAINT FK_SBI_KPI_MODEL_INST_1 foreign key (id_kpi_instance) references SBI_KPI_INSTANCE (id_kpi_instance);\p\g
alter table SBI_KPI_MODEL_INST ADD CONSTRAINT FK_SBI_KPI_MODEL_INST_2 foreign key (KPI_MODEL_INST_PARENT) references SBI_KPI_MODEL_INST (KPI_MODEL_INST);\p\g
alter table SBI_KPI_MODEL_INST ADD CONSTRAINT FK_SBI_KPI_MODEL_INST_3 foreign key (KPI_MODEL_ID) references SBI_KPI_MODEL (KPI_MODEL_ID);\p\g
alter table SBI_RESOURCES ADD CONSTRAINT FK_SBI_RESOURCES_1 foreign key (RESOURCE_TYPE_ID) references SBI_DOMAINS (VALUE_ID);\p\g
alter table SBI_ALARM ADD CONSTRAINT FK_SBI_ALARM_1 foreign key (id_kpi_instance) references SBI_KPI_INSTANCE (id_kpi_instance);\p\g
alter table SBI_ALARM ADD CONSTRAINT FK_SBI_ALARM_2 foreign key (MODALITY_ID) references SBI_DOMAINS (VALUE_ID);\p\g
alter table SBI_ALARM ADD CONSTRAINT FK_SBI_ALARM_3 foreign key (DOCUMENT_ID) references SBI_OBJECTS (BIOBJ_ID);\p\g
alter table SBI_ALARM ADD CONSTRAINT FK_SBI_ALARM_4 foreign key (id_threshold_value) references SBI_THRESHOLD_VALUE (id_threshold_value);\p\g
alter table SBI_ALARM_EVENT ADD CONSTRAINT FK_SBI_ALARM_EVENT_1 foreign key (ALARM_ID) references SBI_ALARM (ALARM_ID);\p\g
alter table SBI_ALARM_DISTRIBUTION ADD CONSTRAINT FK_SBI_ALARM_DISTRIBUTION_1 foreign key (ALARM_CONTACT_ID) references SBI_ALARM_CONTACT (ALARM_CONTACT_ID);\p\g
alter table SBI_ALARM_DISTRIBUTION ADD CONSTRAINT FK_SBI_ALARM_DISTRIBUTION_2 foreign key (ALARM_ID) references SBI_ALARM_EVENT (ALARM_EVENT_ID);\p\g

alter table SBI_KPI ADD CONSTRAINT FK_SBI_KPI_DOMAIN01 foreign key (KPI_TYPE) references SBI_DOMAINS (VALUE_ID);\p\g
alter table SBI_KPI ADD CONSTRAINT FK_SBI_KPI_DOMAIN02 foreign key (METRIC_SCALE_TYPE) references SBI_DOMAINS (VALUE_ID);\p\g
alter table SBI_KPI ADD CONSTRAINT FK_SBI_KPI_DOMAIN03 foreign key (MEASURE_TYPE) references SBI_DOMAINS (VALUE_ID);\p\g 

alter table SBI_EXPORTERS ADD CONSTRAINT FK_SBI_EXPORTERS2 foreign key (ENGINE_ID) references SBI_ENGINES (ENGINE_ID);\p\g
alter table SBI_EXPORTERS ADD CONSTRAINT FK_SBI_EXPORTERS3 foreign key (DOMAIN_ID) references SBI_DOMAINS (VALUE_ID);\p\g

ALTER TABLE SBI_OBJ_METADATA ADD CONSTRAINT FK_SBI_OBJ_METADATA_1 FOREIGN KEY ( DATA_TYPE_ID ) REFERENCES SBI_DOMAINS(VALUE_ID);\p\g
ALTER TABLE SBI_OBJ_METACONTENTS ADD CONSTRAINT FK_SBI_OBJ_METACONTENTS_1 FOREIGN KEY ( OBJMETA_ID ) REFERENCES SBI_OBJ_METADATA (  OBJ_META_ID );\p\g
ALTER TABLE SBI_OBJ_METACONTENTS ADD CONSTRAINT FK_SBI_OBJ_METACONTENTS_2 FOREIGN KEY ( BIOBJ_ID ) REFERENCES SBI_OBJECTS (  BIOBJ_ID );\p\g
ALTER TABLE SBI_OBJ_METACONTENTS ADD CONSTRAINT FK_SBI_OBJ_METACONTENTS_3 FOREIGN KEY ( SUBOBJ_ID ) REFERENCES SBI_SUBOBJECTS (  SUBOBJ_ID ) ;\p\g
ALTER TABLE SBI_OBJ_METACONTENTS ADD CONSTRAINT FK_SBI_OBJ_METACONTENTS_4 FOREIGN KEY ( BIN_ID ) REFERENCES SBI_BINARY_CONTENTS(BIN_ID);\p\g

ALTER TABLE SBI_CONFIG ADD CONSTRAINT FK_sbi_config_1 FOREIGN KEY ( VALUE_TYPE_ID ) REFERENCES SBI_DOMAINS ( VALUE_ID );\p\g
ALTER TABLE SBI_USER_ATTRIBUTES ADD CONSTRAINT FK_sbi_user_attribute_1 FOREIGN KEY (ID) REFERENCES SBI_USER (ID);\p\g
ALTER TABLE SBI_EXT_USER_ROLES ADD CONSTRAINT FK_sbi_ext_user_roles_1 FOREIGN KEY (ID) REFERENCES SBI_USER (ID);\p\g
ALTER TABLE SBI_USER_ATTRIBUTES ADD CONSTRAINT FK_sbi_user_attribute_2 FOREIGN KEY (ATTRIBUTE_ID) REFERENCES SBI_ATTRIBUTE (ATTRIBUTE_ID);\p\g
ALTER TABLE SBI_EXT_USER_ROLES ADD CONSTRAINT FK_sbi_ext_user_roles_2 FOREIGN KEY (EXT_ROLE_ID) REFERENCES SBI_EXT_ROLES (EXT_ROLE_ID);\p\g

Create Index IDX_SBI_AUDIT_1  ON SBI_AUDIT (DOC_REF )  ;\p\g
Create Index IDX_SBI_AUDIT_2  ON SBI_AUDIT (ENGINE_REF )  ;\p\g
Create Index IDX_SBI_AUDIT_3  ON SBI_AUDIT (SUBOBJ_REF )  ;\p\g
Create Index IDX_SBI_CHECKS_1  ON SBI_CHECKS (VALUE_TYPE_ID )  ;\p\g
Create Index IDX_SBI_DATA_SOURCE_1  ON SBI_DATA_SOURCE (DIALECT_ID )  ;\p\g
Create Index IDX_SBI_DIST_LISTS_OBJECT_1  ON SBI_DIST_LIST_OBJECTS (DOC_ID )  ;\p\g
Create Index IDX_SBI_DIST_LISTS_OBJECT_2  ON SBI_DIST_LIST_OBJECTS (DL_ID )  ;\p\g
Create Index IDX_SBI_DOSSIER_BIN_TEMP_1  ON SBI_DOSSIER_BIN_TEMP (PART_ID )  ;\p\g
Create Index IDX_SBI_DOSSIER_PRES_1  ON SBI_DOSSIER_PRES (BIN_ID )  ;\p\g
Create Index IDX_SBI_DOSSIER_PRES_2  ON SBI_DOSSIER_PRES (BIOBJ_ID )  ;\p\g
Create Index IDX_SBI_SBI_DOSSIER_TEMP_1  ON SBI_DOSSIER_TEMP (BIOBJ_ID )  ;\p\g
Create Index IDX_SBI_ENGINES_1  ON SBI_ENGINES (BIOBJ_TYPE )  ;\p\g
Create Index IDX_SBI_ENGINES_2  ON SBI_ENGINES (ENGINE_TYPE )  ;\p\g
Create Index IDX_SBI_ENGINES_3  ON SBI_ENGINES (DEFAULT_DS_ID )  ;\p\g
Create Index IDX_SBI_EVENTS_ROLES_1  ON SBI_EVENTS_ROLES (ROLE_ID )  ;\p\g
Create Index IDX_SBI_EXT_ROLES_1  ON SBI_EXT_ROLES (ROLE_TYPE_ID )  ;\p\g
Create Index IDX_SBI_FUNCTIONS_1  ON SBI_FUNCTIONS (FUNCT_TYPE_ID )  ;\p\g
Create Index IDX_SBI_FUNCTIONS_2  ON SBI_FUNCTIONS (PARENT_FUNCT_ID )  ;\p\g
Create Index IDX_SBI_FUNC_ROLE_1  ON SBI_FUNC_ROLE (ROLE_ID )  ;\p\g
Create Index IDX_SBI_FUNC_ROLE_2  ON SBI_FUNC_ROLE (FUNCT_ID )  ;\p\g
Create Index IDX_SBI_FUNC_ROLE_3  ON SBI_FUNC_ROLE (STATE_ID )  ;\p\g
Create Index IDX_SBI_GEO_MAPS_1  ON SBI_GEO_MAPS (BIN_ID )  ;\p\g
Create Index IDX_SBI_GEO_MAP_FEATURES_1  ON SBI_GEO_MAP_FEATURES (FEATURE_ID )  ;\p\g
Create Index IDX_SBI_LOV_1  ON SBI_LOV (INPUT_TYPE_ID )  ;\p\g
Create Index IDX_SBI_MENU_ROLE_1  ON SBI_MENU_ROLE (EXT_ROLE_ID )  ;\p\g
Create Index IDX_SBI_OBJECTS_1  ON SBI_OBJECTS (STATE_ID )  ;\p\g
Create Index IDX_SBI_OBJECTS_2  ON SBI_OBJECTS (BIOBJ_TYPE_ID )  ;\p\g
Create Index IDX_SBI_OBJECTS_3  ON SBI_OBJECTS (EXEC_MODE_ID )  ;\p\g
Create Index IDX_SBI_OBJECTS_4  ON SBI_OBJECTS (STATE_CONS_ID )  ;\p\g
Create Index IDX_SBI_OBJECTS_5  ON SBI_OBJECTS (ENGINE_ID )  ;\p\g
Create Index IDX_SBI_OBJECTS_6  ON SBI_OBJECTS (DATA_SOURCE_ID )  ;\p\g
Create Index IDX_SBI_OBJECTS_RATING_1  ON SBI_OBJECTS_RATING (OBJ_ID )  ;\p\g
Create Index IDX_SBI_OBJECT_NOTES_1  ON SBI_OBJECT_NOTES (BIN_ID )  ;\p\g
Create Index IDX_SBI_OBJECT_NOTES_2  ON SBI_OBJECT_NOTES (BIOBJ_ID )  ;\p\g
Create Index IDX_SBI_OBJECT_TEMPLATES_1  ON SBI_OBJECT_TEMPLATES (BIN_ID )  ;\p\g
Create Index IDX_SBI_OBJECT_TEMPLATES_2  ON SBI_OBJECT_TEMPLATES (BIOBJ_ID )  ;\p\g
Create Index IDX_SBI_OBJ_FUNC_1  ON SBI_OBJ_FUNC (BIOBJ_ID )  ;\p\g
Create Index IDX_SBI_OBJ_FUNC_2  ON SBI_OBJ_FUNC (FUNCT_ID )  ;\p\g
Create Index IDX_SBI_OBJ_PAR_1  ON SBI_OBJ_PAR (PAR_ID )  ;\p\g
Create Index IDX_SBI_OBJ_PAR_2  ON SBI_OBJ_PAR (BIOBJ_ID )  ;\p\g
Create Index IDX_SBI_OBJ_PARUSE_1  ON SBI_OBJ_PARUSE (USE_ID )  ;\p\g
Create Index IDX_SBI_OBJ_PARUSE_2  ON SBI_OBJ_PARUSE (OBJ_PAR_FATHER_ID )  ;\p\g
Create Index IDX_SBI_OBJ_STATE_1  ON SBI_OBJ_STATE (BIOBJ_ID )  ;\p\g
Create Index IDX_SBI_OBJ_STATE_2  ON SBI_OBJ_STATE (STATE_ID )  ;\p\g
Create Index IDX_SBI_PARAMETERS_1  ON SBI_PARAMETERS (PAR_TYPE_ID )  ;\p\g
Create Index IDX_SBI_PARUSE_1  ON SBI_PARUSE (PAR_ID )  ;\p\g
Create Index IDX_SBI_PARUSE_2  ON SBI_PARUSE (LOV_ID )  ;\p\g
Create Index IDX_SBI_PARUSE_CK_1  ON SBI_PARUSE_CK (USE_ID )  ;\p\g
Create Index IDX_SBI_PARUSE_CK_2  ON SBI_PARUSE_CK (CHECK_ID )  ;\p\g
Create Index IDX_SBI_PARUSE_DET_1  ON SBI_PARUSE_DET (EXT_ROLE_ID )  ;\p\g
Create Index IDX_SBI_PARUSE_DET_2  ON SBI_PARUSE_DET (USE_ID )  ;\p\g
Create Index IDX_SBI_REMEMBER_ME_1  ON SBI_REMEMBER_ME (BIOBJ_ID )  ;\p\g
Create Index IDX_SBI_REMEMBER_ME_2  ON SBI_REMEMBER_ME (SUBOBJ_ID )  ;\p\g
Create Index IDX_SBI_ROLE_TYPE_USER_FUNC_1  ON SBI_ROLE_TYPE_USER_FUNC (USER_FUNCT_ID )  ;\p\g
Create Index IDX_SBI_SNAPSHOTS_1  ON SBI_SNAPSHOTS (BIN_ID )  ;\p\g
Create Index IDX_SBI_SNAPSHOTS_2  ON SBI_SNAPSHOTS (BIOBJ_ID )  ;\p\g
Create Index IDX_SBI_SUBOBJECTS_1  ON SBI_SUBOBJECTS (BIN_ID )  ;\p\g
Create Index IDX_SBI_SUBOBJECTS_2  ON SBI_SUBOBJECTS (BIOBJ_ID )  ;\p\g
Create Index IDX_SBI_SUBREPORTS_1  ON SBI_SUBREPORTS (SUB_RPT_ID )  ;\p\g
Create Index IDX_SBI_VIEWPOINTS_1  ON SBI_VIEWPOINTS (BIOBJ_ID )  ;\p\g
Create Index IDX_SBI_KPI_ROLE_1 ON SBI_KPI_ROLE (KPI_ID);\p\g
Create Index IDX_SBI_KPI_ROLE_2 ON SBI_KPI_ROLE (EXT_ROLE_ID);\p\g
Create Index IDX_SBI_KPI_1 ON SBI_KPI (DS_ID);\p\g
Create Index IDX_SBI_KPI_2 ON SBI_KPI (id_kpi_parent);\p\g
Create Index IDX_SBI_KPI_3 ON SBI_KPI (id_measure_unit);\p\g
Create Index IDX_SBI_KPI_4 ON SBI_KPI (THRESHOLD_ID);\p\g
Create Index IDX_SBI_MEASURE_UNIT_1 ON SBI_MEASURE_UNIT (SCALE_TYPE_ID);\p\g
Create Index IDX_SBI_THRESHOLD_1 ON SBI_THRESHOLD (THRESHOLD_TYPE_ID);\p\g
Create Index IDX_SBI_THRESHOLD_VALUE_1 ON SBI_THRESHOLD_VALUE (SEVERITY_ID);\p\g
Create Index IDX_SBI_THRESHOLD_VALUE_2 ON SBI_THRESHOLD_VALUE (THRESHOLD_ID);\p\g
Create Index IDX_SBI_KPI_MODEL_1 ON SBI_KPI_MODEL (KPI_MODEL_TYPE_ID);\p\g
Create Index IDX_SBI_KPI_MODEL_2 ON SBI_KPI_MODEL (KPI_ID);\p\g
Create Index IDX_SBI_KPI_MODEL_3 ON SBI_KPI_MODEL (KPI_PARENT_MODEL_ID);\p\g
Create Index IDX_SBI_KPI_MODEL_ATTR_1 ON SBI_KPI_MODEL_ATTR (KPI_MODEL_ATTR_TYPE_ID);\p\g
Create Index IDX_SBI_KPI_MODEL_ATTR_VAL_1 ON SBI_KPI_MODEL_ATTR_VAL (KPI_MODEL_ID);\p\g
Create Index IDX_SBI_KPI_MODEL_ATTR_VAL_2 ON SBI_KPI_MODEL_ATTR_VAL (KPI_MODEL_ATTR_ID);\p\g
Create Index IDX_SBI_KPI_INSTANCE_1 ON SBI_KPI_INSTANCE (KPI_ID);\p\g
Create Index IDX_SBI_KPI_INSTANCE_2 ON SBI_KPI_INSTANCE (id_measure_unit);\p\g
Create Index IDX_SBI_KPI_INSTANCE_3 ON SBI_KPI_INSTANCE (ID_KPI_PERIODICITY);\p\g
Create Index IDX_SBI_KPI_INSTANCE_4 ON SBI_KPI_INSTANCE (CHART_TYPE_ID);\p\g
Create Index IDX_SBI_KPI_INSTANCE_5 ON SBI_KPI_INSTANCE (THRESHOLD_ID);\p\g
Create Index IDX_SBI_KPI_INSTANCE_HISTORY_1 ON SBI_KPI_INSTANCE_HISTORY (id_measure_unit);\p\g
Create Index IDX_SBI_KPI_INSTANCE_HISTORY_2 ON SBI_KPI_INSTANCE_HISTORY (THRESHOLD_ID);\p\g
Create Index IDX_SBI_KPI_INSTANCE_HISTORY_3 ON SBI_KPI_INSTANCE_HISTORY (id_kpi_instance);\p\g
Create Index IDX_SBI_KPI_INSTANCE_HISTORY_4 ON SBI_KPI_INSTANCE_HISTORY (CHART_TYPE_ID);\p\g
Create Index IDX_SBI_KPI_VALUE_1 ON SBI_KPI_VALUE (id_kpi_instance);\p\g
Create Index IDX_SBI_KPI_VALUE_2 ON SBI_KPI_VALUE (RESOURCE_ID);\p\g
Create Index IDX_SBI_KPI_MODEL_INST_1 ON SBI_KPI_MODEL_INST (id_kpi_instance);\p\g
Create Index IDX_SBI_KPI_MODEL_INST_2 ON SBI_KPI_MODEL_INST (KPI_MODEL_ID);\p\g
Create Index IDX_SBI_KPI_MODEL_INST_3 ON SBI_KPI_MODEL_INST (KPI_MODEL_INST_PARENT);\p\g
Create Index IDX_SBI_KPI_MODEL_RESOURCES_1 ON SBI_KPI_MODEL_RESOURCES (RESOURCE_ID);\p\g
Create Index IDX_SBI_KPI_MODEL_RESOURCES_2 ON SBI_KPI_MODEL_RESOURCES (KPI_MODEL_INST);\p\g
Create Index IDX_SBI_ALARM_1 ON SBI_ALARM (MODALITY_ID);\p\g
Create Index IDX_SBI_ALARM_2 ON SBI_ALARM (DOCUMENT_ID);\p\g
Create Index IDX_SBI_ALARM_3 ON SBI_ALARM (id_kpi_instance);\p\g
Create Index IDX_SBI_ALARM_4 ON SBI_ALARM (id_threshold_value);\p\g
Create Index IDX_SBI_ALARM_EVENT_1 ON SBI_ALARM_EVENT (ALARM_ID);\p\g
Create Index IDX_SBI_ALARM_DISTRIBUTION_1 ON SBI_ALARM_DISTRIBUTION (ALARM_ID);\p\g
Create Index IDX_SBI_OBJ_METADATA_1  ON SBI_OBJ_METADATA (DATA_TYPE_ID )  ;\p\g
Create Index IDX_SBI_OBJ_METACONTENTS_1  ON SBI_OBJ_METACONTENTS (OBJMETA_ID )  ;\p\g
Create Index IDX_SBI_OBJ_METACONTENTS_1  ON SBI_OBJ_METACONTENTS (BIOBJ_ID )  ;\p\g
Create Index IDX_SBI_OBJ_METACONTENTS_1  ON SBI_OBJ_METACONTENTS (SUBOBJ_ID )  ;\p\g
Create Index IDX_SBI_OBJ_METACONTENTS_1  ON SBI_OBJ_METACONTENTS (BIN_ID )  ;\p\g
Create Unique Index XAK1SBI_CONFIG ON SBI_CONFIG(LABEL);\p\g
Create Index XIF3SBI_CONFIG ON SBI_CONFIG (VALUE_TYPE_ID );\p\g
Create Index XAK1SBI_USER ON SBI_USER(USER_ID);\p\g
