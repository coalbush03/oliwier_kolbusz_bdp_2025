SELECT COUNT(DISTINCT poi.gid) AS n
FROM T2019_KAR_POI_TABLE poi, t2019_kar_land_use_a parks
WHERE poi.type = 'Sporting Goods Store'
AND ST_DWithin(poi.geom, parks.geom, 300);
