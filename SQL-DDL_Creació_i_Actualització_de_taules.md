# 📘 SQL DDL: Creació i Gestió de Taules

Aquest document explica els conceptes bàsics i les sintaxis més importants relacionades amb la creació, gestió i manipulació de taules en bases de dades SQL utilitzant DDL (Data Definition Language).

---

## 🛠 **Creació de Taules: `CREATE TABLE`**

La sentència `CREATE TABLE` permet crear taules noves en una base de dades.

### 📋 **Sintaxi**
```sql
CREATE TABLE NOM_TAULA (
    NOM_CAMP TIPUS_DE_DADA [OPCIONS],
    ...
) [TABLESPACE ESPAI_DE_TAULA];
```

### 🔑 **Elements principals**
- **NOM_TAULA**: Nom únic de la taula.
- **NOM_CAMP**: Nom de les columnes.
- **TIPUS_DE_DADA**: Definició del tipus de dades (`VARCHAR`, `NUMERIC`, etc.).
- **OPCIONS**: Restriccions com `NOT NULL`, `DEFAULT`, o `PRIMARY KEY`.

### ✏️ **Exemple**
```sql
CREATE TABLE EDITORIAL (
    ED_ID NUMERIC NOT NULL,
    ED_NAME VARCHAR(50),
    PRIMARY KEY (ED_ID)
);
```

---

## 📋 **Regles per a noms de taules i camps**
1. Han de començar amb una lletra.
2. No poden superar els 30 caràcters.
3. Poden incloure només lletres (A-Z), números (0-9), i `_` (evitar `$` i `#`).
4. Els noms han de ser únics dins d'un mateix esquema.

---

## 📋 **Tipus de Dades Comuns**
| **TIPUS**       | **DESCRIPCIÓ**                                           |
|------------------|---------------------------------------------------------|
| `CHAR(n)`        | Longitud fixa.                                          |
| `VARCHAR(n)`     | Longitud variable (fins a n).                           |
| `TEXT`           | Longitud il·limitada.                                   |
| `BOOLEAN`        | Valors `TRUE` o `FALSE`.                                |
| `DATE`           | Emmagatzema dates (`DD-MM-YYYY`).                       |
| `TIMESTAMP`      | Data i hora amb precisió (inclou mil·lisegons).         |
| `NUMERIC(p,s)`   | Nombre amb precisió `p` i escala `s` (ex.: `NUMERIC(8,3)`). |
| `SERIAL`         | Enter autoincremental.                                  |

---

## 📋 **Restriccions**
Les restriccions ajuden a garantir la integritat de les dades a les taules. Es defineixen en el moment de crear la taula o amb `ALTER TABLE`.

### 🔑 **Principals restriccions**
- `NOT NULL`: Evita valors nuls.
- `DEFAULT`: Assigna un valor per defecte.
- `CHECK`: Defineix una condició que s'ha de complir.
- `PRIMARY KEY`: Identifica unívocament cada fila.
- `FOREIGN KEY`: Assegura la relació entre dues taules.

### ✏️ **Exemple**
```sql
CREATE TABLE EMPLEAT (
    ID NUMERIC NOT NULL,
    NOM VARCHAR(50) NOT NULL,
    EDAT NUMERIC CHECK (EDAT >= 18 AND EDAT <= 65),
    DEPARTAMENT_ID NUMERIC REFERENCES DEPARTAMENT(ID)
);
```

---

## 📋 **Modificació de Taules: `ALTER TABLE`**

La sentència `ALTER TABLE` permet modificar l’estructura d’una taula existent.

### 📋 **Operacions comunes**
- **Afegir una columna nova**:
  ```sql
  ALTER TABLE NOM_TAULA ADD NOM_CAMP TIPUS_DE_DADA [OPCIONS];
  ```
- **Esborrar una columna**:
  ```sql
  ALTER TABLE NOM_TAULA DROP COLUMN NOM_CAMP;
  ```
- **Afegir o modificar una restricció**:
  ```sql
  ALTER TABLE NOM_TAULA ADD CONSTRAINT NOM_RESTRICCIÓ CONSTRAINT_TYPE;
  ```

---

## 📋 **Eliminació de Taules: `DROP TABLE`**

La sentència `DROP TABLE` elimina una taula de manera permanent.

### ✏️ **Sintaxi**
```sql
DROP TABLE NOM_TAULA [CASCADE CONSTRAINTS];
```
- **CASCADE CONSTRAINTS**: Permet eliminar claus foranes associades.

---

## 📋 **Afegir Comentaris a Taules i Columnes**
Els comentaris són útils per documentar les taules i les seves columnes.

### ✏️ **Exemple**
```sql
COMMENT ON TABLE PERSONES IS 'Taula que conté informació de les persones';
COMMENT ON COLUMN PERSONES.NOM IS 'Columna que conté el nom de les persones';
```
