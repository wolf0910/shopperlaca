<?php 
    session_start();
    // Database details
    include_once ('../config/db_config.php');
    include_once ('../config/reuse_function.php');
    if( !isset($_SESSION['id_administrator']))
    {
        echo "
        <script>    
          window.location='admincp.php';
        </script>

        ";
    } 
      
?>
<!doctype html>
<!--[if IE 8]>         <html class="ie8"> <![endif]-->
<!--[if IE 9]>         <html class="ie9"> <![endif]-->
<!--[if gt IE 9]><!--> <html> <!--<![endif]-->
<head>
 <!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>Admin &middot; Control Pannel </title>
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

        if($_REQUEST['page']=='dashboard')
            { include('allpages/dashboard/dashboard.php'); }

        if($_REQUEST['page']=='crud_agent')
            { include('allpages/crud_agent/crud_agent.php'); }

        if($_REQUEST['page']=='import_export_agent')
            { include('allpages/import_export_agent/import_export_agent.php'); }

        if($_REQUEST['page']=='crud_customer')
            { include('allpages/crud_customer/crud_customer.php'); }

        if($_REQUEST['page']=='import_export_customer')
            { include('allpages/import_export_customer/import_export_customer.php'); }

        if($_REQUEST['page']=='crud_admin')
            { include('allpages/crud_admin/crud_admin.php'); }

        if($_REQUEST['page']=='import_export_admin')
            { include('allpages/import_export_admin/import_export_admin.php'); }

        if($_REQUEST['page']=='crud_category')
            { include('allpages/crud_category/crud_category.php'); }

        if($_REQUEST['page']=='crud_producer')
            { include('allpages/crud_producer/crud_producer.php'); }

        if($_REQUEST['page']=='crud_product')
            { include('allpages/crud_product/crud_product.php'); }

        if($_REQUEST['page']=='crud_order')
            { include('allpages/crud_order/crud_order.php'); }

        if($_REQUEST['page']=='agents_statistic')
            { include('allpages/agents_statistic/agents_statistic.php'); }

        if($_REQUEST['page']=='agent_statistic')
            { include('allpages/agent_statistic/agent_statistic.php'); }

        if($_REQUEST['page']=='customers_statistic')
            { include('allpages/customers_statistic/customers_statistic.php'); }


    } else {
        include('allpages/dashboard/dashboard.php');
    }
?>
</div>


<?php 
    include('allpages/layout/alljs.php');
?>
</body>
</html>
