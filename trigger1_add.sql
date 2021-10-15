-- description: This trigger makes sure that the Current Price of an item must always match the Amount of the most recent bid for that item
PRAGMA foreign_keys = ON; 
drop trigger if exists trigger1;
create trigger trigger1
after insert on Bids
for each row
begin
  update Item set Currently= (Select Amount
				from Bids,Item
				WHERE Bids.ItemId=Items.ItemID and Bids.ItemID=new.ItemID and Time>ALL(select Time from Bids)) 
  where ItemID = new.ItemID;
end;