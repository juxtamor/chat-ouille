<?php
var_dump($_POST);

if(isset($_POST['content'],$_POST['id_article'],$_SESSION['id']))
{
	$content = $_POST['content'];
	$id_article = $_POST['id_article'];
	
	if (strlen($content) > 500)
	{
		$errors[] = "Contenu trop long (> 500)";
	}
	else if (strlen($content) < 2)
	{
		$errors[] = "Contenu trop court (< 2)";
	}
	
	// Etape 3
	if (count($errors) == 0)
	{
		$content = mysqli_real_escape_string($db, $content);
		$id_article=intval($id_article);
		// $content = intval($content);


		$res = mysqli_query($db, "INSERT INTO comments (content, id_article, id_author) VALUES('".$content."', '".$id_article."','".$_SESSION['id']."')");
		if ($res)
		{
		
			// Etape 4
			header('Location: index.php?page=article&id='.$id_article);
			exit;
		}
		else
		{
			$errors[] = mysqli_error($db);
			$errors[] = "Erreur interne";
		}
	}
}

?>