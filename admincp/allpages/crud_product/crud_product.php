<div class="page-content">
  <!-- <div class="page-subheading page-subheading-md">
    <ol class="breadcrumb">
        <li class="active"><a href="../admin_template/javascript:;">Quản lý sản phẩm</a></li>
    </ol>
  </div> -->
<div class="container-fluid-md">
    <div class="panel ">
        <div class="panel-heading panel-primary-black">

            <h4 class="panel-title"><i class="fas fa-boxes"></i> QL sản phẩm</h4>

            <div class="panel-options">
                <!-- <a href="#" data-rel="collapse"><i class="fa fa-fw fa-minus"></i></a> -->
               <!--  <a href="#" data-rel="reload"><i class="fa fa-fw fa-refresh"></i></a> -->
               <!--  <a href="#" data-rel="close"><i class="fa fa-fw fa-times"></i></a> -->
            </div>
        </div>
        <div class="panel-body">
          <div class="dt-responsive table-responsive">
          <button type="button" class="button" id="add_company">
            <i class="fas fa-plus-circle"></i> Thêm sản phẩm
          </button>
        </div>
          <div class="table-responsive">
            <table class="table table-striped table-hover table-bordered nowrap  datatable dataTable" id="table_companies">
              <thead>
                <tr>
                  <th width="10%">ID</th>
                  <th>Avatar</th>
                  <th>Tên sản phẩm</th>
                  <th>Danh mục</th>
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
            <label for="product_name">Tên sản phẩm: <span class="required">*</span></label>
            <div class="field_container">
              <input type="text" class="text" autocomplete="off" name="product_name" id="product_name" value="" required>
            </div>
          </div>

          <div class="input_container">
            <label for="id_category" >Danh mục sản phẩm: <span class="required">*</span></label>
            <div class="field_container">
             
              <select class="form-control form-select2" id="id_category"  name="id_category" >
                <option value="">Chọn danh mục</option>
              <?php 
                $query = "SELECT * FROM `table_category` ";
                $query = mysqli_query($conn, $query);
                while ($row = mysqli_fetch_array($query))
                {
                  echo '<option value="'.$row['id_category'].'">'.$row['category_name'].'</option>';
                }
              ?> 
              </select>

            </div>
          </div>

          <div class="input_container">
            <label for="id_producer">Nhà sản xuất: <span class="required">*</span></label>
            <div class="field_container">
              <select class="form-control form-select2" id="id_producer"  name="id_producer">
                <option value="">Chọn nhà sản xuất</option>
              <?php 
                $query = "SELECT * FROM `table_producer` ";
                $query = mysqli_query($conn, $query);
                while ($row = mysqli_fetch_array($query))
                {
                  echo '<option value="'.$row['id_producer'].'">'.$row['producer_name'].'</option>';
                }
              ?> 
              </select>

             
            </div>
          </div>

          <div class="input_container">
            <label for="product_price">Giá: <span class="required">*</span></label>
            <div class="field_container">
              <input type="text" autocomplete="off" class="text" name="product_price" id="product_price" value="" required>
            </div>
          </div>


          <div class="input_container">
            <label for="product_description">Mô tả chi tiết: <span class="required">*</span></label>
            <div class="field_container"> 
              <textarea id="product_description" class="form-control" name="product_description" value="" required  ></textarea>
            </div>
          </div>

          <div class="input_container">
            <label for="product_additional_information">Chính sách bảo hành: </label>
            <div class="field_container">
              <textarea id="product_additional_information" class="form-control" name="product_additional_information" value="" required rows="5" ></textarea>
            </div>
          </div>

          <div class="input_container">
            <label for="product_price_4compare1">Giá 1: <span class="required">*</span></label>
            <div class="field_container">
              <input type="text" class="text" name="product_price_4compare1" id="product_price_4compare1" value="" required>
            </div>
          </div>

          <div class="input_container">
            <label for="product_price_4compare2">Giá 2: <span class="required">*</span></label>
            <div class="field_container">
              <input type="text" class="text" name="product_price_4compare2" id="product_price_4compare2" value="" required>
            </div>
          </div>

          <div class="input_container">
            <label for="product_price_4compare3">Giá 3: <span class="required">*</span></label>
            <div class="field_container">
              <input type="text" class="text" name="product_price_4compare3" id="product_price_4compare3" value="" required>
            </div>
          </div>

          <div class="input_container">
            <label for="agent_point">Điểm thưởng đại lý: <span class="required">*</span></label>
            <div class="field_container">
              <input type="text" class="text" name="agent_point" id="agent_point" value="" required>
            </div>
          </div>

          <div class="input_container">
            <label for="customer_point">Điểm thưởng khách hàng: <span class="required">*</span></label>
            <div class="field_container">
              <input type="text" class="text" name="customer_point" id="customer_point" value="" required>
            </div>
          </div>

          <div class="input_container" style="display: none">
            <label for="linkhinhanh">Hình ảnh : <span class="required">*</span></label>
            <div class="field_container">
              <input type="text" class="text" name="linkhinhanh" id="linkhinhanh" value="" readonly >
            </div>
          </div>

          <div class="input_container">
            <label for="img_avatar">Hình đại diện(1000x1000 px): <span class="required">*</span></label>
            <div class="field_container">
              
              <input type="file"  name="img_avatar" id="img_avatar" accept="image/*"/>
              <span id="uploaded_img_avatar"></span>
            </div>
          </div>

          <div class="input_container">
            <label for="img_detail">Hình chi tiết(1000x1000 px): </label>
            <div class="field_container">
              
              <input type="file" name="img_detail[]" id="img_detail" accept="image/*" multiple/>
              <span id="uploaded_img_details"></span>
            </div>
          </div>
       
          
          <div class="input_container" style="display: none;">
            <label for="id_product">id_product: <span class="required">*</span></label>
            <div class="field_container">
              <input type="text" class="text" name="id_product" id="id_product" value="" readonly >
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