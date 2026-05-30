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

SELECT d.name, c.model, c.price
FROM   drivers d
FULL OUTER JOIN cars c ON d.car_id = c.id;

SELECT d.name, c.model, c.price
FROM   drivers d
LEFT JOIN cars c ON d.car_id = c.id

UNION ALL

-- Cars with no driver (right-side only rows)
SELECT NULL AS name, c.model, c.price
FROM   cars c
LEFT JOIN drivers d ON d.car_id = c.id
WHERE  d.id IS NULL;

SELECT d.name, c.model
FROM   drivers d
LEFT JOIN cars c ON d.car_id = c.id
WHERE  c.id IS NULL

UNION ALL

SELECT NULL AS name, c.model
FROM   cars c
LEFT JOIN drivers d ON d.car_id = c.id
WHERE  d.id IS NULL;

-- 3.
SELECT
  d.name,
  COALESCE(c.model, '— no car —') AS model,
  COALESCE(c.price, 0)              AS price
FROM   drivers d
LEFT JOIN cars c ON d.car_id = c.id
ORDER BY d.name;
