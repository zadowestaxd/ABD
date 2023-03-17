Create or replace PROCEDURE crea_sec_inversion(nombreEmpresa Invierte.NombreE%TYPE) --creaTablaDinamic_CL(NombreTabla VARCHAR2)
AS
plsql_block VARCHAR(2000);
BEGIN
select count(*)  into temp from user_objects where SEC = 'sec_'%nombreEmpresa; --TENGO QUE TRANSFORMAR NOMBREEMPRESA TODAS LAS LETRAS JUNTAS Y EN MAYÚSCULAS
IF temp = 0
 plsql_block := 'create table ' || NombreTabla || 
 'start with 1
increment by 1
minvalue 0
maxvalue 100
cycle;' ;
EXECUTE IMMEDIATE plsql_block;
DBMS_output.put_line('--- tabla ' || NombreTabla || ' creada '); 
commit;
END creaTablaDinamic_CL;

/* -- ejecución desde el editor
begin 
 creaTablaDinamic_CL('ClienteBlack');
end;
rem, tabla user_objects, DOnde está el ejemplo
*/