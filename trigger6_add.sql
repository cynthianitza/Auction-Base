-- description: This trigger ensures that all new bids must be placed at the time which matches the current time of your AuctionBase system. 
PRAGMA foreign_keys = ON; 
drop trigger if exists trigger6;
create trigger trigger6
before insert on Bids
for each row

when exist(Select * from Bids,CurrentTime,Item
	                   where new.Time<>ActualTime)
begin
  select raise(rollback,'The time does not match the actual time');
end;