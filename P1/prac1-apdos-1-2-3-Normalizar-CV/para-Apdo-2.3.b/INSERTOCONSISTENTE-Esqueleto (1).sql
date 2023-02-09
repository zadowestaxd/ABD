
-------------- PASOS A IMPLEMENTAR  del PROCEDIMIENTO insertoConsistente

create or replace PROCEDURE insertoConsistente (

DNI_p        invierte.DNI%TYPE,
NombreE_p    invierte.NombreE%TYPE,
Cantidad_p   invierte.Cantidad%TYPE,
Tipo_p       invierte.Tipo%TYPE
)  AS


-- vars de trabajo

-- Decido si ese DNI es nuevo (no tiene inversiones) : si 0 es nuevo


-- Decido si es Tipo nuevo para ese cliente: si 0 es nuevo

 
-- Decido si es empresa nueva para ese cliente: si 0 es nuevo


-- para excepciones 
      Tcoderror NUMBER;
      Ttexterror VARCHAR2(100);



BEGIN

DBMS_output.put_line('Aqu� empieza INSERTOCONSISTENTE');

--------- muestro los datos de entrada (par�metros) con los que trabajo


-- Si no ex�st�an inversiones para ese DNI 


-- CASO 0.- No hay inversiones de ese DNI: inserto la fila y termino

--- imprimo la fila nueva



  --- ==  RESTO DE CASOS (tenemos el mismo DNI que en alguna fila de Invierte == ------



-- EN que CASO estoy?


-- imprimo en el caso que estamos


-- CASO 1.-  Ya existe una fila con mismo Tipo (1) y Empresa (1) : es un error, no se lo permito 


-- CASO 2.-  tipo nuevo para una  Empresa que ya hay inversiones: debo insertar filas con ese tipo para todas sus empresas


    -- Imprimo cada fila nueva


-- CASO 3.- Empresa nueva para un tipo que ya hay inversiones: debo insertar filas con ese empresa para todos sus tipos
--          No tomo en cuenta la nueva cantidad (es complejo comprobar la antig�a si hay varias empresas con ese Tipo)


-- Imprimo cada fila nueva


-- CASO 4.- El tipo y la empresa son nuevos: Como  CASO 2 + CASO 3

  ------ para cada empresa que hab�a tengo que insertar el bono nuevo

   -- Imprimo cada fila nueva



  ------- para esta empresa nueva tengo que insertar todos los bonos que hab�a 
  --      (como incluye el bono nuevo, que est� ya en la BD, genera tambi�n 
  --         la fila de los argumentos de entrada)


   -- Imprimo cada fila nueva

EXCEPTION

  WHEN OTHERS THEN
	Tcoderror:= SQLCODE;
	Ttexterror:= SUBSTR(SQLERRM,1, 100);
   DBMS_output.put_line('Sale por una excepcion: ' || Tcoderror ||   '  -- ' || Ttexterror );
   DBMS_output.put_line('$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$' ); 


END;
