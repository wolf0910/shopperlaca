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

      $query = "SELECT * FROM table_order WHERE id_order= '".mysqli_real_escape_string($conn, $id)."' ";
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
            $product['current_price'][]=$row2['current_price'];
          }
        //end get quatation detail
        // get products list
          $query3="SELECT * FROM table_products ";
       
          $query3 = mysqli_query($conn, $query3);

          while ($row3 = mysqli_fetch_array($query3))
          {
            $product_list['id_product'][]=$row3['id_product'];
            $product_list['product_code'][]=$row3['product_code'];
            $product_list['product_name'][]=$row3['product_name'];
          }
        //end get products list

        if($company['status']=='0'){ $status_txt='Chờ sản xuất';}
        if($company['status']=='1'){ $status_txt='Chờ xuất hàng';}
        if($company['status']=='2'){ $status_txt='Đang sản xuất';}
        if($company['status']=='3'){ $status_txt='Chờ giao hàng';}
        if($company['status']=='4'){ $status_txt='Đã giao hàng';}


        $mysql_data[] = array(
          "id_order"  => $company['id_order'],          
          "date_created" => $company['date_created'],
          "status" => $company['status'],
          "status_txt" => $status_txt,
          "product_array" => $product,
          "product_list" => $product_list,
          "id_customer_personal" => $company['id_customer_personal'],
          "id_customer_company" => $company['id_customer_company'],
          "created_by_user"  => $company['created_by_user']
          );
        }

      }

    }
  
  } elseif ($job == 'add_company'){
    // Add company
              $query = "INSERT INTO table_order SET ";

              if (isset($_REQUEST['id_customer']))
                { 
                  $id_customer_tmp=substr($_REQUEST['id_customer'],2);
                  if(substr($_REQUEST['id_customer'],0,2)=='DN'){                   
                    $query .= "id_customer_company  = '" . mysqli_real_escape_string($conn, $id_customer_tmp)         . "', ";
                  } else {
                     $query .= "id_customer_personal  = '" . mysqli_real_escape_string($conn, $id_customer_tmp)         . "', ";
                  }

                }
           
             $current_day=date("Y-m-d");
             $query .= "date_created = '".$current_day."', ";


              
          if (isset($_REQUEST['id_customer'])) { $query .= "created_by_user = '" . mysqli_real_escape_string($conn, $_REQUEST['id_customer'])         . "' "; }
              
              $query = mysqli_query($conn, $query);

          // catch inserted id
              $last_id = mysqli_insert_id($conn);

          if (isset($_REQUEST['product'])) {

            $count_array= count($_REQUEST['product']['name']);           
            $total_order=0;
            for($i=0;$i<$count_array;$i++){

              // get current price of product
              $query = "SELECT * FROM table_products WHERE id_product= ".$_REQUEST['product']['name'][$i]." ";      

              $query = mysqli_query($conn, $query);

              while ($row = mysqli_fetch_array($query))
                {
                    $row_price=$row['price'];
                }

            $query = "INSERT INTO table_order_detail SET ";              
            $query .= "id_product = '".$_REQUEST['product']['name'][$i]."', "; 
            $query .= "quantity = '".$_REQUEST['product']['quantity'][$i]."', ";
            $query .= "current_price = '".$row_price."', ";
            $query .= "id_order = '".$last_id."' ";
            $query = mysqli_query($conn, $query);
            $total_order+=$row_price;

          }
          $query = "UPDATE table_order SET total= '".$total_order."' WHERE id_order= '".$last_id."' ";
           $query = mysqli_query($conn, $query);

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

      if (isset($_REQUEST['id_customer']))         { $query .= "created_by_user         = '" . mysqli_real_escape_string($conn, $_REQUEST['id_customer'])         . "', "; }
      if (isset($_REQUEST['status']))         { $query .= "status         = '" . mysqli_real_escape_string($conn, $_REQUEST['status'])         . "', "; }
      if (isset($_REQUEST['id_customer']))
        { 
          $id_customer_tmp=substr($_REQUEST['id_customer'],2);
          if(substr($_REQUEST['id_customer'],0,2)=='DN'){                   
            $query .= "id_customer_company  = '" . mysqli_real_escape_string($conn, $id_customer_tmp)         . "', ";
          } else {
             $query .= "id_customer_personal  = '" . mysqli_real_escape_string($conn, $id_customer_tmp)         . "', ";
          }
        }
      $current_day=date("Y-m-d");
      $query .= "date_created = '".$current_day."' ";

      $query .= "WHERE id_order = '" . mysqli_real_escape_string($conn, $_REQUEST['id_order']) . "'";
      $query  = mysqli_query($conn, $query);

    // delete old detail of quatation bill
    
      $query = "DELETE FROM table_order_detail WHERE id_order = '".mysqli_real_escape_string($conn, $_REQUEST['id_order'])."'";
      $query = mysqli_query($conn, $query);

    // end delete from table table_order_detail
    

    //add new detail
      if (isset($_REQUEST['product'])) {

        $count_array= count($_REQUEST['product']['name']);           
          
          for($i=0;$i<$count_array;$i++)
          {
          // get current price of product
          $query = "SELECT * FROM table_products WHERE id_product= ".$_REQUEST['product']['name'][$i]." ";      

          $query = mysqli_query($conn, $query);

          while ($row = mysqli_fetch_array($query))
            {
                $row_price=$row['price'];
            }

            $query = "INSERT INTO table_order_detail SET ";              
            $query .= "id_product = '".$_REQUEST['product']['name'][$i]."', "; 
            $query .= "quantity = '".$_REQUEST['product']['quantity'][$i]."', ";
            $query .= "current_price = '".$row_price."', ";
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