
SELECT COUNT(*) AS CATEGORY4
FROM(SELECT itemid
    FROM categories
    group by itemid
    having count(category)=4);