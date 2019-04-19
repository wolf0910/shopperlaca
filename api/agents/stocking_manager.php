<?php

$product_arr = array();
$category = $_REQUEST['category'];
// get total product
$sql="SELECT count(A.id_storage) as product_total  FROM table_storage A 
INNER JOIN table_product B ON A.id_product = B.id_product WHERE B.id_category ='".$category."'";
$result = mysqli_query($conn,$sql);
while($row = $result->fetch_assoc())
{
    $product_arr['total']= $row['product_total'];
}

$limit=20;
$page=1;
if ( isset($_REQUEST['limit']) && $_REQUEST['limit']!='' ){
    $limit=$_REQUEST['limit'];
}
if ( isset($_REQUEST['page']) && $_REQUEST['page']!='' ){
    $page=$_REQUEST['page'];
}


$product_arr['total_page']= strval(ceil($product_arr['total']/$limit));

$product_arr['limit']=strval($limit);
$start=($page-1)*$limit;

// query
$sql = "SELECT * FROM table_storage A
INNER JOIN table_product B ON A.id_product = B.id_product
INNER JOIN table_product_detail C ON A.id_product = C.id_product WHERE B.id_category =  '".$category."' LIMIT $page,$limit";
$result = mysqli_query($conn,$sql);
mysqli_close($conn);
// Get row count
$num = mysqli_num_rows($result);

// Check if any categories
if($num > 0) {
    // Cat array

    $product_arr['success'] = 'true';
    $product_arr['page']=  $page;
    $product_arr['data'] = array();

    while($row = $result->fetch_assoc())
    {
        $count_image=0;
        $product_photo=array();
        $product_photo_item=array();
        $product_item['product_photo']=array();

        $product_item = array(
            'id_producer' => $row['id_producer'],
            'product_name' => $row['product_name'],
             'product_price' => $row['product_price'],
             'date_created' => $row['date_created'],
             'ton_kho' => $row['quantity'],
             'ton_kho_an_toan' => $row['safe_quantity'],
             'photo_link' => $row['photo_link']
        );
        // Push to "data"
        array_push($product_arr['data'], $product_item);


    }
    // Turn to JSON & output
    echo json_encode($product_arr);

} else {
    // No Categories
    echo json_encode(
        array('success' => 'success','message' => 'Product  not found !')
    );
}

?>