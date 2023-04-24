create trigger dbo.tr_basket_insert_update
on dbo.basket
for insert 
as 
 begin                                  
  if(select 
         count(*) 
     from inserted 
	 where id_sku in (select 
	                      id_sku 
	                  from inserted 
					  group by id_sku 
					  having count(*) >= 2)) >= 2
  begin
    update dbo.basket
    set discountvalue = value * 0.05
    from dbo.basket b
    where b.id = (select 
	                id 
				  from inserted);
  end
 else
   begin
    update dbo.basket
    set discountvalue = 0
    from dbo.basket b
    where b.id = (select 
				      id 
			     from inserted);
   end
end
