-- 1) Visualizar todos los registros de la tabla productos
select * from Production.Product
GO

-- 2) Ver la estructura de la tabla productos

SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('Production.Product') 


-- 3) Cuantos productos no pertenecen a una subcategoria
 
SELECT *
FROM Production.Product
WHERE ProductSubcategoryID IS NULL;


-- 4) Ver listado de subcategorias de productos

SELECT *
FROM Production.ProductSubcategory

-- 5) Visualizar listado de subcategorias con sus respectivas categorias

SELECT 
ps.name AS 'Subcategoria',
pc.name AS 'Categoria' 
FROM 
Production.ProductSubcategory ps
INNER JOIN Production.ProductCategory pc
ON 
ps.ProductCategoryID = pc.ProductCategoryID

-- 6) Visualizar cantidad de productos por cada subcategoria

SELECT 
DISTINCT COUNT(pp.ProductID) as 'Producto', 
ps.name AS 'Subcategoria' 
FROM Production.Product pp
INNER JOIN Production.ProductSubcategory ps
ON pp.ProductSubcategoryID = ps.ProductSubcategoryID
GROUP BY ps.name

-- 7) Ver precio promedio por cada categoria de producto


SELECT pc.name AS 'Categoria',
AVG(pp.ListPrice) AS 'Precio Promedio'
FROM Production.Product pp
INNER JOIN Production.ProductSubcategory ps
ON pp.ProductSubcategoryID = ps.ProductSubcategoryID
INNER JOIN Production.ProductCategory pc
ON ps.ProductCategoryID = pc.ProductCategoryID
GROUP BY pc.name


-- 8) Ver cantidad de productos por categoria

SELECT * FROM Production.ProductCategory
SELECT
pro.ProductID,
cat.Name AS Categoria,
pro.Name
FROM Production.Product AS pro
INNER JOIN Production.Productcategory AS cat
ON cat.ProductCategoryID = pro.ProductSubcategoryID;

-- 9) Ver cantidad de productos solo de la categoria components

SELECT
pro.ProductID,
cat.Name AS Categoria,
pro.Name
FROM Production.Product AS pro
INNER JOIN Production.Productcategory AS cat
ON cat.Name = 'Components'

-- 10) Visualizar el total de ventas por cada categoria de producto
SELECT C.Name, 
SUM(SA.LineTotal * SA.UnitPrice) as TOTAL
FROM Production.Product P
INNER JOIN Sales.SalesOrderDetail SA
on P.ProductID = SA.ProductID
INNER JOIN Production.ProductSubcategory S
on S.ProductSubcategoryID = P.ProductSubcategoryID
INNER JOIN Production.ProductCategory C
on C.ProductCategoryID = S.ProductCategoryID
GROUP BY C.Name;

-- 11) Ver la cantidad total de empleados

SELECT COUNT(*) FROM HumanResources.Employee
SELECT * FROM HumanResources.Employee

-- 12) Ver la cantidad total de empleados de acuerdo a su estado civil

SELECT * FROM HumanResources.Employee 
WHERE MaritalStatus='S' 
SELECT * FROM HumanResources.Employee
WHERE MaritalStatus='M'

-- 13) Ver cantidad de empleados por genero

SELECT * FROM HumanResources.Employee
WHERE Gender = 'F' AND MaritalStatus='S' 
SELECT * FROM HumanResources.Employee
WHERE Gender = 'M' AND MaritalStatus='M'

-- 14) Ver listado de Departamentos

select * FROM HumanResources.Department

-- 15) Ver cantidad de empleados por cada departamento

SELECT 
Department,
COUNT(*) AS empleados

FROM HumanResources.vEmployeeDepartment GROUP BY Department
