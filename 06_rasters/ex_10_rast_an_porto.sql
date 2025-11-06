CREATE TABLE oliwier_kolbusz.tpi30_porto AS
SELECT ST_TPI(a.rast, 1) AS rast
FROM rasters.dem AS a, vectors.porto_parishes AS b
WHERE ST_Intersects(a.rast, b.geom) AND b.municipality ILIKE 'porto';

CREATE INDEX idx_tpi30_porto_rast_gist ON oliwier_kolbusz.tpi30_porto USING gist (ST_ConvexHull(rast));
SELECT AddRasterConstraints('oliwier_kolbusz'::name, 'tpi30_porto'::name, 'rast'::name);
