CREATE TABLE IF NOT EXISTS oliwier_kolbusz.intersects AS
SELECT a.rast, b.municipality
FROM rasters.dem AS a, vectors.porto_parishes AS b
WHERE ST_Intersects(a.rast, b.geom) AND b.municipality ilike 'porto';

alter table oliwier_kolbusz.intersects
add column rid SERIAL PRIMARY KEY;

CREATE INDEX idx_intersects_rast_gist ON oliwier_kolbusz.intersects
USING gist (ST_ConvexHull(rast));

SELECT AddRasterConstraints('oliwier_kolbusz'::name, 'intersects'::name,'rast'::name);

