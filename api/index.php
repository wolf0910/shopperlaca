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

// check if data recived is from raw - if so, assign it to $_REQUEST
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
	// Khoa's links
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

		case 'customer_login_check':
			{	
				include_once 'customer/customer_login_check.php';
				break;
			}

		case 'update_customer':
			{	
				include_once 'customer/update_customer.php';
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

		case 'get_city':
			{	
				include_once 'customer/get_city.php';
				break;
			}
		case 'get_district':
			{	
				include_once 'customer/get_district.php';
				break;
			}
		case 'add_customer_search_history':
			{	
				include_once 'customer/add_customer_search_history.php';
				break;
			}
		case 'get_customer_search_history':
			{	
				include_once 'customer/get_customer_search_history.php';
				break;
			}
		case 'get_slider':
			{	
				include_once 'customer/get_slider.php';
				break;
			}
		case 'get_customer_addition_address':
			{	
				include_once 'customer/get_customer_addition_address.php';
				break;
			}
			
		case 'get_district_byidcity':
			{	
				include_once 'customer/get_district_byidcity.php';
				break;
			}

		case 'create_order_string':
			{	
				include_once 'customer/create_order_string.php';
				break;
			}

		case 'get_order_by_id_customer':
			{	
				include_once 'customer/get_order_by_id_customer.php';
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
		case 'get_agent_by_id_product':
			{	
				include_once 'customer/get_agent_by_id_product.php';
				break;
			}
		case 'get_suggestion_by_id_customer':
			{	
				include_once 'customer/get_suggestion_by_id_customer.php';
				break;
			}
		case 'create_customer_addition_address':
			{	
				include_once 'customer/create_customer_addition_address.php';
				break;
			}
	// end Khoa's links

	// Hung's links
			case 'login_agents':
			{	
				include_once 'agents/login.php';
				break;
			}
		case 'update_agents':
			{	
				include_once 'agents/update_agents.php';
				break;
			}
		case 'order_pending':
			{	
				include_once 'agents/order_pending.php';
				break;
			}
		case 'order_transport':
			{	
				include_once 'agents/order_transport.php';
				break;
			}
		case 'order_delivered':
			{	
				include_once 'agents/order_delivered.php';
				break;
			}
		case 'order_detail':
			{	
				include_once 'agents/order_detail.php';
				break;
			}
		case 'product_category':
			{	
				include_once 'agents/product_category.php';
				break;
			}	
		case 'product_by_category':
			{	
				include_once 'agents/product_by_category.php';
				break;
			}
		case 'stocking_manager':
			{	
				include_once 'agents/stocking_manager.php';
				break;
			}
		case 'list_user':
			{	
				include_once 'agents/list_user.php';
				break;
			}
		case 'get_suggestion_by_id_customer':
			{	
				include_once 'customer/get_suggestion_by_id_customer.php';
				break;
			}
	// end Hung's links

		default: {
			echo json_encode( array('success' => 'false','message' => 'detect not match! check đốc cu mần !') );
			break;
		}	
	}
 
 //edit file in new branch
?>