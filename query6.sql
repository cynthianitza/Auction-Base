
SELECT count(distinct userid)
FROM items
where userid in (select distinct userid
                from bids);