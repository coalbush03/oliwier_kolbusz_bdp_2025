SELECT * FROM t2019_kar_buildings t9
LEFT JOIN t2018_kar_buildings t8 ON t9.geom = t8.geom
WHERE t8.geom IS NULL;