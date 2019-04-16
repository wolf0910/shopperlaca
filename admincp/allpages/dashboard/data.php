<?php
// Database details
include_once ('../../../config/db_config.php');
include_once ('../../../config/reuse_function.php');

$sql = " SELECT SUM(table_order_detail.unit_price*table_order_detail.quantity) AS agent_total_income,SUM(table_order_detail.quantity) as agent_total_quantity ,table_category.id_category,table_category.category_name FROM table_order,table_order_detail,table_category,table_product WHERE table_category.id_category = table_product.id_category AND table_product.id_product=table_order_detail.id_product AND table_order.delivery_status='Đã giao hàng' AND table_order.id_agent != '' AND table_order_detail.id_order=table_order.id_order AND table_product.id_category=table_category.id_category  GROUP BY table_category.category_name ";

$result = mysqli_query($conn,$sql);
$total_income = 0;
$total_quantity = 0;
$agent_array= array();
while ($row = mysqli_fetch_array($result)) {

	$agent_array[] = array(
		"id_category"  => $row['id_category'],          
		"category_name" => $row['category_name'],
		"agent_total_quantity" => $row['agent_total_quantity'],
		"agent_total_income" => $row['agent_total_income'],
		
    );

    $total_income += $row['agent_total_income'];
    $total_quantity += $row['agent_total_quantity'];

}

$data = array(
	"total_income"  => vnd_format($total_income), 
	"total_quantity"  => $total_quantity, 
	"data"  => $agent_array, 
);




// Close database connection
mysqli_close($conn);

// Convert PHP array to JSON array
$json_data = json_encode($data);
print $json_data;
?>