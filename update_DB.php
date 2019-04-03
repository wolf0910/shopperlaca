<?php 
include('config/db_config.php');

$sql = 'SELECT * FROM table_product';
$result = mysqli_query($conn,$sql);

while( $row = mysqli_fetch_array($result) )
{
	$price=rand(1000,50000);
	$product_price_4compare1=$price+rand(50,5000);
	$product_price_4compare2=$price+rand(50,5000);
	$product_price_4compare3=$price+rand(50,5000);

	$price=$price * 1000;
	$product_price_4compare1=$product_price_4compare1* 1000;
	$product_price_4compare2=$product_price_4compare2* 1000;
	$product_price_4compare3=$product_price_4compare3* 1000;


	$customer_point=rand(1,20);
	$agent_point=rand(1,10);

	
 	$sql2='
		UPDATE `table_product` SET `product_price_4compare1` = "'.$product_price_4compare1.'", `product_price_4compare2` = "'.$product_price_4compare2.'", `product_price_4compare3` = "'.$product_price_4compare3.'", `product_price` = "'.$price.'", customer_point="'.$customer_point.'", agent_point="'.$agent_point.'"  WHERE `table_product`.`id_product` = "'.$row['id_product'].'" 
 	';
 	echo $sql2;
 	$result2=mysqli_query($conn,$sql2);

}

?>