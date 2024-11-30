CREATE TABLE CLASSES (
  id_clase NUMERIC NOT NULL,
  nom_classe VARCHAR(25) UNIQUE CHECK (nom_classe = UPPER(nom_classe)),

  CONSTRAINT PK_ID_CLASE PRIMARY KEY (id_clase)
);

CREATE TABLE ASSIGNATURES (
  id_assignatura NUMERIC NOT NULL,
  nom_assignatura VARCHAR(25) UNIQUE,
  tipus_assignatura VARCHAR(10) CHECK (tipus_assignatura in ('OBIGATÒRIA', 'OPTATIVA')),

  CONSTRAINT PK_ID_ASSIGNATURA PRIMARY KEY (id_assignatura)
);

CREATE TABLE ALUMNES (
  dni_alumne NUMERIC NOT NULL,
  nom_alumne VARCHAR(25) NOT NULL,
  id_clase NUMERIC NOT NULL, 
  nota_final NUMERIC,

  CONSTRAINT PK_DNI_ALUMNE PRIMARY KEY (dni_alumne),
  CONSTRAINT FK_ID_CLASSE FOREIGN KEY (id_clase) REFERENCES CLASSES(id_clase)
);

CREATE TABLE PROFESSORS(
  dni_professor NUMERIC,
  nom_professor VARCHAR(30) NOT NULL,
  especialitat VARCHAR UNIQUE,

  CONSTRAINT PK_DNI_PROFESSOR PRIMARY KEY (dni_professor)
);

CREATE TABLE ASSIGNACIONS (
  id_assignatura NUMERIC,
  dni_professor NUMERIC,

  CONSTRAINT PK_ID_ASSIGNATURA_DNI_PROFESSOR PRIMARY KEY (id_assignatura, dni_professor),
  CONSTRAINT FK_ID_ASSIGNATURA FOREIGN KEY (id_assignatura) REFERENCES  ASSIGNATURES(id_assignatura),
  CONSTRAINT FK_DNI_PROFESSOR FOREIGN KEY (dni_professor) REFERENCES  PROFESSORS(dni_professor)
);

CREATE TABLE MATRICULACIONS (
  dni_alumne NUMERIC,
  id_assignatura NUMERIC,
  data_matriculacio DATE DEFAULT CURRENT_DATE,

  CONSTRAINT PK_DNI_ALUMNE_ID_ASSIGNATURA PRIMARY KEY (dni_alumne, id_assignatura),
  CONSTRAINT FK_DNI_ALUMNE FOREIGN KEY (dni_alumne) REFERENCES ALUMNES(dni_alumne),
  CONSTRAINT FK_ID_ASSIGNATURA FOREIGN KEY (id_assignatura) REFERENCES ASSIGNATURES(id_assignatura)
);

/* Dades per Clases */
INSERT INTO CLASSES (id_clase, nom_classe) VALUES ('1', 'MATES');
INSERT INTO CLASSES (id_clase, nom_classe) VALUES ('2', 'CATALAN');
INSERT INTO CLASSES (id_clase, nom_classe) VALUES ('3', 'CASTELLANO');

/* Dades per Assignatures */
INSERT INTO ASSIGNATURES (id_assignatura, nom_assignatura, tipus_assignatura) VALUES ('1', 'MATES', 'OPTATIVA');
INSERT INTO ASSIGNATURES (id_assignatura, nom_assignatura, tipus_assignatura) VALUES ('2', 'CATALAN', 'OBIGATÒRIA');
INSERT INTO ASSIGNATURES (id_assignatura, nom_assignatura, tipus_assignatura) VALUES ('3', 'CASTELLANO', 'OBIGATÒRIA');
INSERT INTO ASSIGNATURES (id_assignatura, nom_assignatura, tipus_assignatura) VALUES ('4', 'INGLES', 'OPTATIVA');

/* Dades per Alumnes */
INSERT INTO ALUMNES (dni_alumne, nom_alumne, id_clase, nota_final) VALUES ('56789765', 'Romeo', '1', 7.8);
INSERT INTO ALUMNES (dni_alumne, nom_alumne, id_clase, nota_final) VALUES ('13235346', 'Alvaro', '2', 9.4);
INSERT INTO ALUMNES (dni_alumne, nom_alumne, id_clase, nota_final) VALUES ('98778675', 'Pepe', '3', 4.8);
INSERT INTO ALUMNES (dni_alumne, nom_alumne, id_clase, nota_final) VALUES ('21143657', 'Laura', '2', 3.2);
INSERT INTO ALUMNES (dni_alumne, nom_alumne, id_clase, nota_final) VALUES ('43654757', 'Agustin', '1', 1.2);

/* Dades per Professors */
INSERT INTO PROFESSORS (dni_professor, nom_professor, especialitat) VALUES ('45676557', 'Julian', 'mates');
INSERT INTO PROFESSORS (dni_professor, nom_professor, especialitat) VALUES ('43385923', 'Irene', 'castellano');
INSERT INTO PROFESSORS (dni_professor, nom_professor, especialitat) VALUES ('93280533', 'Carla', 'ingles');

/* Asignacions entre profesores y asignaturas */
INSERT INTO ASSIGNACIONS (id_assignatura, dni_professor) VALUES ('1', '43385923');
INSERT INTO ASSIGNACIONS (id_assignatura, dni_professor) VALUES ('2', '43385923');
INSERT INTO ASSIGNACIONS (id_assignatura, dni_professor) VALUES ('3', '45676557');
INSERT INTO ASSIGNACIONS (id_assignatura, dni_professor) VALUES ('4', '93280533');

/* Matricular alumnos en asignaturas */
INSERT INTO MATRICULACIONS (dni_alumne, id_assignatura) VALUES ('56789765', '1');
INSERT INTO MATRICULACIONS (dni_alumne, id_assignatura) VALUES ('13235346', '2');
INSERT INTO MATRICULACIONS (dni_alumne, id_assignatura) VALUES ('98778675', '3');
INSERT INTO MATRICULACIONS (dni_alumne, id_assignatura) VALUES ('21143657', '2');
INSERT INTO MATRICULACIONS (dni_alumne, id_assignatura) VALUES ('43654757', '4');

/* Incrementa les notes finals de tots els alumnes que pertanyen a la classe 1A en un 10%. */
UPDATE ALUMNES
SET nota_final = nota_final * 1.10;

/* Actualitza el tipus d'una assignatura específica de OPTATIVA a OBLIGATÒRIA. */
UPDATE ASSIGNATURES
SET tipus_assignatura = 'OBIGATÒRIA'
WHERE tipus_assignatura = 'OPTATIVA';

/* Eliminar todas las assignaturas que no tienen alumnos matriculados */
DELETE FROM ASSIGNATURES
WHERE id_assignatura NOT IN (
  SELECT id_assignatura
  FROM MATRICULACIONS
);

/* Eliminar a un alumno especifico y sus matriculas automaticamente */
DELETE FROM ALUMNES
WHERE dni_alumne = 56789765;

/* Transacció */
INSERT INTO ALUMNES (dni_alumne, nom_alumne, id_clase, nota_final) VALUES ('32535235', 'Julian', '3', 7.5);
SAVEPOINT creacio_nou_alumne;
INSERT INTO MATRICULACIONS (dni_alumne, id_assignatura) VALUES ('32535235', '1');
INSERT INTO MATRICULACIONS (dni_alumne, id_assignatura) VALUES ('32535235', '2');
ROLLBACK TO SAVEPOINT creacio_nou_alumne;
COMMIT