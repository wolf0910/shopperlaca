<?php 

if(isset($_REQUEST['id_order']) && $_REQUEST['id_order']!='' )
{

  $id_order=$_REQUEST['id_order'];

  // delete from table_order_detail
  $sql = "DELETE FROM `table_order_detail` WHERE `table_order_detail`.`id_order` = '".$id_order."' ";
  $conn->query($sql);

  // Category read query
  $sql = "DELETE FROM `table_order` WHERE `table_order`.`id_order` = '".$id_order."' ";
  if($conn->query($sql)) {
      echo json_encode( array('success' => 'true','message' => 'order deteled') );
    } else {
      echo json_encode( array('success' => 'false','message' => 'error') );
    } 
 
 
} else { 
  echo json_encode( array('success' => 'false','message' => 'id_order not found') );
}