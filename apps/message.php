<?php
$res = mysqli_query($db, "SELECT messages.*, users.login, users.avatar FROM messages, users WHERE users.id = messages.id_author");

while($messages = mysqli_fetch_assoc($res))
{
	// var_dump($comments);
	require('views/message.phtml');
}
?>