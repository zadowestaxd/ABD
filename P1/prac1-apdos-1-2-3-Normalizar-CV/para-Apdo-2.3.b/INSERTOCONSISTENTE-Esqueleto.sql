
-------------- PASOS A IMPLEMENTAR  del PROCEDIMIENTO insertoConsistente

create or replace PROCEDURE insertoConsistente (

DNI_p        invierte.DNI%TYPE,
NombreE_p    invierte.NombreE%TYPE,
Cantidad_p   invierte.Cantidad%TYPE,
Tipo_p       invierte.Tipo%TYPE
)  AS


-- variables de trabajo para las decisiones (indicadas despu�s del BEGIN
es_dni_nuevo INT;
es_tipo_nuevo INT;
es_nombre_nuevo INT;

-- VARS para excepciones 
      Tcoderror NUMBER;
      Ttexterror VARCHAR2(100);



BEGIN


-- Decido si ese DNI es nuevo (no tiene inversiones) : si 0 es nuevo
select count(*) into es_dni_nuevo from Invierte
where DNI == DNI_p;

-- Decido si es Tipo nuevo para ese cliente: si 0 es nuevo

select count(*) into es_tipo_nuevo from Invierte
where TIPO == TIPO_p;
 
-- Decido si es empresa nueva para ese cliente: si 0 es nuevo
select count(*) into es_nombre_nuevo from Invierte
where Nombre == NombreE_p;

DBMS_output.put_line('Aqu� empieza INSERTOCONSISTENTE');

--------- muestro los datos de entrada (par�metros) con los que trabajo

DBMS_output.put_line('muestro los datos de entrada ' || es_dni_nuevo || ' ' || es_tipo_nuevo || ' ' || es_nombre_nuevo);
-- Si no ex�st�an inversiones para ese DNI 


-- CASO 0.- No hay inversiones de ese DNI: inserto la fila y termino
IF es_dni_nuevo = 0 THEN
INSERT to Invierte (DNI_p, TIPO_p, NULL, NombreE_p);
--- imprimo la fila 

DBMS_output.put_line(DNI_p || ' ' || TIPO_p || ' ' || es_dni_nuevo || ' ' || NombreE_p);


  --- ==  RESTO DE CASOS (tenemos el mismo DNI que en alguna fila de Invierte == ------
ELSE

-- EN que CASO estoy?


-- imprimo en el caso que estamos
DBMS_output.put_line(

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
