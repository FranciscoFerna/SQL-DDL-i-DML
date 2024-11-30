# SQL Cheat Sheet - Gestión de Alumnos y Asignaturas

Este **cheat sheet** proporciona una descripción breve de los conceptos SQL utilizados en la gestión de **Clases**, **Asignaturas**, **Alumnos**, **Profesores** y **Matrículas**. Cada concepto tiene una explicación corta con ejemplos para su uso.

## 1. **Crear Tablas** (`CREATE TABLE`)
**`CREATE TABLE`** se utiliza para crear nuevas tablas en una base de datos, definiendo las columnas y sus tipos de datos.

### Ejemplo:
```sql
CREATE TABLE CLASSES (
  id_clase NUMERIC NOT NULL,
  nom_classe VARCHAR(25) UNIQUE CHECK (nom_classe = UPPER(nom_classe)),
  CONSTRAINT PK_ID_CLASE PRIMARY KEY (id_clase)
);
```
- Crea la tabla **`CLASSES`** con un identificador **`id_clase`** (numérico), un nombre de clase en mayúsculas, y una clave primaria en **`id_clase`**.

## 2. **Tipos de Datos** (`NUMERIC`, `VARCHAR`, `DATE`)
- **`NUMERIC`**: Se usa para almacenar números (puede incluir decimales).
  
  **Ejemplo**:
  ```sql
  dni_alumne NUMERIC NOT NULL
  ```

- **`VARCHAR(n)`**: Se usa para almacenar texto con una longitud máxima de `n` caracteres.

  **Ejemplo**:
  ```sql
  nom_alumne VARCHAR(25) NOT NULL
  ```

- **`DATE`**: Se usa para almacenar fechas.

  **Ejemplo**:
  ```sql
  data_matriculacio DATE DEFAULT CURRENT_DATE
  ```

## 3. **Claves Primarias** (`PRIMARY KEY`)
**`PRIMARY KEY`** define una columna o un conjunto de columnas cuyo valor debe ser único para cada fila. No pueden tener valores nulos.

### Ejemplo:
```sql
CONSTRAINT PK_ID_CLASE PRIMARY KEY (id_clase)
```
- **`id_clase`** es la clave primaria de la tabla **`CLASSES`**.

## 4. **Claves Foráneas** (`FOREIGN KEY`)
**`FOREIGN KEY`** se utiliza para establecer una relación entre dos tablas, haciendo referencia a una clave primaria de otra tabla.

### Ejemplo:
```sql
CONSTRAINT FK_ID_CLASSE FOREIGN KEY (id_clase) REFERENCES CLASSES(id_clase)
```
- **`id_clase`** en la tabla **`ALUMNES`** es una clave foránea que referencia **`id_clase`** en la tabla **`CLASSES`**.

## 5. **Restricciones de Unicidad** (`UNIQUE`)
**`UNIQUE`** garantiza que todos los valores en una columna o conjunto de columnas sean únicos en la tabla.

### Ejemplo:
```sql
nom_assignatura VARCHAR(25) UNIQUE
```
- **`nom_assignatura`** en la tabla **`ASSIGNATURES`** debe ser único.

## 6. **Restricciones de Chequeo** (`CHECK`)
**`CHECK`** permite definir una condición que debe cumplirse para que los datos sean válidos en una columna.

### Ejemplo:
```sql
tipus_assignatura VARCHAR(10) CHECK (tipus_assignatura IN ('OBLIGATÒRIA', 'OPTATIVA'))
```
- **`tipus_assignatura`** solo puede ser **`OBLIGATÒRIA`** u **`OPTATIVA`**.

## 7. **Insertar Datos** (`INSERT INTO`)
**`INSERT INTO`** se usa para insertar nuevos registros en una tabla.

### Ejemplo:
```sql
INSERT INTO ALUMNES (dni_alumne, nom_alumne, id_clase, nota_final)
VALUES (56789765, 'Romeo', 1, 7.8);
```
- Inserta un nuevo alumno con **`dni_alumne`**, **`nom_alumne`**, **`id_clase`** y **`nota_final`**.

## 8. **Actualizar Datos** (`UPDATE`)
**`UPDATE`** se utiliza para modificar los valores existentes en una tabla.

### Ejemplo:
```sql
UPDATE ALUMNES
SET nota_final = nota_final * 1.10
WHERE id_clase = 1;
```
- Incrementa las **`nota_final`** de todos los alumnos de la **`id_clase = 1`** en un 10%.

## 9. **Eliminar Datos** (`DELETE`)
**`DELETE`** se usa para eliminar filas de una tabla. Asegúrate de usar **`WHERE`** para evitar eliminar todas las filas.

### Ejemplo:
```sql
DELETE FROM ASSIGNATURES
WHERE id_assignatura NOT IN (
  SELECT id_assignatura FROM MATRICULACIONS
);
```
- Elimina todas las asignaturas que no tienen alumnos matriculados.

## 10. **Transacciones y Control de Cambios** (`SAVEPOINT`, `ROLLBACK`, `COMMIT`)
- **`SAVEPOINT`** define un punto intermedio en una transacción.
- **`ROLLBACK`** revierte los cambios hasta el **`SAVEPOINT`** especificado.
- **`COMMIT`** guarda los cambios de forma permanente.

### Ejemplo:
```sql
INSERT INTO ALUMNES (dni_alumne, nom_alumne, id_clase, nota_final) VALUES (32535235, 'Julian', 3, 7.5);
SAVEPOINT creacio_nou_alumne;
INSERT INTO MATRICULACIONS (dni_alumne, id_assignatura) VALUES (32535235, 1);
INSERT INTO MATRICULACIONS (dni_alumne, id_assignatura) VALUES (32535235, 2);
ROLLBACK TO SAVEPOINT creacio_nou_alumne;
COMMIT;
```
- Inserta un nuevo alumno y matricula, luego deshace las matrículas y guarda el cambio definitivo.

## 11. **Eliminar un Alumno y sus Matrículas Automáticamente** (`ON DELETE CASCADE`)
**`ON DELETE CASCADE`** asegura que cuando se elimina un registro de una tabla, los registros relacionados en otras tablas también se eliminan.

### Ejemplo:
```sql
DELETE FROM ALUMNES WHERE dni_alumne = 56789765;
```
- Elimina al alumno con **`dni_alumne = 56789765** y sus matrículas asociadas de forma automática.

---

## Resumen de Funciones:
- **`CREATE TABLE`**: Crea nuevas tablas en la base de datos.
- **`INSERT INTO`**: Inserta datos en una tabla.
- **`UPDATE`**: Actualiza datos existentes.
- **`DELETE`**: Elimina datos de una tabla.
- **`FOREIGN KEY`**: Establece relaciones entre tablas.
- **`CHECK`**: Aplica condiciones a los datos.
- **`ON DELETE CASCADE`**: Elimina registros relacionados al borrar un registro principal.
- **`SAVEPOINT`, `ROLLBACK`, `COMMIT`**: Controla transacciones para asegurar la consistencia de los datos.
