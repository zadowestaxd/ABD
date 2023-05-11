CREATE OR REPLACE PROCEDURE autoRegalaComisiones(
    dni_cliente NOTIFICACIONES.DNI_cli%TYPE,
    nombre_empresa NOTIFICACIONES.NombreE%TYPE,
    tipo_inversion NOTIFICACIONES.Tipo%TYPE,
    importe_inversion IN FLOAT
)
AS
    comision FLOAT;
    espacio_libre INT;
    tablespacename varchar(10);
BEGIN
    -- Obtener el espacio libre en el tablespace
        select TABLESPACE_NAME into tablespacename from ALL_TABLES 
        where OWNER LIKE '%ABD0110%';
    ------------ Controlar el espacio libre en bloques de los tablespaces de los alumnos de ABD 
        SELECT 
        SUM(BYTES) BYTES_LIBRES
        into espacio_libre 
        FROM 
        SYS.DBA_FREE_SPACE 
        WHERE 
        TABLESPACE_NAME LIKE tablespacename 
        GROUP BY TABLESPACE_NAME, FILE_ID 
        order by bloques_libres ;


    IF espacio_libre < 1800 THEN
        RAISE_APPLICATION_ERROR(-20000, 'No hay suficiente espacio libre en el tablespace');
    END IF;

    -- Calcular la comisión (2% del importe de la inversión)
    comision := importe_inversion * 0.02;

    -- Insertar la fila en la tabla NOTIFICACIONES
    INSERT INTO NOTIFICACIONES(Usuario_Origen, Fecha, DNI_cli, NombreE, Tipo, Comision)
    VALUES(USER, SYSDATE, dni_cliente, nombre_empresa, tipo_inversion, comision);

    COMMIT;
END;
