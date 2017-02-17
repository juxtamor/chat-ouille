<?php
// Etape 0
// var_dump($_POST);
if (isset($_GET['page']) && $_GET['page'] == "logout")
{
	session_destroy();
	header('Location: index.php');
	exit;
}
// Etape 1
if (isset($_POST['action']))
{
	$action = $_POST['action'];
	if ($action == "register")
	{

if (isset($_POST['login'], $_POST['birthdate'], $_POST['email'], $_POST['password1'], $_POST['password2']))
{
	// Etape 2
	$login = $_POST['login'];// 31
	$birthdate = $_POST['birthdate'];// date
	$email = $_POST['email'];// 127
	$password1 = $_POST['password1'];// 510
	$password2 = $_POST['password2'];// $password1
	if (strlen($login) > 31)
	{
		$errors[] = "Login trop long (> 31)";
	}
	else if (strlen($login) < 2)
	{
		$errors[] = "Login trop court (< 2)";
	}
	if (strlen($password1) > 72)
	{
		$errors[] = "Password trop long (> 72)";
	}
	else if ($password1 != $password2)
	{
		$errors[] = "Les mots de passe ne correspondent pas";
	}
	if (filter_var($email, FILTER_VALIDATE_EMAIL) == false)
	{
		$errors[] = "Email invalide";
	}

	
	// Etape 3
	if (count($errors) == 0)
	{
		
		$login = mysqli_real_escape_string($db, $login);
		$birthdate = mysqli_real_escape_string($db, $birthdate);
		$email = mysqli_real_escape_string($db, $email);
		$hash=password_hash($password1, PASSWORD_BCRYPT,["cost"=>12]);
		//hash permet de protéger le mots de passe suivant le cost plus dur ou non norm = 12
		// $password1 = mysqli_real_escape_string($db, $password1);
		// $password2 = mysqli_real_escape_string($db, $password2);

		$res = mysqli_query($db, "INSERT INTO users (login, birthday, email,passeword) VALUES('".$login."', '".$birthday."', '".$email."', '".$hash."')");

		if ($res)
		{
			
			header('Location: index.php?page=login');
			exit;
		}

		else
		{
			$errors[] = "Erreur interne";
		}
			}
		}
	}
	if ($action == "login")
	{
		// Etape 1
		if (isset($_POST['login'], $_POST['password']))
		{
			// Etape 2
			$login = $_POST['login'];
			$password = $_POST['password'];
			// Etape 3
			if (count($errors) == 0)
			{
				$login = mysqli_real_escape_string($db, $login);
				// $hash = password_hash($password1, PASSWORD_BCRYPT, ["cost"=>15]);
				$res = mysqli_query($db, "SELECT * FROM users WHERE login='".$login."'");
				if ($res)
				{
					$user = mysqli_fetch_assoc($res);
					// $user['id'], $user['email'], $user['login'], $user['password'], $user['birthdate']
					if ($user)
					{
						var_dump($password, $user['passeword'], password_verify($password, $user['passeword']));
						if (password_verify($password, $user['passeword']))
						{
							$_SESSION['id']=$user['id'];
							$_SESSION['login']=$user['login'];
							$_SESSION['admin']=$user['admin'];
							// Etape 4
							header('Location: index.php?page=articles');
							exit;
						}
						else
						{
							$errors[] = "Mot de passe incorrect";
						}
					}
					else
					{
						$errors[] = "Login inconnu";
					}
				}
				else
				{
					$errors[] = "Erreur interne";
				}
			}
		}
	}
}
?>