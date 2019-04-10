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
    $query = "SELECT * FROM `table_customer`";

    $query = mysqli_query($conn, $query);
    if (!$query){
      $result  = 'error';
      $message = 'query error';
    } else {
      $result  = 'success';
      $message = 'query success';
      while ($company = mysqli_fetch_array($query)){
        $functions  = '<div class="function_buttons"><ul>';
        $functions .= '<li class="function_edit"><a data-id="'   . $company['id_customer'] . '" data-name="' . $company['customer_fullname'] . '"><span>Edit</span></a></li>';
        $functions .= '<li class="function_delete"><a data-id="' . $company['id_customer'] . '" data-name="' . $company['customer_fullname'] . '"><span>Delete</span></a></li>';
        $functions .= '</ul></div>';

        $mysql_data[] = array(
          "id_customer"  => $company['id_customer'],          
          "customer_fullname" => $company['customer_fullname'],
          "customer_phone" => $company['customer_phone'],
          "customer_email" => $company['customer_email'],
          "customer_address" => $company['customer_address'],
          "customer_avatar"   => $company['customer_avatar'],
          "img_4display"  => '<img src="../'.$company['customer_avatar'].'" class="img-thumbnail" width="80" height="80" />',
          "status" => $company['status'],
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

      $query = "SELECT * FROM table_customer WHERE id_customer= '".mysqli_real_escape_string($conn, $id)."' ";
      $query = mysqli_query($conn, $query);
      
      if (!$query){
        $result  = 'error';
        $message = 'query error';
      } else {
        $result  = 'success';
        $message = 'query success';
        while ($company = mysqli_fetch_array($query)){

         
          if($company['status']=='active') $status_txt='Đã kích hoạt'; else $status_txt='Chưa kích hoạt';

          
          $mysql_data[] = array(
          "id_customer"  => $company['id_customer'],          
          "customer_fullname" => $company['customer_fullname'],
          "customer_phone" => $company['customer_phone'],
          "customer_email" => $company['customer_email'],
          "customer_address" => $company['customer_address'],
          "customer_avatar"   => $company['customer_avatar'],
          "img_4display"  => '<img src="../'.$company['customer_avatar'].'" class="img-thumbnail" width="80" height="80" />',
          
          "status" => $company['status']
          );
        }
      }

    }
  
  } elseif ($job == 'add_company'){
      
// Add company
  $query = "INSERT INTO table_customer SET ";
  if (isset($_REQUEST['customer_fullname'])) 
  { $query .= "customer_fullname  = '" . mysqli_real_escape_string($conn, $_REQUEST['customer_fullname'])         . "', "; }

// xu ly file hinh dai dien

if(is_uploaded_file($_FILES['user_image']['tmp_name']))
{ 
    // do this, upload file
    $target_dir = 'images/avatar/';    
    $target_dir_4_upload = '../../../images/avatar/';
    $final_name=basename($_FILES["user_image"]["name"]);
    //check if file exists
    $i=0;
    while (file_exists($target_dir_4_upload.$final_name)) {
      $i++;
      // doi ten file
      $final_name=$i.basename($_FILES["user_image"]["name"]);
    }
        
    //upload file toi folder icon
    $target_file_upload = $target_dir_4_upload . $final_name;
    $target_file = $target_dir . $final_name;
    
    move_uploaded_file($_FILES["user_image"]["tmp_name"], $target_file_upload);
    
    // get link tu file upload for query database
    $query .= "customer_avatar = '".$target_file."', ";  
} else { $query .= "customer_avatar = 'images/avatar/user-placeholder.png', ";}    
  // end xu ly file hinh dai dien      

    if (isset($_REQUEST['customer_email']))         { $query .= "customer_email  = '" . mysqli_real_escape_string($conn, $_REQUEST['customer_email'])         . "', "; }
    if (isset($_REQUEST['customer_password'])) { $query .= "customer_password = '" . md5(mysqli_real_escape_string($conn, $_REQUEST['customer_password'])) . "', "; }
    if (isset($_REQUEST['customer_address'])) { $query .= "customer_address = '" . mysqli_real_escape_string($conn, $_REQUEST['customer_address']) . "', "; }

    if (isset($_REQUEST['customer_phone'])) { $query .= "customer_phone = '" . mysqli_real_escape_string($conn, $_REQUEST['customer_phone'])         . "', "; }

    if (isset($_REQUEST['status'])) { $query .= "status = '" . mysqli_real_escape_string($conn, $_REQUEST['status'])         . "' "; }    

    $query = mysqli_query($conn, $query);

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

      // update in table table_customer

      $query = "UPDATE table_customer SET ";

      if (isset($_REQUEST['customer_fullname']))         { $query .= "customer_fullname         = '" . mysqli_real_escape_string($conn, $_REQUEST['customer_fullname'])         . "', "; }    

// xu ly file hinh dai dien
if (isset($_FILES['user_image']))
{
if( is_uploaded_file($_FILES['user_image']['tmp_name']))
{ 
    // do this, upload file
    $target_dir = 'images/avatar/';
    $target_dir_4_upload = '../../../images/avatar/';
    $final_name=basename($_FILES["user_image"]["name"]);
    //check if file exists
    $i=0;
    while (file_exists($target_dir_4_upload.$final_name)) {
      $i++;
      // doi ten file
        $final_name=$i.basename($_FILES["user_image"]["name"]);
    }
        
    //upload file toi folder icon
    $target_file_upload = $target_dir_4_upload . $final_name;
    $target_file = $target_dir . $final_name;

    // unlink old file avatar if exist and it not the place holder file
    if (file_exists('../../../'.$_REQUEST['customer_avatar']) && ($_REQUEST['customer_avatar']!='images/avatar/user-placeholder.png') )
    { 
    unlink('../../../'.$_REQUEST['customer_avatar']);
    }
    // end handle if already have avatar
    move_uploaded_file($_FILES["user_image"]["tmp_name"], $target_file_upload);    
    // get link tu file upload for query database
    $query .= "customer_avatar         = '" . $target_file    . "', ";  
} else {}   

}
// end xu ly file hinh dai dien 
      if (isset($_REQUEST['customer_address']))         { $query .= "customer_address         = '" . mysqli_real_escape_string($conn, $_REQUEST['customer_address'])         . "', "; }
     
      if (isset($_REQUEST['customer_phone']))         { $query .= "customer_phone         = '" . mysqli_real_escape_string($conn, $_REQUEST['customer_phone'])         . "', "; }
      if (isset($_REQUEST['customer_email']))         { $query .= "customer_email         = '" . mysqli_real_escape_string($conn, $_REQUEST['customer_email'])         . "', "; }
      
      if (isset($_REQUEST['customer_password'])){ 
          //check if change customer_password
          if ($_REQUEST['customer_password']!='')   
            $query .= "customer_password = '" . md5(mysqli_real_escape_string($conn, $_REQUEST['customer_password'])) . "', "; 
        }   
      
      
      if (isset($_REQUEST['status']))         { $query .= "status = '" . mysqli_real_escape_string($conn, $_REQUEST['status'])         . "' "; }

      $query .= "WHERE id_customer = '" . mysqli_real_escape_string($conn, $_REQUEST['id_customer']) . "'";

      $query  = mysqli_query($conn, $query);

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
  
    // delete img from folder administrator if exist
  
    $result= mysqli_query($conn,"SELECT * FROM table_customer WHERE id_customer = '".$id."' ");   
     
    $row = $result->fetch_assoc();
    $link4delete=$row['customer_avatar'];
    $link4delete="../../../".$link4delete;
    // delete file if that not the place-holder file
    if (file_exists($link4delete) && ( $link4delete!='../../../images/avatar/user-placeholder.png') )
    {
      unlink($link4delete);
    }

    // end delete img from folder administrator if exist

    // delete from table table_customer
      $query = "DELETE FROM table_customer WHERE id_customer = '".mysqli_real_escape_string($conn, $id)."'";
      $query = mysqli_query($conn, $query);
    // end delete from table table_customer
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