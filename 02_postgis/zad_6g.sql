SELECT b.name
FROM buildings b, roads r
WHERE r.name = 'RoadX'
  AND ST_Y(ST_Centroid(b.geometry)) > (
      SELECT MAX(ST_Y(ST_PointN(r.geometry, 1)))
      FROM roads r WHERE r.name = 'RoadX'
  );
