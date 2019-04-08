<?php
session_start();
//
session_destroy(); 

//Back to login page

header('location:index.php');
exit();

?>