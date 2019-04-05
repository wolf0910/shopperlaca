<?php 

if(isset($_REQUEST['id_customer']))
{
  if($_REQUEST['id_customer']==''){
    unset($_REQUEST['id_customer']);
  }
}

if(!isset($_REQUEST['id_customer']))
{
   echo json_encode(
      array('success'   => 'false','message' => 'id_customer missing !!!')
    );
    exit();
}

if(isset($_REQUEST['search_txt']))
{
  if($_REQUEST['search_txt']==''){
    unset($_REQUEST['search_txt']);
  }
}

if(!isset($_REQUEST['search_txt']))
{
   echo json_encode(
      array('success'   => 'false','message' => 'search_txt missing !!!')
    );
    exit();
}

  // Create query insert into customer_search_history

  $sql = "
    INSERT INTO table_customer_search_history 
    SET id_customer = '".$_REQUEST['id_customer']."', search_txt = '".$_REQUEST['search_txt']."'
    ";

  //check if customer_phone exist


  // Return customer info just created
  if($conn->query($sql)) {

    $id_created=mysqli_insert_id($conn);
    $user_arr = array();

    $user_arr['success'] = 'true';
    $user_arr['data'] = array();
    // get all info of created user
      $sql = "SELECT * FROM table_customer_search_history WHERE id_customer_search_history= '".$id_created."'  ";
      $result = $conn->query($sql);
      while($row = $result->fetch_assoc()) {
          
          $user_item = array(
            'id_customer_search_history' => $row['id_customer_search_history'],
            'id_customer' => $row['id_customer'],
            'search_txt' => $row['search_txt'],
            'message' => 'search history created'            
          );

          // Push to "data"
          $user_arr['data']=$user_item;
      }

    echo json_encode(
      $user_arr
    );

// delete the oldest customer_search_history if there already are 10 of them

  $sql="SELECT * FROM table_customer_search_history WHERE id_customer= '".$_REQUEST['id_customer']."'";
  $result=mysqli_query($conn,$sql);
  if( mysqli_num_rows($result) > 10 )
  {
    $sql2 = "SELECT * FROM table_customer_search_history WHERE id_customer= '".$_REQUEST['id_customer']."' ORDER BY id_customer_search_history ASC limit 1  ";
    $result2 = mysqli_query($conn,$sql2);
    while($row2 = mysqli_fetch_array($result2)){
      $sql3 = "DELETE FROM table_customer_search_history WHERE id_customer_search_history='".$row2['id_customer_search_history']."' ";
      $rs=mysqli_query($conn,$sql3);
    }
  }
// end delete
  } else {
    echo json_encode(
      array('success'   => 'false','message' => 'create fail')
    );
  }




?>

