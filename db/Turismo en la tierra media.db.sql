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
	FOREIGN KEY("atraccion_gratis") REFERENCES "atraccion"("id_atraccion"),
	FOREIGN KEY("tipo_atracciones") REFERENCES "tipo_atraccion"("nombre")
);
CREATE TABLE IF NOT EXISTS "promocion_atraccion" (
	"id_promo"	INTEGER NOT NULL,
	"id_atraccion"	INTEGER NOT NULL,
	FOREIGN KEY("id_atraccion") REFERENCES "atraccion"("id_atraccion"),
	FOREIGN KEY("id_promo") REFERENCES "promocion"("id_promo")
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
	FOREIGN KEY("id_atraccion") REFERENCES "atraccion"("id_atraccion"),
	FOREIGN KEY("id_usuario") REFERENCES "usuario"("id_usuario")
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
COMMIT;
