SELECT c.Categorias, p.Nombre
FROM categorias c
JOIN peliculas p ON p.CodC=c.CodC
ORDER BY c.Categorias ASC;
