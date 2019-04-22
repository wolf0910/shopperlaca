<div class="page-content">
  <!-- <div class="page-subheading page-subheading-md">
    <ol class="breadcrumb">
        <li class="active"><a href="../admin_template/javascript:;">Quản lý danh mục</a></li>
    </ol>
  </div> -->
<div class="container-fluid-md">
    <div class="panel ">
        <div class="panel-heading panel-primary-black">

            <h4 class="panel-title"><i class="fas fa-th-list"></i> QL slider</h4>

            <div class="panel-options">
                <!-- <a href="#" data-rel="collapse"><i class="fa fa-fw fa-minus"></i></a> -->
                <!-- <a href="#" data-rel="reload"><i class="fa fa-fw fa-refresh"></i></a> -->
               <!--  <a href="#" data-rel="close"><i class="fa fa-fw fa-times"></i></a> -->
            </div>
        </div>
        <div class="panel-body">
          <div class="dt-responsive table-responsive">
          <button type="button" class="button" id="add_company">
            <i class="fas fa-plus-circle"></i> Thêm slider
          </button>
        </div>
            <div class="table-responsive">
              <table class="table table-striped table-hover table-bordered datatable dataTable" id="table_companies">
                <thead>
                  <tr>
                    <th width="15%">ID</th>
                    <th width="20%">Hình ảnh</th>
                    <th width="25%">Nội dung 1</th>             
                    <th width="25%">Nội dung 2</th>          
                    <th width="15%">Chức năng</th>
                  </tr>
                </thead>
                <tbody>
                </tbody>
              </table>
            </div>
        </div>


<div class="lightbox_bg"></div>
    <div class="lightbox_container">
      <div class="lightbox_close"></div>
      <div class="lightbox_content">
        
        <h2>Thêm Admin</h2>
        <form method="post" class="form add" id="form_company" enctype="multipart/form-data">

          <div class="input_container">
            <label for="content1">Nội dung 1: <span class="required">*</span></label>
            <div class="field_container">
              <input type="text" class="text" name="content1" id="content1" value="" onrequired>
            </div>
          </div>
          <div class="input_container">
            <label for="content2">Nội dung 2: <span class="required">*</span></label>
            <div class="field_container">
              <input type="text" class="text" name="content2" id="content2" value="" onrequired>
            </div>
          </div>
           <div class="input_container">
            <label for="img_avatar">Hình ảnh(1920x950px): <span class="required">*</span></label>
            <div class="field_container">
              <input type="file"  name="img_avatar" id="img_avatar" accept="image/*"/>
              <span id="uploaded_img_avatar"></span>
            </div>
          </div>

          <div class="input_container" style="display: none;">
            <label for="id_slider">id_slider: <span class="required">*</span></label>
            <div class="field_container">
              <input type="text" class="text" name="id_slider" id="id_slider" value="" readonly >
            </div>
          </div>
          
          <div class="button_container">
            <button type="submit" id='button_submit'>Tạo slider</button>
          </div>
        </form>
        
      </div>
    </div>

    <noscript id="noscript_container">
      <div id="noscript" class="error">
        <p>JavaScript support is needed to use this page.</p>
      </div>
    </noscript>

    <div id="message_container">
      <div id="message" class="success">
        <p>This is a success message.</p>
      </div>
    </div>

    <div id="loading_container">
      <div id="loading_container2">
        <div id="loading_container3">
          <div id="loading_container4">
            Loading, please wait...
          </div>
        </div>
      </div>
    </div>

    </div>    
</div>