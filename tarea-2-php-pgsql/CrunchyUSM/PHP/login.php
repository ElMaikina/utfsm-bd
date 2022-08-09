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
        require 'conection.php';
        session_start();

		$query = "SELECT * FROM usuario WHERE user_name = '$_POST[user]' AND user_password = '$_POST[password]'";      
		$consulta = pg_query($cn, $query);
		$resultado = pg_fetch_assoc($consulta);

		if ($resultado) {
			echo "Bienvenido/a nuevamente, ";
			echo $_POST['user'];
			echo "!";
			echo "<br><br>";
		    echo "<form action=\"session.php\" method=\"post\">";
		    echo "<input type=\"submit\" value=\"Ingresar\">";
		    echo "</form>";

		    $_SESSION["session_user"] = $_POST['user'];
		    $_SESSION["session_password"] = $_POST['password'];

        	$current_user = $_SESSION["session_user"];
		}
		else {
			echo "Usuario incorrecto!";
		}
	?>

    <form action="index.php" method="post">
        <input type="submit" value="Volver">
    </form>

	</center>
	</body>
</html>
