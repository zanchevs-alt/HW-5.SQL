CREATE TABLE drivers (
  id     INTEGER PRIMARY KEY,
  name   TEXT    NOT NULL,
  car_id INTEGER
);

INSERT INTO drivers VALUES
  (1,'Dana',1),
  (2,'Omar',2),
  (3,'Noa',NULL),
  (4,'Liam',3),
  (5,'Rina',NULL);

CREATE TABLE cars (
  id    INTEGER PRIMARY KEY,
  model TEXT    NOT NULL,
  price REAL    NOT NULL
);

INSERT INTO cars VALUES
  (1,'Toyota Corolla',22000),
  (2,'Honda Civic',24000),
  (3,'Ford Focus',19000),
  (4,'Tesla Model 3',42000);

-- 1.
SELECT d.name, c.model
FROM drivers d
FULL OUTER JOIN cars c ON d.car_id = c.id;

-- 2.
SELECT d.name, c.model
FROM drivers d
FULL OUTER JOIN cars c ON d.car_id = c.id
WHERE d.name IS NULL OR c.model IS NULL;

-- 3.
SELECT d.name, c.model, COALESCE(c.price, 0) AS price
FROM drivers d
FULL OUTER JOIN cars c ON d.car_id = c.id;

-- 4.
-- FULL OUTER JOIN
