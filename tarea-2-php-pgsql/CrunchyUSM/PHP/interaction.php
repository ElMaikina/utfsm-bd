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

        $action_query = $_POST["interaction"];
        $this_user = $_SESSION["session_user"];

        echo "<center>";
        if ($action_query == "Ver Anime") {
            echo "Viste el Anime!";
        }        

        if ($action_query == "Calificar Anime") {
            echo "Calificaste el Anime!";
        }

        if ($action_query == "Agregar Anime a Lista") {
            echo "Agregaste el Anime a tu Lista!";
        }

        if ($action_query == "Me Gusta") {
            echo "Le diste me gusta!";
        }        

        if ($action_query == "Agregar") {
            echo "Hiciste un nuevo amigo!";
        }

        if ($action_query == "Borrar") {
            echo "Borraste un comentario!";
        }
        echo "<center>";
        //$query = "SELECT anime_synopsis, anime_airdate FROM anime WHERE anime_name = '$anime'";
        //$consulta = pg_query($cn, $query);

    ?>
    </body>
</html>