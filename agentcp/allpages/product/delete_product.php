<?php
$delete = $_GET['delete'];
if($delete != "")
{
    $sql ="DELETE FROM `table_product` WHERE `id_product` =  '".$delete."'";
    $result = mysqli_query($conn , $sql);
    $sql1= "DELETE FROM `table_product_detail` WHERE `id_product` = '".$delete."'";
    $result1 = mysqli_query($conn , $sql1);
    $sql2= "DELETE FROM `table_storage` WHERE `id_product` = '".$delete."'";
    $result2 = mysqli_query($conn , $sql2);
    mysqli_close($conn);
    if($result == true and $result1 == true and $result2 == true){
        ?>
        <script>
            alert("Xóa Thành Công");
            window.location="?page=list_product";
        </script>
        <?php
    }else{
        ?>
        <script>
            alert("Xóa Không Thành Công");
            window.location="?page=list_product";
        </script>
        <?php
    }
}
?>