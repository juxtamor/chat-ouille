<?php
while ($message = mysqli_fetch_assoc($res))
{
	var_dump($message);
	require('views/message-elem.phtml');
}
?>