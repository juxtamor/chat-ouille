<?php
$res = mysqli_query($db, "SELECT users.* FROM users" );
while ($users = mysqli_fetch_assoc($res))
{
	require('views/users-elem.phtml');
}
?>