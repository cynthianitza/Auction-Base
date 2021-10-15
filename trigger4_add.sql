-- description: This trigger ensures that in every auction, the Number of Bids attribute corresponds to the actual number of bids for that particular item.
PRAGMA foreign_keys = ON; 
drop trigger if exists trigger4;
create trigger trigger4
after insert on Bids
for each row
begin
  update Item set Number_of_bids = (Select count(*)
                                    from Bids,Item
				                            where Bids.ItemID=Item.ItemID and Bids.ItemID=new.ItemID)
  where ItemID= new.ItemID;
end;