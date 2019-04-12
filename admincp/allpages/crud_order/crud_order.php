<div class="page-content">
  <div class="page-subheading page-subheading-md">
      
    <ol class="breadcrumb">
        <li class="active"><a href="#">Quản lý đơn đặt hàng</a></li>
    </ol>
</div>
<div class="container-fluid-md">
    <div class="panel panel-default">
        <div class="panel-heading">

            <h4 class="panel-title">Quản lý đơn đặt hàng</h4>

            <div class="panel-options">
                <!-- <a href="#" data-rel="collapse"><i class="fa fa-fw fa-minus"></i></a> -->
                <a href="#" data-rel="reload"><i class="fa fa-fw fa-refresh"></i></a>
               <!--  <a href="#" data-rel="close"><i class="fa fa-fw fa-times"></i></a> -->
            </div>
        </div>
        <div class="panel-body">
          <div class="dt-responsive table-responsive">
          <button type="button" class="button" id="add_company">
            <i class="fas fa-plus-circle"></i> Thêm đơn đặt hàng
          </button>
        </div>
          <div class="table-responsive">
            <table class="table table-striped table-hover table-bordered nowrap  datatable dataTable" id="table_companies">
              <thead>
                <tr>
                  <th width="70px">ID</th>
                  <th>Tên người nhận</th>
                  <th>Số điện thoại</th>
                  <th>Địa chỉ</th>
                  <th>Ngày đặt</th>
                  <th>Trạng thái</th>
                  <th>Đại lý xữ lý</th>

                  <th>Chức năng</th>
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

            <label for="id_customer">Người đặt: <span class="required">*</span></label>
            <div class="field_container">

              <select class="form-control form-select2" id="id_customer"  name="id_customer" >
                <option value="">Chọn khách hàng</option>
              <?php 
                $query = "SELECT * FROM `table_customer` ";
                $query = mysqli_query($conn, $query);
                while ($row = mysqli_fetch_array($query))
                {
                  echo '<option value="'.$row['id_customer'].'">'.$row['customer_fullname'].' - '.$row['customer_phone'].'</option>';
                }
              ?> 
              </select>
            </div>

          </div>

          <div class="input_container">

            <label for="id_city">Thành phố: <span class="required">*</span></label>
            <div class="field_container">

              <select class="form-control form-select2" id="id_city"  name="id_city" >
                <option value="">Chọn thành phố</option>
              <?php 
                $query = "SELECT * FROM `table_city` ";
                $query = mysqli_query($conn, $query);
                while ($row = mysqli_fetch_array($query))
                {
                  echo '<option value="'.$row['id_city'].'">'.$row['city_name'].'</option>';
                }
              ?> 
              </select>
            </div>

          </div>

          <div class="input_container">
            <label for="id_district">Quận huyện: <span class="required">*</span></label>
            <div class="field_container">
              <select class="form-control form-select2" id="id_district"  name="id_district" >
                <option value="">Chọn quận huyện</option>
                
              </select>
            </div>
          </div>

          <div class="input_container">
            <label for="receiver_name">Tên người nhận: <span class="required">*</span></label>
            <div class="field_container">
              <input type="text" autocomplete="off" class="text" name="receiver_name" id="receiver_name" value="" required>
            </div>
          </div>

          <div class="input_container">
            <label for="receiver_phone">Số điện thoại: <span class="required">*</span></label>
            <div class="field_container">
              <input type="text" autocomplete="off" class="text" name="receiver_phone" id="receiver_phone" value="" required>
            </div>
          </div>

          <div class="input_container">
            <label for="receiver_address">Địa chỉ giao hàng: <span class="required">*</span></label>
            <div class="field_container">
              <input type="text" autocomplete="off" class="text" name="receiver_address" id="receiver_address" value="" required>
            </div>
          </div>
          

          <div class="input_container">
            <label for="email">Sản phẩm: <span class="required">*</span></label>
            <div class="field_container ">




      <!--animated clone demo start-->
        <div id="div_products_input" class="demo-wrap">

          <div class="row toclone" >            
              <div class="col-sm-6">
                <div class="form-group">
                  <select class="form-control form-select2" id="id_product"  name="id_product[]" >
                    <option value="">Chọn sản phẩm</option>
                    <?php 
                      $query = "SELECT * FROM `table_product` ";
                      $query = mysqli_query($conn, $query);
                      while ($row = mysqli_fetch_array($query))
                      {
                        echo '<option value="'.$row['id_product'].'">'.$row['product_name'].'</option>';
                      }
                    ?> 
                  </select>
                </div>
              </div>

              <div class="col-sm-3">
                <div class="form-group">
                    <input type="number" class="form-control" id="quantity" name="quantity[]" placeholder="số lượng">
                </div>
              </div>
              
            <div class="btn btn-success clone"><i class="fas fa-plus"></i></div>
            <div class="btn btn-danger delete"><i class="fa fa-times"></i></div>
          </div>

        </div>
    <!--animated clone demo end-->

            </div>
          </div>

          <div class="input_container">

            <label for="id_agent">Đại lý xữ lý: <span class="required">*</span></label>
            <div class="field_container">

              <select class="form-control form-select2" id="id_agent"  name="id_agent" >
                <option value="">Chọn đại lý</option>
              <?php 
                $query = "SELECT * FROM `table_agent` ";
                $query = mysqli_query($conn, $query);
                while ($row = mysqli_fetch_array($query))
                {
                  echo '<option value="'.$row['id_agent'].'">'.$row['agent_name'].' - '.$row['agent_phone'].'</option>';
                }
              ?> 
              </select>
            </div>

          </div>
    

          <div class="input_container" id="delivery_status_div">
            <label for="delivery_status" >Trạng thái: <span class="required">*</span></label>
            <div class="field_container">
             
              <select class="form-control form-select2" id="delivery_status"  name="delivery_status" >
                <option value="Chờ giao hàng">Chờ giao hàng</option>
                <option value="Đang giao hàng">Đang giao hàng</option>
                <option value="Đã giao hàng">Đã giao hàng</option>               
              </select>

            </div>
          </div>

          <div class="input_container" style="display: none;">
            <label for="id_order">id_order: <span class="required">*</span></label>
            <div class="field_container">
              <input type="text" class="text" name="id_order" id="id_order" value="" readonly >
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