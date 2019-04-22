<div class="page-content">
  <div class="page-subheading page-subheading-md">
    <ol class="breadcrumb">
        <li class="active"><a href="../admin_template/javascript:;">Manage Category</a></li>
    </ol>
</div>
<div class="container-fluid-md">
    <div class="panel panel-default">
        <div class="panel-heading">

            <h4 class="panel-title">Manage Category</h4>

            <div class="panel-options">
                <!-- <a href="#" data-rel="collapse"><i class="fa fa-fw fa-minus"></i></a> -->
                <a href="#" data-rel="reload"><i class="fa fa-fw fa-refresh"></i></a>
               <!--  <a href="#" data-rel="close"><i class="fa fa-fw fa-times"></i></a> -->
            </div>
        </div>
        <div class="panel-body">
          <div class="dt-responsive table-responsive">
          <button type="button" class="button" id="add_company">
            <i class="fas fa-plus-circle"></i> Create Category
          </button>
        </div>
            <div class="table-responsive">
              <table class="table table-striped table-hover table-bordered nowrap  datatable dataTable" id="table_companies">
                <thead>
                  <tr>
                    <th>Avatar</th>
                    <th>Category Name</th>
                    <th>Function</th>
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
            <label for="category_name">Category Name : <span class="required">*</span></label>
            <div class="field_container">
              <input type="text" class="text" autocomplete="off" name="category_name" id="category_name" value="" onkeyup="checkAvailability()" >
              <div id="user-availability-status" ></div>
              <p><img src="LoaderIcon.gif" id="loaderIcon" style="display:none" /></p>
            </div>
          </div>

          <div class="input_container">
            <label for="agent_avatar">Image Avatar: <span class="required">*</span></label>
             <div class="field_container">
               <input type="text" class="text" name="agent_avatar" id="agent_avatar" value="" style="display: none">
               <input type="file" name="img_avatar" id="img_avatar" accept="image/*"  />
              <span id="uploaded_img_avatarư"></span>
            </div>
          </div>

          <div class="input_container" style="display: none;">
            <label for="id_category">id_category: <span class="required">*</span></label>
            <div class="field_container">
              <input type="text" class="text" name="id_category" id="id_category" value="" readonly >
            </div>
          </div>
          
          <div class="button_container">
            <button type="submit" id='button_submit'>Tạo tài khoản</button>
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