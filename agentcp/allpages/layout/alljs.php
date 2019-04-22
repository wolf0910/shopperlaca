<script src="../admin_template/dist/assets/libs/jquery/jquery.min.js"></script>
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
<script>
function reload(){
    window.location.reload();
}
</script>

 <script src="../admin_template/dist/assets/plugins/bootstrap-wysihtml5/js/wysihtml5-0.3.0.min.js"></script>
<script src="../admin_template/dist/assets/plugins/bootstrap-wysihtml5/js/bootstrap-wysihtml5.js"></script>
<script>
    jQuery(function ($) {
        $('#wysiwyg').wysihtml5({
            stylesheets: ['../admin_template/dist/assets/plugins/bootstrap-wysihtml5/css/wysiwyg-color.css']
        });
        $('.wysihtml5-toolbar .btn-default').removeClass('btn-default').addClass('btn-white');
    });
</script>
<!-- my custom js -->
<script src="js/jquery_validate/jquery.validate.js"></script>
<script src="js/jquery_validate/additional-methods.js"></script>
<?php 
	if (isset($_REQUEST['page']))
    { 
        if($_REQUEST['page']=='dashboard') 
        	echo '<script src="../admin_template/demo/js/dashboard.js"></script>';
        if($_REQUEST['page']=='crud_agent') 
        	echo '<script src="allpages/crud_agent/crud_agent.js"></script>';
        if($_REQUEST['page']=='crud_category') 
        	echo '<script src="allpages/crud_category/crud_category.js"></script>';
    } 
?>