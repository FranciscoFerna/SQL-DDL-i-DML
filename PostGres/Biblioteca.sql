/* 
## 🛠 **Exercici: Gestió d’un Sistema de Biblioteca**

Disposem de les següents taules per gestionar la informació d’una biblioteca:  
- **LLIBRES**(_id_llibre_, nom, autor, any_publicacio, preu, quantitat)  
- **CATEGORIES**(_id_categoria_, nom)  
- **LLIBRE_CATEGORIA**(_id_llibre_, _id_categoria_)  

### **Restriccions**
1. Els camps `id_llibre`, `id_categoria` i `nom` són obligatoris i formen les claus primàries respectives.
2. Els camps `preu` i `quantitat` han de ser de tipus numèric.
3. No es poden introduir llibres amb `preu <= 0`.
4. El camp `nom` de la taula **CATEGORIES** no pot contenir valors duplicats.
5. Es manté integritat referencial:
   - La taula **LLIBRE_CATEGORIA** ha de relacionar els llibres amb les seves categories.
   - Els camps `id_llibre` i `id_categoria` han de ser claus foranes que referencien **LLIBRES** i **CATEGORIES**, respectivament.
6. Crea un índex per als camps `id_llibre` de la taula **LLIBRES** i `id_categoria` de la taula **CATEGORIES**.

---

### **Tasques**
1. Escriu les sentències SQL per crear les taules respectant les restriccions esmentades.
2. Afegeix les claus primàries i foranes necessàries per mantenir la integritat referencial.
3. Crea els índexs per optimitzar les consultes segons el que s’ha especificat.
*/

CREATE TABLE LLIBRES (
  id_llibre NUMERIC,
  nom VARCHAR(50) NOT NULL,
  autor VARCHAR(25) NOT NULL,
  any_publicacio NUMERIC NOT NULL,
  preu NUMERIC CHECK (preu > 0),
  quantitat NUMERIC NOT NULL,

  CONSTRAINT PK_ID_LLIBRE PRIMARY KEY (id_llibre)
);

CREATE INDEX IDX_ID_LLIBRE
ON LLIBRES (id_llibre);

CREATE TABLE CATEGORIES (
  id_categoria NUMERIC,
  nom VARCHAR(25) UNIQUE NOT NULL,

  CONSTRAINT PK_ID_CATEGORIA PRIMARY KEY (id_categoria)
);

CREATE INDEX IDX_ID_CATEGORIA
ON CATEGORIES (id_categoria);

CREATE TABLE LLIBRE_CATEGORIA (
  id_llibre NUMERIC,
  id_categoria NUMERIC,

  CONSTRAINT FK_ID_LLIBRE FOREIGN KEY (id_llibre) REFERENCES LLIBRES(id_llibre),
  CONSTRAINT FK_ID_CATEGORIA FOREIGN KEY (id_categoria) REFERENCES CATEGORIES(id_categoria),

  CONSTRAINT UC_LLIBRE_CATEGORIA UNIQUE (id_llibre, id_categoria)
);

/* Per comprovar les taules creades */
\d

/* Comprovar les columnes de la taules LLIBRES */
\d LLIBRES

/* Comprovar les columnes de la taules CATEGORIES */
\d CATEGORIES

/* Comprovar les columnes de la taules LLIBRE_CATEGORIA */
\d LLIBRE_CATEGORIA

-- Comprovar les restriccions (claus primàries i foranes)
SELECT conname, contype, conrelid::regclass AS taula
FROM pg_constraint
WHERE contype IN ('p', 'f'); 

-- Comprovar els índexs creats a la base de dades
SELECT indexname, indexdef
FROM pg_indexes
WHERE tablename IN ('llibres', 'categories');

-- Comprovar les dades de la taula LLIBRES
SELECT * FROM LLIBRES;

-- Comprovar les dades de la taula CATEGORIES
SELECT * FROM CATEGORIES;

-- Comprovar les dades de la taula LLIBRE_CATEGORIA
SELECT * FROM LLIBRE_CATEGORIA;

-- Inserir un llibre a LLIBRES
INSERT INTO LLIBRES (id_llibre, nom, autor, any_publicacio, preu, quantitat)
VALUES (1, 'El senyor dels anells', 'J.R.R. Tolkien', 1954, 20.5, 10);

-- Inserir una categoria a CATEGORIES
INSERT INTO CATEGORIES (id_categoria, nom)
VALUES (1, 'Fantasía');

-- Assignar un llibre a una categoria a LLIBRE_CATEGORIA
INSERT INTO LLIBRE_CATEGORIA (id_llibre, id_categoria)
VALUES (1, 1);

