USE tienda; SELECT nombre FROM producto;
SELECT nombre, precio FROM producto;
SELECT * FROM producto;
SELECT nombre, precio as 'Euros',  precio * 1.08929 as 'Dollars' FROM producto;
SELECT nombre as 'nombre de producto', precio as 'Euros', precio * 1.08929 as 'Dollars' FROM producto;
SELECT UPPER(nombre), precio FROM producto;
SELECT LOWER(nombre), precio FROM producto;
SELECT nombre, UPPER(SUBSTRING(nombre, 1, 2)) FROM fabricante;
SELECT nombre, ROUND(precio) FROM producto;
SELECT nombre, TRUNCATE(precio, 0) FROM producto;
SELECT codigo_fabricante FROM producto;
SELECT DISTINCT codigo_fabricante FROM producto;
SELECT nombre FROM fabricante ORDER BY nombre ASC;
SELECT nombre FROM fabricante ORDER BY nombre DESC;
SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC;
SELECT * FROM fabricante LIMIT 5;
SELECT * FROM fabricante WHERE codigo>=4 Limit 2;
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;
SELECT nombre FROM producto WHERE codigo_fabricante=2;
SELECT p.nombre as 'Producto', p.precio as 'Precio ', f.nombre as 'Fabricante' FROM producto p JOIN fabricante f on p.codigo_fabricante=f.codigo;
SELECT p.nombre as 'Producto', p.precio as 'Precio', f.nombre as 'Fabricante' FROM producto p JOIN fabricante f on p.codigo_fabricante=f.codigo ORDER BY f.nombre;
SELECT p.codigo as 'Código Producto', p.nombre as 'Producto', f.codigo as 'Código Fabricante', f.nombre as 'Fabricante'  FROM producto p JOIN fabricante f on p.codigo_fabricante=f.codigo;
SELECT p.nombre as 'Producto', p.precio as 'Precio', f.nombre as 'Fabricante' FROM producto p JOIN fabricante f on p.codigo_fabricante=f.codigo ORDER BY p.precio ASC LIMIT 1;
SELECT p.nombre as 'Producto', p.precio as 'Precio', f.nombre as 'Fabricante' FROM producto p JOIN fabricante f on p.codigo_fabricante=f.codigo ORDER BY p.precio DESC LIMIT 1;
SELECT p.nombre as 'Producto' FROM producto p JOIN fabricante f on p.codigo_fabricante=f.codigo WHERE f.nombre='Lenovo';
SELECT p.nombre as 'Producto' FROM producto p JOIN fabricante f on p.codigo_fabricante=f.codigo WHERE f.nombre='Crucial' AND p.precio > 200;
SELECT p.nombre as 'Producto', f.nombre as 'Fabricante' FROM producto p LEFT JOIN fabricante f on p.codigo_fabricante=f.codigo WHERE f.nombre='Asus' or f.nombre='Hewlett-Packard' or f.nombre='Seagate';
SELECT p.nombre as 'Producto', f.nombre as 'Fabricante' FROM producto p JOIN fabricante f on p.codigo_fabricante=f.codigo WHERE f.nombre in ('Asus', 'Hewlett-Packard', 'Seagate');
SELECT p.nombre as 'Producto', p.precio as 'Precio ', f.nombre as 'Fabricante' FROM producto p JOIN fabricante f on p.codigo_fabricante=f.codigo WHERE f.nombre LIKE '%e';
SELECT p.nombre as 'Producto', p.precio as 'Precio ', f.nombre as 'Fabricante' FROM producto p JOIN fabricante f on p.codigo_fabricante=f.codigo WHERE f.nombre LIKE '%w%';
SELECT p.nombre as 'Producto', p.precio as 'Precio', f.nombre as 'Fabricante' FROM producto p JOIN fabricante f on p.codigo_fabricante=f.codigo WHERE p.precio >=180 ORDER BY p.precio DESC, p.nombre ASC;
SELECT f.codigo as 'Código Fabricante', f.nombre as 'Fabricante' FROM fabricante f INNER JOIN producto p on p.codigo_fabricante=f.codigo;
SELECT f.codigo as 'Código Fabricante', f.nombre as 'Fabricante', p.nombre as 'Producto' FROM fabricante f LEFT JOIN producto p on p.codigo_fabricante=f.codigo;
SELECT f.codigo as 'Código Fabricante', f.nombre as 'Fabricante', p.nombre as 'Producto' FROM fabricante f LEFT JOIN producto p on p.codigo_fabricante=f.codigo WHERE p.nombre is NULL;
SELECT p.nombre as 'Producto', f.nombre as 'Fabricante' FROM fabricante f JOIN producto p on p.codigo_fabricante=f.codigo WHERE f.nombre='Lenovo';
SELECT * FROM producto p WHERE p.precio = (SELECT MAX(p.precio) FROM producto p JOIN fabricante f on p.codigo_fabricante=f.codigo WHERE f.nombre='Lenovo');
SELECT p.nombre as 'Producto' FROM producto p JOIN fabricante f on p.codigo_fabricante=f.codigo WHERE f.nombre='Lenovo' ORDER BY p.precio DESC LIMIT 1;
SELECT p.nombre as 'Producto' FROM producto p JOIN fabricante f on p.codigo_fabricante=f.codigo WHERE f.nombre='Hewlett-Packard' ORDER BY p.precio ASC LIMIT 1;
SELECT producto.nombre as 'Producto', producto.precio FROM producto WHERE producto.precio >= (SELECT MAX(p.precio) FROM producto p JOIN fabricante f on p.codigo_fabricante=f.codigo WHERE f.nombre='Lenovo');
SELECT p.nombre as 'Producto', p.precio FROM producto p JOIN fabricante f on f.codigo=p.codigo_fabricante WHERE f.nombre='Asus' AND p.precio > (SELECT AVG(p.precio) FROM producto p);
USE universidad; SELECT apellido1 as 'Apellido', apellido2 as 'Segundo apellido', nombre FROM persona WHERE tipo='alumno' ORDER BY apellido1 ASC, apellido2 ASC, nombre ASC;
SELECT nombre, CONCAT(apellido1, ' ', apellido2) as 'Apellidos' FROM persona WHERE telefono IS NULL;
SELECT nombre, CONCAT(apellido1, ' ', apellido2) as 'Apellidos' FROM persona WHERE tipo='alumno' AND fecha_nacimiento BETWEEN '1998-12-31' AND '1999-12-31';
SELECT nombre, CONCAT(apellido1, ' ', apellido2) as 'Apellidos' FROM persona WHERE tipo='profesor' AND telefono IS NULL AND nif LIKE '%k';
SELECT a.nombre FROM grado g JOIN asignatura a on g.id=a.id_grado WHERE a.cuatrimestre=1 AND g.id=7 AND a.curso=3;
SELECT p.apellido1 as 'Primer Apellido', p.apellido2 as 'Segundo Apellido', p.nombre as 'Nombre', d.nombre as 'Departamento' FROM persona p JOIN profesor pr on p.id=pr.id_profesor JOIN departamento d on pr.id_departamento=d.id WHERE p.tipo='profesor' ORDER BY p.apellido1 AND p.apellido2 AND p.nombre;
SELECT a.nombre as 'Asignatura', ce.anyo_inicio as 'Año de inicio', ce.anyo_fin as 'Año de fin de curso' FROM persona p JOIN alumno_se_matricula_asignatura asm on p.id=asm.id_alumno JOIN curso_escolar ce on ce.id=asm.id_curso_escolar JOIN asignatura a on a.id=asm.id_asignatura WHERE p.tipo='alumno' AND p.nif='26902806M';
SELECT DISTINCT d.nombre as 'Departamentos' FROM departamento d JOIN profesor pr on d.id=pr.id_departamento JOIN asignatura a on a.id=pr.id_profesor JOIN grado g on g.id=a.id_grado WHERE g.nombre='Grado en Ingeniería Informática (Plan 2015)';
SELECT DISTINCT CONCAT(p.nombre, ' ', p.apellido1, ' ', p.apellido2) as 'Alumnos matriculados en el curso 2018' FROM persona p JOIN alumno_se_matricula_asignatura asm on p.id=asm.id_alumno JOIN curso_escolar ce on ce.id=asm.id_curso_escolar WHERE ce.anyo_inicio=2018;
SELECT d.nombre as 'Departamento', p.apellido1 as 'Primer apellido', p.apellido2 as 'Segundo apellido', p.nombre as 'Nombre' FROM persona p LEFT JOIN profesor pf on p.id=pf.id_profesor LEFT JOIN departamento d on pf.id_departamento=d.id WHERE p.tipo='profesor' ORDER BY d.nombre ASC, p.apellido1 DESC, p.apellido2 DESC, p.nombre DESC;
SELECT p.apellido1 as 'Primer apellido', p.apellido2 as 'Segundo apellido', p.nombre as 'Nombre' FROM persona p LEFT JOIN profesor pf on p.id=pf.id_profesor LEFT JOIN departamento d on pf.id_departamento=d.id WHERE p.tipo='profesor' AND pf.id_departamento IS NULL;
SELECT d.nombre as 'Departamento' FROM departamento d LEFT JOIN profesor p on d.id=p.id_departamento WHERE p.id_departamento IS NULL;
SELECT p.nombre as 'profesor' FROM persona p JOIN profesor pf on p.id=pf.id_profesor LEFT JOIN asignatura a on a.id_profesor=pf.id_profesor WHERE p.tipo='profesor' AND a.id_profesor IS NULL;
SELECT a.nombre as 'Asignatura' FROM asignatura a LEFT JOIN profesor p on a.id_profesor=p.id_profesor WHERE a.id_profesor IS NULL;
-- Retorna un llistat amb tots els departaments que no han impartit assignatures en cap curs escolar.
SELECT COUNT(p.id) as 'Número de alumnos' FROM persona p WHERE p.tipo='alumno';
SELECT COUNT(p.id) as 'Alumnos nacidos en el año 1999' FROM persona p WHERE p.tipo='alumno' AND p.fecha_nacimiento LIKE '1999%';
SELECT d.nombre as 'Departamento', COUNT(pf.id_departamento) as 'Número de profesores asignados' FROM persona p JOIN profesor pf on p.id=pf.id_profesor JOIN departamento d on d.id=pf.id_departamento GROUP BY pf.id_departamento ORDER BY COUNT(pf.id_departamento) DESC;
SELECT d.nombre as 'Departamento', COUNT(p.id_profesor) as 'Número de profesores asignados' FROM departamento d LEFT JOIN profesor p on d.id=p.id_departamento GROUP BY d.id;
SELECT g.nombre as 'Grado', COUNT(a.id) as 'Número de asignaturas' FROM grado g LEFT JOIN asignatura a on g.id=a.id_grado GROUP BY g.id ORDER BY COUNT(a.id) DESC;
SELECT g.nombre as 'Grado', COUNT(a.id) as 'Número de asignaturas' FROM grado g JOIN asignatura a on g.id=a.id_grado GROUP BY g.id HAVING COUNT(a.id) > 40;
SELECT g.nombre as 'Grado', a.tipo as 'Tipo asignatura', SUM(a.creditos) as 'Total de créditos' FROM grado g JOIN asignatura a on g.id=a.id_grado GROUP BY g.nombre, a.tipo, a.creditos;
SELECT ce.anyo_inicio as 'Inicio del curso escolar', COUNT(asm.id_alumno) as 'Alumnos matriculados' FROM curso_escolar as ce JOIN alumno_se_matricula_asignatura as asm on ce.id=asm.id_curso_escolar GROUP BY ce.anyo_inicio;
SELECT p.id as 'Id del profesor', p.nombre as 'Nombre', p.apellido1 as 'Primer apellido', p.apellido2 as 'Segundo apellido', COUNT(a.id) as 'Número de asignaturas que imparte' FROM asignatura a RIGHT JOIN profesor pf on a.id_profesor=pf.id_profesor JOIN persona p on pf.id_profesor=p.id GROUP BY p.id, p.nombre, p.apellido1, p.apellido2 ORDER BY COUNT(a.id) DESC;
-- Retorna totes les dades de l'alumne/a més jove.
-- Retorna un llistat amb els professors/es que tenen un departament associat i que no imparteixen cap assignatura.