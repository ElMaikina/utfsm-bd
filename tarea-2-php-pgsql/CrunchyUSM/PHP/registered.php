<html>
    <head>
        <meta charset = "utf-8">
        <title>
        </title>
    </head>
    <body>
    <center>
    <br><br><br><br><br><br>
    <img src="crunchy_icon.png" alt="CrunchyUSMLogo" width="64" height="64">
    <img src="crunchy_usm_logo.png" alt="CrunchyUSM" height="48"> 
    <p>
    La mejor plataforma para ver Anime durante clase!
    </p>
    <br>
    <?php
        // Registra un nuevo Usuario a la Base de Datos
        require 'conection.php';
        session_start();
        // Pide los datos del Usuario a través de la página
        $register_username = $_POST["name"];
        $register_email = $_POST["email"];
        $register_password = $_POST["password"];

        if ($register_username == "") {
            echo "<br>Ingrese un Usuario valido!<br><br>";
        }
        else {
            // Realiza una Query para insertar al Usuario
            $query = "INSERT INTO usuario (user_name, user_email, user_password) VALUES('$register_username', '$register_email', '$register_password')";
            $consulta = pg_query($cn, $query);

            if($consulta){
                echo "Se creó el Usuario exitosamente!";
            }
            else{
                echo pg_last_error($cn);
            }

            $query = "INSERT INTO playlist (creator_name, playlist_name) VALUES('$register_username', 'Historial')";
            $consulta = pg_query($cn, $query);

            $query = "INSERT INTO playlist (creator_name, playlist_name) VALUES('$register_username', 'Favoritos')";
            $consulta = pg_query($cn, $query);
        }
    ?>
    <form action="index.php" method="post">
        Volver a la página principal
        <br>
        <input type="submit" value="Volver">
    </form>

    </center>
    </body>
</html>