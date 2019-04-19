<?php
	$id_order = $_GET['purchase'];
	$id_agent = $_SESSION['id_agent'];
	$sql = "UPDATE `table_order` SET `id_agent`= '".$id_agent."',`delivery_status` = 2  WHERE `id_order` = '".$id_order."' ";
	$result = mysqli_query($conn,$sql);
	mysqli_close($conn);
	if($result == true){
        ?>
        <script>
            alert("Nhận Đơn Hàng Thành Công");
            window.location="?page=delivery";
        </script>
        <?php
    }else{
        ?>
        <script>
            alert("Nhận Đơn Hàng Thất Bại");
            window.location="?page=order_new";
        </script>
        <?php
    }
?>