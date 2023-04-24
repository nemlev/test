create function dbo.udf_GetSKUPrice (@ID_SKU numeric)
returns decimal(18,2)
as 
	begin 
		declare @sumznach decimal(18,2)
		select 
			@sumznach = (sum(dbo.Basket.Value) / sum(dbo.Basket.Quantity))
		from dbo.Basket
		where @ID_SKU = dbo.Basket.ID_SKU
		return @sumznach
	end;
