DROP TABLE IF EXISTS Profesor;
DROP TABLE IF EXISTS Alumno;
DROP TABLE IF EXISTS Bootcamp;
DROP TABLE IF EXISTS Matricula;

CREATE TABLE Profesor (
    id_profesor serial PRIMARY KEY,
    nombre varchar(50) NOT NULL,
    apellidos varchar(50) NOT NULL,
    telefono varchar(15) NOT NULL,
    email varchar(100) UNIQUE NOT NULL
);

CREATE TABLE  Alumno (
    id_alumno serial PRIMARY KEY,
    nombre varchar(50) NOT NULL,
    apellidos varchar(50) NOT NULL,
    telefono varchar(15) NOT NULL,
    email varchar(100) UNIQUE NOT NULL
);

CREATE TABLE Bootcamp (
    id_bootcamp serial PRIMARY KEY,
    nombre varchar(50) NOT NULL,
    id_profesor int NOT NULL,
    duracion int NOT NULL,
    numero_alumnos int NOT NULL,
    FOREIGN KEY (id_profesor) REFERENCES Profesor(id_profesor)
    FOREIGN KEY (id_alumno) REFERENCES Alumno(id_alumno)
    FOREIGN KEY (id_bootcamp) REFERENCES Bootcamp(id_bootcamp)
    
    
);
CREATE TABLE Matricula (
    id_matricula serial PRIMARY KEY,
    id_alumno int NOT NULL,
    pago_al_contado boolean NOT NULL,
    pago_fraccionado boolean NOT NULL,
    estado_de_la_matricula varchar(50) NOT NULL,
    FOREIGN KEY (id_alumno) REFERENCES Alumno(id_alumno)
);
