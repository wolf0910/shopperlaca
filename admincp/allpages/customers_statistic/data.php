<?php
// Database details
include_once ('../../../config/db_config.php');
include_once ('../../../config/reuse_function.php');

// xu ly daterange input
    $start_day=substr($_REQUEST['date_range'],0,10);
    $end_day=substr($_REQUEST['date_range'],13);
    $new_start_day = date('Y-m-d', strtotime($start_day));
    $new_end_day= date('Y-m-d', strtotime($end_day));

$sql = " SELECT SUM(table_order_detail.unit_price*table_order_detail.quantity) AS customer_total_income,table_order.id_customer,SUM(table_order_detail.quantity) as customer_total_quantity ,table_customer.customer_fullname,table_customer.customer_phone FROM table_order,table_order_detail,table_customer WHERE table_customer.id_customer=table_order.id_customer AND table_order.id_customer != '' AND table_order_detail.id_order=table_order.id_order AND  table_order.`date_created` > '".$new_start_day."' AND table_order.`date_created` < '".$new_end_day."' GROUP BY table_order.id_customer ";

$result = mysqli_query($conn,$sql);
$total_income = 0;
$total_quantity = 0;
while ($row = mysqli_fetch_array($result)) {

	$customer_array[] = array(
		"id_customer"  => $row['id_customer'],          
		"customer_total_income" => vnd_format($row['customer_total_income']),
		"customer_total_quantity" => $row['customer_total_quantity'],
		"customer_fullname" => $row['customer_fullname'],
		"customer_phone" => $row['customer_phone'],
    );

    $total_income += $row['customer_total_income'];
    $total_quantity += $row['customer_total_quantity'];

}

$data = array(
	"total_income"  => vnd_format($total_income), 
	"total_quantity"  => $total_quantity, 
	"data"  => $customer_array, 
);




// Close database connection
mysqli_close($conn);

// Convert PHP array to JSON array
$json_data = json_encode($data);
print $json_data;
?>