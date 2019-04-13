<?php 
// Database details
include ('../../../config/db_config.php');

$query = "SELECT * FROM `table_order`,table_customer WHERE table_order.id_customer = table_customer.id_customer  AND id_order=".$_REQUEST['id_bill']." ";
// get quatation common bill info
$query = mysqli_query($conn, $query);
while ($company = mysqli_fetch_array($query)){
  $id_order=$company['id_order'];
  $date_created=$company['date_created'];
  $id_customer=$company['id_customer'];
  $customer_fullname=$company['customer_fullname'];
  $customer_phone=$company['customer_phone'];
  $customer_address=$company['customer_address'];

}

?>


<html lang="en">
<head>
  <meta charset="UTF-8">  
  <title>Đơn đặt hàng</title>  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.2/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="../../css/invoice.css">
  <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
</head>
<body >
  <div class="container">
  <div class="row invoice-header px-3 py-2 " style="padding-top: 35px !important;">
    <div class="col-4">
      <h3 class="company_name">QTCtek.com</h3>
      <h2 class="bill_title">ĐƠN ĐẶT HÀNG</h2>
    </div>
    <div class="col-4 text-right">
      <p>+841279696839</p>
      <p>antoni.quang@qtctek.com</p>
      <p>http://www.qtctek.com/</p>
    </div>
    <div class="col-4 text-right">
      <p>157/17/1 Đường D2</p>
      <p>Tp. Hồ Chí Minh, P.25, Quận Bình Thạnh</p>
    </div>
  </div>

  <div class="invoice-content row px-5 pt-5">
    <div class="col-5">
      <h5 class="almost-gray mb-3">Khách hàng:</h5>
      <?php   
        
          echo '<p class="gray-ish "><i class="fas fa-user-tie"></i> '.$customer_fullname.'</p>';

      ?>  
      <p class="gray-ish"><i class="fas fa-phone"></i> <?php echo $customer_phone;?></p>    
      <p class="gray-ish"><i class="fas fa-map-marked-alt"></i> <?php echo $customer_address;?></p>

      
    </div>
    <div class="col-3">
      <h5 class="almost-gray">Mã đơn đặt hàng:</h5>
      <p class="gray-ish"><i class="fas fa-hashtag"></i> <?php echo $id_order;?></p>

      <h5 class="almost-gray">Ngày tạo:</h5>
      <p class="gray-ish"><i class="fas fa-calendar-alt"></i> <?php echo date("d/m/Y",strtotime($date_created)); ?></p>

    </div>
    <div class="col-4 text-right total-field">
      <h4 class="almost-gray">Tổng giá trị</h4>
      <h3 class="gray-ish" id='total_bill_final_display'></h3>
  <!--     <h5 class="almost-gray due-date">Hạn thanh toán: 01 / 01 / 20 20</h5> -->
    </div>
  </div>

  <div class="row mt-5" style="background-color: white;">
    <div class="col-10 offset-1 invoice-table pt-1">
      <table class="table table-hover">
            <thead class="thead splitForPrint">
              <tr>
                <th scope="col gray-ish"><i class="fas fa-list-ol"></i> STT</th>
                <th scope="col gray-ish"><i class="fas fa-th-large"></i> Tên sản phẩm</th>
                <th scope="col gray-ish"><i class="fas fa-boxes"></i> Số lượng</th>
                <th scope="col gray-ish"><i class="fas fa-tag"></i> Đơn giá (VNĐ)</th>
               
                <th class="text-right" scope="col gray-ish"><i class="fas fa-money-bill"></i> Thành tiền (VNĐ)</th>
              </tr>
            </thead>
            <tbody>
            <?php 
            // get bill detail
              $query = "SELECT * FROM `table_order_detail`,table_product WHERE id_order=".$_REQUEST['id_bill']." AND table_product.id_product=table_order_detail.id_product ";
              // get quatation common bill info
              $count_row=1;
              $total_bill=0;
              $query = mysqli_query($conn, $query);

              while ($company = mysqli_fetch_array($query)){
                $id_product=$company['id_product'];
                $product_name=$company['product_name'];
                $quantity=$company['quantity'];
                $current_price=$company['unit_price'];
                $line_total=$current_price*$quantity;
                $total_bill=$total_bill+$line_total;
                $row_dif='';
                if( $count_row%2 ==0){
                   $row_dif='class="row_dif"';
                }
               

                $currency_display=number_format($current_price,0,",",".");
                $line_total_display=number_format($line_total,0,",",".");
                echo '
                <tr '.$row_dif.'>
                <th scope="row">'.$count_row.'</th>
                <td class="item">'.$product_name.'</td>
                <td>'.$quantity.'</td>
                <td>'.$currency_display.' </td>               
                <td class="text-right">'.$line_total_display.'</td>
                </tr>
                ';
                $count_row++;
              }
              $total_bil_display=number_format($total_bill,0,",","."). '';
              $vat_tax=$total_bill*5/100;
              $vat_tax_display=number_format($vat_tax,0,",","."). ' ';

              $total_bill_final=$total_bill+$vat_tax;
              $total_bill_final_display=number_format($total_bill_final,0,",","."). ' VNĐ';


            ?>

            </tbody>
          </table>
    </div>
  </div>
<div class="row invoice_details" style="background-color: white;">
   <!-- invoiced to details -->
   <div class="col-4 offset-1 pt-3">
     <h4 class="gray-ish">Lưu ý:</h4>
    <p class="pt-3 almost-gray"> Chúng tôi cam kết 100% chất lượng sản phẩm.
     Thông tin bảo hành thảm khảo ở http://www.qtctek.com/baohanh.
    </p>
     
   </div>
   <!-- Invoice assets and total -->
        <div class="offset-1 col-5 mb-3 pr-4 sub-table">
          <table class="table table-borderless">
            <tbody>
              <tr>
                <th scope="row gray-ish">Thành tiền (trước thuế):</th>
                <td class="text-right"><?php echo $total_bil_display;?> </td>
              </tr>
              <tr>
                <th scope="row gray-ish">Khuyến mãi:</th>
                <td class="text-right">0 </td>
              </tr>              
              <tr>
                <th scope="row gray-ish">Thuế VAT (5%):</th>
                <td class="text-right"><?php echo $vat_tax_display; ?></td>
              </tr>              
              <tr class="last-row">
                  <th scope="row"><h4>Tổng tiền:</h4></th>
                  <td class="text-right"><h5><?php echo $total_bill_final_display;?></h5></td>
              </tr>
            </tbody>
          </table>
        </div>
   </div>
  <!-- <p class="text-center pb-3"><em> Taxes will be calculated in &euro; regarding transport and other taxable services.</em></p> -->
</div>

<script type="text/javascript" src="../../lib/jquery.min.js"></script>
<script>
    var total_bill_final_display = '<?php echo $total_bill_final_display; ?>'; //outputting string foo in context of JS
                                 //must wrap in quotes so that it is still string foo when JS does execute
                                 //when this DOES execute in the browser, PHP will have already completed all processing and exited
    $('#total_bill_final_display').html(total_bill_final_display);
    window.print();
</script>
</body>
</html>