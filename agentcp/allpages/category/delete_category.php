<?php
$delete = $_GET['delete'];
if($delete != "")
{
    $sql ="DELETE FROM `table_category` WHERE `id_category` =  '".$delete."'";
    $result = mysqli_query($conn , $sql);
    mysqli_close($conn);
    if($result == true){
        ?>
        <script>
            alert("Xóa Thành Công");
            window.location="?page=list_category";
        </script>
        <?php
    }else{
        ?>
        <script>
            alert("Xóa Không Thành Công");
            window.location="?page=list_category";
        </script>
        <?php
    }
}
?>