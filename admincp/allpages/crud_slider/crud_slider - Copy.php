  <!-- Page-header start -->
  <div class="page-header card">
      <div class="row align-items-end">
          <div class="col-lg-6">
            <div class="page-header-title">                  
              <i class="fa fa-users bg-c-blue"></i>

          <h4>Quản lý slider</h4>
          <!-- <span>lorem ipsum dolor sit amet, consectetur adipisicing elit</span> -->
                
          </div>
          </div>
          <div class="col-lg-6">
              <div class="page-header-breadcrumb">
                  <ul class="breadcrumb-title">
                      <li class="breadcrumb-item">
                          <a href="index.html">
                              <i class="icofont icofont-home"></i>
                          </a>
                      </li>
                      <li class="breadcrumb-item"><a href="#">Quản lý slider</a>
                      </li>
                      
                  </ul>
              </div>
          </div>
      </div>
  </div>
  <!-- Page-header end -->
 
  <!-- Page body start -->
 <div class="card">    
    <div class="card-block">
        <div class="dt-responsive table-responsive">
          <button type="button" class="button" id="add_company">
            <i class="fas fa-plus-circle"></i> Thêm slider
          </button>
    </div>
<div class="card-body">
  <div class="table-responsive">
    <table class="table table-striped table-hover table-bordered nowrap  datatable dataTable" id="table_companies">
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
</div>