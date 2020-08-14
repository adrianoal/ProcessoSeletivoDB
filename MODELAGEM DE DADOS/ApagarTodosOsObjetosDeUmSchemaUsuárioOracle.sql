---------------------------------------------------------------------------------------------------------------------------------------------------
                                -- Apagar todos os Objetos de um schema/usuário [Oracle]: --
---------------------------------------------------------------------------------------------------------------------------------------------------                     
-- Link: http://dbaduarte.blogspot.com/2015/02/apagar-todos-os-objetos-de-um_5.html

-- ORACLE 11g
BEGIN
   for rec1 in (select decode(object_type, 'TABLE', 'A', '')||OBJECT_TYPE AS ORDEM_TYPE, object_type, object_name from user_objects where object_type not in ('PACKAGE BODY','INDEX','TRIGGER', 'LOB', 'JOB') order by 1) loop
     EXECUTE IMMEDIATE 'drop ' || rec1.object_type || ' ' || rec1.object_name || case rec1.object_type when 'TABLE' then ' cascade constraints' when 'TYPE' then ' FORCE' else '' end;
   end loop;
      
   for rec in (select job_creator, job_name from user_SCHEDULER_JOBS) loop
       DBMS_SCHEDULER.DROP_JOB(JOB_NAME => '"'||rec.job_creator||'"."'||rec.job_name||'"', defer=>false, force=>false);
   end loop;

   for rec in (select job from user_JOBS) loop
       DBMS_JOB.REMOVE(job => rec.job);
   end loop;

exception when others then
   raise_application_error(-20001,'An error was encountered - ' || SQLCODE || ' -ERROR- ' || SQLERRM);
END;
/
--Limpa a Lixeira a nível de Usuário
PURGE RECYCLEBIN;
/