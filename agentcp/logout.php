<?php
session_start();
//
unset($_SESSION['agent_name']);
unset($_SESSION['id_agent']);

//Back to login page

header('location:../agentcp/');
exit();

?>