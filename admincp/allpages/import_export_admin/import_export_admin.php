<div class="page-content">
  <div class="page-subheading page-subheading-md">
  <ol class="breadcrumb">
    <li><a href="#">Quản Trị Viên bán lẻ</a></li>
    <li class="active"><a href="javascript:;">Import/Export Quản Trị Viên</a></li>
  </ol>
</div>
<div class="page-heading page-heading-md">
    <h2>Import/Export Quản Trị Viên</h2>
</div>

<div class="container-fluid-md">
    <div class="panel panel-default">
        <div class="panel-heading">
             <a href="allpages/import_export_admin/Administrators_example.xlsx" class="btn btn-lg btn-flat btn-primary" download><i class="fas fa-download"></i> Mẫu file excel import</a>

            <div class="panel-options">
                <a href="#" data-rel="collapse"><i class="fa fa-fw fa-minus"></i></a>
                <a href="#" data-rel="reload"><i class="fa fa-fw fa-refresh"></i></a>
                <a href="#" data-rel="close"><i class="fa fa-fw fa-times"></i></a>
            </div>
        </div>
        <div class="panel-body no-padding-top">
            <div class="row">
                <div class="col-md-6 col-button-colors">
                    <h4 class="margin-md-top">Import Quản Trị Viên</h4>
<form method="post" id="form_import" enctype="multipart/form-data" action="allpages/import_export_admin/import_admin.php">
    <div class="form-group">
        <label for="exampleInputFile">Chọn file</label>
        <input type="file" name="file" required="true" class="form-control" id="exampleInputFile">
    </div>
    <button type="button" id="button_import" class="btn btn-lg btn-flat btn-primary">Import</button>
</form>
                   
                </div>

                <div class="col-md-6 col-button-colors">
                    <h4 class="margin-md-top">Export Quản Trị Viên</h4>
                    <a href="allpages/import_export_admin/export_admin.php" class="btn btn-lg btn-flat btn-primary"><i class="fas fa-download"></i> Export </a>
                </div>

            </div>
        </div>
    </div>

    <div class="panel panel-default" id="import_result_pannel">
        <div class="panel-heading">
            Kết quả import
            <div class="panel-options">
                <!-- <a href="#" data-rel="collapse"><i class="fa fa-fw fa-minus"></i></a>
                <a href="#" data-rel="reload"><i class="fa fa-fw fa-refresh"></i></a>
                <a href="#" data-rel="close"><i class="fa fa-fw fa-times"></i></a> -->
            </div>
        </div>
        <div class="panel-body no-padding-top">
            <div class="row">
                <div class="col-md-12 " id="import_result_content">
                    

                </div>
            </div>
    </div>

</div>
</div>