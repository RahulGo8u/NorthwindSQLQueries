--Query Using CTE
with cte as
(
select b.ShippedDate,b.OrderID,
		cast(Sum(UnitPrice*Quantity*(1-Discount)) as decimal(10,2)) as Total
from [Order Details] a
	join Orders b 
	on a.OrderID=b.OrderID
Where b.ShippedDate is not null
	and ShippedDate between '1996-12-24' and '1997-09-30'
group by b.ShippedDate,b.OrderID
)
select *, Year(cte.ShippedDate) Year from cte order by cte.ShippedDate;

--Query Using Correlated Sub Query
Select cast(ShippedDate as date) as ShippedDate,a.OrderId, b.Total,Year(ShippedDate) Year
From
(
	Select OrderID,
		Cast(Sum(UnitPrice*Quantity*(1-discount)) as decimal(10,2)) as Total
	from [Order Details]
	group by OrderID
) as b
join Orders a on a.OrderID=b.OrderID
Where
	ShippedDate between '1996-05-01' and '1997-05-30'
And
	ShippedDate is not null
Order by ShippedDate
