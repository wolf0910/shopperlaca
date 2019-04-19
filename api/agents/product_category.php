<?php
// query
$sql = "SELECT * FROM `table_category` WHERE 1=1";

$result = mysqli_query($conn,$sql);
mysqli_close($conn);
// Get row count
$num = mysqli_num_rows($result);

// Check if any categories
if($num > 0) {
    // Cat array

    $product_arr['success'] = 'true';
    $product_arr['data'] = array();

    while($row = $result->fetch_assoc())
    {
        $count_image=0;
        $product_photo=array();
        $product_photo_item=array();
        $product_item['product_photo']=array();

        $product_item = array(
            'id_category' => $row['id_category'],
            'category_name' => $row['category_name'],
            'category_img' => $row['category_img']
        );
        // Push to "data"
        array_push($product_arr['data'], $product_item);


    }
    // Turn to JSON & output
    echo json_encode($product_arr);

}else {
    // No Categories
    echo json_encode(
        array('success' => 'success','message' => 'Product  not found !')
    );
}

?>