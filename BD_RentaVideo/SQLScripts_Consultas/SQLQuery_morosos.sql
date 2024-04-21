SELECT n.Nombres,n.Apellidos,n.DUI 
FROM clientes n
JOIN rentas r ON n.DUI = r.DUI
where mora>0;