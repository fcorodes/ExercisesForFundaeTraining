-- Escribe una consulta SQL que calcule el total de ventas de cada categoría de producto. 
-- Para hacerlo utiliza JOIN para combinar las tablas de productos, categorías y detalles de pedidos.

select c.CategoryID, c.CategoryDesc,  sum(o.UdsResquested) 
from category c 
inner join products p 
on c.CategoryID = p.CategoryId
inner join orders o  
on p.productId = o.productId
inner join details d 
on o.DetailID = d.DetailId
group by c.CategoryID 

select * 
from category c 
inner join products p 
on c.CategoryID = p.CategoryId
inner join orders o  
on p.productId = o.productId
inner join details d 
on o.DetailID = d.DetailId
 

-- Tu segunda tarea es crear una consulta SQL para determinar el gasto promedio de cada cliente. 
-- Usa JOINs para conectar las tablas de clientes y pedidos. 
-- Aplica también las funciones SUM para sumar los pedidos y AVG para calcular el promedio.



select c.ClientId, sum(o.UdsResquested) as 'total de unidades por cliente'
from clients c
inner join orders o
on c.ClientId = o.ClientId 
group by o.ClientId 

select c.ClientId , count(o.OrderId)  as 'numero de pedidos por cada cliente'
from clients c
inner join orders o
on c.ClientId = o.ClientId
group by o.ClientId 


select c.ClientId ,o.UdsResquested, p.productPrice , o.UdsResquested * p.productPrice as 'dinero gastado'  
from clients c
inner join orders o
on c.ClientId = o.ClientId
inner join products p
on o.productId = p.productId

select c.ClientId , avg(o.UdsResquested * p.productPrice)
from clients c
inner join orders o
on c.ClientId = o.ClientId
inner join products p
on o.productId = p.productId
group by c.ClientId 


-- ORDER BY A continuación, desarrolla una consulta SQL para listar los productos más vendidos en orden descendente. 
-- Combina la tabla de productos con los detalles de pedidos para contar las veces que cada producto ha sido pedido. 
-- Luego, ordena los resultados de mayor a menor usando ORDER BY. 

select o.productId , o.UdsResquested 
from orders o  
order by o.UdsResquested desc


-- LEFT JOIN WHERE Al final, formula una consulta SQL para identificar a los clientes que no han hecho ningún pedido. 
-- Considera usar una subconsulta o un LEFT JOIN con la tabla de pedidos. 
-- Para acabar, filtra los resultados con una cláusula WHERE para buscar clientes con valores nulos en la columna de pedidos. 


select distinct(c.Name ), sum(o.UdsResquested ) as 'unidades pedidas'  from clients c 
left join orders o  
on c.ClientId = o.ClientId
where o.UdsResquested > 0
group by c.Name 

INSERT INTO databaselevel3firstexercise.clients
(Surname, Name, ZipCode, Place, shippingAddress, TelephoneNumber)
VALUES('SinDinero', 'Javier', 44444, 'SinLugar', 'SinDireccion', 000777777);

select distinct(c.Name ), sum(o.UdsResquested ) as 'unidades pedidas'  from clients c 
left join orders o  
on c.ClientId = o.ClientId
where o.UdsResquested is null
group by c.Name 

