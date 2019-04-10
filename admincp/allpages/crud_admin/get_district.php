<?php
include "../../../config/db_config.php";

$id_city = $_POST['id_city'];   // department id

$sql = "SELECT * FROM table_district WHERE id_city=".$id_city;

$result = mysqli_query($conn,$sql);

if(mysqli_num_rows($result)>0)
{
	$district_arr = array();
	while( $row = mysqli_fetch_array($result) ){
	    $id_district = $row['id_district'];
	    $district_name = $row['district_name'];
	    $district_arr[] = array("id_district" => $id_district, "district_name" => $district_name);
	}
}else{
	 $district_arr[] = array("id_district" => '', "district_name" => 'Chọn danh mục con');
}


	
// encoding array to json format
echo json_encode($district_arr);