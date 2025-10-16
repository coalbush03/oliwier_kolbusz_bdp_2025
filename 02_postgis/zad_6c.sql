SELECT name, ST_Area(geometry) AS pole
FROM buildings
ORDER BY name;
