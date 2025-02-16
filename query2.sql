create table Profesor (
    id_profesor serial primary key,
    nombre varchar(50) not null,
    apellidos varchar(50) not null,
    telefono varchar(15) not null,
    email varchar(100) unique not null
);

create table  Alumno (
    id_alumno serial primary key,
    nombre varchar(50) not null,
    apellidos varchar(50) not null,
    telefono varchar(15) not null,
    email varchar(100) unique not null
);

create table Bootcamp (
    id_bootcamp serial primary key,
    nombre varchar(50) not null,
    id_profesor int not null,
    duracion int not null,
    numero_alumnos int not null,
    foreign key (id_profesor) references Profesor(id_profesor)
);

create table Matricula (
    id_matricula serial primary key,
    id_alumno int not null,
    pago_al_contado boolean not null,
    pago_fraccionado boolean not null,
    estado_de_la_matricula varchar(50) not null,
    foreign key (id_alumno) references Alumno(id_alumno)
);
