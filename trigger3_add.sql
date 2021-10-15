-- description: This trigger ensures that no auction may have a bid before its start time or after its end time.
PRAGMA foreign_keys = ON; 
drop trigger if exists trigger3;
create trigger trigger3
before insert on Bids
for each row
when exist(Select * from Bids,Item
	  where Bids.ItemID=Item.ItemID and Bids.ItemID=new.ItemID and (Item.Started>new.Time or Item.Ends<new.Time))
begin
  select raise(rollback,'Your bid is in the wrong time');
end;