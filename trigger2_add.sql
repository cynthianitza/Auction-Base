-- description: This trigger ensures that a user may not bid on an item he or she is also selling.
PRAGMA foreign_keys = ON; 
drop trigger if exists trigger2;
create trigger trigger2
before insert on Bids
for each row
when exist(Select * from Bids,Item
	  where SellerId=new.BidderId and Item.ItemID=new.ItemID)
begin
  select raise(rollback,'No user can bid on an item that he or she is also selling');
end;