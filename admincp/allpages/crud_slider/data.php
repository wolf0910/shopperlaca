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
    $query = "SELECT * FROM `table_slider` ";
    $query = mysqli_query($conn, $query);
    if (!$query){
      $result  = 'error';
      $message = 'query error';
    } else {
      $result  = 'success';
      $message = 'query success';
      while ($company = mysqli_fetch_array($query)){
        $link_avatar='<img src="../'.$company['photo_link'].'" class="img-thumbnail" width="100" height="100" />';
        $functions  = '<div class="function_buttons"><ul>';
        $functions .= '<li class="function_edit"><a data-id="'   . $company['id_slider'] . '" data-name="' . $company['id_slider'] . '"><span>Edit</span></a></li>';
        $functions .= '<li class="function_delete"><a data-id="' . $company['id_slider'] . '" data-name="' . $company['id_slider'] . '"><span>Delete</span></a></li>';
        $functions .= '</ul></div>';

        $mysql_data[] = array(
          "id_slider"  => $company['id_slider'],  
          "content1" => $company['content1'],
          "content2" => $company['content2'],
          "link_avatar" => $link_avatar,          
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

      $query = "SELECT * FROM table_slider WHERE id_slider= '".mysqli_real_escape_string($conn, $id)."' ";
      $query = mysqli_query($conn, $query);
      
      if (!$query){
        $result  = 'error';
        $message = 'query error';
      } else {
        $result  = 'success';
        $message = 'query success';

        while ($company = mysqli_fetch_array($query)){
        //end get quatation detail
        $link_avatar='<img src="../'.$company['photo_link'].'" class="img-thumbnail" width="100" height="100" />';

          $mysql_data[] = array(
          "id_slider"  => $company['id_slider'],  
          "content1" => $company['content1'],
          "content2" => $company['content2'],
          "link_avatar" => $link_avatar
          );
        }
      }

    }
  
  } elseif ($job == 'add_company'){
      
              // insert into category table
              $query = "INSERT INTO table_slider SET ";

              //handle image avatar
                if(!empty($_FILES['img_avatar']['name']))
                {

                  $target_dir_4_upload='../../../images/sliders/';
                  $link_4query='images/sliders/';
                  //check if file name exists            
                    $path = $_FILES['img_avatar']['name'];
                    $ext = pathinfo($path, PATHINFO_EXTENSION);
                    $k=0;
                    $newfilename=$k.'.'.$ext;
                    while (file_exists($target_dir_4_upload.$newfilename)) 
                    {
                      $k++;
                      // change file name
                      $newfilename=$k.'.'.$ext;
                    }
                  //end handle file name exists
                  $query_link = $link_4query.$newfilename;
                  $link4upload=$target_dir_4_upload.$newfilename;
                  //Upload the file into the temp dir
                  move_uploaded_file($_FILES['img_avatar']['tmp_name'], $link4upload);
                 // set to query
                  $query.=' photo_link="'.$query_link.'" ,';

                }
              //end handle image avatar

                if (isset($_REQUEST['content1']))
                { 
                  $query .= "content1  = '" . mysqli_real_escape_string($conn, $_REQUEST['content1'])         . "', "; 
                }

                if (isset($_REQUEST['content2']))
                { 
                  $query .= "content2  = '" . mysqli_real_escape_string($conn, $_REQUEST['content2'])         . "' "; 
                }

              $query = mysqli_query($conn, $query);
              // end insert into category table
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

      // update in table table_slider

      $query = "UPDATE table_slider SET ";

      //check if change img san pham
    if(!empty($_FILES['img_avatar']['name']))
    {
        // Delete file in folder

        $sql4='SELECT * FROM table_slider WHERE id_slider='.$_REQUEST['id_slider'].' ';
        $result_sql4=mysqli_query($conn,$sql4);
        while($row4=mysqli_fetch_array($result_sql4)){
          $photo_link=$row4['photo_link'];
        }
        unlink('../../../'.$photo_link);
        
        //end delete old image 

        // update new image
        $target_dir_4_upload='../../../images/sliders/';
        $query_4multi_img = '';
        $link_4query='images/sliders/';
        //check if file name exists               
        $newfilename=$_FILES['img_avatar']['name'];
        $k=0;
        while (file_exists($target_dir_4_upload.$newfilename)) 
        {
          $k++;
          // doi ten file
          $newfilename = $k.basename($_FILES['img_avatar']['name']);
        }   
        //end handle file name exists
      
        $link4upload = $target_dir_4_upload.$newfilename;
        // Upload the file into folder categories
        move_uploaded_file($_FILES['img_avatar']['tmp_name'], $link4upload);
        $link_4query_final=$link_4query.$newfilename;
        $query .= "photo_link='".$link_4query_final."', "; 
        // update new image


    } 
        //end handle change img san pham

    if (isset($_REQUEST['content1']))
      { 
        $query .= "content1='".mysqli_real_escape_string($conn, $_REQUEST['content1'])."', "; 
      }
      if (isset($_REQUEST['content2']))
      { 
        $query .= "content2='".mysqli_real_escape_string($conn, $_REQUEST['content2'])."' "; 
      }

      $query .= "WHERE id_slider = '" . mysqli_real_escape_string($conn, $_REQUEST['id_slider']) . "'";
      $query  = mysqli_query($conn, $query);

      // end update in table_slider

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
    
    //unlink category image
      $sql4='SELECT * FROM table_slider WHERE id_slider='.$id.' ';
      $result_sql4=mysqli_query($conn,$sql4);
      while($row4=mysqli_fetch_array($result_sql4)){
        $photo_link=$row4['photo_link'];
      }
      unlink('../../../'.$photo_link);
    //end unlink category image

    // delete from table table_slider
      $query = "DELETE FROM table_slider WHERE id_slider = '".mysqli_real_escape_string($conn, $id)."'";
      $query = mysqli_query($conn, $query);
    // end delete from table table_slider



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