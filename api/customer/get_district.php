<?php 

  // Category read query
   $sql = "SELECT table_district.`id_district`,table_district.district_name,table_district.map_location,table_district.id_city,city_name FROM `table_district`,table_city WHERE table_district.id_city=table_city.id_city ";
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
            'map_location' => $row['map_location'],
            'id_city'=> $row['id_city'],
            'city_name'=> $row['city_name']
          );

          // Push to "data"
          array_push($district_arr['data'], $district_item);
        }

        // Turn to JSON & output
        echo json_encode($district_arr);

  } else {
        // No Categories
        echo json_encode(
          array('success' => 'true','message' => 'district  not found')
        );
  }


?>