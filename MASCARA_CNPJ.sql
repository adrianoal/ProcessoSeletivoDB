--DROP FUNCTION FUNC_MASCARA_CNPJ

CREATE OR REPLACE FUNCTION FUNC_MASCARA_CNPJ (PCNPJ IN VARCHAR2) RETURN VARCHAR2
IS
   VMASCARA VARCHAR2(100);

BEGIN

   VMASCARA := SUBSTR(PCNPJ,1,3)||'.'||SUBSTR(PCNPJ,4,3)||'.'||SUBSTR(PCNPJ,7,3)||'/'||SUBSTR(PCNPJ,10);
   RETURN VMASCARA;

      EXCEPTION
        WHEN OTHERS THEN
          DBMS_OUTPUT.PUT_LINE('CODIGO DO ERRO'||SQLCODE||' MSG '||SQLERRM);
          DBMS_OUTPUT.PUT_LINE('LINHA: ' || DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);  
END;

/*
begin
  -- Call the function
  :result := func_mascara_cnpj(pcnpj => :pcnpj);
end;
*/
-------------------------------------------------------------------------------------------------------------------------------


CREATE OR REPLACE PROCEDURE FORMAT_CNPJ (PCNPJ IN OUT VARCHAR2) 
IS
  
  VMASCARA VARCHAR2(100);

BEGIN

   VMASCARA := SUBSTR(PCNPJ,1,3)||'.'||SUBSTR(PCNPJ,4,3)||'.'||SUBSTR(PCNPJ,7,3)||'/'||SUBSTR(PCNPJ,10);

      EXCEPTION
        WHEN OTHERS THEN
          DBMS_OUTPUT.PUT_LINE('CODIGO DO ERRO'||SQLCODE||' MSG '||SQLERRM);
          DBMS_OUTPUT.PUT_LINE('LINHA: ' || DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);  
END;


/*
begin
  -- Call the procedure
  format_cnpj(pcnpj => :pcnpj);
end;
*/



