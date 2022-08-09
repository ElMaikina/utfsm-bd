<html>
    <head>
        <meta charset = "utf-8">
        <title>
        </title>
    </head>
    <body>
    <center>
    <br><br><br>
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
        $upload_title = $_POST["new_title"];
        $upload_synopsis = $_POST["new_synopsis"];
        $upload_airdate = $_POST["new_airdate"];
        $upload_genre = $_POST["new_genre"];
        $upload_type = $_POST["type"];

        $query = "INSERT INTO anime (anime_name, anime_synopsis, anime_airdate, isMovie) VALUES('$upload_title', '$upload_synopsis', '$upload_airdate', '$upload_type')";
        $consulta = pg_query($cn, $query);

        if($consulta)
        {
            for ($i = 0; $i < count($upload_genre); $i++) {
                $current_genre = $upload_genre[$i];
                $query_loop = "INSERT INTO genreofanime (which_genre, which_anime) VALUES('$current_genre', '$upload_title')";
                $consulta_loop = pg_query($cn, $query_loop);
            }

            echo "Se subió el anime exitosamente!<br><br>";
        }
        else{
            echo pg_last_error($cn);
        }
    ?>

    <form action="upload.php" method="post">
        Subir otro Anime
        <br>
        <input type="submit">
    </form>

    <form action="index.php" method="post">
        Volver a la página principal
        <br>
        <input type="submit" value="Volver">
    </form>

    </center>
    </body>
</html>