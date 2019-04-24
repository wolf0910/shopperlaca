<?php
// Database details
include ('../../../config/db_config.php');

// Get job (and id)
$job = '';
$id  = '';
if (isset($_REQUEST['job'])){
  $job = $_REQUEST['job'];
  if ($job == 'get_companies' ||
      $job == 'get_company'   ||
      $job == 'add_company'   ||
      $job == 'edit_company'  ||
      $job == 'delete_company'){
    if (isset($_REQUEST['id'])){
      $id = $_REQUEST['id'];
      if (!is_numeric($id)){
        $id = '';
      }
    }
  } else {
    $job = '';
  }
}

// Prepare array
$mysql_data = array();

// Valid job found
if ($job != ''){
  
  
  if (mysqli_connect_errno()){
    $result  = 'error';
    $message = 'Failed to connect to database: ' . mysqli_connect_error();
    $job     = '';
  }
  
  // Execute job
  if ($job == 'get_companies'){
    
    // Get companies
    $query = "SELECT * FROM `table_order` ";

    $query = mysqli_query($conn, $query);
    if (!$query){
      $result  = 'error';
      $message = 'query error';
    } else {
      $result  = 'success';
      $message = 'query success';
      while ($company = mysqli_fetch_array($query)){

        $functions  = '<div class="function_buttons"><ul>';
        $functions .= '<li class="function_view"><a  data-id="'   . $company['id_order'] . '" data-name="' . $company['id_order'] . '"><span>View</span></a></li>';
        $functions .= '<li class="function_edit"><a data-id="'   . $company['id_order'] . '" data-name="' . $company['id_order'] . '"><span>Edit</span></a></li>';
        $functions .= '<li class="function_delete"><a data-id="' . $company['id_order'] . '" data-name="' . $company['id_order'] . '"><span>Delete</span></a></li>';
        $functions .= '</ul></div>';

        // get agent_name from id_agent
        if( $company['id_agent'] !='' ){
          $query2="SELECT * FROM `table_agent` WHERE id_agent='".$company['id_agent']."' ";
          $query2 = mysqli_query($conn, $query2);
          while ($row2 = mysqli_fetch_array($query2)){
            $agent_name=$row2['agent_name'];
          }
        } else {
          $agent_name = "Chờ đại lý nhận";
        }

        // get products list
        $query3="SELECT * FROM table_product ";
     
        $query3 = mysqli_query($conn, $query3);

        while ($row3 = mysqli_fetch_array($query3))
        {
          $product_list['id_product'][] = $row3['id_product'];
          $product_list['product_name'][] = $row3['product_name'];
        }
        //end get products list


        $mysql_data[] = array(
          "id_order"  => $company['id_order'],          
          "date_created" => $company['date_created'],
          "id_customer"  => $company['id_customer'],
          "agent_name"  => $agent_name,

          "receiver_address"  => $company['receiver_address'],
          "receiver_name"  => $company['receiver_name'],
          "receiver_phone"  => $company['receiver_phone'],           
            
          "delivery_status" => $company['delivery_status'],
          "product_list" => $product_list,
          "id_agent"   => $company['id_agent'],     
          "functions"     => $functions
        );
      }
    }
    
  } elseif ($job == 'get_company'){
    
    // Get company
    if ($id == ''){
      $result  = 'error';
      $message = 'id missing';
    } else {

      $query = "SELECT * FROM table_order, table_district WHERE table_order.receiver_id_district = table_district.id_district AND id_order= '".mysqli_real_escape_string($conn, $id)."' ";
      $query = mysqli_query($conn, $query);
      
      if (!$query){
        $result  = 'error';
        $message = 'query error';
      } else {
        $result  = 'success';
        $message = 'query success';
        while ( $company = mysqli_fetch_array($query) ){

        // get quatation detail
        $query2=" SELECT * FROM `table_order_detail` WHERE id_order='".$company['id_order']."' ";
       
        $query2 = mysqli_query($conn, $query2);

        while ($row2 = mysqli_fetch_array($query2))
        {
          $product['id_product'][]=$row2['id_product'];
          $product['quantity'][]=$row2['quantity'];
          $product['unit_price'][]=$row2['unit_price'];
        }
        //end get quatation detail

        // get products list
          $query3="SELECT * FROM table_product";
       
          $query3 = mysqli_query($conn, $query3);

          while ($row3 = mysqli_fetch_array($query3))
          {
            $product_list['id_product'][]=$row3['id_product'];
            $product_list['product_name'][]=$row3['product_name'];
          }
        //end get products list

        $mysql_data[] = array(
          "id_order"  => $company['id_order'],          
          "date_created" => $company['date_created'],
          "delivery_status" => $company['delivery_status'],
          "product_array" => $product,
          "product_list" => $product_list,
          "id_city" => $company['id_city'],
          "id_district" => $company['id_district'],
          "id_customer" => $company['id_customer'],
          "id_agent"  => $company['id_agent']
          );
        }

      }

    }
  
  } elseif ($job == 'add_company'){
    // Add company
      $query = "INSERT INTO table_order SET ";

      if (isset($_REQUEST['id_customer']))
        { 
          $query .= "id_customer = '".mysqli_real_escape_string($conn, $_REQUEST['id_customer']). "', ";
        }
      if (isset($_REQUEST['receiver_name']))
        { 
          $query .= "receiver_name = '".mysqli_real_escape_string($conn, $_REQUEST['receiver_name']). "', ";
        }
      if (isset($_REQUEST['receiver_phone']))
        { 
          $query .= "receiver_phone = '".mysqli_real_escape_string($conn, $_REQUEST['receiver_phone']). "', ";
        }
      if (isset($_REQUEST['receiver_address']))
        { 
          $query .= "receiver_address = '".mysqli_real_escape_string($conn, $_REQUEST['receiver_address']). "', ";
        }
      if (isset($_REQUEST['id_district']))
        { 
          $query .= "receiver_id_district = '".mysqli_real_escape_string($conn, $_REQUEST['id_district']). "', ";
        }
      if (isset($_REQUEST['id_agent']))
        { 
          $query .= "id_agent = '".mysqli_real_escape_string($conn, $_REQUEST['id_agent']). "', ";
        }
      
     
      $current_day = date("Y-m-d h:i:s");
      $query .= "date_created = '".$current_day."' ";

      $query = mysqli_query($conn, $query);

      // catch inserted id
      $last_id = mysqli_insert_id($conn);
      if (isset($_REQUEST['id_product']))
      {
        $count_array= count($_REQUEST['id_product']);
        for($i=0;$i<$count_array;$i++)
        {
          // get current price of product
          $query = "SELECT * FROM table_product WHERE id_product= ".$_REQUEST['id_product'][$i]." "; 
          $query = mysqli_query($conn, $query);
          while ($row = mysqli_fetch_array($query))
          {
            $row_price = $row['product_price'];
          }
          $query = "INSERT INTO table_order_detail SET ";              
          $query .= "id_product = '".$_REQUEST['id_product'][$i]."', "; 
          $query .= "quantity = '".$_REQUEST['quantity'][$i]."', ";
          $query .= "unit_price = '".$row_price."', ";
          $query .= "id_order = '".$last_id."' ";
          $query = mysqli_query($conn, $query);
        }
      }

      if ($query){
        $result  = 'success';
        $message = 'query success';
       
      } else {
         $result  = 'error';
        $message = 'query error';
      }

} elseif ($job == 'edit_company'){
    
    // Edit company
    if ($id == ''){
      $result  = 'error';
      $message = 'id missing';
    } else {

      // update in table table_order

      $query = "UPDATE table_order SET ";

      if (isset($_REQUEST['id_customer']))         { $query .= "id_customer = '" .mysqli_real_escape_string($conn, $_REQUEST['id_customer']). "', "; }
      if (isset($_REQUEST['delivery_status']))         { $query .= "delivery_status = '" . mysqli_real_escape_string($conn, $_REQUEST['delivery_status'])         . "', "; }

      if (isset($_REQUEST['receiver_name']))
      { 
        $query .= "receiver_name = '" . mysqli_real_escape_string($conn, $_REQUEST['receiver_name'])         . "', "; 
      }

      if (isset($_REQUEST['receiver_phone']))
      { 
        $query .= "receiver_phone = '" . mysqli_real_escape_string($conn, $_REQUEST['receiver_phone'])         . "', ";
      }

      if (isset($_REQUEST['receiver_address']))
      { 
        $query .= "receiver_address = '" . mysqli_real_escape_string($conn, $_REQUEST['receiver_address'])         . "', "; 
      }

      if (isset($_REQUEST['delivery_status']))
      { 
        $query .= "delivery_status = '" . mysqli_real_escape_string($conn, $_REQUEST['delivery_status'])         . "' "; 
      }
     
      $query .= "WHERE id_order = '" . mysqli_real_escape_string($conn, $_REQUEST['id_order']) . "'";

      $query  = mysqli_query($conn, $query);

    // delete old detail of order bill
    
      $query = "DELETE FROM table_order_detail WHERE id_order = '".mysqli_real_escape_string($conn, $_REQUEST['id_order'])."'";
      $query = mysqli_query($conn, $query);

    // end delete from table table_order_detail
    

    //add new detail
      if (isset($_REQUEST['id_product'])) {

        $count_array= count($_REQUEST['id_product']);           
          
        for($i=0;$i<$count_array;$i++)
        {
          // get current price of product
          $query = "SELECT * FROM table_product WHERE id_product= ".$_REQUEST['id_product'][$i]." ";      

          $query = mysqli_query($conn, $query);

          while ($row = mysqli_fetch_array($query))
            {
                $row_price=$row['product_price'];
            }

          $query = "INSERT INTO table_order_detail SET ";              
          $query .= "id_product = '".$_REQUEST['id_product'][$i]."', "; 
          $query .= "quantity = '".$_REQUEST['quantity'][$i]."', ";
          $query .= "unit_price = '".$row_price."', ";
          $query .= "id_order = '".$_REQUEST['id_order']."' ";
          $query = mysqli_query($conn, $query);
        }

          }
    //end add new detail


      if (!$query){
        $result  = 'error';
        $message = 'query error';
      } else {
        $result  = 'success';
        $message = 'query success';
      }
    }
    
  } elseif ($job == 'delete_company'){
  
    // Delete company
    if ($id == ''){
      $result  = 'error';
      $message = 'id missing';
    } else {
    

   
    // delete from table table_order_detail
      $query = "DELETE FROM table_order_detail WHERE id_order = '".mysqli_real_escape_string($conn, $id)."'";
      $query = mysqli_query($conn, $query);

    // end delete from table table_order_detail

    // delete from table table_order
      $query = "DELETE FROM table_order WHERE id_order = '".mysqli_real_escape_string($conn, $id)."'";
      $query = mysqli_query($conn, $query);

    // end delete from table table_order

      if (!$query){
        $result  = 'error';
        $message = 'query error';
      } else {
        $result  = 'success';
        $message = 'query success';
      }
    }
  
  }
  
  // Close database connection
  mysqli_close($conn);

}

// Prepare data
$data = array(
  "result"  => $result,
  "message" => $message,
  "data"    => $mysql_data
);

// Convert PHP array to JSON array
$json_data = json_encode($data);
print $json_data;
?>