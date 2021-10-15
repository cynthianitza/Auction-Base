DROP TABLE IF EXISTS Item;
CREATE TABLE Item(
    ItemID INTEGER PRIMARY KEY,
    "Name" TEXT,
    Currently REAL,
    Buy_Price REAL,
    First_Bid REAL,
    Number_of_Bids INTEGER,
    "Started" DATETIME,
    Ends DATETIME,
    SellerID TEXT,
    "Description" TEXT,
    FOREIGN KEY(SellerID) REFERENCES AuctionUser(UserID),
    CHECK(Ends > Started)
);
DROP TABLE IF EXISTS AuctionUser;
CREATE TABLE AuctionUser(
    UserID TEXT PRIMARY KEY,
    Rating INTEGER,
    "Location" TEXT,
    Country TEXT
    
);
DROP TABLE IF EXISTS Bids;
CREATE TABLE Bids(
    ItemID INTEGER,
    BidderID TEXT,
    Amount REAL,
    "Time" DATETIME,
    UNIQUE(ItemID,Time),
    UNIQUE(ItemID,BidderID,Amount),
    FOREIGN KEY(BidderID) REFERENCES AuctionUser(UserID),
    FOREIGN KEY(ItemID) REFERENCES Item(ItemID)
);
DROP TABLE IF EXISTS Category;
CREATE TABLE Category(
    ItemID INTEGER,
    Category TEXT,
    UNIQUE(ItemID,Category),
    FOREIGN KEY(ItemID) REFERENCES Item(ItemID)
);
DROP TABLE IF EXISTS CurrentTime;
CREATE TABLE CurrentTime(
    ActualTime DATETIME
);
INSERT INTO CurrentTime VALUES('2001-12-20 00:00:01');
SELECT * FROM CurrentTime;