<?php
// <!-- 1. isset OU array_key_exists = vérification des variables
// 2. sécurisation/validation des données (ex : verification de longueur)
// 3. traitement des données (enregistrer les informations vers base de données)
// 4. redirection (PRG : POST REDIRECT GET) UX et Sécurité -->

if (isset( $_POST['message']))
{
	// Etape 2 : Validation des données
	
	$message = $_POST['message'];
	
	if (strlen($message) > 4094)
	{
		$errors[] = "Message trop long (> 4095)";
	}
	else if (strlen($message) < 2)
	{
		$errors[] = "Message trop court (< 20)";
	}

	// Etape 3 : Traitement des données
	if (count($errors)==0)
	{
		
		$message = mysqli_real_escape_string($db, $message);
		
		$res = mysqli_query($db, "INSERT INTO messages (id_author, content) VALUES('".$_SESSION['id']."', '".$message."')");
		if ($res)
		{
			header('Location: index.php?page=message');

			exit;
			
		}
		else
		{
			$errors[] = "Erreur interne";
		}
	/*
	INSERT INTO articles (title, content, author) VALUES('titre', 'contenu', 'auteur')
	*/
	}
	
}
?>