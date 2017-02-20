<?php
$errors = [];
$db = mysqli_connect("192.168.1.79","chat-ouille","chat-ouille","chat-ouille"); //URL, Utilisateur, MdP, Base de données//
session_start();// http://php.net/manual/fr/function.session-start.php
$access = ["message", "login", "register", "create-message","profil", "message-elem" , "users-elem"];
$page = "message";
if (isset($_GET['page']) && in_array($_GET['page'], $access))
{
    $page = $_GET['page'];
}
require('apps/traitement-users.php');
require('apps/traitement-messages.php');
if (isset($_GET['ajax']))
{
	require('apps/'.$page.'.php');
}
else
{
	require('apps/skel.php');
}
?>