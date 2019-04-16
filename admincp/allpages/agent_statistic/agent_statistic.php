<div class="page-content">
  <!-- <div class="page-subheading page-subheading-md">
    <ol class="breadcrumb">
        <li class="active"><a href="../admin_template/javascript:;">thống kê danh sách đại lý</a></li>
    </ol>
</div> -->

<div class="container-fluid-md">
    <div class="panel panel-default">
        <div class="panel-heading">
           <!--  <h4 class="panel-title">thống kê danh sách đại lý</h4> -->
            <div class="panel-options">
                <!-- <a href="#" data-rel="collapse"><i class="fa fa-fw fa-minus"></i></a> -->
                <!-- <a href="#" data-rel="reload"><i class="fa fa-fw fa-refresh"></i></a> -->
               <!--  <a href="#" data-rel="close"><i class="fa fa-fw fa-times"></i></a> -->
            </div>
        </div>
        <div class="panel-body">
          <div class="dt-responsive table-responsive">
            <form  method="POST" accept-charset="utf-8" id="form_company" >
                <div class="row">
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        Chọn khoảng thời gian:
                        <input id="date_range" type="text" name="date_range" class=" form-control" style="width: 250px; display: block;" autocomplete="off" value="" required="">
                         Đại lý :
                        <select style="    width: 250px;
    display: block;" class="form-control form-select2" id="id_agent"  name="id_agent" >
                            <option value="">Chọn khách hàng</option>
                          <?php 
                            $query = "SELECT * FROM `table_agent` ";
                            $query = mysqli_query($conn, $query);
                            while ($row = mysqli_fetch_array($query))
                            {
                              echo '<option value="'.$row['id_agent'].'">'.$row['agent_phone'].' - '.$row['agent_name'].'</option>';
                            }
                          ?> 
                      </select>
                    </div>
                    <div class="col-md-6 col-lg-6 col-sm-6">
                       
                    </div>
                    
                </div>
                <button type="button" class="button" id="create_statistic">
                    <i class="fas fa-level-down-alt"></i> Tạo thống kê
                </button>

              
                
            
           </form>

        </div>
           
        </div>
    </div>

    <div class="panel panel-default" id="statistic_result_pannel" style="display: none" >
        <div class="panel-heading">
            Kết quả thống kê:
        <div class="row" >
            <div class="col-sm-6 col-lg-6">
                <div class="panel panel-metric panel-metric-sm">
                    <div class="panel-body panel-body-success">
                        <div class="metric-content metric-icon">
                            <div class="value font-size-36" id="agents_total_quantity">
                                
                            </div>
                            <div class="icon font-size-36">
                                <i class="fas fa-people-carry"></i>
                            </div>
                            <header>
                                <h3 class="thin">Số lượng sản phẩm</h3>
                            </header>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-6 col-lg-6">
                <div class="panel panel-metric panel-metric-sm">
                    <div class="panel-body panel-body-inverse">
                        <div class="metric-content metric-icon">
                            <div class="value font-size-36" id="agents_total_income">
                                
                            </div>
                            <div class="icon font-size-36">
                                <i class="fas fa-money-bill"></i>
                            </div>
                            <header>
                                <h3 class="thin">Doanh thu </h3>
                            </header>
                        </div>
                    </div>
                </div>
            </div>

        </div>
            
            <div class="panel-options">
                <!-- <a href="#" data-rel="collapse"><i class="fa fa-fw fa-minus"></i></a>
                <a href="#" data-rel="reload"><i class="fa fa-fw fa-refresh"></i></a>
                <a href="#" data-rel="close"><i class="fa fa-fw fa-times"></i></a> -->
            </div>
        </div>
        <div class="panel-body no-padding-top">
            <div class="row">
                Kết quả thống kê doanh thu
                <div class="col-md-12 " id="import_result_content">
        
               
                    
                   
                        <div id="morris-bar" style="height: 300px"></div>
        



                </div>
            </div>
             <div class="row">
                Kết quả thống kê số lượng
                <div class="col-md-12 " id="import_result_content">

               
                    
                   
                        <div id="morris-bar2" style="height: 300px"></div>
        



                </div>
            </div>
        </div>

    </div>


</div>