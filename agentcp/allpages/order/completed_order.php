<?php
	$id_order = $_GET['purchase'];
	$sql = "UPDATE `table_order` SET `delivery_status` = '3'  WHERE `id_order` = '".$id_order."' ";
	$result = mysqli_query($conn,$sql);
	mysqli_close($conn);
	if($result == true){
        ?>
        <script>
            alert("Completed order True");
            window.location="?page=completed";
        </script>
        <?php
    }else{
        ?>
        <script>
            alert("Completed orderr False");
            window.location="?page=delivery";
        </script>
        <?php
    }
?>