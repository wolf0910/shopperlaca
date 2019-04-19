<?php
// Get raw posted data
if(isset($_REQUEST['username']) && isset($_REQUEST['password']))
{
    $name = $_REQUEST['username'];
    $passworde = $_REQUEST['password'];
    $password = md5($passworde);
    if(!empty($name) && !empty($password)){
        $sql="SELECT * FROM `table_agent` WHERE `agent_phone` = '".$name."' and `agent_password` = '".$password."'";
        $result = mysqli_query($conn,$sql);
        mysqli_close($conn);
        $row = mysqli_num_rows($result);
        $rowS = mysqli_fetch_assoc($result);
        $product_arr['success'] = 'true';
        $product_arr['data'] = array();
        if($row > 0){
            $count_image=0;
            $product_photo=array();
            $product_photo_item=array();
            $product_item['product_photo']=array();

            $product_item = array(
                'id_agent' => $rowS['id_agent'],
                'agent_name' => $rowS['agent_name'],
                'agent_phone' => $rowS['agent_phone'],
                'agent_address' => $rowS['agent_address']
            );
            array_push($product_arr['data'], $product_item);
            // Push to "data"
            echo json_encode($product_arr);
        }else{
            echo json_encode(
                array('success' => 'false', 'message' => 'Đăng Nhập Không Thành Công !!!')
            );
        }
    }else {
        echo json_encode(
            array('success' => 'false', 'message' => 'userName và Password rỗng !!!')
        );
    }
}else{
    echo json_encode(
        array('success' => 'false','message' => 'Thiếu params username hoạc password !!!')
    );
}