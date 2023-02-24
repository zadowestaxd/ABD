Create or replace PROCEDURE crea_sec_inversion(nombreEmpresa Invierte.NombreE%TYPE) --creaTablaDinamic_CL(NombreTabla VARCHAR2)
AS
plsql_block VARCHAR(2000);
BEGIN
select count(*)  into temp from user_objects where SEC = 'sec_'%nombreEmpresa; --TENGO QUE TRANSFORMAR NOMBREEMPRESA TODAS LAS LETRAS JUNTAS Y EN MAYÚSCULAS
IF temp = 0
START WITH 1
INCREMENT BY 1 nomaxvalue
 CREATE SEQUENCE sec_%nombreEmpresa --VA DENTRO DEL PLSQLBLOCK
 plsql_block := 'create table ' || NombreTabla || 
 '(DNI CHAR(8) not null, 
 NombreC CHAR(30), 
 Direccion VARCHAR2(50),
 Telefono CHAR(12),
 PRIMARY KEY (DNI))' ;
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