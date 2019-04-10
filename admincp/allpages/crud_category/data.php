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
    $query = "SELECT * FROM `table_category` ";

    $query = mysqli_query($conn, $query);
    if (!$query){
      $result  = 'error';
      $message = 'query error';
    } else {
      $result  = 'success';
      $message = 'query success';
      while ($company = mysqli_fetch_array($query)){
        $link_avatar='<img src="../'.$company['category_img'].'" class="img-thumbnail" width="100" height="100" />';

        $functions  = '<div class="function_buttons"><ul>';
        $functions .= '<li class="function_edit"><a data-id="'   . $company['id_category'] . '" data-name="' . $company['category_name'] . '"><span>Edit</span></a></li>';
        $functions .= '<li class="function_delete"><a data-id="' . $company['id_category'] . '" data-name="' . $company['category_name'] . '"><span>Delete</span></a></li>';
        $functions .= '</ul></div>';
       
        $mysql_data[] = array(
          "id_category"  => $company['id_category'],          
          "category_name" => $company['category_name'],
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

      $query = "SELECT * FROM table_category WHERE id_category= '".mysqli_real_escape_string($conn, $id)."' ";
      $query = mysqli_query($conn, $query);
      
      if (!$query){
        $result  = 'error';
        $message = 'query error';
      } else {
        $result  = 'success';
        $message = 'query success';
        while ($company = mysqli_fetch_array($query)){
        //end get quatation detail
        $link_avatar='<img src="../'.$company['category_img'].'" class="img-thumbnail" width="100" height="100" />';

          $mysql_data[] = array(
          "id_category"  => $company['id_category'],          
          "category_name" => $company['category_name'],
          "link_avatar" => $link_avatar
          );
        }
      }

    }
  
  } elseif ($job == 'add_company'){
      // check if user exist
          $result = mysqli_query($conn,"SELECT * FROM table_category WHERE category_name='".$_REQUEST['category_name']."' ");
          if($result->num_rows >0)
          {
                // Add company
               $result  = 'error';
               $message = 'Ten san pham da ton tai';
          }   // end check
        else {
              // insert into category table
              $query = "INSERT INTO table_category SET ";

              //handle image avatar
                if(!empty($_FILES['img_avatar']['name']))
                {

                  $target_dir_4_upload='../../../images/categories/';
                  $link_4query='images/categories/';
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
                  $query.=' category_img="'.$query_link.'" ,';
               
                
                }
              //end handle image avatar

              if (isset($_REQUEST['category_name']))
                { 
                  $query .= "category_name  = '" . mysqli_real_escape_string($conn, $_REQUEST['category_name'])         . "' "; 
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
           }   
        
  
  } elseif ($job == 'edit_company'){
    
    // Edit company
    if ($id == ''){
      $result  = 'error';
      $message = 'id missing';
    } else {

      // update in table table_category

      $query = "UPDATE table_category SET ";

      //check if change img san pham
    if(!empty($_FILES['img_avatar']['name'][0]))
    {
        // Delete file in folder

        $sql4='SELECT * FROM table_category WHERE id_category='.$_REQUEST['id_category'].' ';
        $result_sql4=mysqli_query($conn,$sql4);
        while($row4=mysqli_fetch_array($result_sql4)){
          $category_img=$row4['category_img'];
        }

        unlink('../../../'.$category_img);
        
        //end delete old image 

        // update new image
        $target_dir_4_upload='../../../images/categories/';
        $query_4multi_img = '';
        $link_4query='images/categories/';
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
        $query .= "category_img='".$link_4query_final."', "; 
        // update new image


    } 
        //end handle change img san pham



      if (isset($_REQUEST['category_name']))
      { 
        $query .= "category_name='".mysqli_real_escape_string($conn, $_REQUEST['category_name'])."' "; 
      }



      $query .= "WHERE id_category = '" . mysqli_real_escape_string($conn, $_REQUEST['id_category']) . "'";
      $query  = mysqli_query($conn, $query);

      // end update in table_category

      // handle update or delete or insert into table _subcategory 
      if (isset($_REQUEST['subcategory_name'])){
        $sql2='SELECT * FROM table_subcategory WHERE id_category= '.$_REQUEST['id_category'].' ';
        $result_sql2=mysqli_query($conn,$sql2);
        $current_id_subcategory= array();
        $current_subcategory_name= array();
        while($row_sql2=mysqli_fetch_array($result_sql2)){
          array_push($current_id_subcategory,$row_sql2['id_subcategory']);
          array_push($current_subcategory_name,$row_sql2['id_subcategory']);
        }

        $count_array= count($_REQUEST['subcategory_name']);
        for($i=0;$i<$count_array;$i++)
        {
          // case1: change subcategory name
          if( in_array($_REQUEST['id_subcategories'][$i], $current_id_subcategory) ) {
              $sql_3='UPDATE table_subcategory SET subcategory_name = "'.$_REQUEST['subcategory_name'][$i].'" WHERE id_subcategory = '.$_REQUEST['id_subcategories'][$i].' ';
             
              $result_sql3=mysqli_query($conn,$sql_3);

          } // case2: add new subcategory
          elseif( !in_array($_REQUEST['subcategory_name'][$i], $current_subcategory_name) ){
            $sql_3='INSERT INTO table_subcategory SET id_category='.$_REQUEST['id_category'].',subcategory_name="'.$_REQUEST['subcategory_name'][$i].'" ';
            
            $result_sql3=mysqli_query($conn,$sql_3);
          }
          
        }

        // case3: delete subcategory
          for ($k=0;$k<count($current_id_subcategory);$k++) {
            
            if( !in_array($current_subcategory_name[$k], $_REQUEST['subcategory_name'] ) && !in_array($current_id_subcategory[$k], $_REQUEST['id_subcategories'] )  )
            {
              $sql_3='DELETE FROM table_subcategory WHERE id_subcategory='.$current_id_subcategory[$k].' ';
              $result_sql3=mysqli_query($conn,$sql_3);
            }

          }


      }


      // end handle update or delete or insert into table _subcategory




    // delete old subcategories  
      // $query = "DELETE FROM table_subcategory WHERE id_category = '".mysqli_real_escape_string($conn, $_REQUEST['id_category'])."'";
      // $query = mysqli_query($conn, $query);
    // end delete old subcategories
    
    //add new subcategories
      // if (isset($_REQUEST['subcategory_name'])) 
      // {
      //   $count_array= count($_REQUEST['subcategory_name']);
      //   for($i=0;$i<$count_array;$i++)
      //   {        
      //     $query = "INSERT INTO table_subcategory SET ";              
      //     $query .= "subcategory_name = '".$_REQUEST['subcategory_name'][$i]."', ";
      //     $query .= "id_category = '".$_REQUEST['id_category']."' ";               
      //     $query = mysqli_query($conn, $query);
      //   }
      // }
    //end add new subcategories



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

      //check if there is any product currently having this category id

      $sql=" SELECT * FROM table_product WHERE id_category= ".$id." ";
      $result=mysqli_query($conn,$sql);
      if ( mysqli_num_rows($result) > 1 ){
        // Prepare data
        $data = array(
          "result"  => "error",
          "message" => "Có sản phẩm thuộc danh mục này. Chỉ có thể xóa danh mục không có sản phẩm !"
        );
        // Convert PHP array to JSON array
        $json_data = json_encode($data);
        print $json_data;
        exit();
      }
      // end check

    //unlink category image
      $sql4='SELECT * FROM table_category WHERE id_category='.$id.' ';
      $result_sql4=mysqli_query($conn,$sql4);
      while($row4=mysqli_fetch_array($result_sql4)){
        $category_img=$row4['category_img'];
        unlink('../../../'.$category_img);
      }
      
    //end unlink category image

    // delete from table table_category
      $query = "DELETE FROM table_category WHERE id_category = '".mysqli_real_escape_string($conn, $id)."'";
      $query = mysqli_query($conn, $query);
    // end delete from table table_category



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