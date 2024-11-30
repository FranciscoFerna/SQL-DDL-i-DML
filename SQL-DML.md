# 📘 SQL DML: Manipulació de Dades

El **DML (Data Manipulation Language)** forma part fonamental del llenguatge SQL i està dissenyat per modificar les dades emmagatzemades en una base de dades. Les instruccions DML permeten afegir, modificar o eliminar registres, així com gestionar transaccions.

---

## 📋 **Transaccions**

Una **transacció** és un conjunt d'instruccions DML que s'executen de manera consecutiva. Les transaccions només es fan efectives quan es confirmen amb la comanda `COMMIT`. També es poden revertir amb `ROLLBACK`.

### 📝 **Característiques de les transaccions**
1. Una transacció comença amb la primera instrucció DML i finalitza quan:
   - Es realitza un `COMMIT` o un `ROLLBACK`.
   - Es llança una instrucció DDL o DCL, que genera un `COMMIT` implícit.
   - L'usuari abandona la sessió o hi ha una caiguda del sistema.

### 🔑 **Comandes principals**
- **`COMMIT`**: Fa definitius els canvis realitzats durant la transacció.
- **`ROLLBACK`**: Reverteix els canvis realitzats des de l'últim `COMMIT`.
- **`SAVEPOINT`**: Permet establir punts de salvament per retornar-hi amb un `ROLLBACK TO SAVEPOINT`.

---

## 🔄 **Inserció de dades: `INSERT`**

La instrucció `INSERT` permet afegir nous registres a una taula.

### 📝 **Sintaxi bàsica**
```sql
INSERT INTO nom_taula (columna1, columna2, ...) 
VALUES (valor1, valor2, ...);
```

- Si no es defineixen les columnes explícitament, els valors han de seguir l'ordre de les columnes de la taula.
- Els camps no especificats s'omplen amb:
  - El valor **per defecte** (si en té).
  - **NULL**, sempre que no hi hagi una restricció `NOT NULL`.

### ✏️ **Exemple**
```sql
INSERT INTO clients (dni, nom, cognom1, cognom2)
VALUES ('111111111', 'Pere', 'Vera', 'Crepo');
```

#### 🔁 **Inserció basada en una consulta**
Permet afegir registres a una taula copiant els resultats d'una consulta.

```sql
INSERT INTO clients2015 (dni, nom, localitat, adreça)
SELECT dni, nom, localitat, adreça
FROM clients
WHERE problemes = 0;
```

---

## ✏️ **Actualització de dades: `UPDATE`**

La instrucció `UPDATE` modifica els valors de registres existents en una taula.

### 📝 **Sintaxi bàsica**
```sql
UPDATE nom_taula
SET columna1 = valor1, columna2 = valor2, ...
WHERE condició;
```

- Si no es proporciona una clàusula `WHERE`, tots els registres de la taula seran modificats.

### ✏️ **Exemples**
```sql
UPDATE clients 
SET provincia = 'Orense' 
WHERE provincia = 'Ourense';

UPDATE productes 
SET preu = preu * 1.16;
```

---

## ❌ **Esborrat de dades: `DELETE`**

La instrucció `DELETE` elimina registres d'una taula que compleixin una condició.

### 📝 **Sintaxi bàsica**
```sql
DELETE FROM nom_taula
WHERE condició;
```

- **Nota:** Si no es proporciona la clàusula `WHERE`, tots els registres de la taula seran eliminats.
- L'esborrat no pot provocar errors d'integritat referencial.

### ✏️ **Exemples**
```sql
DELETE FROM clients 
WHERE provincia = 'Ourense';

DELETE FROM empleats 
WHERE id_empleat IN (SELECT id_empleat FROM errors_greus);
```

---

## 🔒 **Gestió de transaccions**

### 📝 **Comandes principals**
1. **`COMMIT`**:
   - Fa definitius els canvis realitzats durant la transacció.
   - Exemple:
     ```sql
     COMMIT;
     ```

2. **`ROLLBACK`**:
   - Reverteix els canvis realitzats des de l'últim `COMMIT`.
   - Exemple:
     ```sql
     ROLLBACK;
     ```

3. **`SAVEPOINT`**:
   - Crea un punt de salvament dins d'una transacció.
   - Exemple:
     ```sql
     SAVEPOINT nom_punt;
     ```

   - Per tornar a un punt de salvament:
     ```sql
     ROLLBACK TO SAVEPOINT nom_punt;
     ```

---

## 📖 **Resum**

El DML és essencial per gestionar les dades d'una base de dades:
- **`INSERT`**: Afegir registres.
- **`UPDATE`**: Modificar registres.
- **`DELETE`**: Eliminar registres.
- **Gestió de transaccions**: Garantir coherència amb `COMMIT`, `ROLLBACK` i `SAVEPOINT`.
