# **Cheat Sheet: Comandos Útiles de PostgreSQL en la Terminal**

## 1. **`\d`** - **Describe una tabla**
**Descripción**: El comando **`\d`** muestra la estructura de una tabla, es decir, las columnas y sus tipos de datos.

### Ejemplo:
```sql
\d ALUMNES
```
- Muestra la estructura de la tabla **`ALUMNES`**, con los nombres de las columnas, tipos de datos, claves primarias y foráneas.

## 2. **`\d+`** - **Describe una tabla con más detalles**
**Descripción**: Similar a **`\d`**, pero agrega información adicional como restricciones (FOREIGN KEY, CHECK, etc.) y detalles sobre las tablas como el tamaño de los índices.

### Ejemplo:
```sql
\d+ ALUMNES
```
- Muestra la estructura de la tabla **`ALUMNES`**, además de detalles extra como los índices y las restricciones de la tabla.

## 3. **`\dt`** - **Listar todas las tablas**
**Descripción**: Muestra todas las tablas en la base de datos actual.

### Ejemplo:
```sql
\dt
```
- Muestra todas las tablas de la base de datos en la que estás trabajando.

## 4. **`\dt <nombre_de_tabla>`** - **Mostrar detalles de una tabla específica**
**Descripción**: Muestra información sobre una tabla específica (como su nombre, tipo y propietario).

### Ejemplo:
```sql
\dt ALUMNES
```
- Muestra detalles sobre la tabla **`ALUMNES`**.

## 5. **`\l`** - **Listar todas las bases de datos**
**Descripción**: Muestra todas las bases de datos disponibles en el servidor PostgreSQL.

### Ejemplo:
```sql
\l
```
- Muestra todas las bases de datos en el servidor de PostgreSQL.

## 6. **`\c`** - **Conectar a una base de datos**
**Descripción**: Permite conectarse a una base de datos específica.

### Ejemplo:
```sql
\c nombre_base_de_datos
```
- Conecta a la base de datos **`nombre_base_de_datos`**.

## 7. **`\i`** - **Ejecutar un archivo SQL**
**Descripción**: Ejecuta un script SQL almacenado en un archivo. Esto es útil para ejecutar varias consultas de una vez desde un archivo.

### Ejemplo:
```sql
\i /ruta/al/archivo.sql
```
- Ejecuta el script SQL ubicado en **`/ruta/al/archivo.sql`**.

## 8. **`\q`** - **Salir de psql**
**Descripción**: Sale del intérprete de comandos de PostgreSQL.

### Ejemplo:
```sql
\q
```
- Sale de la sesión actual de **psql**.

## 9. **`\h`** - **Obtener ayuda sobre un comando SQL**
**Descripción**: Muestra la sintaxis y descripción de un comando SQL.

### Ejemplo:
```sql
\h SELECT
```
- Muestra la ayuda para el comando **`SELECT`**.

## 10. **`\x`** - **Activar/desactivar el modo de formato expandido**
**Descripción**: Cambia el formato de salida de los resultados de las consultas. Cuando está activado, muestra los resultados de manera más legible (por ejemplo, muestra cada columna en una nueva línea).

### Ejemplo:
```sql
\x
SELECT * FROM ALUMNES;
```
- Activa el formato expandido para una salida más detallada de los resultados de la consulta.

## 11. **`\df`** - **Listar funciones definidas por el usuario**
**Descripción**: Muestra todas las funciones definidas por el usuario en la base de datos.

### Ejemplo:
```sql
\df
```
- Muestra todas las funciones definidas por el usuario en la base de datos actual.

## 12. **`\dS`** - **Mostrar objetos del esquema**
**Descripción**: Muestra todas las tablas, vistas, secuencias y otros objetos dentro del esquema de la base de datos actual.

### Ejemplo:
```sql
\dS
```
- Muestra todos los objetos del esquema de la base de datos.

## 13. **`\di`** - **Listar los índices**
**Descripción**: Muestra todos los índices definidos en la base de datos.

### Ejemplo:
```sql
\di
```
- Muestra todos los índices en la base de datos actual.

## 14. **`\du`** - **Listar los roles de PostgreSQL**
**Descripción**: Muestra todos los roles y usuarios definidos en PostgreSQL.

### Ejemplo:
```sql
\du
```
- Muestra todos los roles y usuarios en el servidor PostgreSQL.

## 15. **`\!`** - **Ejecutar comandos del sistema operativo**
**Descripción**: Permite ejecutar comandos del sistema operativo directamente desde **psql**.

### Ejemplo:
```sql
\! ls
```
- Muestra los archivos del directorio actual en el sistema operativo.

## 16. **`SELECT`** - **Realizar consultas a la base de datos**
**Descripción**: Permite realizar consultas SQL sobre las tablas para extraer datos.

### Ejemplo:
```sql
SELECT * FROM ALUMNES;
```
- Muestra todos los registros de la tabla **`ALUMNES`**.

## 17. **`BEGIN` y `COMMIT`** - **Control de transacciones**
**Descripción**: **`BEGIN`** inicia una transacción, y **`COMMIT`** guarda los cambios realizados. Si no se ejecuta **`COMMIT`**, los cambios no se harán permanentes.

### Ejemplo:
```sql
BEGIN;
UPDATE ALUMNES SET nota_final = 8.0 WHERE dni_alumne = 56789765;
COMMIT;
```
- Inicia una transacción, actualiza la nota de un alumno y luego guarda los cambios.

## 18. **`ROLLBACK`** - **Revertir una transacción**
**Descripción**: Revierte los cambios realizados desde el último **`BEGIN`** o **`SAVEPOINT`**.

### Ejemplo:
```sql
ROLLBACK;
```
- Revierte todos los cambios realizados en la transacción actual.

## 19. **`VACUUM`** - **Recuperar espacio de disco**
**Descripción**: Limpia y optimiza la base de datos, recuperando el espacio de disco no utilizado.

### Ejemplo:
```sql
VACUUM;
```
- Realiza una operación de **`VACUUM`** en la base de datos, optimizando el almacenamiento.

## 20. **`ANALYZE`** - **Actualizar estadísticas de la base de datos**
**Descripción**: Recoge estadísticas sobre las tablas y sus índices para ayudar al optimizador de consultas a tomar mejores decisiones.

### Ejemplo:
```sql
ANALYZE;
```
- Ejecuta **`ANALYZE`** para actualizar las estadísticas de la base de datos.

---

### **Resumen de Comandos Útiles**:

| Comando        | Descripción                                                                                       | Ejemplo                           |
|----------------|---------------------------------------------------------------------------------------------------|-----------------------------------|
| `\d`           | Muestra la estructura de una tabla                                                                | `\d ALUMNES`                      |
| `\d+`          | Muestra la estructura de una tabla con detalles adicionales                                        | `\d+ ALUMNES`                     |
| `\dt`          | Muestra todas las tablas                                                                           | `\dt`                             |
| `\l`           | Muestra todas las bases de datos                                                                   | `\l`                              |
| `\c`           | Conectar a una base de datos                                                                      | `\c nombre_base_de_datos`         |
| `\i`           | Ejecuta un archivo SQL                                                                            | `\i /ruta/al/archivo.sql`         |
| `\q`           | Salir del intérprete de comandos PostgreSQL                                                       | `\q`                              |
| `\h`           | Muestra la ayuda sobre un comando SQL                                                             | `\h SELECT`                       |
| `\x`           | Activa/desactiva el modo expandido                                                                 | `\x`                              |
| `\df`          | Muestra funciones definidas por el usuario                                                        | `\df`                             |
| `\di`          | Muestra los índices en la base de datos                                                           | `\di`                             |
| `\du`          | Muestra los roles y usuarios definidos en PostgreSQL                                             | `\du`                             |
| `\!`           | Ejecuta un comando del sistema operativo                                                          | `\! ls`                           |
| `BEGIN`        | Inicia una transacción                                                                            | `BEGIN;`                          |
| `COMMIT`       | Guarda los cambios de la transacción                                                              | `COMMIT;`                         |
| `ROLLBACK`     | Revierte los cambios realizados desde el último `BEGIN`                                           | `ROLLBACK;`                       |
| `VACUUM`       | Limpia y optimiza la base de datos                                                                | `VACUUM;`                         |
