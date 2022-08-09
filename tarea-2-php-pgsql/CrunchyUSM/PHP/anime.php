<html>
    <head>
        <meta charset = "utf-8">
        <title>
        </title>
    </head>
    <body>

    <form action="session.php" method="post">
        <input type="submit" value="Volver">
    </form>

    <?php
        require 'conection.php';
        session_start();

        $anime = $_GET['anime'];
        $_SESSION["anime"] = $_GET['anime'];

        echo "<center>";
        echo "<h1>";
        echo $anime;
        echo "</h1>";
        echo "<img src=\"crunchy_banner.webp\" alt=\"CrunchyUSMBanner\" width=\"256\" height=\"256\">";
        echo "<br><br>";

        echo "<form action=\"interaction.php\" method=\"post\">";
        echo "<input type=\"submit\" name=\"interaction\" value=\"Ver Anime\">";
        echo "  ";
        echo "<input type=\"submit\" name=\"interaction\" value=\"Calificar Anime\">";
        echo "  ";
        echo "<input type=\"submit\" name=\"interaction\" value=\"Agregar Anime a Lista\">";
        echo "</form>";

        $query = "SELECT isMovie FROM anime WHERE anime_name = '$anime'";
        $consulta = pg_query($cn, $query);

        while ($row = pg_fetch_row($consulta)) {
            echo "Tipo: ";
            if ($row[0] == 'f') {
                echo "Serie";                
            }
            if ($row[0] == 't') {
                echo "Pelicula";
            }
            echo "<br><br>";
        };

        $query = "SELECT anime_synopsis, anime_airdate FROM anime WHERE anime_name = '$anime'";
        $consulta = pg_query($cn, $query);

        while ($row = pg_fetch_row($consulta)) {
            echo "Descripcion: <br>";
            echo $row[0];
            echo "<br><br>";
            echo "Fecha de Estreno: <br>";
            echo $row[1];
            echo "<br><br>";
        };

        echo "Calificaciones: <br>";
        $query = "SELECT which_user, score_value FROM calificacion WHERE which_anime = '$anime'";
        $consulta = pg_query($cn, $query);

        while ($row = pg_fetch_row($consulta)) {
            echo "<br>";
            echo "\"";
            echo $row[0];
            echo "\"";
            echo " : ";
            echo $row[1];
            echo "<br>";
        }
        echo "<br>";

        echo "Comentarios: <br>";
        $query = "SELECT which_user, comment_text FROM comentario WHERE which_anime = '$anime'";
        $consulta = pg_query($cn, $query);

        while ($row = pg_fetch_row($consulta)) {
            echo "<br>";
            echo "\"";
            echo $row[0];
            echo "\"";
            echo " : ";
            echo $row[1];
            echo "<br>";

            $me_commented = $_SESSION["session_user"];
            $who_commented = $row[0];

            echo "<form action=\"interaction.php\" method=\"post\">";
            echo "<input type=\"submit\" name=\"interaction\" value=\"Me Gusta\">";
            echo "  ";
            echo "<input type=\"submit\" name=\"interaction\" value=\"Agregar\">";
            echo "  ";
            if ($who_commented == $me_commented) {
                echo "<input type=\"submit\" name=\"interaction\" value=\"Borrar\">";
            }
            echo "</form>";
        }
        echo "<center>";
    ?>
    <br>
    <form action="rank.php" method="post">
        <label for="quantity"> Calificacion (de 0 a 100):</label>
        <input type="number" id="nota" name="nota" min="0" max="100">
        <input type="submit" value="Subir">
    </form>

    <form action="comment.php" method="post">
        Comentar Anime:
        <textarea name="new_comment">
        </textarea>
        <input type="submit" value="Subir">
    </form>

    </body>
</html>