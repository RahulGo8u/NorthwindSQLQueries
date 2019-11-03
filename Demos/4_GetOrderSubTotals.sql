Select OrderId, cast(Sum(UnitPrice*Quantity*(1-Discount)) as decimal(10,2)) as Total
from [Order Details]
Group By OrderId