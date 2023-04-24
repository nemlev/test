
create view dbo.vw_SKUPriceâ 
as 
select 
		*
		,dbo.udf_GetSKUPrice (s.ID) as fun
from dbo.SKU s