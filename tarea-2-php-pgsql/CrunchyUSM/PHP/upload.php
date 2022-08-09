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
    Ingrese los Datos del Anime!
	<form action="uploaded.php" method="post">
		<br>
		Nombre del Anime: <input type="text" name="new_title">
		<br>
		<br>
		Synopsis / Descripcion:
		<textarea name="new_synopsis">
		</textarea>
    	<br>
    	<br>
		Fecha de Estreno: <input type="date" name="new_airdate">
		<br>
        <br>
        ¿Es serie o pelicula?:
        <br>
        <input type="radio" name="type" value="f"> Serie
        <input type="radio" name="type" value="t"> Pelicula
        <br><br>
        Indique el/los género/s:
        <br>
        <input type="checkbox" name="new_genre[]" value="Accion"> Accion
        <input type="checkbox" name="new_genre[]" value="Comedia"> Comedia
        <input type="checkbox" name="new_genre[]" value="Romance"> Romance
        <input type="checkbox" name="new_genre[]" value="Terror"> Terror
        <br>
        <input type="checkbox" name="new_genre[]" value="Misterio"> Misterio
        <input type="checkbox" name="new_genre[]" value="Deportes"> Deportes
        <input type="checkbox" name="new_genre[]" value="Isekai"> Isekai
        <input type="checkbox" name="new_genre[]" value="Mechas"> Mechas
        <br>
        <input type="checkbox" name="new_genre[]" value="Drama"> Drama
        <input type="checkbox" name="new_genre[]" value="Ecchi"> Ecchi
        <input type="checkbox" name="new_genre[]" value="Hentai"> Hentai
        <input type="checkbox" name="new_genre[]" value="Otro"> Otro
        <br>
        <br>
        Foto de Portada:
	  	<input type="file" name="file" id="portada">
        <br>
        <br>
		<input type="submit" value="Subir Anime">
	</form>

	<form action="profile.php" method="post">
        Volver a Perfil
        <br>
        <input type="submit" value="Volver">
    </form>

	<center>
	</body>
</html>
