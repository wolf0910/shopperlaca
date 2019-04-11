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
    $query = "SELECT * FROM `table_producer` ";

    $query = mysqli_query($conn, $query);
    if (!$query){
      $result  = 'error';
      $message = 'query error';
    } else {
      $result  = 'success';
      $message = 'query success';
      while ($company = mysqli_fetch_array($query)){
       

        $functions  = '<div class="function_buttons"><ul>';
        $functions .= '<li class="function_edit"><a data-id="'   . $company['id_producer'] . '" data-name="' . $company['producer_name'] . '"><span>Edit</span></a></li>';
        $functions .= '<li class="function_delete"><a data-id="' . $company['id_producer'] . '" data-name="' . $company['producer_name'] . '"><span>Delete</span></a></li>';
        $functions .= '</ul></div>';
       
        $mysql_data[] = array(
          "id_producer"  => $company['id_producer'],          
          "producer_name" => $company['producer_name'],
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

      $query = "SELECT * FROM table_producer WHERE id_producer= '".mysqli_real_escape_string($conn, $id)."' ";
      $query = mysqli_query($conn, $query);
      
      if (!$query){
        $result  = 'error';
        $message = 'query error';
      } else {
        $result  = 'success';
        $message = 'query success';
        while ($company = mysqli_fetch_array($query)){
        //end get quatation detail
      

          $mysql_data[] = array(
          "id_producer"  => $company['id_producer'],          
          "producer_name" => $company['producer_name']
          );
        }
      }

    }
  
  } elseif ($job == 'add_company'){
      // check if user exist
          $result = mysqli_query($conn,"SELECT * FROM table_producer WHERE producer_name='".$_REQUEST['producer_name']."' ");
          if($result->num_rows >0)
          {
                // Add company
               $result  = 'error';
               $message = 'Ten san pham da ton tai';
          }   // end check
        else {
              // insert into producer table
              $query = "INSERT INTO table_producer SET ";

              if (isset($_REQUEST['producer_name']))
                { 
                  $query .= "producer_name  = '" . mysqli_real_escape_string($conn, $_REQUEST['producer_name'])         . "' "; 
                }             

              $query = mysqli_query($conn, $query);
              // end insert into producer table

              


              if ($query){
                $result  = 'success';
                $message = 'query success';
               
              } else {
                 $result  = 'error';
                $message = 'query error';
              }
           }   
        
  
  } elseif ($job == 'edit_company'){
    
    // Edit company
    if ($id == ''){
      $result  = 'error';
      $message = 'id missing';
    } else {

      // update in table table_producer
      $query = "UPDATE table_producer SET ";
      if (isset($_REQUEST['producer_name']))
      { 
        $query .= "producer_name='".mysqli_real_escape_string($conn, $_REQUEST['producer_name'])."' "; 
      }
      $query .= "WHERE id_producer = '" . mysqli_real_escape_string($conn, $_REQUEST['id_producer']) . "'";
      $query  = mysqli_query($conn, $query);
      // end update in table_producer

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

    //check if there is any product currently having this producer id

      $sql=" SELECT * FROM table_product WHERE id_producer= ".$id." ";
      $result=mysqli_query($conn,$sql);
      if ( mysqli_num_rows($result) > 1 ){
        // Prepare data
        $data = array(
          "result"  => "error",
          "message" => "Có sản phẩm thuộc danh mục này. Chỉ có thể xóa nhà sản xuất không có sản phẩm !"
        );
        // Convert PHP array to JSON array
        $json_data = json_encode($data);
        print $json_data;
        exit();
      }
    // end check

  
    // delete from table table_producer
      $query = "DELETE FROM table_producer WHERE id_producer = '".mysqli_real_escape_string($conn, $id)."'";
      $query = mysqli_query($conn, $query);
    // end delete from table table_producer



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