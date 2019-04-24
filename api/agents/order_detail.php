<?php
// query
$order_id = $_REQUEST['order_id'];
$sql = "SELECT * FROM table_order_detail A
INNER JOIN table_product B ON A.id_product = B.id_product
INNER JOIN table_product_detail C ON A.id_product = C.id_product WHERE A.id_order = '".$order_id."'";

$result = mysqli_query($conn,$sql);
mysqli_close($conn);
// Get row count
$num = mysqli_num_rows($result);

    $product_arr['success'] = 'true';
    $product_arr['data'] = array();

    while($row = $result->fetch_assoc())
    {
        $count_image=0;
        $product_photo=array();
        $product_photo_item=array();
        $product_item['product_photo']=array();

        $product_item = array(
            'product_name' => $row['product_name'],
            'product_price' => $row['product_price'] * $row['quantity'],
            'quantity' => $row['quantity'],
            'date_created' => $row['date_created'],
            'photo_link' => $row['photo_link']           
        );
        // Push to "data"
        array_push($product_arr['data'], $product_item);


    }
    // Turn to JSON & output
    echo json_encode($product_arr);

?>






