-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Seleccionar los clientes del año 2021
SELECT DISTINCT c.id_cliente, c.nombre, c.apellido, c.direccion, c.fec_nac, c.telefono, c.email
FROM cliente c
JOIN factura f ON c.id_cliente = f.id_cliente
WHERE YEAR(f.fecha) = 2021
ORDER BY c.id_cliente; -- Ajusta según tus necesidades de clasificación

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Seleccionar los clientes de 2022 (hasta el momento) en base a la fecha de la factura.
SELECT DISTINCT c.id_cliente, c.nombre, c.apellido, c.direccion, c.fec_nac, c.telefono, c.email
FROM cliente c
JOIN factura f ON c.id_cliente = f.id_cliente
WHERE YEAR(f.fecha) = 2022 AND f.fecha <= GETDATE()
ORDER BY c.id_cliente; -- Ajusta según tus necesidades de clasificación

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Seleccionar los clientes de diciembre de 2021
SELECT DISTINCT c.id_cliente, c.nombre, c.apellido, c.direccion, c.fec_nac, c.telefono, c.email
FROM cliente c
JOIN factura f ON c.id_cliente = f.id_cliente
WHERE YEAR(f.fecha) = 2021 AND MONTH(f.fecha) = 12
ORDER BY c.id_cliente; -- Puedes ajustar la clasificación según tus necesidades

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Seleccionar las compras de Valentina Anastasia Huerta Corral
-- Seleccionar las compras de Zayra Manuela Gómez López
-- Seleccionar las compras de Dante Eduardo Dolores Meza
-- Seleccionar las compras de Ana Maribel Cedillo Núñez
-- Seleccionar las compras de Rodrigo Ismael Silva Ugarte
SELECT 
    cliente.nombre AS nombre_cliente,
    cliente.apellido AS apellido_cliente,
    factura.id_factura,
    factura.fecha,
    producto.nombre AS nombre_producto,
    detalle.cantidad,
    detalle.precio AS precio_unitario
FROM 
    cliente AS cliente
JOIN 
    factura AS factura ON cliente.id_cliente = factura.id_cliente
JOIN 
    detalle AS detalle ON factura.id_detalle = detalle.id_detalle
JOIN 
    producto AS producto ON detalle.id_producto = producto.id_producto
WHERE 
    (cliente.nombre = 'Valentina Anastasia' AND cliente.apellido = 'Huerta Corral') OR
    (cliente.nombre = 'Zayra Manuela' AND cliente.apellido = 'Gómez López') OR
    (cliente.nombre = 'Dante Eduardo' AND cliente.apellido = 'Dolores Meza') OR
    (cliente.nombre = 'Ana Maribel' AND cliente.apellido = 'Cedillo Núñez') OR
    (cliente.nombre LIKE 'Rodrigo Ismael%');

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Seleccionar el producto que ha tenido más ventas
SELECT 
	producto.nombre AS nombre_producto,
	detalle.cantidad AS cantidad_producto
FROM
	detalle detalle
JOIN 
	producto producto ON producto.id_producto = detalle.id_producto
ORDER BY 
	detalle.cantidad DESC;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Mostrar todos los productos del stock
SELECT 
    producto.id_producto,
    producto.nombre AS nombre_producto,
    producto.stock AS cantidad_en_stock
FROM producto AS producto
ORDER BY cantidad_en_stock DESC;

-- Consultar producto con más stock
SELECT TOP 1
    id_producto,
    nombre_producto,
    cantidad_en_stock
FROM Stock
ORDER BY cantidad_en_stock DESC;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Ordenar compras de la más antigua a la más reciente
SELECT 
    cliente.nombre AS nombre_cliente,
    cliente.apellido AS apellido_cliente,
    factura.id_factura,
    factura.fecha,
    producto.nombre AS nombre_producto,
    detalle.cantidad,
    detalle.precio AS precio_unitario
FROM 
    cliente AS cliente
JOIN 
    factura AS factura ON cliente.id_cliente = factura.id_cliente
JOIN 
    detalle AS detalle ON factura.id_detalle = detalle.id_detalle
JOIN 
    producto AS producto ON detalle.id_producto = producto.id_producto
ORDER BY 
    factura.fecha ASC; -- ASC para ordenar de la más antigua a la más reciente

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Ordenar alfabéticamente los nombres de clientes
SELECT 
    nombre AS nombre_cliente,
    apellido AS apellido_cliente
FROM cliente
ORDER BY 
    nombre ASC, 
    apellido ASC; -- ASC para ordenar de forma ascendente (alfabéticamente)

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Productos de la categoría Falda
SELECT 
    id_producto,
    nombre AS nombre_producto
FROM producto
WHERE 
    id_categoria = (SELECT id_categoria FROM categoria WHERE CAST(nombre AS VARCHAR(MAX)) = 'Falda');

-- Productos de la categoría Pantalón
SELECT 
    id_producto,
    nombre AS nombre_producto
FROM producto
WHERE 
    id_categoria = (SELECT id_categoria FROM categoria WHERE CAST(nombre AS VARCHAR(MAX)) = 'Pantalón');

-- Productos de la categoría Chamarra
SELECT 
    id_producto,
    nombre AS nombre_producto
FROM producto
WHERE 
    id_categoria = (SELECT id_categoria FROM categoria WHERE CAST(nombre AS VARCHAR(MAX)) = 'Chamarra');

-- Productos de la categoría Zapatos
SELECT 
    id_producto,
    nombre AS nombre_producto
FROM producto
WHERE 
    id_categoria = (SELECT id_categoria FROM categoria WHERE CAST(nombre AS VARCHAR(MAX)) = 'Zapatos');

-- Productos de la categoría Accesorios
SELECT 
    id_producto,
    nombre AS nombre_producto
FROM producto
WHERE 
    id_categoria = (SELECT id_categoria FROM categoria WHERE CAST(nombre AS VARCHAR(MAX)) = 'Accesorios');

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Seleccionar los encargados de las sucursales de Akira's Boutique
SELECT 
    s.Numero AS Numero_Sucursal,
    s.Nombre AS Nombre_Sucursal,
    s.Encargado AS Encargado_Sucursal
FROM Sucursales s
WHERE s.Nombre LIKE 'AkirasBoutiques%';

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Seleccionar empleados de la sucursal Akira's Boutique Constitución
SELECT 
    ID AS ID_Empleado,
    Nombre AS Nombre_Empleado,
    Direccion AS Direccion_Empleado,
    Telefono AS Numero_Telefono,
    Edad AS Edad_Empleado,
    Sucursal AS Sucursal_Trabajo,
    Email AS Correo_Electronico
FROM Empleados
WHERE Sucursal = 'AkirasBoutiques Constitucion';

DELETE FROM Empleados
WHERE ID BETWEEN 81 AND 96;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Obtener clientes mayores de 30 años
SELECT 
    id_cliente,
    nombre,
    apellido,
    fec_nac,
    telefono,
    email
FROM Cliente
WHERE DATEADD(YEAR, 30, fec_nac) < GETDATE();