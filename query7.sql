
SELECT COUNT(*)
FROM (SELECT distinct category
        FROM categories,bids
        WHERE categories.itemid=bids.itemid and amount>100
        group by category);