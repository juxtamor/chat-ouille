<?php
$res = mysqli_query($db, "SELECT users.* FROM users WHERE last_act+10>CURRENT_TIMESTAMP");
while ($users = mysqli_fetch_assoc($res))
{
	require('views/users-elem.phtml');
}
?>