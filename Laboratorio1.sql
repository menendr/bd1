-- LABORATORIO 1

CLIENTE (cod_cli, nombre, ciudad)
PROVEEDOR (cod_prov, nombre, ciudad)
PRODUCTO (cod_prod, nombre, precio, cod_prov)
ORDEN (num_orden, cod_cli, fecha_orden, fecha_entrega)
DETALLE (num_orden, cod_prod, cantidad)

1) Seleccionar el nombre de los clientes con domicilio en Montevideo.
2) Seleccionar todos los datos de los clientes con domicilio en Montevideo, ordenando alfabéticamente por nombre.
3) Seleccionar el número de las órdenes con fecha anterior al 21 de abril de este año.
4) Seleccionar el número de las órdenes pedidas o entregadas el 20 de abril de este año.
5) Seleccionar el código y nombre de los clientes con domicilio en Montevideo, Pando o Rocha.
6) Seleccionar el código de los productos con precio entre 100 y 500.
7) Seleccionar el código de los clientes cuyos nombres empiecen con "A" o "M".
8) Seleccionar el número de las órdenes no entregadas.
9) Seleccionar todos los datos de las órdenes pedidas el 20 de abril de este año y entregadas al día siguiente.
10) Seleccionar las ciudades donde hay clientes.
11) Seleccionar el nombre de los clientes que hayan realizado alguna orden.
12) Seleccionar todos los datos de los clientes que hayan realizado alguna orden antes del 30 de marzo de este año.
13) Seleccionar el nombre y el precio de los productos de la orden 5001.
14) Seleccionar el nombre y el precio de los productos que hayan sido ordenados por el cliente Pérez domiciliado en Montevideo.
15) Seleccionar el número de las órdenes que han pedido alguno de los mismos productos pedidos en la orden 5001.
16) Seleccionar el código de los clientes que han ordenado alguno de los mismos productos ordenados por el cliente García.
17) Seleccionar el nombre de los clientes y en el caso que hayan realizado alguna orden, el número de orden.
18) Seleccionar el mayor y el menor número de orden. 


1)
SELECT NOMBRE
FROM CLIENTES
WHERE UPPER(CIUDAD) = 'MONTEVIDEO'


2)
SELECT *
FROM CLIENTES
WHERE CIUDAD = 'MONTEVIDEO'
ORDER BY NOMBRE ASC

3)
SELECT NUM_ORDEN
FROM ORDEN
WHERE FECHA_ORDEN < TO_DATE('20/04/2026', 'DD/MM/YYYY')

4)
SELECT NUM_ORDEN
FROM ORDEN
WHERE FECHA_ORDEN < TO_DATE('20/04/2026', 'DD/MM/YYYY')
OR FECHA_ENTREGA  < TO_DATE('20/04/2026', 'DD/MM/YYYY')

5)
SELECT COD_CLI, NOMBRE
FROM CLIENTES
WHERE UPPER(CIUDAD) = 'MONTEVIDEO'
OR UPPER(CIUDAD) = 'PANDO'
OR UPPER(CIUDAD) = 'ROCHA'

SELECT COD_CLI, NOMBRE
FROM CLIENTES
WHERE UPPER(CIUDAD) IN ('MONTEVIDEO', 'PANDO', 'ROCHA')

6)
SELECT COD_PROD
FROM PRODUCTO
WHERE 100 < PRECIO AND PRECIO < 500

SELECT COD_PROD
FROM PRODUCTO
WHERE PRECIO BETWEEN 100 AND 500

7)
SELECT COD_CLI
FROM CLIENTES
WHERE UPPER(NOMBRE) LIKE 'A%'
OR UPPER(NOMBRE) LIKE 'M%'

8)
SELECT NUM_ORDEN
FROM ORDEN
WHERE FECHA_ENTREGA IS NULL

9)
SELECT *
FROM ORDEN
WHERE FECHA_ORDEN = TO_DATE('20/04/2026', 'DD/MM/YYYY')
AND FECHA_ENTREGA = TO_DATE('21/04/2026', 'DD/MM/YYYY')

10)
SELECT DISTINCT CIUDAD
FROM CLIENTES

11)
SELECT DISTINCT C.NOMBRE
FROM CLIENTES C
JOIN ORDEN O
ON C.COD_CLI = O.COD_CLI

12)
SELECT *
FROM CLIENTES C
JOIN ORDEN O
ON C.COD_CLI = O.COD_CLI
WHERE O.FECHA_ORDEN < TO_DATE('30/03/2026', 'DD/MM/YYYY')

13)
SELECT P.NOMBRE, P.PRECIO
FROM PRODUCTO P
JOIN DETALLE D
ON P.COD_PROD = D.COD_PROD
WHERE D.NUM_ORDEN = 5001

14)
SELECT P.NOMBRE, P.PRECIO
FROM PRODUCTO P
JOIN DETALLE D
ON P.COD_PROD = D.COD_PROD
JOIN ORDEN O
ON D.NUM_ORDEN = O.NUM_ORDEN
JOIN CLIENTES C
ON O.COD_CLI = C.COD_CLI
WHERE UPPER(C.NOMBRE) = 'PEREZ'
AND C.CIUDAD = 'MONTEVIDEO'

15)
SELECT DISTINCT NUM_ORDEN
FROM DETALLE
WHERE NUM_ORDEN <> 5001
AND COD_PROD IN (SELECT COD_PROD
				FROM DETALLE
				WHERE NUM_ORDEN = 5001)

16)
SELECT C.COD_CLI
FROM CLIENTES C
JOIN ORDEN O
ON O.COD_CLI = C.COD_CLI
JOIN DETALLE D
ON O.NUM_ORDEN 

17)
SELECT C.NOMBRE, O.NUM_ORDEN
FROM CLIENTES C
LEFT JOIN ORDEN O
ON C.COD_CLI = O.COD_CLI

19)
SELECT CIUDAD
FROM CLIENTES
UNION
SELECT CIUDAD
FROM PROVEEDOR

20)
SELECT CIUDAD
FROM CLIENTES
MINUS
SELECT CIUDAD
FROM PROVEEDOR

21)
SELECT DISTINCT NUM_ORDEN
FROM DETALLE
MINUS
SELECT NUM_ORDEN
FROM DETALLE
WHERE COD_PROD <> 110

22)
SELECT O.*
FROM DETALLE D, ORDEN O, PRODUCTO P
WHERE O.NUM_ORDEN = D.NUM_ORDEN
AND D.COD_PROD = P.COD_PROD
AND (UPPER(P.NOMBRE) = 'ESMALTE 10L'
OR UPPER(P.NOMBRE) = 'ESMALTE 25L')
MINUS
(
SELECT O.*
FROM DETALLE D, ORDEN O, PRODUCTO P
WHERE O.NUM_ORDEN = D.NUM_ORDEN
AND D.COD_PROD = P.COD_PROD
AND UPPER(P.NOMBRE) = 'ESMALTE 10L'
INTERSECT
SELECT O.*
FROM DETALLE D, ORDEN O, PRODUCTO P
WHERE O.NUM_ORDEN = D.NUM_ORDEN
AND D.COD_PROD = P.COD_PROD
AND UPPER(P.NOMBRE) = 'ESMALTE 25L'
)