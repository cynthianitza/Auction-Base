
SELECT count(distinct userid)
FROM items
where userid in (select userid
                from users
                where rating >1000);