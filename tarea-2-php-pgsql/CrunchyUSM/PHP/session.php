<html>
    <head>
        <meta charset = "utf-8">
        <title>
        </title>
    </head>
    <body>
    <?php
        session_start();
        echo "<form action=\"profile.php\" method=\"post\">";
        echo "Usuario actual: ";
        echo $_SESSION["session_user"];
        echo "  ";
        echo "<input type=\"submit\" value=\"Ver Perfil\">";
        echo "</form>";
    ?>    
    <center>
    <br><br><br>
    <img src="crunchy_icon.png" alt="CrunchyUSMLogo" width="64" height="64">
    <img src="crunchy_usm_logo.png" alt="CrunchyUSM" height="48"> 
    <p>
    La mejor plataforma para ver Anime durante clase!
    </p>
    <br>
    <form action="search.php" method="post">
        Buscar por nombre:
        <input type="text" name="name">
        <input type="submit" name="search_by_name" value="Buscar">

        <br><br>
        Buscar por orden:
        <input type="radio" name="sort" value="alphabetic"> Alfabético
        <input type="radio" name="sort" value="airdate"> Reciente
        <input type="radio" name="sort" value="popular"> Popularidad
        <input type="radio" name="sort" value="comments"> Comentarios 
        
        <br><br>
        Recomendados:
        <br><br>
        <input type="radio" name="sort" value="top5_most_popular"> Top 5 Mas Populares
        <br>
        <input type="radio" name="sort" value="top5_least_popular"> Top 5 Menos Populares
        <br>
        <input type="radio" name="sort" value="top5_most_comments"> Top 5 Mas Comentados
        
        <br><br>
        <input type="submit" name="search_by_sort" value="Buscar">

        <br><br>
        Buscar por género:
        <br><br>
        <input type="radio" name="genre" value="Accion"> Accion
        <input type="radio" name="genre" value="Comedia"> Comedia
        <input type="radio" name="genre" value="Romance"> Romance
        <input type="radio" name="genre" value="Terror"> Terror

        <br>
        <input type="radio" name="genre" value="Misterio"> Misterio
        <input type="radio" name="genre" value="Deportes"> Deportes
        <input type="radio" name="genre" value="Isekai"> Isekai
        <input type="radio" name="genre" value="Mechas"> Mechas


        <br>
        <input type="radio" name="genre" value="Drama"> Drama
        <input type="radio" name="genre" value="Ecchi"> Ecchi
        <input type="radio" name="genre" value="Hentai"> Hentai
        <input type="radio" name="genre" value="Otro"> Otro
        <br><br>
        <input type="submit" name="search_by_genre" value="Buscar">

    </form>
    </center>
    </body>
</html>