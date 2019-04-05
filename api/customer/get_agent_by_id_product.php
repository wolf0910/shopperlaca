<?php

if(isset($_REQUEST['id_product']))
{
  if($_REQUEST['id_product']==''){
    unset($_REQUEST['id_product']);
  }
}
if(!isset($_REQUEST['id_product']))
{
  // No Categories
  echo json_encode(
    array('success' => 'false','message' => 'id_product not found !')
  );
  exit();
}

if(isset($_REQUEST['customer_latitude']))
{
  if($_REQUEST['customer_latitude']==''){
    unset($_REQUEST['customer_latitude']);
  }
}
if(!isset($_REQUEST['customer_latitude']))
{
  // No Categories
  echo json_encode(
    array('success' => 'false','message' => 'customer_latitude not found !')
  );
  exit();
}

if(isset($_REQUEST['customer_longitude']))
{
  if($_REQUEST['customer_longitude']==''){
    unset($_REQUEST['customer_longitude']);
  }
}
if(!isset($_REQUEST['customer_longitude']))
{
  // No Categories
  echo json_encode(
    array('success' => 'false','message' => 'customer_longitude not found !')
  );
  exit();
}

$range=5;
if(isset($_REQUEST['range']))
{
  if($_REQUEST['range']==''){
    unset($_REQUEST['range']);
  } else {
  	$range=$_REQUEST['range'];
  }
}

	// get all agent
	$agent_arr = array();
	// query
	$sql = "SELECT * FROM `table_agent`,`table_storage` WHERE table_agent.id_agent = table_storage.id_agent AND table_storage.id_product= '".$_REQUEST['id_product']."' ";  
	$result = $conn->query($sql);  
	// Get row count
	$num = mysqli_num_rows($result);

// Check if any categories
if($num > 0) {
    // Cat array   
    $agent_arr['success'] = 'true';
    $agent_arr['data'] = array();
	while($row = $result->fetch_assoc()) 
	{
	    $product_item = array(
	      'id_agent' => $row['id_agent'],
	      'agent_name' => $row['agent_name'],
	      'agent_phone' => $row['agent_phone'],
	      'agent_email' => $row['agent_email'],
	      'agent_password' => $row['agent_password'],
	      'id_district' => $row['id_district'],      
	      'map_latitude' => $row['map_latitude'],
	      'map_longitude' => $row['map_longitude'],
	      'quantity' => $row['quantity'],
	      'agent_address' => $row['agent_address']
	    );
		// Push to "data"
		array_push($agent_arr['data'], $product_item);
	}
// filter result with range and location 

    // create tmp_array
    $agent_arr2 = array();
    $agent_arr2['success'] = 'true';
    $agent_arr2['total'] = 0;  
    $agent_arr2['data'] = array();

    foreach ($agent_arr['data'] as $value)
    {     
      if( distanceCalculation($_REQUEST['customer_latitude'],$_REQUEST['customer_longitude'],$value['map_latitude'],$value['map_longitude']) <= $range )
      {
      	$value['distant'] = (string)distanceCalculation($_REQUEST['customer_latitude'],$_REQUEST['customer_longitude'],$value['map_latitude'],$value['map_longitude']) ;
        array_push($agent_arr2['data'],$value);
        $agent_arr2['total']++;
      }
    }
    // assign new result
    $agent_arr=$agent_arr2;

// end filter result with range and location

if($agent_arr['total'] == 0){
	$agent_arr['message'] = 'There are no agent fit the condition !';
}
//end paging result

    // Turn to JSON & output
    echo json_encode($agent_arr);

  } else {
        // No Categories
        echo json_encode(
          array('success' => 'true','message' => 'There are no agent fit the condition !')
        );
  }

?>






