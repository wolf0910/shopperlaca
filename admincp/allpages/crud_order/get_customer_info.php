<?php
include "../../../config/db_config.php";

$id_customer = $_POST['id_customer'];   // department id

$sql = "SELECT * FROM table_customer WHERE id_customer=".$id_customer." "; 

$result = mysqli_query($conn,$sql);

if(mysqli_num_rows($result)>0)
{
	$customer_arr = array();
	while( $row = mysqli_fetch_array($result) ){

	    $customer_arr[] = array(
	    	"id_customer" => $row['id_customer'], 
	    	"customer_fullname" => $row['customer_fullname'],
	    	"customer_address" => $row['customer_address'],
	    	"customer_phone" => $row['customer_phone'],

	    );
	}
}else{
	 $customer_arr[] = array("id_customer" => '', "customer_fullname" => '',"customer_address" => '',"customer_phone" => '');
}

// encoding array to json format
echo json_encode($customer_arr);