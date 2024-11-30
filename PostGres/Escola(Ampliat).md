## 🛠 **Exercici: Gestió d'un Sistema Escolar (Ampliat)**

### **Objectiu**
Crear i gestionar un sistema escolar amb diverses taules relacionades, aplicant restriccions, manipulació de dades i gestió de transaccions.

---

### **Requeriments**

1. **Crear un usuari i una base de dades:**
   - L'usuari es dirà `escolar`.
   - La base de dades es dirà `sistema_escolar`.
   - Assigna tots els permisos a l'usuari `escolar` per gestionar la base de dades.

2. **Definir les taules següents i establir les restriccions indicades:**

#### **Taula `Classes`:**
- La clau primària és `id_classe`.
- El camp `nom_classe` ha de ser únic i els seus valors s’han d’emmagatzemar en majúscules.

#### **Taula `Assignatures`:**
- La clau primària és `id_assignatura`.
- El camp `nom_assignatura` no pot tenir valors duplicats.
- El camp `tipus_assignatura` només pot tenir els valors `OBLIGATÒRIA` o `OPTATIVA`.

#### **Taula `Alumnes`:**
- La clau primària és `dni_alumne`.
- El camp `nom_alumne` s’ha d’emmagatzemar amb la primera lletra en majúscula.
- `id_classe` és clau forana que referencia la taula `Classes`.
- El camp `nota_final` ha de ser un valor entre 0 i 10.

#### **Taula `Professors`:**
- La clau primària és `dni_professor`.
- El camp `nom_professor` s’ha d’emmagatzemar amb la primera lletra en majúscula.
- El camp `especialitat` ha de contenir valors únics.

#### **Taula `Assignacions`:**
- Les claus primàries són `id_assignatura` i `dni_professor`.
- Els camps `id_assignatura` i `dni_professor` són claus foranes que referencien les taules `Assignatures` i `Professors`, respectivament.

#### **Taula `Matriculacions`:**
- Les claus primàries són `dni_alumne` i `id_assignatura`.
- Els camps `dni_alumne` i `id_assignatura` són claus foranes que referencien les taules `Alumnes` i `Assignatures`, respectivament.
- El camp `data_matriculació` ha de tenir un valor per defecte que sigui la data actual.
- Si un alumne és eliminat de la taula `Alumnes`, s’han d’eliminar també totes les seves matrícules utilitzant l'opció `ON DELETE CASCADE`.

---

### **Tasques Addicionals**

#### **Inserir dades inicials:**
1. Afegeix almenys:
   - 3 registres a la taula `Classes`.
   - 4 registres a la taula `Assignatures`.
   - 5 registres a la taula `Alumnes`, cadascun assignat a una classe.
   - 3 registres a la taula `Professors`.
   - Assignacions entre professors i assignatures.
   - Matrícules d'alumnes en assignatures.

#### **Modificar dades:**
2. Incrementa les notes finals de tots els alumnes que pertanyen a la classe `1A` en un 10%.
3. Actualitza el tipus d'una assignatura específica de `OPTATIVA` a `OBLIGATÒRIA`.

#### **Eliminar dades:**
4. Elimina totes les assignatures que no tenen alumnes matriculats.
5. Esborra un alumne específic i comprova que les seves matrícules s’eliminen automàticament.

#### **Gestió de Transaccions:**
6. Crea una transacció que:
   - Insereixi un nou alumne i el matriculi a dues assignatures.
   - Defineixi un punt de salvament (`SAVEPOINT`) després d'inserir el nou alumne.
   - Reverteixi només les matrícules del nou alumne sense eliminar-lo (`ROLLBACK TO SAVEPOINT`).
   - Confirmi els altres canvis amb un `COMMIT`.

