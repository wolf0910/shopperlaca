<?php
if(isset($_REQUEST['id_agent']))
{
    $product_arr = array();
    // get total product
    $id_agent = $_REQUEST['id_agent'];
    // get total product
    $sql="SELECT count(table_order.id_order) as product_total FROM `table_order` where  `id_agent` = '".$id_agent."'";
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
    $sql = "SELECT * FROM table_order A
    INNER JOIN table_agent B ON A.id_agent = B.id_agent WHERE A.delivery_status = 3 and A.id_agent = '".$id_agent."' LIMIT $page,$limit";

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
                'Ma_Don_Hang' => $row['id_order'],
                'Ten_Nguoi_Dat_Hang' => $row['agent_name'],
                 'Sdt_Nguoi_Dat' => $row['agent_phone'],
                 'Dia_Chi' => $row['agent_address'],
                 'lat' => $row['map_latitude'],
                 'log' => $row['map_longitude'],
                 'Ngay_Dat' => $row['date_created']
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
}else if(isset($_REQUEST['user_id'])){
    $product_arr = array();
    // get total product
    $user_id = $_REQUEST['user_id'];

    $sql="SELECT count(table_order.id_order) as product_total FROM `table_order` where  `id_customer` = '".$user_id."'";
    
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
    $sql = "SELECT * FROM table_order A
    INNER JOIN table_agent B ON A.id_agent = B.id_agent WHERE A.delivery_status = 3 and A.id_customer = '".$user_id."'";

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
                'Ma_Don_Hang' => $row['id_order'],
                'Ten_Nguoi_Dat_Hang' => $row['agent_name'],
                 'Sdt_Nguoi_Dat' => $row['agent_phone'],
                 'Dia_Chi' => $row['agent_address'],
                 'lat' => $row['map_latitude'],
                 'log' => $row['map_longitude'],
                 'Ngay_Dat' => $row['date_created']
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

}

?>






