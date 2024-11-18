DECLARE
--  v_vallist EWIRE.ET_CRUD_OPERATIONS_PKG.COL_REC;
  v_dat EWIRE.ET_CRUD_OPERATIONS_PKG.COL_ARRAY;
  V_STRING VARCHAR2(255);
  BEGIN

--    v_vallist := EWIRE.ET_CRUD_OPERATIONS_PKG.COL_ARRAY();
    
    select rowid id, ssp.* into v_dat(1) from ewire.std_step_strip_wires_parts ssp where rowid = 'AAAJcYAAPAAGBtzAAA';
    v_dat(1).v_comments := 'Vamsi is happy';
        select rowid id, ssp.* into v_dat(2) from ewire.std_step_strip_wires_parts ssp where rowid = 'AAAJcYAAPAAGBtzAAC';
    v_dat(2).v_comments := 'Voman is happy';
DBMS_OUTPUT.PUT_LINE(v_dat(1).V_ROWID||'  '||v_dat(1).v_comments);
    EWIRE.ET_CRUD_OPERATIONS_PKG.PROC_UPDATE_ARRAY(v_dat);
  END;
  /
  
  
  
  DECLARE
  v_rowid EWIRE.ET_CRUD_OPERATIONS_PKG.COL_ARRAY;
  v_collist EWIRE.ET_CRUD_OPERATIONS_PKG.COL_ARRAY;
  v_vallist EWIRE.ET_CRUD_OPERATIONS_PKG.COL_ARRAY;
  BEGIN
    v_rowid := EWIRE.ET_CRUD_OPERATIONS_PKG.COL_ARRAY();
    v_collist := EWIRE.ET_CRUD_OPERATIONS_PKG.COL_ARRAY();
    v_vallist := EWIRE.ET_CRUD_OPERATIONS_PKG.COL_ARRAY();
    
--    v_rowid.EXTEND(2);
--    v_collist.EXTEND(2);
--    v_vallist.EXTEND(2);
    
    v_rowid(1) := 'AAAJcYAAPAAGBtzAAA';
    v_collist(1) := 'COMMENTS';
    v_vallist(1) := 'Vamsi is Happy';
    
    v_rowid(2) := 'AAAJcYAAPAAGBtzAAC';
    v_collist(2) := 'COMMENTS';
    v_vallist(2) := 'Voman is Happy';
    EWIRE.ET_CRUD_OPERATIONS_PKG.PROC_UPDATE_ARRAY('EWIRE','STD_STEP_STRIP_WIRES_PARTS',v_rowid,v_collist,v_vallist);
  END;