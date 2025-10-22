UPDATE obiekty
SET geom = ST_MakePolygon(ST_AddPoint((geom)::geometry, ST_StartPoint(geom)))
WHERE nazwa = 'obiekt4';

--domkniecie