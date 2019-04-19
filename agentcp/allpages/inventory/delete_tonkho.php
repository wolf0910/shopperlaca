<?php
$delete = $_GET['delete'];
if($delete != "")
{
    $sql ="DELETE FROM `table_storage` WHERE `id_storage`  =  '".$delete."'";
    $result = mysqli_query($conn , $sql);
    mysqli_close($conn);
    if($result == true){
        ?>
        <script>
            alert("delete True");
            window.location="?page=list_TonKho";
        </script>
        <?php
    }else{
        ?>
        <script>
            alert("Delete False");
            window.location="?page=list_TonKho";
        </script>
        <?php
    }
}
?>