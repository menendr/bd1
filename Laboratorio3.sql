-- LABORATORIO 3

CLIENTE (cod_cli, nombre, ciudad)
PROVEEDOR (cod_prov, nombre, ciudad)
PRODUCTO (cod_prod, nombre, precio, cod_prov)
ORDEN (num_orden, cod_cli, fecha_orden, fecha_entrega)
DETALLE (num_orden, cod_prod, cantidad) 

1)  Seleccionar la cantidad de clientes.
2)  Seleccionar el mayor y el menor precio de los productos.
3)  Seleccionar el promedio de precios de los productos.
4)  Seleccionar el número de las órdenes cuando el precio del producto ordenado sea el precio mayor de todos los productos.
5)  Seleccionar la cantidad de clientes por ciudad.
6)  Seleccionar la cantidad de órdenes por día en el período comprendido entre el 1 y 20 de abril de este año.
7)  Seleccionar la cantidad de órdenes que hay por día, con su respectivo importe.
8)  Seleccionar las ciudades en donde hay más de 3 clientes.
9)  Seleccionar el número de las órdenes en donde se haya pedido más de un producto.
10) Seleccionar el número de las órdenes cuando la cantidad total pedida es superior a 100 y no se pida menos de 30 unidades por producto.
11) Seleccionar el número de las órdenes en donde se hayan pedido productos de más de un proveedor.
12) Seleccionar el código de los clientes que han realizado la mayor o la menor cantidad de órdenes.
13) Seleccionar el nombre de los clientes que han realizado la mayor cantidad de órdenes.
14) Seleccionar el nombre de los clientes que han ordenado la mayor cantidad de productos.
15) Seleccionar el número de las órdenes en donde se hayan pedido más productos fabricados por distintos proveedores.
16) Seleccionar el nombre de los clientes que han ordenado absolutamente todos los productos.
17) Seleccionar el nombre de los clientes que han ordenado absolutamente todos los productos de los proveedores de la ciudad de Montevideo. 
18) Seleccionar el nombre de los productos que han sido ordenados por absolutamente todos los clientes. 

1)
SELECT COUNT(*)
FROM CLIENTES

4)
SELECT MAX(PRECIO)