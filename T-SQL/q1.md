![Image](https://i.imgur.com/RJVwwJF.png)

```SQL Server
select	
		e.EmployeeID as '員工編號',
		e.FirstName as '員工姓名',
		isnull(e.ReportsTo,0) as '主管編號',
		case isnull(e.ReportsTo,0) when 0 then '我就是主管' else m.FirstName end as '主管姓名'
from dbo.Employees e left join dbo.Employees m
on m.EmployeeID = e.ReportsTo

```

note:

1. Left join 才有含null的欄位，inter join沒有
2. isnull的用法是isnull(判斷值,是null要顯示甚麼)
3. on都是+在join後面