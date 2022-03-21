


--select DATENAME(MONTH,o.OrderDate) as Mes,
--SUM(UnitPrice*Quantity)as total, 
--CompanyName
--from [Order Details] d join Orders o
--on d.OrderID=d.OrderID join Shippers s
--on o.ShipVia =s.ShipperID
--where  YEAR(O.OrderDate) = (SELECT distinct MAX(YEAR(Orderdate)) from Orders) 
--GROUP BY DATENAME(MONTH,o.OrderDate),CompanyName
--ORDER BY mes ASC

SELECT TOP(30) OD.ProductID, P.ProductName, CA.CategoryID,CA.CategoryName, SUM(OD.Quantity) AS Quantity
FROM Customers C INNER JOIN Orders O
ON C.CustomerID = O.CustomerID
INNER JOIN [Order Details] OD
ON OD.OrderID = O.OrderID
INNER JOIN Products P
ON P.ProductID = OD.ProductID
INNER JOIN Categories CA
ON CA.CategoryID = P.CategoryID
GROUP BY OD.ProductID,P.ProductName,CA.CategoryName,CA.CategoryID
ORDER BY Quantity ASC

SELECT TOP(15) OD.ProductID,P.ProductName,CA.CategoryID,CA.CategoryName,SUM(OD.Quantity) AS Quantity
FROM Customers C INNER JOIN Orders O
ON C.CustomerID = O.CustomerID
INNER JOIN [Order Details] OD
ON OD.OrderID = O.OrderID
INNER JOIN Products P
ON P.ProductID = OD.ProductID
INNER JOIN Categories CA
ON CA.CategoryID = P.CategoryID
GROUP BY OD.ProductID,P.ProductName,CA.CategoryName,CA.CategoryID
ORDER BY Quantity DESC