<?php
if(isset($_SESSION['id']))
{

	if (isset($_SESSION['admin']) && $_SESSION['admin'] == true)
	{
	require ('views/header-admin.phtml');
	}
	
	else 
	{
	require('views/header-in.phtml');
	}
}

	else
	{
	require('views/header.phtml');
	}

?>