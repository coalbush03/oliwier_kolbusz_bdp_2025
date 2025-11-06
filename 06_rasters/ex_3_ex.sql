CREATE TABLE tmp_out AS
SELECT lo_from_bytea(0,
 ST_AsGDALRaster(ST_Union(rast), 'GTiff', ARRAY['COMPRESS=DEFLATE',
'PREDICTOR=2', 'PZLEVEL=9'])
 ) AS loid
FROM oliwier_kolbusz.porto_ndvi;
----------------------------------------------
SELECT lo_export(loid, 'C:\Users\junio\Downloads') --> Save the file in a place
--where the user postgres have access. In windows a flash drive usualy works
--fine.
 FROM tmp_out;
----------------------------------------------
SELECT lo_unlink(loid)
 FROM tmp_out; --> Delete the large object.