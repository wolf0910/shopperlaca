<?php
$delete = $_GET['delete'];
if($delete != "")
{
    $sql ="DELETE FROM `table_agent` WHERE `id_agent` =  '".$delete."'";
    $result = mysqli_query($conn , $sql);
    mysqli_close($conn);
    if($result == true){
        ?>
        <script>
            alert("Delete Thành Công");
            window.location="?page=list_user";
        </script>
        <?php
    }else{
        ?>
        <script>
            alert("Delete Thất Bại");
            window.location="?page=list_user";
        </script>
        <?php
    }
}
?>