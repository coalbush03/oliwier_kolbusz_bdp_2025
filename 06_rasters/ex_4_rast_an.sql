CREATE TABLE oliwier_kolbusz.paranhos_slope_reclass AS
SELECT a.rid,ST_Reclass(a.rast,1,']0-15]:1, (15-30]:2, (30-9999:3',
'32BF',0)
FROM oliwier_kolbusz.paranhos_slope AS a;
