<script src="lib/jquery.min.js"></script>
<script src="../admin_template/dist/assets/bs3/js/bootstrap.min.js"></script>
<script src="../admin_template/dist/assets/plugins/jquery-navgoco/jquery.navgoco.js"></script>
<script src="../admin_template/dist/js/main.js"></script>

<!--[if lt IE 9]>
<script src="../admin_template/dist/assets/plugins/flot/excanvas.min.js"></script>
<![endif]-->
<script src="../admin_template/dist/assets/plugins/jquery-sparkline/jquery.sparkline.js"></script>
<script src="../admin_template/demo/js/demo.js"></script>

<script src="../admin_template/dist/assets/plugins/jquery-jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="../admin_template/dist/assets/plugins/jquery-jvectormap/maps/world_mill_en.js"></script>

<!--[if gte IE 9]>-->
<script src="../admin_template/dist/assets/plugins/rickshaw/js/vendor/d3.v3.js"></script>
<script src="../admin_template/dist/assets/plugins/rickshaw/rickshaw.min.js"></script>
<!--<![endif]-->

<script src="../admin_template/dist/assets/plugins/flot/jquery.flot.js"></script>
<script src="../admin_template/dist/assets/plugins/flot/jquery.flot.resize.js"></script>
<script src="../admin_template/dist/assets/plugins/raphael/raphael-min.js"></script>
<script src="../admin_template/dist/assets/plugins/morris/morris.min.js"></script>

<script src="../admin_template/dist/assets/plugins/jquery-datatables/js/jquery.dataTables.js"></script>
<script src="../admin_template/dist/assets/plugins/jquery-datatables/js/dataTables.tableTools.js"></script>
<script src="../admin_template/dist/assets/plugins/jquery-datatables/js/dataTables.bootstrap.js"></script>

<script src="../admin_template/dist/assets/plugins/jquery-select2/select2.min.js"></script>

<script src="../admin_template/dist/assets/plugins/raphael/raphael-min.js"></script>
<script src="../admin_template/dist/assets/plugins/morris/morris.min.js"></script>



<!-- my custom js -->

<!-- ckeditor plugin -->
<script src="lib/ckeditor/ckeditor.js"></script>
<script src="lib/ckfinder/ckfinder.js"></script>

<!-- daterange picker plugin -->
<script src="lib/daterangepicker/moment.min.js"></script>
<script src="lib/daterangepicker/daterangepicker.min.js"></script>

<!-- jquery validate -->
<script src="lib/jquery_validate/jquery.validate.js"></script>
<script src="lib/jquery_validate/additional-methods.js"></script>

<!-- cloneya -->
<script src="lib/jquery-cloneya/jquery-cloneya.min.js"></script>

<!-- Numberic stepper -->
<script src="lib/stepper/jquery.stepper.js"></script>

<?php 
	if (isset($_REQUEST['page']))
    {  
        if($_REQUEST['page']=='crud_agent') 
        	echo '<script src="allpages/crud_agent/crud_agent.js"></script>';
        if($_REQUEST['page']=='import_export_agent') 
        	echo '<script src="allpages/import_export_agent/import_export_agent.js"></script>';

        if($_REQUEST['page']=='crud_customer') 
        	echo '<script src="allpages/crud_customer/crud_customer.js"></script>';
        if($_REQUEST['page']=='import_export_customer') 
        	echo '<script src="allpages/import_export_customer/import_export_customer.js"></script>';

        if($_REQUEST['page']=='crud_admin') 
        	echo '<script src="allpages/crud_admin/crud_admin.js"></script>';
        if($_REQUEST['page']=='import_export_admin') 
        	echo '<script src="allpages/import_export_admin/import_export_admin.js"></script>';

        if($_REQUEST['page']=='crud_category') 
        	echo '<script src="allpages/crud_category/crud_category.js"></script>';

        if($_REQUEST['page']=='crud_producer') 
        	echo '<script src="allpages/crud_producer/crud_producer.js"></script>';

        if($_REQUEST['page']=='crud_product') 
        	echo '<script src="allpages/crud_product/crud_product.js"></script>';

        if($_REQUEST['page']=='crud_order') 
        	echo '<script src="allpages/crud_order/crud_order.js"></script>';

        if($_REQUEST['page']=='agents_statistic') 
            echo '<script src="allpages/agents_statistic/agents_statistic.js"></script>';

        if($_REQUEST['page']=='agent_statistic') 
        echo '
            <script src="allpages/agent_statistic/agent_statistic.js"></script>;
        ';


        if($_REQUEST['page']=='customers_statistic') 
            echo '<script src="allpages/customers_statistic/customers_statistic.js"></script>';

        if($_REQUEST['page']=='dashboard') 
            echo '<script src="allpages/dashboard/dashboard.js"></script>';


    } else {
        echo '<script src="allpages/dashboard/dashboard.js"></script>';
    }








?>
