SELECT ST_Distance(b.geometry, p.geometry) AS dist
FROM buildings b, poi p
WHERE b.name = 'BuildingC' AND p.name = 'K';
