<?php
if (isset($_GET['id']))
{
	// $article
	$id = intval($_GET['id']);
	$res = mysqli_query($db, "SELECT comments.*, users.login FROM comments, users WHERE users.id = comments.id_author AND comments.id_article=".$article['id']);

	while($comments = mysqli_fetch_assoc($res))
	{
		// var_dump($comments);
		require('views/comments.phtml');
	}
}
?>