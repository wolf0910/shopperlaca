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
            alert("delete True");
            window.location="?page=list_user";
        </script>
        <?php
    }else{
        ?>
        <script>
            alert("delete False");
            window.location="?page=list_user";
        </script>
        <?php
    }
}
?>