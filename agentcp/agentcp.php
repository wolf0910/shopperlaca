<?php 
session_start();
if(isset($_SESSION['id_agent']))
{
       // Database details
    include_once ('../config/db_config.php');
    ?>
    <!doctype html>
    <!--[if IE 8]>         <html class="ie8"> <![endif]-->
    <!--[if IE 9]>         <html class="ie9"> <![endif]-->
    <!--[if gt IE 9]><!--> <html> <!--<![endif]-->
    <head>
     <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Agents admin</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width">
    <?php 
        include('allpages/layout/allcss.php');
    ?>
    </head>
    <body class="">
    <?php 
        include('allpages/layout/top_nav.php');
    ?>

    <div class="page-wrapper">
    <?php 
        include('allpages/layout/left_menu.php');
    ?>

    <?php
    
   
    if(isset($_REQUEST['page'])){

        if($_REQUEST['page']=='dashboards')
            { include('allpages/User/list_user.php'); }
        if($_REQUEST['page']=='list_users')
            { include('allpages/User/list_user.php'); }
        if($_REQUEST['page']=='update_agents')
            { include('allpages/User/update_agents.php'); }
        if($_REQUEST['page']=='delete_agents')
            { include('allpages/User/delete_agents.php'); }
        if($_REQUEST['page']=='create_user')
            { include('allpages/User/create_user.php'); }
        if($_REQUEST['page']=='order_new')
            { include('allpages/order/order_new.php'); }
        if($_REQUEST['page']=='detail_order')
            { include('allpages/order/detail_order.php'); }
        if($_REQUEST['page']=='delivery')
            { include('allpages/order/delivery.php'); }
        if($_REQUEST['page']=='purchase_order')
            { include('allpages/order/receive_purchase_order.php'); }
        if($_REQUEST['page']=='completed_order')
            { include('allpages/order/completed_order.php'); }
        if($_REQUEST['page']=='completed')
            { include('allpages/order/completed.php'); }
        if($_REQUEST['page']=='list_product')
            { include('allpages/product/list_product.php'); }
        if($_REQUEST['page']=='create_product')
            { include('allpages/product/create_product.php'); }
        if($_REQUEST['page']=='update_product')
            { include('allpages/product/update_product.php'); }
        if($_REQUEST['page']=='delete_product')
            { include('allpages/product/delete_product.php'); }
        if($_REQUEST['page']=='list_category')
            { include('allpages/category/list_category.php'); }
        if($_REQUEST['page']=='create_category')
            { include('allpages/category/create_category.php'); }
        if($_REQUEST['page']=='update_category')
            { include('allpages/category/update_category.php'); }
        if($_REQUEST['page']=='delete_category')
            { include('allpages/category/delete_category.php'); }
        if($_REQUEST['page']=='enter_inventory')
            { include('allpages/category/enter_inventory.php'); }
        if($_REQUEST['page']=='list_TonKho')
            { include('allpages/inventory/list_TonKho.php'); }
        if($_REQUEST['page']=='delete_tonkho')
            { include('allpages/inventory/delete_tonkho.php'); }
        if($_REQUEST['page']=='list_customsr')
            { include('allpages/User/list_customsr.php'); }
        if($_REQUEST['page']=='purchase_history')
            { include('allpages/statistical/purchase_history.php'); }
        if($_REQUEST['page']=='inventory_day')
            { include('allpages/statistical/inventory_day.php'); }
        if($_REQUEST['page']=='inventory_month')
            { include('allpages/statistical/inventory_month.php'); }
        if($_REQUEST['page']=='inventory_year')
            { include('allpages/statistical/inventory_year.php'); }
        if($_REQUEST['page']=='order_history')
            { include('allpages/order/order_history.php'); }
        if($_REQUEST['page']=='inventory_day')
            { include('allpages/statistical/inventory_day.php'); }
    } else {
        include('allpages/User/list_user.php');
    }
    ?>
    </div>


    <?php 
        include('allpages/layout/alljs.php');
    ?>
    </body>
    </html>
<?php
}else{
    ?>
    <script>
        alert("Chưa Đăng Nhập Vào Hệ Thống");
        window.location="index.php";
    </script>
    <?php
}
?>
