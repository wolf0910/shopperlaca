<div class="page-content">
  <!-- <div class="page-subheading page-subheading-md">
    <ol class="breadcrumb">
        <li class="active"><a href="../admin_template/javascript:;">Quản lý khách hàng</a></li>
    </ol>
  </div> -->
<div class="container-fluid-md">
    <div class="panel ">
        <div class="panel-heading panel-primary-black">

            <h4 class="panel-title"><i class="fas fa-users"></i> Quản lý khách hàng</h4>

            <div class="panel-options">
                <!-- <a href="#" data-rel="collapse"><i class="fa fa-fw fa-minus"></i></a> -->
                <!-- <a href="#" data-rel="reload"><i class="fa fa-fw fa-refresh"></i></a> -->
               <!--  <a href="#" data-rel="close"><i class="fa fa-fw fa-times"></i></a> -->
            </div>
        </div>
        <div class="panel-body">
          <div class="dt-responsive table-responsive">
          <button type="button" class="button" id="add_company">
            <i class="fas fa-plus-circle"></i> Tạo tài khoản
          </button>
        </div>
            <div class="table-responsive">
              <table class="table table-striped table-hover table-bordered datatable dataTable" id="table_companies">
                <thead>
                  <tr>
                    <th width="10%">Avatar</th>
                    <th>Họ tên</th>
                    <th >Số điện thoại</th>
                    <th >Địa chỉ</th>
                    <th >Tình trạng</th>     
                    
                    <th width="10%">Chức năng</th>
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
            <label for="customer_fullname">Họ tên: <span class="required">*</span></label>
            <div class="field_container">
              <input type="text" class="text" autocomplete="off" name="customer_fullname" id="customer_fullname" value="" required>
            </div>
          </div>
          <div class="input_container">
            <label for="customer_email">Email: <span class="required">*</span></label>
            <div class="field_container">
              <input type="text" class="text" autocomplete="off" name="customer_email" id="customer_email"    required >
              
            </div>
          </div>
          <div class="input_container">
            <label for="customer_phone">SĐT: <span class="required">*</span></label>
            <div class="field_container">
              <input type="text" class="text" autocomplete="off" name="customer_phone" id="customer_phone" value="" onkeyup="checkAvailability()" >
              <div id="user-availability-status" ></div>
              <p><img src="LoaderIcon.gif" id="loaderIcon" style="display:none" /></p>
            </div>
          </div>

          <div class="input_container">
            <label for="customer_password">Mật khẩu: <span class="required">*</span></label>
            <div class="field_container">
              <input type="password" class="text" autocomplete="off" name="customer_password" id="customer_password" value="" >
            </div>
          </div>
          
        
        <div class="input_container" id="status_div">
          <label for="status">Tình trạng: <span class="required">*</span></label>
          <div class="field_container">
          <select name="status" id="status" form="form_company" class="selectpicker form-control" required>
          <option value="">Chọn tình trạng</option>             
          <option value="deactive">Chưa kích hoạt</option>
          <option value="active">Đã kích hoạt</option>              
          </select> 
          </div>
        </div>           
        <div class="input_container">
            <label for="customer_address">Địa chỉ: <span class="required">*</span></label>
            <div class="field_container">
              <input type="text" class="text" autocomplete="off" name="customer_address" id="customer_address" value="" >
            </div>
        </div>
        
        <div class="input_container">
            <label for="customer_avatar">Hình đại diện: <span class="required">*</span></label>
             <div class="field_container">
               <input type="text" class="text" name="customer_avatar" id="customer_avatar" value="" style="display: none">
               <input type="file" name="user_image" id="user_image" accept="image/*"  />
              <span id="user_uploaded_image"></span>
            </div>
        </div>

          <div class="input_container" style="display: none;">
            <label for="id_customer">id_customer: <span class="required">*</span></label>
            <div class="field_container">
              <input type="text" class="text" name="id_customer" id="id_customer" value="" readonly >
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