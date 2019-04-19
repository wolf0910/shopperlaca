<?php
    if(isset($_REQUEST['id_Agents']) && isset($_REQUEST['name']) && isset($_REQUEST['phone']) && isset($_REQUEST['address'])){
        $id_agents = $_REQUEST['id_Agents'];
        $name = $_REQUEST['name'];
         $phone = $_REQUEST['phone'];
        $address = $_REQUEST['address'];
        $sql = "UPDATE `table_agent` SET `agent_name`= '".$name."',`agent_phone`='".$phone."' ,`agent_address`='".$address."' WHERE `id_agent` = '".$id_agents."'";
        $result = mysqli_query($conn,$sql);
        mysqli_close($conn);
        if($result == true){
            echo json_encode(
                array('success' => 'true', 'message' => 'Update Thành Công !!!')
            );
        }else{
            echo json_encode(
                array('success' => 'false', 'message' => 'Update thất bại !!!')
            );
        }
    }else{
            echo json_encode(
                array('success' => 'false', 'message' => 'params chưa đủ hoạc sai !!!')
            );
        }
?>