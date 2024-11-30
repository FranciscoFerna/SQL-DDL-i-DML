

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
