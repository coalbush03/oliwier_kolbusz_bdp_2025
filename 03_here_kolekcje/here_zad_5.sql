UPDATE input_points
SET geom = ST_Transform(geom, 3068);
