<?php
if (isset($_GET['id']))
{
	// $article
	$id = intval($_GET['id']);
	$res = mysqli_query($db, "SELECT messages.*, users.login FROM messages, users WHERE users.id = messages.id_author");

	while($messages = mysqli_fetch_assoc($res))
	{
		// var_dump($comments);
		require('views/message.phtml');
	}
}
?>