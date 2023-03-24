CREATE SCHEMA Equipo6;
USE Equipo6; # PARA INDICAR QUE SE HACE REFERENCIA AL ESQUEMA EQUIPO6, RECIEN CREADO. 

CREATE TABLE Usuarios( #LA TABLA USUARIOS, ES LA BASE Y POR LO TANTO, NO TIENE FOREIGN KEY ASOCIADA.
usuarios_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
nombreUsuario VARCHAR (25),
contrasenia VARCHAR (12),
correoElectronico VARCHAR (35)
); 

CREATE TABLE Cursos ( # EJEMPLO: 5° BÁSICO B - 4° MEDIO H
cursos_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
nombreCurso VARCHAR (10),
nivelCurso VARCHAR (10)
);

CREATE TABLE LibroClases (
libroClases_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
calificaciones INTEGER

);

CREATE TABLE Juegos (
juegos_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
tipoDeJuego VARCHAR (25),
descripcionJuego VARCHAR (40)

);

CREATE TABLE ProgresoJuegos (
progresoJuegos_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
estadoJuego BOOLEAN #EJ: ACTIVO O INACTIVO.

);

CREATE TABLE Lecciones (
lecciones_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
nombreLeccion VARCHAR (15),
puntajeLeccion INTEGER,
referenteApoyo VARCHAR (50)

);

CREATE TABLE ProgresoUsuarios (
progresoUsuario_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
nivel INTEGER, #1,2,3
rango DOUBLE, #EJ: ENTRE 0.0 - 100.0 DE ACIERTOS
puntajeAprobatorio DOUBLE #EJ: 0.80 --> 80%

);

#VAMOS A RENOMBRAR LA TABLA USUARIOS Y PROGRESO USUARIOS, PARA INCORPORAR LOS NOMBRES EN PLURAL.alter

ALTER TABLE Usuarios RENAME COLUMN usuario_id TO usuarios_id;

ALTER TABLE ProgresoUsuario RENAME TO ProgresoUsuarios;

ALTER TABLE ProgresoUsuarios RENAME COLUMN progresoUsuario_id TO ProgresoUsuarios_id;

# AGREGA UNA COLUMNA A UNA DE LAS TABLAS (DIFEENTES A LA TABLA BASE USUARIOS).
ALTER TABLE Usuarios ADD cursos_id INTEGER NOT NULL;

#AHORA QUE YA TENEMOS TODAS LAS TABLITAS, PASAMOS A ALTERARLAS E INCORPORAR LAS RESPECTIVAS FOREIGN KEY.
ALTER TABLE Usuarios
ADD FOREIGN KEY (cursos_id) REFERENCES Cursos(cursos_id);

#AHORA REPETIR CON DEMÁS TABLAS

#---------------------------------------------------------------------------------------------------------
ALTER TABLE Usuarios ADD libroClases_id INTEGER NOT NULL;

ALTER TABLE Usuarios
ADD FOREIGN KEY (libroClases_id) REFERENCES libroClases(libroClases_id);

#-----------------------------------------------------------------------------------------------------------
ALTER TABLE Usuarios ADD progresoUsuarios_id INTEGER NOT NULL;

ALTER TABLE Usuarios
ADD FOREIGN KEY (progresoUsuarios_id) REFERENCES progresoUsuarios(progresoUsuarios_id);


#-----------------------------------------------------------------------------------------------------------
ALTER TABLE Usuarios ADD juegos_id INTEGER NOT NULL;

ALTER TABLE Usuarios
ADD FOREIGN KEY (juegos_id) REFERENCES juegos(juegos_id);


#------------------------------------------------------------------------------------------------------------
ALTER TABLE progresoJuegos ADD juegos_id INTEGER NOT NULL;

ALTER TABLE progresoJuegos
ADD FOREIGN KEY (juegos_id) REFERENCES juegos(juegos_id);

#------------------------------------------------------------------------------------------------------------
ALTER TABLE lecciones ADD juegos_id INTEGER NOT NULL;

ALTER TABLE lecciones
ADD FOREIGN KEY (juegos_id) REFERENCES juegos(juegos_id);

#------------------------------------------------------------------------------------------------------------

#INTENTAR CONSULTA MEDIANTE JOIN

SELECT Usuarios.nombreUsuario, progresoUsuarios.nivel FROM Usuarios JOIN progresoUsuarios ON (Usuarios.progresoUsuario_id=progresoUsuarios.progresoUsuario_id);

DROP SCHEMA Equipo6; #PARA REINICIAR