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
        $current_user = $_SESSION["session_user"];

        $query = "SELECT * FROM usuario WHERE user_name = '$current_user'";
        $consulta = pg_query($cn, $query);

        echo "<center>";
        echo "<h1>";
        echo "Perfil del Usuario";
        echo "</h1>";
        
        while ($row = pg_fetch_row($consulta)) {
            echo "usuario: ";
            echo $row[0];
            echo "<br>";
            echo "correo: ";
            echo $row[1];
            echo "<br>";
            echo "clave: ";
            echo $row[2];
        }
        echo "<br><br>";

        $query = "SELECT user_name FROM usuario WHERE user_name = '$current_user'";
        $consulta = pg_query($cn, $query);

        echo "<form action=\"profile_action.php\" method=\"post\">";
        echo "<input type=\"submit\" name=\"interaction\" value=\"Ver Historial\">";
        echo "<br><br>";
        echo "<input type=\"submit\" name=\"interaction\" value=\"Ver Favoritos\">";
        echo "<br><br>";
        echo "<input type=\"submit\" name=\"interaction\" value=\"Crear Lista\">";
        echo "</form>";

        echo "<form action=\"delete_user.php\" method=\"post\">";
        echo "<input type=\"submit\" name=\"interaction\" value=\"Borrar Cuenta\">";
        echo "</form>";

        while ($row = pg_fetch_row($consulta)) {
            if ($row[0] == "admin") {
                echo "<form action=\"upload.php\" method=\"post\">";
                echo "<input type=\"submit\" value=\"Subir un Anime\">";
                echo "</form>";
            }
        }

        echo "<center>";
    ?>

    </body>
</html>