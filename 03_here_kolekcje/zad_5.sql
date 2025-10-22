SELECT nazwa,
       ST_Area(ST_Buffer(geom, 5)) AS pole_bufora
FROM obiekty
WHERE NOT ST_HasArc(geom);

--SELECT SUM(ST_Area(ST_Buffer(geom, 5))) AS pole_bufora
--FROM obiekty
--WHERE NOT ST_HasArc(geom);

