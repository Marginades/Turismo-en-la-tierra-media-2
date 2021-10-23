BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "usuario" (
	"id_usuario"	INTEGER NOT NULL,
	"nombre"	TEXT NOT NULL,
	"presupuesto"	INTEGER NOT NULL CHECK("presupuesto" > 0),
	"tiempo"	NUMERIC NOT NULL CHECK("tiempo" > 0),
	"preferencia"	INTEGER NOT NULL,
	PRIMARY KEY("id_usuario" AUTOINCREMENT),
	FOREIGN KEY("preferencia") REFERENCES "tipo_atraccion"("id_tipo")
);
COMMIT;
