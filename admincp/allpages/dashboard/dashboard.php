<?php 
    $current_date=date('Y-m-d');
    $total_income = 0;
    $total_sell = 0;
    $agent_count=0;
    $total_order=0;
    $total_product=0;
    $total_customer=0;

    // count income and quantity of sell
   
    $sql = " SELECT SUM(unit_price*quantity) as total_income, sum(quantity) as total_sell FROM table_order_detail,table_order WHERE table_order.id_order = table_order_detail.id_order AND delivery_status='Đã giao hàng' AND MONTH(date_created) = MONTH('".$current_date."') ";
    $result=mysqli_query($conn,$sql);
    while($row=mysqli_fetch_array($result)){
        $total_income = $row['total_income'];
        $total_sell = $row['total_sell'];
    }

    $total_income = vnd_format($total_income);

    // end income and quantity of sell

    // count total agent
    $sql = " SELECT COUNT(id_agent) as total_agent FROM table_agent ";
    $result=mysqli_query($conn,$sql);
    while($row=mysqli_fetch_array($result)){
        $agent_count = $row['total_agent'];
    }

    // end count total agent

    // count total agent
    $sql = " SELECT COUNT(id_agent) as total_agent FROM table_agent ";
    $result=mysqli_query($conn,$sql);
    while($row=mysqli_fetch_array($result)){
        $agent_count = $row['total_agent'];
    }

    // end count total order

    // count total agent
    $sql = " SELECT COUNT(id_order) as total_order FROM table_order ";
    $result=mysqli_query($conn,$sql);
    while($row=mysqli_fetch_array($result)){
        $total_order = $row['total_order'];
    }

    // end count total order

    // count total product
    $sql = " SELECT COUNT(id_product) as total_product FROM table_product ";
    $result=mysqli_query($conn,$sql);
    while($row=mysqli_fetch_array($result)){
        $total_product = $row['total_product'];
    }
    // end count total product

    // count total customer
    $sql = " SELECT COUNT(id_customer) as total_customer FROM table_customer ";
    $result = mysqli_query($conn,$sql);
    while($row = mysqli_fetch_array($result)){
        $total_customer = $row['total_customer'];
    }
    // end count total customer


?>

<div class="page-content">
<!-- 
    <div class="page-subheading page-subheading-md">
        <ol class="breadcrumb">
            <li class="active"><a href="../admin_template/javascript:;">Dashboard</a></li>
        </ol>
         
    </div> 
-->
<div class="container-fluid-md">
    <div class="row">
        <div class="col-sm-6 col-lg63">
            <div class="panel panel-metric panel-metric-sm">
                <div class="panel-body panel-body-primary">
                    <div class="metric-content metric-icon">
                        <div class="value">
                            <?php  echo $total_income; ?>
                        </div>
                        <div class="icon" style="font-size: 36px;">
                            <i class="fas fa-money-bill-wave"></i>
                        </div>
                        <header>
                            <h3 class="thin">Thu nhập trong tháng</h3>
                        </header>
                    </div>
                </div>
            </div>
        </div>
  
        <div class="col-sm-6 col-lg-6">
            <div class="panel panel-metric panel-metric-sm">
                <div class="panel-body panel-body-success">
                    <div class="metric-content metric-icon">
                        <div class="value">
                             <?php  echo $total_sell; ?>
                        </div>
                        <div class="icon" style="font-size: 36px;">
                            <i class="fas fa-boxes"></i>
                        </div>
                        <header>
                            <h3 class="thin">Số lượng hàng đã bán</h3>
                        </header>
                    </div>
                </div>
            </div>
        </div>

    <a href="?page=crud_agent">
        <div class="col-sm-6 col-lg-3">
            <div class="panel panel-metric panel-metric-sm">
                <div class="panel-body panel-body-inverse">
                    <div class="metric-content metric-icon">
                        <div class="value">
                             <?php  echo $agent_count; ?>
                        </div>
                        <div class="icon" style="font-size: 36px;">
                            <i class="fas fa-store"></i>
                        </div>
                        <header>
                            <h3 class="thin">Đại lý</h3>
                        </header>
                    </div>
                </div>
            </div>
        </div>
    </a>
    <a href="?page=crud_customer">
        <div class="col-sm-6 col-lg-3">
            <div class="panel panel-metric panel-metric-sm">
                <div class="panel-body panel-body-inverse">
                    <div class="metric-content metric-icon">
                        <div class="value">
                             <?php  echo $total_customer; ?>
                        </div>
                        <div class="icon" style="font-size: 36px;">
                            <i class="fas fa-users"></i>
                        </div>
                        <header>
                            <h3 class="thin">Khách hàng</h3>
                        </header>
                    </div>
                </div>
            </div>
        </div>
    </a>
    <a href="?page=crud_product">
        <div class="col-sm-6 col-lg-3">
            <div class="panel panel-metric panel-metric-sm">
                <div class="panel-body panel-body-inverse">
                    <div class="metric-content metric-icon">
                        <div class="value">
                             <?php  echo $total_product; ?>
                        </div>
                        <div class="icon" style="font-size: 36px;">
                            <i class="fas fa-boxes"></i>
                        </div>
                        <header>
                            <h3 class="thin">Sản phẩm</h3>
                        </header>
                    </div>
                </div>
            </div>
        </div>
    </a>

    <a href="?page=crud_order">
        <div class="col-sm-6 col-lg-3">
            <div class="panel panel-metric panel-metric-sm">
                <div class="panel-body panel-body-inverse">
                    <div class="metric-content metric-icon">
                        <div class="value">
                             <?php  echo $total_order; ?>
                        </div>
                        <div class="icon" style="font-size: 36px;">
                            <i class="fas fa-file-invoice"></i>
                        </div>
                        <header>
                            <h3 class="thin">Đơn đặt hàng</h3>
                        </header>
                    </div>
                </div>
            </div>
        </div>
    </a>
        
</div> 
<div class="row">   
    <div class="col-md-6">
        <div class="panel ">
            <div class="panel-heading panel-primary-black">
                <h4 class="panel-title"><i class="fas fa-chart-pie"></i> Doanh thu theo danh mục</h4>

                <div class="panel-options">
                    
                </div>
            </div>
            <div class="panel-body">
                <div id="morris-color-donut" style="height: 300px"></div>
            </div>
        </div>
    </div>
    <div class="col-md-6">
        <div class="panel ">
            <div class="panel-heading panel-primary-black">
                <h4 class="panel-title"> <i class="fas fa-chart-pie"></i> Sản phẩm đã bán theo danh mục</h4>

                <div class="panel-options">
                    
                </div>
            </div>
            <div class="panel-body">
                <div id="morris-color-donut2" style="height: 300px"></div>
            </div>
        </div>
    </div>
</div>   


</div>

</div>