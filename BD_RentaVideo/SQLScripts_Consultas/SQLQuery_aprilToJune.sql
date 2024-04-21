SELECT *
FROM clientes
WHERE Fecha_Afiliacion >= CONVERT(DATE,'2008-04-01') AND Fecha_Afiliacion <= CONVERT(DATE,'2008-06-30'); 