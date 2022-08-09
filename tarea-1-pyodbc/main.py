import pyodbc
import csv

# Pide por pantalla la información de la base de datos para
# así poder conectarse
def conectarse_a_bd():
    driver = input("Driver: ")
    usuario = input("Usuario: ")
    clave = input("Contraseña: ")
    base_de_datos = input("Base de Datos: ")
    servidor = input("Servidor: ")
    puerto = input("Puerto: ")
    string = 'DRIVER=' + driver + ';\
                User=' + usuario + ';\
                Password=' + clave + ';\
                Database=' + base_de_datos + ';\
                Server='+ servidor +';\
                Port='+ puerto +';'
    return string

# Imprime por pantalla todos los Juegos que se hayan comprado
def mostrar_biblioteca():
    cursor = cnxn.cursor()
    command = "SELECT * FROM Biblioteca"
    cursor.execute(command)
    result = ''
    for row in cursor.fetchall():
        result += str(row) + '\n'
    print(result)

# Busca un Juego en base a su nombre
def buscar_juego(nombre):
    cursor = cnxn.cursor()
    command = "SELECT DISTINCT * FROM Juegos "
    command += "WHERE Name = '" + nombre + "'"
    command += " FETCH FIRST ROW ONLY "
    cursor.execute(command)
    arr = []
    for row in cursor:
        arr.append(row)
    result = tuple(e for e in arr)
    return result[0]

# Compra un Juego desde la tabla de Juegos y luego lo inserta
# en la tabla de Biblioteca, entregándole un ID y una Calificación
def comprar_juego(nombre, new_id):
    juego = buscar_juego(nombre)
    rank = juego[0];
    name = juego[1];
    platform = juego[2];
    year = juego[3];
    genre = juego[4];
    publisher = juego[5];
    rating = input("Agregue un Rating del 1 al 5: ")
    valores = (new_id, rank, name, platform, year, genre, publisher, rating)
    command = "INSERT INTO Biblioteca(Id, Rank, Name, Platform, Year, Genre, Publisher, Rating)"
    command += " VALUES (?,?,?,?,?,?,?,?)"
    cursor.execute(command, valores)

# Muestra los 5 Juegos con el Ranking más alto
def mostrar_top5rank():
    cursor = cnxn.cursor()
    command = "SELECT DISTINCT * FROM Juegos "
    command += "ORDER BY Rank "
    command += "FETCH FIRST 5 ROWS ONLY "
    cursor.execute(command)
    result = ''
    for row in cursor.fetchall():
        result += str(row) + '\n'
    print(result)

# Muestra los 5 Juegos con más ventas Globales
def mostrar_top5venta():
    cursor = cnxn.cursor()
    genre = input("De qué género? ")
    command = "SELECT DISTINCT * FROM Juegos "
    command += "WHERE Genre = '" + genre + "' "
    command += "ORDER BY Global_Sales DESC "
    command += "FETCH FIRST 5 ROWS ONLY "
    cursor.execute(command)
    result = ''
    for row in cursor.fetchall():
        result += str(row) + '\n'
    print(result)

# Elimina un Juego de la Biblioteca en base a su nombre
def eliminar_juego(nombre, new_id):
    cursor = cnxn.cursor()
    command = "DELETE FROM Biblioteca "
    command += "WHERE Name = "
    command += "'" + nombre + "'" 
    cursor.execute(command)

# Actualiza la calificación de un Juego en Biblioteca
# en base a su nombre
def actualizar_calificacion(nombre_juego, new_rating):
    cursor = cnxn.cursor()
    command = "UPDATE Biblioteca "
    command += "SET Rating = " + new_rating
    command += "WHERE Name = "
    command += "'" + nombre_juego + "'"
    cursor.execute(command)

# Busca los Juegos y si lo haya lo imprime por pantalla
def buscar_por_nombre(nombre):
    command = "SELECT * FROM Juegos "
    command += "WHERE Name = "
    command += "'" + nombre + "'" 
    command += "FETCH FIRST ROW ONLY "
    cursor.execute(command)
    result = ''
    for row in cursor.fetchall():
        result += str(row) + '\n'
    print(result)

# Busca los Juegos que corresponden a la consola
# indicada, luego muestra la cantidad de filas que
# el usuario le indique
def buscar_por_consola(consola):
    rows = input("Cuantas filas quiere mostrar?: ")
    command = "SELECT * FROM Juegos "
    command += "WHERE Platform = "
    command += "'" + consola + "'" 
    command += "FETCH FIRST " + rows + " ROWS ONLY "
    cursor.execute(command)
    result = ''
    for row in cursor.fetchall():
        result += str(row) + '\n'
    print(result)

# Elimina absolutamente todos los Juegos comprados
# en Biblioteca
def eliminar_lib():
    cursor = cnxn.cursor()
    command = "TRUNCATE TABLE Biblioteca"
    cursor.execute(command)

# Funciones a elección que pide la tarea

# Muestra los Juegos por año más reciente
# evidentemente esta función es útil ya
# que el usuario puede querer saber los
# lanzamientos más recientes
def vista():
    cursor = cnxn.cursor()
    command = "SELECT DISTINCT * FROM Juegos "
    command += "ORDER BY Year DESC "
    command += "FETCH FIRST 5 ROWS ONLY "
    cursor.execute(command)
    result = ''
    for row in cursor.fetchall():
        result += str(row) + '\n'
    print(result)

# Este trigger busca los Juegos que tengan año -1
# y los remplaza por un dato nulo. Este trigger es
# necesario ya que al insertar los datos desde el
# csv, N/A no es un valor válido
def trigger():
    cursor = cnxn.cursor()
    command = "CREATE TRIGGER fix_null "
    command += "AFTER INSERT "
    command += "ON Biblioteca "
    command += "FOR EACH ROW "
    command += "SET Year = NULL "
    command += "WHERE Year = -1 "
    cursor.execute(command)


print("Cómo deséa conectarse a la Base de Datos?")
print("     1) Automático (Para testeo y programar)")
print("     2) Manual (Para revisión de los ayudantes)")
automatic_cnxn = int(input())
print("")
print("")
print("         - Conectando a la Base de Datos... - ")
print("")
print("")

if (automatic_cnxn == 1):
    # Conexión rápida a la base de datos local de mi PC, solo usada para revisar y arreglar errores
    # La clave y el puerto deben establecerse por la persona que intente ejecutar el codigo
    cnxn = pyodbc.connect("DRIVER=/usr/lib/libmaodbc.so;User=root;Password=;Database=tarea_1_bd;Server=localhost;Port=")

if (automatic_cnxn == 2):
    # Se conecta a través de la función que pide por pantalla
    cnxn = pyodbc.connect(conectarse_a_bd())

# Crea un cursor de conexión
cursor = cnxn.cursor()

# Abre el archivo juegos.csv para poder insertar los datos a la tabla Juegos
with open('juegos.csv', mode ='r') as file:

    # Extrae las filas del archivo CSV
    csvFile = csv.reader(file)
    csvFileRows = iter(csvFile)
    next(csvFileRows)
    
    # Inserta los datos uno por uno en la tabla de Juegos
    for line in csvFileRows:
        arr_valores = line
        index = 0
        # Filtra los datos que contengan N/A
        for element in arr_valores:
            if arr_valores[index] == 'N/A':
                arr_valores[index] = '-1'
            index += 1

        valores = tuple(e for e in arr_valores)
        command = "INSERT INTO Juegos(Rank, Name, Platform, Year, Genre, Publisher, "
        command += "NA_Sales, EU_Sales, JP_Sales, Other_Sales, Global_Sales)"
        command += " VALUES (?,?,?,?,?,?,?,?,?,?,?)"
        cursor.execute(command, valores)

# Genera la tabla Biblioteca
command = "CREATE TABLE Biblioteca(Id INT, Rank INT, Name VARCHAR(256), "
command += "Platform VARCHAR(8), Year INT, Genre VARCHAR(128), "
command += "Publisher VARCHAR(128), Rating INT)"
cursor.execute(command)

print("Bienvenido a USM Games! ¿Qué deséa hacer?")
print("")

# Usado para navegar el menú del interfaz
option = 0

# Almacena la cantidad de juegos comprados, notar que no se reduce
# al eliminar juegos, ya que actúa como el Id de las compras
n_de_juegos = 0

while option < 11:
    print("1) Mostrar Biblioteca        6) Actualizar Calificacion")
    print("2) Comprar Juego             7) Buscar Juego por Nombre")
    print("3) Mostrar Top 5 por Ranking 8) Buscar Juego por Plataforma")
    print("4) Mostrar Top 5 por Ventas  9) Eliminar Todos los Juegos")
    print("5) Eliminar Juego")
    print("")
    print("10) Mostrar Nuevos Lanzamientos")
    print("")
    print("11) Salir")
    option = int(input())
    print("")

    if option == 1:
        mostrar_biblioteca()

    if option == 2:
        nombre_juego = str(input("Que juego quiere comprar? "))
        comprar_juego(nombre_juego, n_de_juegos)
        n_de_juegos += 1

    if option == 3:
        mostrar_top5rank()

    if option == 4:
        mostrar_top5venta()

    if option == 5:
        nombre_juego = str(input("Que juego quiere eliminar? "))
        eliminar_juego(nombre_juego, n_de_juegos)

    if option == 6:
        nombre_juego = str(input("Que juego quiere cambiar? "))
        new_rating = str(input("Que calificación tendrá? "))
        actualizar_calificacion(nombre_juego, new_rating)

    if option == 7:
        nombre_juego = str(input("Que juego quiere buscar? "))
        buscar_por_nombre(nombre_juego)

    if option == 8:
        plataforma = str(input("Que plataforma busca? "))
        buscar_por_consola(plataforma)

    if option == 9:
        eliminar_lib()

    if option == 10:
        vista()

cnxn.commit()
cnxn.close()

