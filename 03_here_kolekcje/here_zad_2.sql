WITH new_buildings AS (
    SELECT t9.geom
    FROM t2019_kar_buildings t9
    LEFT JOIN t2018_kar_buildings t8
        ON t9.geom = t8.geom
    WHERE t8.geom IS NULL
) 
SELECT poi9.type, COUNT(*) AS n
FROM t2019_kar_poi_table poi9
LEFT JOIN t2018_kar_poi_table poi8
        ON poi9.geom = poi8.geom
WHERE poi8.geom IS NULL
AND EXISTS (
    SELECT 1
    FROM new_buildings nb
    WHERE ST_DWithin(poi9.geom, nb.geom, 500)  
)
GROUP BY poi9.type;
