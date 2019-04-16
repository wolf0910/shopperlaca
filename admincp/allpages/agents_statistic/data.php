<?php
// Database details
include_once ('../../../config/db_config.php');
include_once ('../../../config/reuse_function.php');

// xu ly daterange input
    $start_day=substr($_REQUEST['date_range'],0,10);
    $end_day=substr($_REQUEST['date_range'],13);
    $new_start_day = date('Y-m-d', strtotime($start_day));
    $new_end_day= date('Y-m-d', strtotime($end_day));

// $sql = " SELECT SUM(table_order_detail.unit_price*table_order_detail.quantity) AS agent_total_income,table_order.id_agent,SUM(table_order_detail.quantity) as agent_total_quantity ,table_agent.agent_name,table_agent.agent_phone FROM table_order,table_order_detail,table_agent WHERE table_order.delivery_status='Đã giao hàng' AND table_agent.id_agent=table_order.id_agent AND table_order.id_agent != '' AND table_order_detail.id_order=table_order.id_order AND  table_order.`date_created` > '".$new_start_day."' AND table_order.`date_created` < '".$new_end_day."' GROUP BY table_order.id_agent ";

$total_income = '0';
$total_quantity = '0';
$agent_array= array();

// new way
    $sql_tmp = "SELECT * FROM table_agent";
    $rs = mysqli_query($conn,$sql_tmp);

    while( $row_tmp = mysqli_fetch_array($rs) ){

    	$sql2 = "SELECT SUM(table_order_detail.unit_price*table_order_detail.quantity) AS agent_total_income, SUM(table_order_detail.quantity) as agent_total_quantity FROM table_order_detail,table_order WHERE table_order.id_order=table_order_detail.id_order AND table_order.id_agent='".$row_tmp['id_agent']."' ";

    	$result = mysqli_query($conn,$sql2);
    	while($row=mysqli_fetch_array($result)){

    		if( $row['agent_total_quantity'] != '') {
		    	$tmp_quantity=$row['agent_total_quantity'];
		    } else {
		    	$tmp_quantity=0;
		    }

    		$agent_array[] = array(
				"id_agent"  => $row_tmp['id_agent'],          
				"agent_total_income" => vnd_format($row['agent_total_income']),
				"agent_total_quantity" => $tmp_quantity,
				"agent_name" => $row_tmp['agent_name'],
				"agent_phone" => $row_tmp['agent_phone']
		    );

		    $total_income += $row['agent_total_income'];
	    	$total_quantity += $row['agent_total_quantity'];

    	}
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