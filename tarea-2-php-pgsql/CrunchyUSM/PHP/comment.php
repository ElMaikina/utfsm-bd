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
        // Registra un nuevo Usuario a la Base de Datos
        require 'conection.php';
        session_start();
        // Pide los datos del Usuario a través de la página
        $comment_anime = $_SESSION['anime'];
        $comment_user = $_SESSION["session_user"];
        $comment = $_POST['new_comment'];
        
        //echo $comment_anime;

        $query = "INSERT INTO comentario (which_anime, which_user, comment_text) VALUES('$comment_anime', '$comment_user', '$comment')";
        $consulta = pg_query($cn, $query);

        if($consulta){
            echo "Se publicó tu comentario existosamente!";
        }
        else{
            echo pg_last_error($cn);
        }
    ?>

    </center>
    </body>
</html>