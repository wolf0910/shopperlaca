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
		
		case 'create_user':
			{	
				include_once 'user/create_user.php';
				break;
			}
		case 'login_check':
			{	
				include_once 'user/login_check.php';
				break;
			}
		case 'update_user':
			{	
				include_once 'user/update_user.php';
				break;
			}
		case 'create_order':
			{	
				include_once 'user/create_order.php';
				break;
			}
		case 'get_order_by_id_user':
			{	
				include_once 'user/get_order_by_id_user.php';
				break;
			}
		case 'get_slider':
			{	
				include_once 'product/get_slider.php';
				break;
			}
		case 'get_all_order':
			{	
				include_once 'user/get_all_order.php';
				break;
			}
		case 'delete_order':
			{	
				include_once 'user/delete_order.php';
				break;
			}
		case 'get_all_storage':
			{	
				include_once 'user/get_all_storage.php';
				break;
			}
		case 'update_storage':
			{	
				include_once 'user/update_storage.php';
				break;
			}
		case 'get_users':
			{	
				include_once 'user/get_users.php';
				break;
			}
		case 'create_order_string':
			{	
				include_once 'user/create_order_string.php';
				break;
			}
		case 'like_product':
			{	
				include_once 'product/like_product.php';
				break;
			}
		case 'unlike_product':
			{	
				include_once 'product/unlike_product.php';
				break;
			}
		case 'get_user_favorite_product':
			{	
				include_once 'product/get_user_favorite_product.php';
				break;
			}
		case 'check_if_phone_exist':
			{	
				include_once 'user/check_if_phone_exist.php';
				break;
			}
		case 'update_user_password_by_phone':
			{	
				include_once 'user/update_user_password_by_phone.php';
				break;
			}

		default: {
			echo json_encode( array('success' => 'false','message' => 'detect not match! check guide!') );
			break;
		}	
	}
 
 //edit file in new branch
?>