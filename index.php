<?php
$errors = [];
$db = mysqli_connect("192.168.1.79","chat-ouille","chat-ouille","chat-ouille"); //URL, Utilisateur, MdP, Base de données//
session_start();// http://php.net/manual/fr/function.session-start.php
$access = ["articles", "login", "register", "create_article", "edit_article", "article"];
$page = "articles";
if (isset($_GET['page']) && in_array($_GET['page'], $access))
{
    $page = $_GET['page'];
}
require('apps/traitement_users.php');
require('apps/traitement_messages.php');
require('apps/skel.php');
?>