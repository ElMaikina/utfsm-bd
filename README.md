Descripción
-----------
Este es un archivado de las tareas que realicé luego de rendir el 
ramo Bases de Datos. Las ambas tareas consistieron en armar bases
de datos, una através de la librería PyOBDC en Python y la otra 
dentro de una página hecha con PHP y PostgreSQL.
___
Detalles (Tarea 1)
------------------
La tarea fue programada desde Arch Linux, usando la versión de python:

	Python 3.10.4

y usando la siguiente versión de MySQL

	mysql  Ver 15.1 Distrib 10.7.3-MariaDB, for Linux (x86_64) using readline 5.1

(La cuál es completamente compatible e intercambiable con Oracle 18c XE)

Luego, los comandos que utilicé por pantalla son los siguientes

	Driver: /usr/lib/libmaodbc.so
	Usuario: root
	Base de Datos: tarea_1_bd
	Servidor: localhost

Importante recalcar que se debe tener una base de datos establecida previamente antes de establecer 
cualquier conexión dentro del código de Python. 

El puerto y la clave no las dejaré explicitas por razones obvias, sin embargo cualquiera que 
tenga una base de datos con MariaDB o MySQL en Linux debiese poder conectarse con dichos parámetros.
___
Detalles (Tarea 2)
------------------
La base de datos fue programada usando puramente PHP, HTML y PostgreSQL.
La página se ejecutó en Firefox e Internet Explorer y no presentó mayor 
problema de ningún tipo.

La página permite navegar libremente, ordenar Animes en base a los filtros,
añadir a favoritos, historial y crear otras listas. Además se puede interactuar 
con otros usuarios a través de los foros de cada página generada para cada 
Anime. Finalmente se pueden crear uno o múltiples Usuarios, borrar la cuenta 
y cambiarse de cuenta.

Hay ciertas funciones en las que tuve que tomarme ciertas libertades y 
algunos detalles que me faltaron implementar, lo cuál explicaré con más 
detalle en la defensa.

Para ejecutarla en Windows es necesario tener instalada la ultima versión de XAMPP, establecer
una conexión con la base de datos a través de dicha aplicacion y luego abrir el siguente link en
el navegador web que se desée:

	localhost:CrunchyUSM

Importante recalcar que la carpeta CrunchyUSM debe estar en C:\xampp\htdocs\

Para ejecutar la tarea en Linux basta con hacer:
	
	php -s localhost:CrunchyUSM

Dentro de la carpeta que contenga los .php que conforman la página.
___
Notas de las Tareas
-------------------

* Tarea 1: 94
* Tarea 2: 55