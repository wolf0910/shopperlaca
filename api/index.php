<?php 
  // Headers
  header('Access-Control-Allow-Origin: *');
  header('Content-Type: application/json');
  header('Access-Control-Allow-Methods: POST');
  header("Access-Control-Allow-Methods: GET");
  header('Access-Control-Allow-Headers: Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authorization, X-Requested-With');

  include_once 'basic_auth.php';
  include_once '../config/db_config.php';
  include_once '../config/reuse_function.php';

// check if data recived is from raw - if so, asign it to $_REQUEST
	if(!isset($_REQUEST['detect']))
    {
  		// get raw json data
  		$_REQUEST = json_decode(file_get_contents('php://input'), true);
	  	if(!isset($_REQUEST['detect']))
	  	{
		    echo json_encode(
		      array('message' => 'detect parameter not found !')
		    );
		    exit();  
		} 
	}
// handle detect value
	$detect = $_REQUEST['detect'];

	switch ($detect) {

		case 'get_category':
			{	
				include_once 'product/get_category.php';
				break;
			}

		case 'get_producer':
			{	
				include_once 'product/get_producer.php';
				break;
			}

		case 'get_product_by_id_category':
			{	
				include_once 'product/get_product_by_id_category.php';
				break;
			}

		case 'get_all_product':
			{	
				include_once 'product/get_all_product.php';
				break;
			}

		case 'get_product_detail_by_id_product':
			{	
				include_once 'product/get_product_detail_by_id_product.php';
				break;
			}
		
		case 'create_customer':
			{	
				include_once 'customer/create_customer.php';
				break;
			}

		case 'update_customer':
			{	
				include_once 'customer/update_customer.php';
				break;
			}

		case 'get_order_by_id_customer':
			{	
				include_once 'customer/get_order_by_id_customer.php';
				break;
			}

		case 'get_all_order':
			{	
				include_once 'customer/get_all_order.php';
				break;
			}

		case 'delete_order':
			{	
				include_once 'admin/delete_order.php';
				break;
			}

		case 'get_customer':
			{	
				include_once 'customer/get_customer.php';
				break;
			}

		case 'create_order_string':
			{	
				include_once 'customer/create_order_string.php';
				break;
			}

		case 'check_if_customer_phone_exist':
			{	
				include_once 'customer/check_if_customer_phone_exist.php';
				break;
			}

		case 'update_customer_password_by_phone':
			{	
				include_once 'customer/update_customer_password_by_phone.php';
				break;
			}

		default: {
			echo json_encode( array('success' => 'false','message' => 'detect not match! check đốc cu mần !') );
			break;
		}	
	}
 
 //edit file in new branch
?>