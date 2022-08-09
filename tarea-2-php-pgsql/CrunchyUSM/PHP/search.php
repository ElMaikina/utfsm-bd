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

    <center>
    <?php
        require 'conection.php';
        session_start();

        $name_query = "";
        $sort_query = "";
        $genre_query = "";
        $consulta = "";

        if (isset($_POST["search_by_name"])) {
            echo "Buscando resultados por nombre... <br>";

            if (empty($_POST["name"])) {
                echo "No se ingresaron los campos suficientes.";
            }
            else {
                $name_query = $_POST["name"];
                $query = "SELECT anime_name FROM anime WHERE anime_name = '$name_query'";
                $consulta = pg_query($cn, $query);
                while ($row = pg_fetch_row($consulta)) {
                    echo "<br>";
                    echo "<a href=\"anime.php?anime=";
                    echo $row[0];
                    echo "\">";
                    echo $row[0];
                    echo "</a>";
                    echo "<br>";   
                    echo "<img src=\"crunchy_banner.webp\" alt=\"CrunchyUSMBanner\" width=\"256\" height=\"96\">";
                    echo "<br>";
                }
            }
        }
        if (isset($_POST["search_by_sort"])) {
            echo "Buscando resultados por orden... <br>";
            
            if (empty($_POST["sort"])) {
                echo "No se ingresaron los campos suficientes.";
            }
            else {
                $sort_query = $_POST["sort"];
                if ($sort_query == "alphabetic") {
                    $query = "SELECT anime_name FROM anime ORDER BY anime_name ASC";
                    $consulta = pg_query($cn, $query);
                    while ($row = pg_fetch_row($consulta)) {
                        echo "<br>";
                        echo "<a href=\"anime.php?anime=";
                        echo $row[0];
                        echo "\">";
                        echo $row[0];
                        echo "</a>";
                        echo "<br>";   
                        echo "<img src=\"crunchy_banner.webp\" alt=\"CrunchyUSMBanner\" width=\"256\" height=\"96\">";
                        echo "<br>";
                    }
                }
                if ($sort_query == "airdate") {
                    $query = "SELECT anime_name FROM anime ORDER BY anime_airdate DESC";
                    $consulta = pg_query($cn, $query);
                    while ($row = pg_fetch_row($consulta)) {
                        echo "<br>";
                        echo "<a href=\"anime.php?anime=";
                        echo $row[0];
                        echo "\">";
                        echo $row[0];
                        echo "</a>";
                        echo "<br>";   
                        echo "<img src=\"crunchy_banner.webp\" alt=\"CrunchyUSMBanner\" width=\"256\" height=\"96\">";
                        echo "<br>";
                    }
                }
                if ($sort_query == "popular") {
                    $query = "SELECT which_anime, AVG(score_value) FROM calificacion GROUP BY which_anime ORDER BY AVG(score_value) DESC";
                    $consulta = pg_query($cn, $query);
                    while ($row = pg_fetch_row($consulta)) {
                        echo "<br>";
                        echo "<a href=\"anime.php?anime=";
                        echo $row[0];
                        echo "\">";
                        echo $row[0];
                        echo "</a>";
                        echo "<br>";   
                        echo "<img src=\"crunchy_banner.webp\" alt=\"CrunchyUSMBanner\" width=\"256\" height=\"96\">";
                        echo "<br>";
                    }
                }   
                if ($sort_query == "comments") {
                    $query = "SELECT which_anime FROM comentario GROUP BY which_anime ORDER BY COUNT(*) DESC";
                    $consulta = pg_query($cn, $query);
                    while ($row = pg_fetch_row($consulta)) {
                        echo "<br>";
                        echo "<a href=\"anime.php?anime=";
                        echo $row[0];
                        echo "\">";
                        echo $row[0];
                        echo "</a>";
                        echo "<br>";   
                        echo "<img src=\"crunchy_banner.webp\" alt=\"CrunchyUSMBanner\" width=\"256\" height=\"96\">";
                        echo "<br>";
                    }
                }                
                if ($sort_query == "top5_most_popular") {
                    $query = "SELECT which_anime, AVG(score_value) FROM calificacion GROUP BY which_anime ORDER BY AVG(score_value) DESC LIMIT 5";
                    $consulta = pg_query($cn, $query);
                    while ($row = pg_fetch_row($consulta)) {
                        echo "<br>";
                        echo "<a href=\"anime.php?anime=";
                        echo $row[0];
                        echo "\">";
                        echo $row[0];
                        echo "</a>";
                        echo "<br>";   
                        echo "<img src=\"crunchy_banner.webp\" alt=\"CrunchyUSMBanner\" width=\"256\" height=\"96\">";
                        echo "<br>";
                    }
                }
                if ($sort_query == "top5_least_popular") {
                    $query = "SELECT which_anime, AVG(score_value) FROM calificacion GROUP BY which_anime ORDER BY AVG(score_value) ASC LIMIT 5";
                    $consulta = pg_query($cn, $query);
                    while ($row = pg_fetch_row($consulta)) {
                        echo "<br>";
                        echo "<a href=\"anime.php?anime=";
                        echo $row[0];
                        echo "\">";
                        echo $row[0];
                        echo "</a>";
                        echo "<br>";   
                        echo "<img src=\"crunchy_banner.webp\" alt=\"CrunchyUSMBanner\" width=\"256\" height=\"96\">";
                        echo "<br>";
                    }
                }
                if ($sort_query == "top5_most_comments") {
                    $query = "SELECT which_anime FROM comentario GROUP BY which_anime ORDER BY COUNT(*) DESC LIMIT 5";
                    $consulta = pg_query($cn, $query);
                    while ($row = pg_fetch_row($consulta)) {
                        echo "<br>";
                        echo "<a href=\"anime.php?anime=";
                        echo $row[0];
                        echo "\">";
                        echo $row[0];
                        echo "</a>";
                        echo "<br>";   
                        echo "<img src=\"crunchy_banner.webp\" alt=\"CrunchyUSMBanner\" width=\"256\" height=\"96\">";
                        echo "<br>";
                    }
                }
            }
        }
        if (isset($_POST["search_by_genre"])) {
            echo "Buscando resultados por género... <br>";
            
            if (empty($_POST["genre"])) {
                echo "No se ingresaron los campos suficientes.";
            }
            else {
                $genre_query = $_POST["genre"];
                $query = "SELECT anime_name FROM anime INNER JOIN genreofanime ON which_anime = anime.anime_name AND genreofanime.which_genre = '$genre_query'";
                $consulta = pg_query($cn, $query);
                while ($row = pg_fetch_row($consulta)) {
                    echo "<br>";
                    echo "<a href=\"anime.php?anime=";
                    echo $row[0];
                    echo "\">";
                    echo $row[0];
                    echo "</a>";
                    echo "<br>";   
                    echo "<img src=\"crunchy_banner.webp\" alt=\"CrunchyUSMBanner\" width=\"256\" height=\"96\">";
                    echo "<br>";
                }
            }
        } 
    ?>
    </center>
    </body>
</html>