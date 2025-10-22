WITH najkrotsza AS (
    SELECT ST_ShortestLine(o3.geom, o4.geom) AS linia
    FROM obiekty o3, obiekty o4
    WHERE o3.nazwa = 'obiekt3' AND o4.nazwa = 'obiekt4'
)
SELECT ST_Area(ST_Buffer(linia, 5)) AS pole_bufora
FROM najkrotsza
LIMIT 1;
