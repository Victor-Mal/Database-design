DROP TABLE product;

CREATE TABLE "product" (
"id" serial PRIMARY KEY,
"name" varchar(255) NOT NULL,
"price" numeric(10, 2) NOT NULL
);

INSERT INTO product (
    name, 
    price)
VALUES 
('table', 100),
('wardrobe', 450),
('cactus', 20),
('lamp', 77),
('toy', 10),
('cat', 9),
('car', 17000);

DROP TABLE "contract";

CREATE TABLE "contract" (
"id" serial PRIMARY KEY,
"date" DATE NOT NULL
);

INSERT INTO "contract" (
    date)
VALUES 
('2021.09.13'),
('2021.09.13'),
('2021.09.06'),
('2021.09.15'),
('2021.09.08'),
('2021.09.01'),
('2021.09.11');

DROP TABLE "customer";

CREATE TABLE "customer" (
"id" serial PRIMARY KEY,
"customer_name" varchar(255) NOT NULL,
"address" varchar(255) NOT NULL,
"phone" varchar(12) NOT NULL,
"contract_number" int,
FOREIGN KEY ("contract_number") REFERENCES contract ("id")
);

INSERT INTO "customer" (
    customer_name, 
    address, 
    phone,
    contract_number
)
VALUES 
('Oleg', 'London', '0669855896', 1),  
('Tesla', 'Kyiv', '0677896321', 2),    
('Lionel', 'Moscow', '0336984563', 3),
('Helen', 'Warsaw', '0662222896', 4), 
('Olga', 'New York', '0224569871', 5),
('Deniel', 'Delhi', '0998887896', 6), 
('Mikael', 'Paris', '0669855896', 7);

DROP TABLE "order";

CREATE TABLE "order" (
"id" serial PRIMARY KEY,
"customer_id" int,
"product_id" int,
"planned_delivery" numeric NOT NULL,
FOREIGN KEY ("customer_id") REFERENCES customer ("id"),
FOREIGN KEY ("product_id") REFERENCES product ("id")
);

INSERT INTO "order" (
    customer_id, 
    product_id, 
    planned_delivery)
VALUES 
(1, 1, 3),
(2, 1, 1),
(2, 4, 2),
(2, 3, 4),
(3, 2, 7),
(4, 2, 10),
(4, 1, 5),
(5, 5, 9),
(6, 5, 4),
(6, 1, 7),
(6, 2, 13),
(7, 3, 99);

DROP TABLE "shipping";

CREATE TABLE "shipping" (
"id" serial PRIMARY KEY,
"order_id" int,
"date" DATE NOT NULL,
"shipped_goods"  numeric NOT NULL,
FOREIGN KEY ("order_id") REFERENCES "order" ("id")
);

INSERT INTO "shipping" (
    order_id, 
    date, 
    shipped_goods)
VALUES 
(1, '2021.09.13', 3),
(2, '2021.10.13', 1),
(3, '2021.10.13', 2),
(4, '2021.10.13', 4),
(10, '2021.09.08', 7),
(11, '2021.09.11', 13);


