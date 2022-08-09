<html>
    <head>
        <meta charset = "utf-8">
        <title>
        </title>
    </head>
    <body>

    <form action="index.php" method="post">
        <input type="submit" value="Indice">
    </form>
    <center>
    <?php
        // Registra un nuevo Usuario a la Base de Datos
        require 'conection.php';
        session_start();

        $this_user = $_SESSION["session_user"];
        

        $query = "DELETE FROM animeinlist WHERE creator_name = '$this_user'";
        $consulta = pg_query($cn, $query);
    
        $query = "DELETE FROM playlist WHERE creator_name = '$this_user'";
        $consulta = pg_query($cn, $query);

        $query = "DELETE FROM comentario WHERE which_user = '$this_user'";
        $consulta = pg_query($cn, $query);
    
        $query = "DELETE FROM calificacion WHERE which_user = '$this_user'";
        $consulta = pg_query($cn, $query);
    
        echo "Borraste tu Usuario!";
    ?>

    </center>
    </body>
</html>