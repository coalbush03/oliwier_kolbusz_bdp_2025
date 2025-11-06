CREATE TABLE oliwier_kolbusz.paranhos_slope AS
SELECT a.rid,ST_Slope(a.rast,1,'32BF','PERCENTAGE') as rast
FROM oliwier_kolbusz.paranhos_dem AS a;
