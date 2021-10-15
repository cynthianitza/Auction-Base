-- description: This trigger ensures that the current time of your AuctionBase system can only advance forward in time, not backward in time.
PRAGMA foreign_keys = ON; 
drop trigger if exists trigger7;
create trigger trigger7
before update on Bids
for each row

when exist(Seleect * from CurrentTime
	  where new.CurrentTime<old.CurrentTime)

begin
  select raise(rollback,'You cannot advance the time backwards');
end;