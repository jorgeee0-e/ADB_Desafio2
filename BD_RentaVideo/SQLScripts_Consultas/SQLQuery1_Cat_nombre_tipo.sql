SELECT c.Categorias, p.Nombre, t.Nombre_tipo
FROM categorias c
JOIN peliculas p ON p.CodC=c.CodC
JOIN tipos t ON t.codT = p.CodT
ORDER BY c.Categorias ASC;
