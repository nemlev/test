
create view dbo.vw_SKUPrice� 
as 
select 
		*
		,dbo.udf_GetSKUPrice (s.ID) as fun
from dbo.SKU s