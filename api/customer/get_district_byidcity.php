<?php 
if( isset($_REQUEST['id_city']) && $_REQUEST['id_city']!='' ){
  // Category read query
   $sql = "SELECT * FROM table_district WHERE id_city='".$_REQUEST['id_city']."' ";

   $result = $conn->query($sql);
  
  // Get row count
  $num = mysqli_num_rows($result);

  // Check if any categories
  if($num > 0) {
        // Cat array
        $district_arr = array();
        $district_arr['success'] = 'true';        
        $district_arr['data'] = array();

        while($row = $result->fetch_assoc()) {
          
          $district_item = array(
            'id_district' => $row['id_district'],
            'district_name' => $row['district_name'],
            'map_location' => $row['map_location']
          );

          // Push to "data"
          array_push($district_arr['data'], $district_item);
        }

        // Turn to JSON & output
        echo json_encode($district_arr);

  } else {
        // No Categories
        echo json_encode(
          array('success'   => 'false','message' => 'district  not found')
        );
  }
} else {
   // No Categories
        echo json_encode(
          array('success'   => 'false','message' => 'id_city  not found')
        );
}

?>