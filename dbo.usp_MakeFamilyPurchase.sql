create procedure dbo.usp_MakeFamilyPurchase
@FamilySurName varchar(255) =''
as
begin 
	update dbo.Family 
	set dbo.Family.BudgetValue = dbo.Family.BudgetValue - (select 
														       sum(Value)
														   from dbo.Basket as b
														       join dbo.Family as f ON f.id = b.ID_Family
														   where f.SurName = @FamilySurName)
    where @FamilySurName = dbo.Family.SurName
    if @@rowcount = 0
		print('такой семьи нет')
end 
