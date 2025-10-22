WITH linia AS (
    SELECT ST_MakeLine(geom ORDER BY id) AS geom
    FROM input_points
)

SELECT n.*
FROM T2019_KAR_STREET_NODE n, linia l
WHERE ST_DWithin(
    ST_Transform(n.geom, 3068),  
    l.geom,
    200
);
