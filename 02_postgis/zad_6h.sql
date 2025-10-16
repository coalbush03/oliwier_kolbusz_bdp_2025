SELECT ST_Area(
    ST_SymDifference(
        b.geometry,
        ST_GeomFromText('POLYGON((4 7, 6 7, 6 8, 4 8, 4 7))')
    )
) AS pole
FROM buildings b
WHERE b.name = 'BuildingC';
