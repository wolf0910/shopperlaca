<?php

// Database details
include ('../../../config/db_config.php');
include ('../../../config/reuse_function.php');

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
    $query = "SELECT * FROM table_product,table_category WHERE table_product.id_category=table_category.id_category ";

    $query = mysqli_query($conn, $query);
    if (!$query){
      $result  = 'error';
      $message = 'query error';
    } else {
      $result  = 'success';
      $message = 'query success';
      while ($company = mysqli_fetch_array($query)){

        $functions  = '<div class="function_buttons"><ul>';
        $functions .= '<li class="function_edit"><a data-id="'   . $company['id_product'] . '" data-name="' . $company['product_name'] . '"><span>Edit</span></a></li>';
        $functions .= '<li class="function_delete"><a data-id="' . $company['id_product'] . '" data-name="' . $company['product_name'] . '"><span>Delete</span></a></li>';
        $functions .= '</ul></div>';

        // get link avatar image
            $sql = "SELECT * FROM table_product_detail WHERE id_product= '".$company['id_product']."' AND is_avatar='yes' ";

            $query_result = mysqli_query($conn, $sql);
            $link_avatar='';
            while($row=mysqli_fetch_array($query_result)){
              $link_avatar='<img src="../'.$row['photo_link'].'" class="img-thumbnail" width="100" height="100" />';
            }
       
        $mysql_data[] = array(
          "id_product"  => $company['id_product'],          
          "product_name" => $company['product_name'],
          "category_name" => $company['category_name'],
          "id_category"    => $company['id_category'],
          "product_price"    => vnd_format($company['product_price']),
          "link_avatar"    => $link_avatar,    
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

      $query = "SELECT * FROM table_product,table_category,table_producer WHERE table_product.id_category=table_category.id_category AND table_product.id_producer=table_producer.id_producer AND id_product= '".mysqli_real_escape_string($conn, $id)."' ";
      $query = mysqli_query($conn, $query);
      
      if (!$query){
        $result  = 'error';
        $message = 'query error';
      } else {
        $result  = 'success';
        $message = 'query success';
        while ($company = mysqli_fetch_array($query)){
          // get link avatar image
            $sql = "SELECT * FROM table_product_detail WHERE id_product= '".mysqli_real_escape_string($conn, $id)."' ";
            $query_result = mysqli_query($conn, $sql);
            $link_all_img_detail='';
            while($row=mysqli_fetch_array($query_result)){

            if($row['is_avatar']=='yes') $link_avatar='<img src="../'.$row['photo_link'].'" class="img-thumbnail" width="100" height="100" />';
              else {
                if($row['photo_link']!=''){
                   $link_all_img_detail.='<img src="../'.$row['photo_link'].'" class="img-thumbnail" width="100" height="100" />';
                }
               
              }
              $all_product_images[]=$row['photo_link'];
            }
           
          

          // end get link detail images
          $mysql_data[] = array(
          "id_product"  => $company['id_product'],          
          "product_name" => $company['product_name'],  
          "category_name" => $company['category_name'],  
          "producer_name" => $company['producer_name'],  
          "id_category"    => $company['id_category'],
          "id_producer"    => $company['id_producer'],
          "product_price_4compare1"    => $company['product_price_4compare1'],
          "product_price_4compare2"    => $company['product_price_4compare2'],
          "product_price_4compare3"    => $company['product_price_4compare3'],  
          "customer_point"    => $company['customer_point'],
          "agent_point"    => $company['agent_point'],
          "product_price"    => $company['product_price'],
          "product_price_vnd"    => vnd_format($company['product_price']),            
          "product_description"    => $company['product_description'],
          "product_additional_information"    => $company['product_additional_information'],
          "all_product_images"    => $all_product_images,
          "link_avatar"    => $link_avatar,
          "link_all_img_detail"    => $link_all_img_detail
          
          );
        }
      }

    }
  
  } elseif ($job == 'add_company'){
      // check if user exist
         
              // Add company
              $query = "INSERT INTO table_product SET ";
              if (isset($_REQUEST['product_name']))
              { 
                $query .= "product_name  = '" . mysqli_real_escape_string($conn, $_REQUEST['product_name'])         . "', "; 
              }

              if (isset($_REQUEST['product_price_4compare1']))
              {
                $query .= "product_price_4compare1 = '" . mysqli_real_escape_string($conn, $_REQUEST['product_price_4compare1'])         . "', "; 
              }

              if (isset($_REQUEST['product_price']))
              {
                $query .= "product_price = '" . mysqli_real_escape_string($conn, $_REQUEST['product_price'])         . "', "; 
              }

              if (isset($_REQUEST['product_price_4compare2']))
              {
                $query .= "product_price_4compare2 = '" . mysqli_real_escape_string($conn, $_REQUEST['product_price_4compare2'])         . "', "; 
              }

              if (isset($_REQUEST['product_price_4compare3']))
              {
                $query .= "product_price_4compare3 = '" . mysqli_real_escape_string($conn, $_REQUEST['product_price_4compare3'])         . "', "; 
              }

              if (isset($_REQUEST['agent_point']))
              {
                $query .= "agent_point = '" . mysqli_real_escape_string($conn, $_REQUEST['agent_point'])         . "', "; 
              }

              if (isset($_REQUEST['customer_point']))
              {
                $query .= "customer_point = '" . mysqli_real_escape_string($conn, $_REQUEST['customer_point'])         . "', "; 
              }

              if (isset($_REQUEST['id_category']))
              { 
                $query .= "id_category = '" . mysqli_real_escape_string($conn, $_REQUEST['id_category'])         . "', "; 
              }
              if (isset($_REQUEST['id_producer'])) { $query .= "id_producer = '" . mysqli_real_escape_string($conn, $_REQUEST['id_producer'])         . "', "; }
              if (isset($_REQUEST['product_description'])) { $query .= "product_description = '" . mysqli_real_escape_string($conn, $_REQUEST['product_description'])         . "', "; }
              if (isset($_REQUEST['product_additional_information'])) { $query .= "product_additional_information = '" . mysqli_real_escape_string($conn, $_REQUEST['product_additional_information'])         . "' "; }      

              $query = mysqli_query($conn, $query);
              $last_id = mysqli_insert_id($conn);

              //handle image avatar
                if(isset($_FILES['img_avatar']['name']))
                {
                  $target_dir_4_upload='../../../images/products/';
                  $link_4query='images/products/';
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

                  // insert into table product_detail
                  $sql='INSERT INTO table_product_detail SET id_product='.$last_id.' , photo_link="'.$query_link.'", is_avatar="yes" ';

                  $result = mysqli_query($conn, $sql);
                  // end insert into table product_detail
                  
                }
              //end handle image avatar
              
              //handle images detail              

              if(!empty($_FILES['img_detail']['name'][0]))
              {
                  $target_dir_4_upload='../../../images/products/';
                  // dem tong so file upload
                  $total = count($_FILES['img_detail']['name']);
                  
                  // Loop through each file
                  for( $i=0 ; $i < $total ; $i++ ) 
                  {
                    $query_link = '';
                    $link_4query='images/products/';
                    //check if file name exists            

                    $path = $_FILES['img_detail']['name'][$i];
                    $ext = pathinfo($path, PATHINFO_EXTENSION);
                    $newfilename=$i.'.'.$ext;
                    $k=0;
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
                  move_uploaded_file($_FILES['img_detail']['tmp_name'][$i], $link4upload);

                  // insert into table product_detail
                  $sql='INSERT INTO table_product_detail SET id_product='.$last_id.' , photo_link="'.$query_link.'", is_avatar="no" ';

                  $result = mysqli_query($conn, $sql);
                  // end insert into table product_detail
                  }
              }
    
    
              //end handle image detail

              // insert product to storage with quantity=0
              $sql4='
                  INSERT INTO table_storage SET 
                  id_product='.$last_id.',
                  quantity=0,
                  safe_quantity=0,
                  is_alert="no"
                ';
                
              $result4=mysqli_query($conn,$sql4);
              // end insert product to storage with quantity=0




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

      // update in table table_product

      $query = "UPDATE table_product SET ";

      if (isset($_REQUEST['product_name'])) 
        { $query .= "product_name         = '" . mysqli_real_escape_string($conn, $_REQUEST['product_name'])         . "', "; }
      if (isset($_REQUEST['id_subcategory']))         
        { $query .= "id_subcategory = '".mysqli_real_escape_string($conn, $_REQUEST['id_subcategory'])."', "; }
      if (isset($_REQUEST['product_description']))         
        { $query .= "product_description = '".mysqli_real_escape_string($conn, $_REQUEST['product_description'])."', "; }
     
      if (isset($_REQUEST['product_additional_information']))         
        { $query .= "product_additional_information = '".mysqli_real_escape_string($conn, $_REQUEST['product_additional_information'])."', "; }

      if (isset($_REQUEST['product_price']))         
        { $query .= "product_price = '".mysqli_real_escape_string($conn, $_REQUEST['product_price'])."', "; }

      if (isset($_REQUEST['product_price_4compare1']))         
        { $query .= "product_price_4compare1 = '".mysqli_real_escape_string($conn, $_REQUEST['product_price_4compare1'])."', "; }

      if (isset($_REQUEST['product_price_4compare2']))         
        { $query .= "product_price_4compare2 = '".mysqli_real_escape_string($conn, $_REQUEST['product_price_4compare2'])."', "; }

      if (isset($_REQUEST['product_price_4compare3']))         
        { $query .= "product_price_4compare3 = '".mysqli_real_escape_string($conn, $_REQUEST['product_price_4compare3'])."', "; }

      if (isset($_REQUEST['customer_point']))         
        { $query .= "customer_point = '".mysqli_real_escape_string($conn, $_REQUEST['customer_point'])."', "; }

      if (isset($_REQUEST['agent_point']))         
        { $query .= "agent_point = '".mysqli_real_escape_string($conn, $_REQUEST['agent_point'])."', "; }


      if (isset($_REQUEST['id_category']))
        { $query .= "id_category = '".mysqli_real_escape_string($conn, $_REQUEST['id_category']) ."', "; }

// addition code for font-end
      if(isset($_REQUEST['id_product2']))
        $id_product_tmp=$_REQUEST['id_product2']; else $id_product_tmp=$_REQUEST['id_product'];

      $query .= "id_product  = '".$id_product_tmp."' ";
//end addition code

      $query .= "WHERE id_product = '" . mysqli_real_escape_string($conn, $id_product_tmp) . "'";
      $query  = mysqli_query($conn, $query);


        //handle image avatar
        if(!empty($_FILES['img_avatar']['name']))
        {

          //delete old img avatar
            // delete file
              $result= mysqli_query($conn,"SELECT * FROM table_product_detail WHERE id_product = '".$_REQUEST['id_product']."' AND is_avatar='yes' ");
              while ($row=mysqli_fetch_array($result))
              {
                unlink('../../../'.$row['photo_link']);
              }
            //end delete file
            // delete in DB
              $result= mysqli_query($conn,"DELETE FROM table_product_detail WHERE id_product = '".$_REQUEST['id_product']."' AND is_avatar='yes' ");
            //end delete in DB
          // end delete old img avatar

          // add new img avatar
          $target_dir_4_upload='../../../images/products/';
          $link_4query='images/products/';
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

            // insert into table product_detail
            $sql='INSERT INTO table_product_detail SET id_product='.$_REQUEST['id_product'].' , photo_link="'.$query_link.'", is_avatar="yes" ';

            $result = mysqli_query($conn, $sql);
            // end insert into table product_detail
          // end add new img avatar 
        }
      //end handle image avatar
              
              //handle images detail
              

              if(!empty($_FILES['img_detail']['name'][0]))
              {
                $id_product=$_REQUEST['id_product'];
                //delete all old img detail
                  $result= mysqli_query($conn,"SELECT * FROM table_product_detail WHERE id_product = '".$id_product."' AND is_avatar='no' ");
                  while ($row=mysqli_fetch_array($result))
                  {
                    unlink('../../../'.$row['photo_link']);
                  }
                  $result= mysqli_query($conn,"DELETE FROM table_product_detail WHERE id_product = '".$id_product."' AND is_avatar='no' ");
                // end delete all old img detail

                  $target_dir_4_upload='../../../images/products/';
                  // dem tong so file upload
                  $total = count($_FILES['img_detail']['name']);
                  
                  // Loop through each file
                  for( $i=0 ; $i < $total ; $i++ ) 
                  {
                    $query_link = '';
                    $link_4query='images/products/';
                    //check if file name exists            

                    $path = $_FILES['img_detail']['name'][$i];
                    $ext = pathinfo($path, PATHINFO_EXTENSION);
                    $newfilename=$i.'.'.$ext;
                    $k=0;
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
                  move_uploaded_file($_FILES['img_detail']['tmp_name'][$i], $link4upload);

                  // insert into table product_detail
                  $sql='INSERT INTO table_product_detail SET id_product='.$id_product.' , photo_link="'.$query_link.'", is_avatar="no" ';

                  $result = mysqli_query($conn, $sql);
                  // end insert into table product_detail
                  }
              }
            //end handle image detail

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
    
  // delete product detail
      // delete file
      $result= mysqli_query($conn,"SELECT * FROM table_product_detail WHERE id_product = '".$id."' ");
      while ($row=mysqli_fetch_array($result))
      {
         unlink('../../../'.$row['photo_link']);
      }
      //end delete file
      //delete in DB
      $query = "DELETE FROM table_product_detail WHERE id_product = '".mysqli_real_escape_string($conn, $id)."'";
      $query = mysqli_query($conn, $query);
      //end delete in DB
    
  // end handle delete product detail

  // delete from table table_product
    $query = "DELETE FROM table_product WHERE id_product = '".mysqli_real_escape_string($conn, $id)."'";
    $query = mysqli_query($conn, $query);
  // end delete from table table_product

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