DROP TABLE "workers";

CREATE TABLE "workers"(
    "id" SERIAL PRIMARY KEY,
    "birthday" DATE NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "salary" NUMERIC(10, 2) NOT NULL
);

INSERT INTO "workers" (
    "birthday", 
    "name", 
    "salary"
    )
VALUES
('1990.10.09', 'Nikita', 300);

INSERT INTO "workers" (
    "birthday", 
    "name", 
    "salary"
    )
VALUES
('1990.10.09', 'Svetlana', 1200);

INSERT INTO "workers" (
    "birthday", 
    "name", 
    "salary"
    )
VALUES
('1980.10.09', 'Yaroslav', 1200),
('1993.10.09', 'Peter', 1000);

UPDATE "workers"
SET "salary" = 200
WHERE "name" = 'Svetlana';

UPDATE "workers"
SET "birthday" = '1987.09.22'
WHERE "id" = 4;

UPDATE "workers"
SET "salary" = 700
WHERE "salary" = 500;

UPDATE "workers"
SET "birthday" = '1999.01.01'
WHERE "id" BETWEEN  3 AND 5;

UPDATE "workers"
SET "name" = 'Evgeniy',
"salary" = 900
WHERE "name" = 'Yaroslav';

SELECT * FROM "workers"
WHERE "id" = 3;

SELECT * FROM "workers"
WHERE "salary" > 400;

SELECT * FROM "workers"
WHERE "salary" <> 500;

SELECT "salary", 
extract(
    'year' from age("birthday")) 
    as "age"
 FROM "workers"
WHERE "name" = 'Evgeniy';

SELECT * FROM "workers"
WHERE "name" = 'Peter';

SELECT * FROM "workers"
WHERE "name" <> 'Peter';

SELECT * FROM "workers"
WHERE age("birthday") = '27 year' 
OR 
"salary" = 1000;

SELECT * FROM "workers"
WHERE 
age("birthday") > '25 year' 
AND age("birthday") <= '28 year';

SELECT * FROM "workers"
WHERE 
(age("birthday") BETWEEN '23 year' 
AND  '27 year') 
OR 
"salary" BETWEEN 400 AND 1000;

SELECT * FROM "workers"
WHERE age("birthday") = '27 year' 
OR 
"salary" <> 400;

DELETE FROM "workers"
WHERE "id" = 7;

DELETE FROM "workers"
WHERE "name" = 'Nikolay';

DELETE FROM "workers"
WHERE age("birthday") = '23 year'; 
