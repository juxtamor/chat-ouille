<?php
while ($message = mysqli_fetch_assoc($res))
{
	require('views/message-elem.phtml');
}
?>