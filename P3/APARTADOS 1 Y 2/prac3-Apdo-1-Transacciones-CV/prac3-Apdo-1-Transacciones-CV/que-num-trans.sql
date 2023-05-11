
/*     para saber si estamos dentro de una Transacci�n
       y que n�mero tiene
*/

set serveroutput on
set autocommit off

SET TRANSACTION ISOLATION LEVEL READ COMMITTED 
    NAME 'TuTro';

declare

 numeroT varchar(50);
begin 

 SELECT dbms_transaction.local_transaction_id into numeroT
 FROM dual ;

 ABDMIUTIL.dormir(5); -- en segundos
 DBMS_OUTPUT.PUT_LINE('se ha dormido la trans->  ' || numeroT);
end;


/*   PARA HACER PRUEBAS DE TRANSACCIONES NECESITAMOS CONTROLAR: CUANDO FUNCIONAN
     Simulamos que una transacci�n dura un tiempo, poni�ndola a dormir.
     As� puedes hacer pruebas de bloqueos y resultados de Niveles de Aislamiento.
     Usa este procedimiento 

*/
