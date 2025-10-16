CREATE TABLE buildings (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    geometry GEOMETRY(POLYGON)
);

CREATE TABLE roads (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    geometry GEOMETRY(LINESTRING)
);

CREATE TABLE poi (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    geometry GEOMETRY(POINT)
);
