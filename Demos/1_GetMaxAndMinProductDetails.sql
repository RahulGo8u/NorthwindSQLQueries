Select ProductName, Unitprice from products where UnitPrice = (Select Max(UnitPrice) from products)
Union
Select ProductName, Unitprice from products where UnitPrice = (Select Min(UnitPrice) from products)