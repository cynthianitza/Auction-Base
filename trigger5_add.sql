-- description: This trigger ensures that any new bid for a particular item must have a higher amount than any of the previous bids for that particular item.
PRAGMA foreign_keys = ON; 
drop trigger if exists trigger5;
create trigger trigger5
before insert on Bids
for each row
when exist(Select * from Bids,Item
		where Bids.ItemID=Item.ItemID and Bids.ItemID=new.ItemID and new.Amount<ANY		(SELECT Amount from Bids,Item where Bids.ItemID=Item.ItemID and 
		     																												Bids.ItemID=new.ItemID)
begin
 	select raise(rollback,'The amount of the bid should be higher than any of the previous ones')
end;