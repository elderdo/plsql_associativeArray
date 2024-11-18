CREATE OR REPLACE PACKAGE BODY EWIRE.ET_CRUD_OPERATIONS_PKG AS
/*********************************************************************************
  WRITTEN BY        :    VamsiKrishna Samuru
  DATE WRITTEN      :    04/22/2021
  FILE NAME         :      
  PURPOSE           :    To perform CRUD operations from EWIRE Tooling UI. 
  CHANGED BY        :        
  DATE CHANGED      :           
  CHANGE REQUEST    :    
  CHANGE DESCRPTION : 
**********************************************************************************/
    PROCEDURE PROC_INSERTARRAY(V_DATA IN COL_ARRAY) AS
        /***************************************************************************
        This procedure accepts Array list and inserts into DB for given Table and schema
        ***************************************************************************/
        V_DATA_ONE COL_ARRAY;
        
    BEGIN
      
        V_DATA_ONE := V_DATA;
        
      FOR i IN 1..V_DATA_ONE.COUNT LOOP
      
      INSERT INTO EWIRE.STD_STEP_STRIP_WIRES_PARTS VALUES (V_DATA_ONE(i).V_STEP_CD, V_DATA_ONE(i).V_CONNECTOR_PN, V_DATA_ONE(i).V_CONTACT_PN, V_DATA_ONE(i).V_CONTACT_SIZE, V_DATA_ONE(i).V_EXT_CONTACT_SIZE, V_DATA_ONE(i).V_WIRE_SIZE, V_DATA_ONE(i).V_WIRE_TYPE_CD, V_DATA_ONE(i).V_FLAG_NOTE, V_DATA_ONE(i).V_REFERENCE, V_DATA_ONE(i).V_COMMENTS);
         
      END LOOP;
      
--      COMMIT;
    END;
    
    
    PROCEDURE PROC_UPDATE_ARRAY(V_DATA IN COL_ARRAY) AS
        /***************************************************************************
        This procedure accepts Array list and UPDATES in DB for given Table and schema
        ***************************************************************************/
    V_DATA_ONE COL_ARRAY;
    V_DATA_TWO COL_ARRAY;
    
    BEGIN  
    
    V_DATA_ONE := V_DATA;
--    V_DATA_TWO := V_DATA;
    
      FOR i IN 1..V_DATA_ONE.COUNT LOOP
      
        SELECT ROWID ID, SSP.* INTO V_DATA_TWO(1) from EWIRE.STD_STEP_STRIP_WIRES_PARTS SSP WHERE ROWID = V_DATA_ONE(i).V_ROWID;
        
--      DBMS_OUTPUT.PUT_LINE('V_DATA_ONE ==>'||V_DATA_ONE(i).V_ROWID||'  '||V_DATA_ONE(i).v_comments);
      
            FOR j IN 1..V_DATA_TWO.COUNT LOOP
            
--            DBMS_OUTPUT.PUT_LINE('V_DATA_TWO ==>'||V_DATA_TWO(j).V_ROWID||'  '||V_DATA_TWO(j).v_comments);

                    IF V_DATA_ONE(i).V_STEP_CD != V_DATA_TWO(j).V_STEP_CD THEN
                        UPDATE EWIRE.STD_STEP_STRIP_WIRES_PARTS SET STEP_CD = V_DATA_ONE(i).V_STEP_CD WHERE ROWID = V_DATA_ONE(i).V_ROWID;
                    ELSIF NVL(V_DATA_ONE(i).V_CONNECTOR_PN, '0') != NVL(V_DATA_TWO(j).V_CONNECTOR_PN, '0') THEN
                        UPDATE EWIRE.STD_STEP_STRIP_WIRES_PARTS SET CONNECTOR_PN = V_DATA_ONE(i).V_CONNECTOR_PN WHERE ROWID = V_DATA_ONE(i).V_ROWID;
                    ELSIF NVL(V_DATA_ONE(i).V_CONTACT_PN, '0') != NVL(V_DATA_TWO(j).V_CONTACT_PN, '0') THEN
                        UPDATE EWIRE.STD_STEP_STRIP_WIRES_PARTS SET CONTACT_PN = V_DATA_ONE(i).V_CONTACT_PN WHERE ROWID = V_DATA_ONE(i).V_ROWID;
                    ELSIF NVL(V_DATA_ONE(i).V_CONTACT_SIZE, '0') != NVL(V_DATA_TWO(j).V_CONTACT_SIZE, '0') THEN
                        UPDATE EWIRE.STD_STEP_STRIP_WIRES_PARTS SET CONTACT_SIZE = V_DATA_ONE(i).V_CONTACT_SIZE WHERE ROWID = V_DATA_ONE(i).V_ROWID;
                    ELSIF NVL(V_DATA_ONE(i).V_EXT_CONTACT_SIZE, '0') != NVL(V_DATA_TWO(j).V_EXT_CONTACT_SIZE, '0') THEN
                        UPDATE EWIRE.STD_STEP_STRIP_WIRES_PARTS SET EXT_CONTACT_SIZE = V_DATA_ONE(i).V_EXT_CONTACT_SIZE WHERE ROWID = V_DATA_ONE(i).V_ROWID;
                    ELSIF NVL(V_DATA_ONE(i).V_WIRE_SIZE, '0') != NVL(V_DATA_TWO(j).V_WIRE_SIZE, '0') THEN
                        UPDATE EWIRE.STD_STEP_STRIP_WIRES_PARTS SET WIRE_SIZE = V_DATA_ONE(i).V_WIRE_SIZE WHERE ROWID = V_DATA_ONE(i).V_ROWID;   
                    ELSIF NVL(V_DATA_ONE(i).V_WIRE_TYPE_CD, '0') != NVL(V_DATA_TWO(j).V_WIRE_TYPE_CD, '0') THEN
                        UPDATE EWIRE.STD_STEP_STRIP_WIRES_PARTS SET WIRE_TYPE_CD = V_DATA_ONE(i).V_WIRE_TYPE_CD WHERE ROWID = V_DATA_ONE(i).V_ROWID; 
                    ELSIF NVL(V_DATA_ONE(i).V_FLAG_NOTE, '0') != NVL(V_DATA_TWO(j).V_FLAG_NOTE, '0') THEN
                        UPDATE EWIRE.STD_STEP_STRIP_WIRES_PARTS SET FLAG_NOTE = V_DATA_ONE(i).V_FLAG_NOTE WHERE ROWID = V_DATA_ONE(i).V_ROWID;   
                    ELSIF NVL(V_DATA_ONE(i).V_REFERENCE, '0') != NVL(V_DATA_TWO(j).V_REFERENCE, '0') THEN
                        UPDATE EWIRE.STD_STEP_STRIP_WIRES_PARTS SET REFERENCE = V_DATA_ONE(i).V_REFERENCE WHERE ROWID = V_DATA_ONE(i).V_ROWID; 
                    ELSIF NVL(V_DATA_ONE(i).V_COMMENTS, '0') != NVL(V_DATA_TWO(j).V_COMMENTS, '0') THEN
                        UPDATE EWIRE.STD_STEP_STRIP_WIRES_PARTS SET COMMENTS = V_DATA_ONE(i).V_COMMENTS WHERE ROWID = V_DATA_ONE(i).V_ROWID;                     
                    END IF;

            END LOOP;
        END LOOP;    
--      COMMIT;
    END PROC_UPDATE_ARRAY;
    
    PROCEDURE PROC_DELETE_ARRAY(V_DATA IN COL_ARRAY) AS
        /***************************************************************************
        This procedure accepts Array list and DELETES in DB for given Table and schema
        ***************************************************************************/
    V_DATA_ONE COL_ARRAY;
    
    BEGIN  
    
    V_DATA_ONE := V_DATA;
         
      FOR i IN 1..V_DATA.COUNT LOOP
               
        DELETE EWIRE.STD_STEP_STRIP_WIRES_PARTS WHERE ROWID = V_DATA_ONE(i).V_ROWID; 
            
      END LOOP;
--      COMMIT;
    END PROC_DELETE_ARRAY;
END;
/