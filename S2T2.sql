-- TIENDA
use tienda;
select * from producto;
select * from fabricante;

--
-- CÓDIGO
-- Llista el nom de tots els productes que hi ha en la taula producto.
SELECT nombre FROM producto;
-- Llista els noms i els preus de tots els productes de la taula producto.
SELECT nombre, precio FROM producto;
-- Llista totes les columnes de la taula producto.
DESCRIBE producto;
-- Llista el nom dels productes, el preu en euros i el preu en dòlars estatunidencs (USD).
SELECT nombre, precio, (precio * 0.99) AS 'USD' FROM producto ;
-- Llista el nom dels productes, el preu en euros i el preu en dòlars estatunidencs (USD). Utilitza els següents àlies per a les columnes: nom de producto, euros, dòlars.
SELECT nombre AS 'nom de producto', precio AS 'euros', (precio * 0.99) AS 'dòlars' FROM producto ;
-- Llista els noms i els preus de tots els productes de la taula producto, convertint els noms a majúscula.
SELECT UPPER(nombre), precio FROM producto;
-- Llista els noms i els preus de tots els productes de la taula producto, convertint els noms a minúscula.
SELECT LOWER(nombre), precio FROM producto;
-- Llista el nom de tots els fabricants en una columna, i en una altra columna obtingui en majúscules els dos primers caràcters del nom del fabricant.
SELECT nombre, LEFT(nombre, 2) FROM fabricante;
-- Llista els noms i els preus de tots els productes de la taula producto, arrodonint el valor del preu.
SELECT nombre, CEIL(precio) FROM producto;
-- Llista els noms i els preus de tots els productes de la taula producto, truncant el valor del preu per a mostrar-lo sense cap xifra decimal.
SELECT nombre, ROUND(precio, 0, 1) FROM producto;
-- Llista el codi dels fabricants que tenen productes en la taula producto.
SELECT codigo_fabricante FROM producto;
-- Llista el codi dels fabricants que tenen productes en la taula producto, eliminant els codis que apareixen repetits.
SELECT DISTINCT codigo_fabricante FROM producto;
-- Llista els noms dels fabricants ordenats de manera ascendent.
SELECT nombre FROM fabricante ORDER BY nombre ASC;
-- Llista els noms dels fabricants ordenats de manera descendent.
SELECT nombre FROM fabricante ORDER BY nombre DESC;
-- Llista els noms dels productes ordenats, en primer lloc, pel nom de manera ascendent i, en segon lloc, pel preu de manera descendent.
SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC;
-- Retorna una llista amb les 5 primeres files de la taula fabricante.
SELECT * FROM fabricante LIMIT 5;
-- Retorna una llista amb 2 files a partir de la quarta fila de la taula fabricante. La quarta fila també s'ha d'incloure en la resposta.
SELECT * FROM fabricante LIMIT 3, 2;
-- Llista el nom i el preu del producte més barat. (Utilitza solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MIN(preu), necessitaria GROUP BY.
SELECT nombre, precio  FROM producto ORDER BY precio ASC LIMIT 1;
-- Llista el nom i el preu del producte més car. (Utilitza solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MAX(preu), necessitaria GROUP BY.
SELECT nombre, precio  FROM producto ORDER BY precio DESC LIMIT 1;
-- 20-Llista el nom de tots els productes del fabricant el codi de fabricant del qual és igual a 2.
SELECT nombre FROM producto WHERE codigo_fabricante = 2;
-- 21-Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades.
SELECT producto.nombre, precio, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;
-- 22-Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades. Ordena el resultat pel nom del fabricant, per ordre alfabètic.
SELECT producto.nombre, precio, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY fabricante.nombre;
-- 23-Retorna una llista amb el codi del producte, nom del producte, codi del fabricador i nom del fabricador, de tots els productes de la base de dades.
SELECT producto.nombre, precio, codigo_fabricante, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;
-- 24-Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més barat.
SELECT producto.nombre, precio, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY producto.precio DESC LIMIT 1;
-- 25-Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més car.
SELECT producto.nombre, precio, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY producto.precio ASC LIMIT 1;
-- 26-Retorna una llista de tots els productes del fabricant Lenovo.
SELECT producto.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Lenovo';
-- 27-Retorna una llista de tots els productes del fabricant Crucial que tinguin un preu major que 200 €.
SELECT producto.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Crucial' AND producto.precio > 200;
-- Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packardy Seagate. Sense utilitzar l'operador IN.
SELECT producto.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Asus' OR fabricante.nombre = 'Hewlett-Packardy' OR fabricante.nombre = 'Seagate';
-- Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packardy Seagate. Fent servir l'operador IN.
SELECT producto.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');
-- 30-Retorna un llistat amb el nom i el preu de tots els productes dels fabricants el nom dels quals acabi per la vocal e.
SELECT producto.nombre, precio FROM producto INNER JOIN fabricante  ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre LIKE '%e';
-- 31-Retorna un llistat amb el nom i el preu de tots els productes el nom de fabricant dels quals contingui el caràcter w en el seu nom.
SELECT producto.nombre, precio FROM producto INNER JOIN fabricante  ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre LIKE '%w%';
-- 32-Retorna un llistat amb el nom de producte, preu i nom de fabricant, de tots els productes que tinguin un preu major o igual a 180 €. Ordena el resultat, en primer lloc, pel preu (en ordre descendent) i, en segon lloc, pel nom (en ordre ascendent).
SELECT producto.nombre, precio, fabricante.nombre FROM producto 
INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo 
WHERE precio >= 180 
ORDER BY precio DESC, producto.nombre ASC;
-- Retorna un llistat amb el codi i el nom de fabricant, solament d'aquells fabricants que tenen productes associats en la base de dades.
SELECT DISTINCT fabricante.codigo, fabricante.nombre FROM fabricante INNER JOIN producto ON producto.codigo_fabricante = fabricante.codigo;
-- Retorna un llistat de tots els fabricants que existeixen en la base de dades, juntament amb els productes que té cadascun d'ells. El llistat haurà de mostrar també aquells fabricants que no tenen productes associats.
SELECT fabricante.nombre AS Fabricante, producto.nombre AS Producto FROM fabricante LEFT JOIN producto ON producto.codigo_fabricante = fabricante.codigo;
-- 35-Retorna un llistat on només apareguin aquells fabricants que no tenen cap producte associat.
SELECT fabricante.nombre AS 'Fabricantes sin productos' FROM fabricante LEFT JOIN producto ON producto.codigo_fabricante = fabricante.codigo WHERE producto.nombre IS NULL; 
-- 36-Retorna tots els productes del fabricador Lenovo. (Sense utilitzar INNER JOIN).
SELECT producto.nombre FROM tienda.producto, tienda.fabricante WHERE fabricante.nombre = 'Lenovo';
-- 37-Retorna totes les dades dels productes que tenen el mateix preu que el producte més car del fabricant Lenovo. (Sense usar INNER JOIN).
SELECT producto.codigo, producto.nombre, producto.precio, producto.codigo_fabricante FROM tienda.producto, tienda.fabricante WHERE (SELECT max(producto.precio) FROM tienda.producto) = (SELECT MAX(producto.nombre) FROM tienda.producto, tienda.fabricante WHERE fabricante.nombre = 'Lenovo');
-- Llista el nom del producte més car del fabricant Lenovo.
SELECT MAX(producto.nombre) AS 'Mas caro Lenovo' FROM tienda.producto, tienda.fabricante WHERE fabricante.nombre = 'Lenovo';
-- Llista el nom del producte més barat del fabricant Hewlett-Packard.
SELECT min(producto.nombre) AS 'Más barato Hewlett-Packard' FROM tienda.producto, tienda.fabricante WHERE fabricante.nombre = 'Hewlett-Packard';
-- 40-Retorna tots els productes de la base de dades que tenen un preu major o igual al producte més car del fabricant Lenovo.
SELECT producto.nombre AS '>= maxLenovo' FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE producto.precio >= (SELECT MAX(producto.precio) FROM tienda.producto, tienda.fabricante WHERE fabricante.nombre = 'Lenovo');
-- Llesta tots els productes del fabricant Asus que tenen un preu superior al preu mitjà de tots els seus productes.
SELECT producto.nombre AS 'Asus > media' FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE (SELECT precio, fabricante.nombre FROM tienda.producto, tienda.fabricante WHERE fabricante.nombre = 'Asus') > (SELECT AVG(precio) FROM producto);


-- UNIVERSIDAD
-- VISIÓN
use universidad;
select * from alumno_se_matricula_asignatura;
select * from asignatura;-- id
select * from curso_escolar;-- id
select * from departamento;-- id
select * from grado;-- id
select * from persona;-- id
select * from profesor;-- id
--
-- CÓDIGO
-- 1-Retorna un llistat amb el primer cognom, segon cognom i el nom de tots els/les alumnes. El llistat haurà d'estar ordenat alfabèticament de menor a major pel primer cognom, segon cognom i nom.
SELECT persona.apellido1, persona.apellido2, persona.nombre FROM persona WHERE persona.tipo LIKE 'alumno';
-- Esbrina el nom i els dos cognoms dels alumnes que no han donat d'alta el seu número de telèfon en la base de dades.
SELECT persona.nombre, persona.apellido1, persona.apellido2 FROM persona WHERE persona.tipo LIKE 'alumno' AND persona.telefono IS NULL;
-- Retorna el llistat dels alumnes que van néixer en 1999.
SELECT persona.nombre, persona.apellido1, persona.apellido2 FROM persona WHERE persona.tipo LIKE 'alumno' AND YEAR(persona.fecha_nacimiento) = 1999;
-- Retorna el llistat de professors/es que no han donat d'alta el seu número de telèfon en la base de dades i a més el seu NIF acaba en K.
SELECT persona.nombre, persona.apellido1, persona.apellido2 FROM persona WHERE persona.tipo LIKE 'profesor' AND persona.telefono IS NULL AND persona.nif LIKE '%K';
-- 5-Retorna el llistat de les assignatures que s'imparteixen en el primer quadrimestre, en el tercer curs del grau que té l'identificador 7.
SELECT asignatura.nombre AS 'Asignaturas 3er quadrimestre' FROM universidad.asignatura WHERE asignatura.cuatrimestre = 1 AND asignatura.curso = 3 AND id_grado = 7;
-- Retorna un llistat dels professors/es juntament amb el nom del departament al qual estan vinculats. El llistat ha de retornar quatre columnes, primer cognom, segon cognom, nom i nom del departament. El resultat estarà ordenat alfabèticament de menor a major pels cognoms i el nom.
SELECT persona.apellido1, persona.apellido2, persona.nombre, departamento.nombre AS 'departamento' FROM persona 
INNER JOIN profesor ON persona.id = profesor.id_profesor
INNER JOIN departamento ON profesor.id_departamento = departamento.id
ORDER BY apellido1, nombre ASC;
-- Retorna un llistat amb el nom de les assignatures, any d'inici i any de fi del curs escolar de l'alumne/a amb NIF 26902806M.
SELECT asignatura.nombre, curso_escolar.anyo_inicio, curso_escolar.anyo_fin FROM persona
INNER JOIN alumno_se_matricula_asignatura ON alumno_se_matricula_asignatura = persona.id
INNER JOIN asignatura ON asignatura.id = alumno_se_matricula_asignatura.id_asignatura
INNER JOIN curso_escolar ON curso_escolar.id = asignatura.curso
WHERE nif LIKE '26902806M';
-- Retorna un llistat amb el nom de tots els departaments que tenen professors/es que imparteixen alguna assignatura en el Grau en Enginyeria Informàtica (Pla 2015).

-- Retorna un llistat amb tots els alumnes que s'han matriculat en alguna assignatura durant el curs escolar 2018/2019.
SELECT DISTINCT persona.nombre, persona.apellido1, persona.apellido2, id_curso_escolar FROM persona
INNER JOIN alumno_se_matricula_asignatura on alumno_se_matricula_asignatura.id_alumno = persona.id
INNER JOIN curso_escolar on curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar
WHERE curso_escolar.id = 5;

-- Resol les 6 següents consultes utilitzant les clàusules LEFT JOIN i RIGHT JOIN.
-- Retorna un llistat amb els noms de tots els professors/es i els departaments que tenen vinculats. El llistat també ha de mostrar aquells professors/es que no tenen cap departament associat. El llistat ha de retornar quatre columnes, nom del departament, primer cognom, segon cognom i nom del professor/a. El resultat estarà ordenat alfabèticament de menor a major pel nom del departament, cognoms i el nom.
SELECT departamento.nombre, persona.apellido1, persona.apellido2, persona.nombre FROM persona 
LEFT JOIN profesor ON profesor.id_profesor = persona.id 
LEFT JOIN departamento ON departamento.id = profesor.id_departamento
ORDER BY departamento.nombre, persona.apellido1, persona.apellido2, persona.nombre DESC;
-- Retorna un llistat amb els professors/es que no estan associats a un departament.
SELECT  persona.nombre, persona.apellido1, persona.apellido2 FROM persona
LEFT JOIN profesor ON profesor.id_profesor = persona.id
LEFT JOIN departamento ON departamento.id = profesor.id_departamento
WHERE departamento.nombre IS NULL;
-- Retorna un llistat amb els departaments que no tenen professors/es associats.
SELECT departamento.nombre FROM departamento
LEFT JOIN profesor ON profesor.id_departamento = departamento.id
WHERE profesor.id_departamento IS NULL;
-- Retorna un llistat amb els professors/es que no imparteixen cap assignatura.

-- Retorna un llistat amb les assignatures que no tenen un professor/a assignat.

-- Retorna un llistat amb tots els departaments que no han impartit assignatures en cap curs escolar.

