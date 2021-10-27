BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "tipo_atraccion" (
	"nombre"	TEXT NOT NULL UNIQUE,
	PRIMARY KEY("nombre")
);
CREATE TABLE IF NOT EXISTS "usuario" (
	"id_usuario"	INTEGER NOT NULL,
	"nombre"	TEXT NOT NULL,
	"presupuesto"	INTEGER NOT NULL CHECK("presupuesto" > 0),
	"tiempo"	NUMERIC NOT NULL CHECK("tiempo" > 0),
	"preferencia"	TEXT NOT NULL,
	PRIMARY KEY("id_usuario" AUTOINCREMENT),
	FOREIGN KEY("preferencia") REFERENCES "tipo_atraccion"("nombre")
);
CREATE TABLE IF NOT EXISTS "promocion" (
	"id_promo"	INTEGER NOT NULL,
	"nombre"	TEXT NOT NULL,
	"tipo_atracciones"	TEXT NOT NULL,
	"descuento"	NUMERIC,
	"costo"	INTEGER,
	"atraccion_gratis"	INTEGER,
	PRIMARY KEY("id_promo" AUTOINCREMENT),
	FOREIGN KEY("tipo_atracciones") REFERENCES "tipo_atraccion"("nombre"),
	FOREIGN KEY("atraccion_gratis") REFERENCES "atraccion"("id_atraccion")
);
CREATE TABLE IF NOT EXISTS "promocion_atraccion" (
	"id_promo"	INTEGER NOT NULL,
	"id_atraccion"	INTEGER NOT NULL,
	FOREIGN KEY("id_promo") REFERENCES "promocion"("id_promo"),
	FOREIGN KEY("id_atraccion") REFERENCES "atraccion"("id_atraccion")
);
CREATE TABLE IF NOT EXISTS "atraccion" (
	"id_atraccion"	INTEGER NOT NULL,
	"nombre"	INTEGER NOT NULL,
	"costo"	INTEGER NOT NULL CHECK("costo" > 0),
	"duracion"	NUMERIC NOT NULL CHECK("duracion" > 0),
	"cupo"	INTEGER NOT NULL CHECK("cupo" > 0),
	"tipo"	TEXT NOT NULL,
	PRIMARY KEY("id_atraccion" AUTOINCREMENT),
	FOREIGN KEY("tipo") REFERENCES "tipo_atraccion"("nombre")
);
CREATE TABLE IF NOT EXISTS "itinerario" (
	"id_usuario"	INTEGER,
	"id_promo"	INTEGER,
	"id_atraccion"	INTEGER,
	FOREIGN KEY("id_promo") REFERENCES "promocion"("id_promo"),
	FOREIGN KEY("id_usuario") REFERENCES "usuario"("id_usuario"),
	FOREIGN KEY("id_atraccion") REFERENCES "atraccion"("id_atraccion")
);
INSERT INTO "tipo_atraccion" VALUES ('PAISAJE');
INSERT INTO "tipo_atraccion" VALUES ('AVENTURA');
INSERT INTO "tipo_atraccion" VALUES ('DEGUSTACION');
INSERT INTO "usuario" VALUES (1,'Kalista',2000,2,'PAISAJE');
INSERT INTO "usuario" VALUES (2,'Mason',300,4,'DEGUSTACION');
INSERT INTO "usuario" VALUES (3,'Gack',150,4,'AVENTURA');
INSERT INTO "usuario" VALUES (4,'Galadriel',100,4.5,'PAISAJE');
INSERT INTO "usuario" VALUES (5,'Gandalf',100,5,'PAISAJE');
INSERT INTO "usuario" VALUES (6,'Minerva',125,5,'PAISAJE');
INSERT INTO "usuario" VALUES (7,'Ermenor',115,7,'PAISAJE');
INSERT INTO "usuario" VALUES (8,'Mazoga',60,3.5,'PAISAJE');
INSERT INTO "usuario" VALUES (9,'Ruby',45,3,'PAISAJE');
INSERT INTO "usuario" VALUES (10,'Anon',96,6,'PAISAJE');
INSERT INTO "usuario" VALUES (11,'Cyrus',84,7.5,'PAISAJE');
INSERT INTO "usuario" VALUES (12,'Tulgan',30,2.5,'PAISAJE');
INSERT INTO "usuario" VALUES (13,'Ignis',62,6.5,'DEGUSTACION');
INSERT INTO "usuario" VALUES (14,'Vigo',150,3.5,'DEGUSTACION');
INSERT INTO "usuario" VALUES (15,'Myrna',33,6,'DEGUSTACION');
INSERT INTO "usuario" VALUES (16,'Sam',40,8,'DEGUSTACION');
INSERT INTO "usuario" VALUES (17,'Elric',67,3.5,'DEGUSTACION');
INSERT INTO "usuario" VALUES (18,'Tork',48,3,'DEGUSTACION');
INSERT INTO "usuario" VALUES (19,'Jemira',89,2.5,'DEGUSTACION');
INSERT INTO "usuario" VALUES (20,'Zan',70,7,'DEGUSTACION');
INSERT INTO "usuario" VALUES (21,'Harnoth',90,8,'DEGUSTACION');
INSERT INTO "usuario" VALUES (22,'Kipper',104,3.5,'AVENTURA');
INSERT INTO "usuario" VALUES (23,'Leo',55,3,'AVENTURA');
INSERT INTO "usuario" VALUES (24,'Erevon',30,4,'AVENTURA');
INSERT INTO "usuario" VALUES (25,'Mirazumin',65,5.5,'AVENTURA');
INSERT INTO "usuario" VALUES (26,'Uriro',35,6,'AVENTURA');
INSERT INTO "usuario" VALUES (27,'Tana',90,6.5,'AVENTURA');
INSERT INTO "usuario" VALUES (28,'Eowyn',50,8,'AVENTURA');
INSERT INTO "usuario" VALUES (29,'Meldur',116,7.5,'AVENTURA');
INSERT INTO "usuario" VALUES (30,'Jareth',81,7,'AVENTURA');
INSERT INTO "promocion" VALUES (1,'Caminata en la montaña','AVENTURA',NULL,40,NULL);
INSERT INTO "promocion" VALUES (2,'4 en 1','AVENTURA',NULL,80,NULL);
INSERT INTO "promocion" VALUES (3,'En subida','AVENTURA',NULL,20,NULL);
INSERT INTO "promocion" VALUES (4,'Saboresinesperados','DEGUSTACION',NULL,40,NULL);
INSERT INTO "promocion" VALUES (5,'Delicias dulces','DEGUSTACION',NULL,80,NULL);
INSERT INTO "promocion" VALUES (6,'El plato fuerte','DEGUSTACION',NULL,20,NULL);
INSERT INTO "promocion" VALUES (7,'Paisajes élficos','PAISAJE',NULL,50,NULL);
INSERT INTO "promocion" VALUES (8,'Vistas marítimas','PAISAJE',NULL,60,NULL);
INSERT INTO "promocion" VALUES (9,'Paisajes increíbles','PAISAJE',NULL,80,NULL);
INSERT INTO "promocion" VALUES (10,'Triple aventura','AVENTURA',0.2,NULL,NULL);
INSERT INTO "promocion" VALUES (11,'Caminata M','AVENTURA',0.1,NULL,NULL);
INSERT INTO "promocion" VALUES (12,'Aventura de terror','AVENTURA',0.15,NULL,NULL);
INSERT INTO "promocion" VALUES (13,'Sabores tradicionales','DEGUSTACION',0.1,NULL,NULL);
INSERT INTO "promocion" VALUES (14,'Paladares inquietos','DEGUSTACION',0.25,NULL,NULL);
INSERT INTO "promocion" VALUES (15,'Sabores exoticos','DEGUSTACION',0.2,NULL,NULL);
INSERT INTO "promocion" VALUES (16,'Ver para creer','PAISAJE',0.2,NULL,NULL);
INSERT INTO "promocion" VALUES (17,'Vistas marítimas','PAISAJE',0.15,NULL,NULL);
INSERT INTO "promocion" VALUES (18,'Mirar hacia el norte','PAISAJE',0.1,NULL,NULL);
INSERT INTO "promocion" VALUES (19,'Aventura en las montañas','AVENTURA',NULL,NULL,6);
INSERT INTO "promocion" VALUES (20,'Paseo Costero','AVENTURA',NULL,NULL,5);
INSERT INTO "promocion" VALUES (21,'Caminata por los senderos','AVENTURA',NULL,NULL,3);
INSERT INTO "promocion" VALUES (22,'Festin Medieval','DEGUSTACION',NULL,NULL,14);
INSERT INTO "promocion" VALUES (23,'Delicias Alpinas','DEGUSTACION',NULL,NULL,13);
INSERT INTO "promocion" VALUES (24,'Sabores Élficos','DEGUSTACION',NULL,NULL,11);
INSERT INTO "promocion" VALUES (25,'Ver y disfrutar','PAISAJE',NULL,NULL,25);
INSERT INTO "promocion" VALUES (26,'Grandes miradores','PAISAJE',NULL,NULL,22);
INSERT INTO "promocion" VALUES (27,'Vistas magnificas','PAISAJE',NULL,NULL,16);
INSERT INTO "promocion_atraccion" VALUES (1,6);
INSERT INTO "promocion_atraccion" VALUES (1,7);
INSERT INTO "promocion_atraccion" VALUES (1,5);
INSERT INTO "promocion_atraccion" VALUES (2,2);
INSERT INTO "promocion_atraccion" VALUES (2,4);
INSERT INTO "promocion_atraccion" VALUES (2,8);
INSERT INTO "promocion_atraccion" VALUES (2,6);
INSERT INTO "promocion_atraccion" VALUES (3,7);
INSERT INTO "promocion_atraccion" VALUES (3,6);
INSERT INTO "promocion_atraccion" VALUES (4,15);
INSERT INTO "promocion_atraccion" VALUES (4,9);
INSERT INTO "promocion_atraccion" VALUES (4,13);
INSERT INTO "promocion_atraccion" VALUES (5,14);
INSERT INTO "promocion_atraccion" VALUES (5,12);
INSERT INTO "promocion_atraccion" VALUES (5,13);
INSERT INTO "promocion_atraccion" VALUES (6,10);
INSERT INTO "promocion_atraccion" VALUES (6,12);
INSERT INTO "promocion_atraccion" VALUES (7,21);
INSERT INTO "promocion_atraccion" VALUES (7,20);
INSERT INTO "promocion_atraccion" VALUES (7,24);
INSERT INTO "promocion_atraccion" VALUES (8,21);
INSERT INTO "promocion_atraccion" VALUES (8,17);
INSERT INTO "promocion_atraccion" VALUES (9,17);
INSERT INTO "promocion_atraccion" VALUES (9,22);
INSERT INTO "promocion_atraccion" VALUES (9,23);
INSERT INTO "promocion_atraccion" VALUES (9,25);
INSERT INTO "promocion_atraccion" VALUES (10,2);
INSERT INTO "promocion_atraccion" VALUES (10,5);
INSERT INTO "promocion_atraccion" VALUES (10,4);
INSERT INTO "promocion_atraccion" VALUES (11,1);
INSERT INTO "promocion_atraccion" VALUES (11,8);
INSERT INTO "promocion_atraccion" VALUES (11,7);
INSERT INTO "promocion_atraccion" VALUES (12,6);
INSERT INTO "promocion_atraccion" VALUES (12,3);
INSERT INTO "promocion_atraccion" VALUES (13,13);
INSERT INTO "promocion_atraccion" VALUES (13,11);
INSERT INTO "promocion_atraccion" VALUES (14,10);
INSERT INTO "promocion_atraccion" VALUES (14,14);
INSERT INTO "promocion_atraccion" VALUES (14,12);
INSERT INTO "promocion_atraccion" VALUES (15,9);
INSERT INTO "promocion_atraccion" VALUES (15,10);
INSERT INTO "promocion_atraccion" VALUES (15,11);
INSERT INTO "promocion_atraccion" VALUES (16,18);
INSERT INTO "promocion_atraccion" VALUES (16,22);
INSERT INTO "promocion_atraccion" VALUES (17,16);
INSERT INTO "promocion_atraccion" VALUES (17,21);
INSERT INTO "promocion_atraccion" VALUES (17,17);
INSERT INTO "promocion_atraccion" VALUES (18,18);
INSERT INTO "promocion_atraccion" VALUES (18,16);
INSERT INTO "promocion_atraccion" VALUES (19,7);
INSERT INTO "promocion_atraccion" VALUES (19,5);
INSERT INTO "promocion_atraccion" VALUES (20,4);
INSERT INTO "promocion_atraccion" VALUES (20,8);
INSERT INTO "promocion_atraccion" VALUES (21,2);
INSERT INTO "promocion_atraccion" VALUES (21,6);
INSERT INTO "promocion_atraccion" VALUES (22,15);
INSERT INTO "promocion_atraccion" VALUES (22,12);
INSERT INTO "promocion_atraccion" VALUES (23,10);
INSERT INTO "promocion_atraccion" VALUES (23,15);
INSERT INTO "promocion_atraccion" VALUES (24,9);
INSERT INTO "promocion_atraccion" VALUES (24,10);
INSERT INTO "promocion_atraccion" VALUES (25,21);
INSERT INTO "promocion_atraccion" VALUES (25,19);
INSERT INTO "promocion_atraccion" VALUES (26,23);
INSERT INTO "promocion_atraccion" VALUES (26,18);
INSERT INTO "promocion_atraccion" VALUES (27,23);
INSERT INTO "promocion_atraccion" VALUES (27,20);
INSERT INTO "promocion_atraccion" VALUES (1,6);
INSERT INTO "promocion_atraccion" VALUES (1,7);
INSERT INTO "promocion_atraccion" VALUES (1,5);
INSERT INTO "promocion_atraccion" VALUES (2,2);
INSERT INTO "promocion_atraccion" VALUES (2,4);
INSERT INTO "promocion_atraccion" VALUES (2,8);
INSERT INTO "promocion_atraccion" VALUES (2,6);
INSERT INTO "promocion_atraccion" VALUES (3,7);
INSERT INTO "promocion_atraccion" VALUES (3,6);
INSERT INTO "promocion_atraccion" VALUES (4,15);
INSERT INTO "promocion_atraccion" VALUES (4,9);
INSERT INTO "promocion_atraccion" VALUES (4,13);
INSERT INTO "promocion_atraccion" VALUES (5,14);
INSERT INTO "promocion_atraccion" VALUES (5,12);
INSERT INTO "promocion_atraccion" VALUES (5,13);
INSERT INTO "promocion_atraccion" VALUES (6,10);
INSERT INTO "promocion_atraccion" VALUES (6,12);
INSERT INTO "promocion_atraccion" VALUES (7,21);
INSERT INTO "promocion_atraccion" VALUES (7,20);
INSERT INTO "promocion_atraccion" VALUES (7,24);
INSERT INTO "promocion_atraccion" VALUES (8,21);
INSERT INTO "promocion_atraccion" VALUES (8,17);
INSERT INTO "promocion_atraccion" VALUES (9,17);
INSERT INTO "promocion_atraccion" VALUES (9,22);
INSERT INTO "promocion_atraccion" VALUES (9,23);
INSERT INTO "promocion_atraccion" VALUES (9,25);
INSERT INTO "promocion_atraccion" VALUES (10,2);
INSERT INTO "promocion_atraccion" VALUES (10,5);
INSERT INTO "promocion_atraccion" VALUES (10,4);
INSERT INTO "promocion_atraccion" VALUES (11,1);
INSERT INTO "promocion_atraccion" VALUES (11,8);
INSERT INTO "promocion_atraccion" VALUES (11,7);
INSERT INTO "promocion_atraccion" VALUES (12,6);
INSERT INTO "promocion_atraccion" VALUES (12,3);
INSERT INTO "promocion_atraccion" VALUES (13,13);
INSERT INTO "promocion_atraccion" VALUES (13,11);
INSERT INTO "promocion_atraccion" VALUES (14,10);
INSERT INTO "promocion_atraccion" VALUES (14,14);
INSERT INTO "promocion_atraccion" VALUES (14,12);
INSERT INTO "promocion_atraccion" VALUES (15,9);
INSERT INTO "promocion_atraccion" VALUES (15,10);
INSERT INTO "promocion_atraccion" VALUES (15,11);
INSERT INTO "promocion_atraccion" VALUES (16,18);
INSERT INTO "promocion_atraccion" VALUES (16,22);
INSERT INTO "promocion_atraccion" VALUES (17,16);
INSERT INTO "promocion_atraccion" VALUES (17,21);
INSERT INTO "promocion_atraccion" VALUES (17,17);
INSERT INTO "promocion_atraccion" VALUES (18,18);
INSERT INTO "promocion_atraccion" VALUES (18,16);
INSERT INTO "promocion_atraccion" VALUES (19,7);
INSERT INTO "promocion_atraccion" VALUES (19,5);
INSERT INTO "promocion_atraccion" VALUES (20,4);
INSERT INTO "promocion_atraccion" VALUES (20,8);
INSERT INTO "promocion_atraccion" VALUES (21,2);
INSERT INTO "promocion_atraccion" VALUES (21,6);
INSERT INTO "promocion_atraccion" VALUES (22,15);
INSERT INTO "promocion_atraccion" VALUES (22,12);
INSERT INTO "promocion_atraccion" VALUES (23,10);
INSERT INTO "promocion_atraccion" VALUES (23,15);
INSERT INTO "promocion_atraccion" VALUES (24,9);
INSERT INTO "promocion_atraccion" VALUES (24,10);
INSERT INTO "promocion_atraccion" VALUES (25,21);
INSERT INTO "promocion_atraccion" VALUES (25,19);
INSERT INTO "promocion_atraccion" VALUES (26,23);
INSERT INTO "promocion_atraccion" VALUES (26,18);
INSERT INTO "promocion_atraccion" VALUES (27,23);
INSERT INTO "promocion_atraccion" VALUES (27,20);
INSERT INTO "atraccion" VALUES (1,'Mordor',25,3,4,'AVENTURA');
INSERT INTO "atraccion" VALUES (2,'Moria',10,2,6,'AVENTURA');
INSERT INTO "atraccion" VALUES (3,'Bosque Negro',3,4,12,'AVENTURA');
INSERT INTO "atraccion" VALUES (4,'Bahia de Forochel',20,3,40,'AVENTURA');
INSERT INTO "atraccion" VALUES (5,'Montañas de Angmar',15,1.5,100,'AVENTURA');
INSERT INTO "atraccion" VALUES (6,'Montañas Asperas',40,5,50,'AVENTURA');
INSERT INTO "atraccion" VALUES (7,'Meseta de Gorgoroth',10,2,20,'AVENTURA');
INSERT INTO "atraccion" VALUES (8,'Mar de Nurnen',50,3,100,'AVENTURA');
INSERT INTO "atraccion" VALUES (9,'Lothlórien',35,1,30,'DEGUSTACION');
INSERT INTO "atraccion" VALUES (10,'La Comarca',30,6.5,150,'DEGUSTACION');
INSERT INTO "atraccion" VALUES (11,'Camino del viejo bosque',20,2,50,'DEGUSTACION');
INSERT INTO "atraccion" VALUES (12,'Isengard',40,3,40,'DEGUSTACION');
INSERT INTO "atraccion" VALUES (13,'Montañas Azules',20,2,30,'DEGUSTACION');
INSERT INTO "atraccion" VALUES (14,'Cardolan',80,4,100,'DEGUSTACION');
INSERT INTO "atraccion" VALUES (15,'Pinnath Gelin',30,2,50,'DEGUSTACION');
INSERT INTO "atraccion" VALUES (16,'Harondor',50,3,30,'PAISAJE');
INSERT INTO "atraccion" VALUES (17,'Puertos de Umbar',70,5,80,'PAISAJE');
INSERT INTO "atraccion" VALUES (18,'Torre Oscura',50,3,50,'PAISAJE');
INSERT INTO "atraccion" VALUES (19,'Minas Morgul',30,2,30,'PAISAJE');
INSERT INTO "atraccion" VALUES (20,'Belfalas',40,3,20,'PAISAJE');
INSERT INTO "atraccion" VALUES (21,'Tierras Pardas',80,5,30,'PAISAJE');
INSERT INTO "atraccion" VALUES (22,'Colinas de Hierro',40,4,30,'PAISAJE');
INSERT INTO "atraccion" VALUES (23,'Abismo de Helm',25,2,15,'PAISAJE');
INSERT INTO "atraccion" VALUES (24,'Erebor',20,3,32,'PAISAJE');
INSERT INTO "atraccion" VALUES (25,'Minas Tirith',25,2.5,25,'PAISAJE');
COMMIT;
