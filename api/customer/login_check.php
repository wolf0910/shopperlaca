<?php 
if(isset($_REQUEST['phone']))
{
  if($_REQUEST['phone']==''){
    unset($_REQUEST['phone']);
  }
}
if(isset($_REQUEST['password']))
{
  if($_REQUEST['password']==''){
    unset($_REQUEST['password']);
  }
}

  // Get raw posted data
  if( isset($_REQUEST['phone']) && isset($_REQUEST['password']) )
  {

  $phone = $_REQUEST['phone'];
  $password = $_REQUEST['password'];
  $user_arr=array();

  //check if tentaikhoan exist in table_users
  $sql = "
    SELECT * FROM table_users WHERE phone= '".$phone."'
   ";
   $result = $conn->query($sql);
  if ($result->num_rows > 0) {

    while($row = $result->fetch_assoc()) {                   
         if( $row['password']==md5($password) ) 
         {

         
          // if users account banned
          if( $row['status']=='deactive' ){
            echo json_encode(
              array('success' => 'false','message' => 'account deactived !!!')
            );
            exit();
          }

        // check if overide device - send firebase message to old device
        // if ( $row['device_info'] != $_REQUEST['device_info'] &&  $row["fcm_token"]!='') 
        // {

        //   $url = 'https://fcm.googleapis.com/fcm/send';

        //   // $notification =array('title' =>'Cảnh báo tài khoản !' ,'body' =>'Tài khoản của bạn đã đăng nhập ở nơi khác !');

        //   $message_data=array('notification_title' =>'Cảnh báo tài khoản !' ,'notification_code' =>'1','notification_body' => 'Tài khoản của bạn đã đăng nhập ở nơi khác !');
        //   $data = array('to' => $row["fcm_token"],'data' => $message_data);
         
        //   $data=json_encode($data); 

        //   $ch = curl_init();
        //   curl_setopt($ch, CURLOPT_URL, $url);
        //   curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/json','Authorization: key=AAAAiQXvgZA:APA91bGKc12FiRd3l3jzIgMVsF9Dkn25xF_NuVzNTEBoUOKOuGkVSLXJb4r8kmv76JK2p8uuGKSZWIOWSdkOG4pl7FQE1rOEgEHY49EpRYChdlOJjK9Oq1JDzHlGuCoZEpXaoqqgomse'));
        //   curl_setopt($ch, CURLOPT_POST, 1);
        //   curl_setopt($ch, CURLOPT_POSTFIELDS,$data);
        //   curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        //   curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
         
        //   $response  = curl_exec($ch);
        //   curl_close($ch);

        // }


          // login success- update device info
        //   if(isset($_REQUEST['fcm_token']) ) {
        //      $sql = "
        //     UPDATE `table_users` SET `device_info` = '".$_REQUEST['device_info']."',`fcm_token` = '".$_REQUEST['fcm_token']."' WHERE `table_users`.`id_user` = ".$row['id_user'].";
        //    ";
        //   } else {
        //     $sql = "
        //     UPDATE `table_users` SET `device_info` = '".$_REQUEST['device_info']."' WHERE `table_users`.`id_user` = ".$row['id_user'].";
        //    ";
        //   }
       
        // $result = $conn->query($sql);
        // end handle update device info

       // get new info
  $sql = "
    SELECT * FROM table_users WHERE phone= '".$phone."'
   ";
  $result = $conn->query($sql);
  $row = $result->fetch_assoc();
        
  $user_item = array(
      'id_user' => $row['id_user'],
      'fullname' => $row['fullname'],
      'phone' => $row['phone'],
      'address' => $row['address'],
      'password' => $row['password'],
      'role' => 'user'
    );

    // if($row['avatar']!='') 
    //   { $user_item['avatar'] = $row['avatar'];}
    // if($row['sex']!='0') 
    //   { $user_item['sex'] = $row['sex'];}
    // if($row['birthday']!='0000-00-00') 
    //   { $user_item['birthday'] = $row['birthday'];}
    // if($row['address']!='') 
    //   { $user_item['address'] = $row['address'];}
    // if($row['device_info']!='') 
    //   { $user_item['device_info'] = $row['device_info'];}
    // if($row['fcm_token']!='') 
    //   { $user_item['fcm_token'] = $row['fcm_token'];}

    
     
    $user_arr['success']='true';
    $user_arr['data']=$user_item;

      echo json_encode($user_arr);
      exit();


     }  else {
        echo json_encode(array('success' => 'false','message' => 'invalid password!!!'));
        exit();
     }        
  }   
    

   } else {
    // check if login as administrators
    $sql2="
      SELECT * FROM table_administrator WHERE phone= '".$phone."'
    ";

    $result2 = mysqli_query($db_connection,$sql2);
    if ($result2->num_rows > 0) {

    while($row = $result2->fetch_assoc()) {                   
         if( $row['password']==md5($password) ) 
         {
            // if users account banned
            if( $row['status']=='deactive' ){
              echo json_encode( 
                array('success' => 'false','message' => 'account deactived !!!')
              );
              exit();
            }
            //end check if account is banned

            // get new account info
            $sql = "
              SELECT * FROM table_administrator WHERE phone= '".$phone."'
             ";
            $result = $conn->query($sql);
            $row = $result->fetch_assoc();
            $user_arr['success']='true';
            $user_item = array(
                'id_administrator' => $row['id_administrator'],
                'fullname' => $row['fullname'],
                'phone' => $row['phone'],
                'address' => $row['address'],
                'password' => $row['password'],
                'role' => $row['role']
              );
           
            $user_arr['data']=$user_item;
            echo json_encode($user_arr);
            exit();
            // end print account info

         } else {
            echo json_encode(array('success' => 'false','message' => 'invalid password!!!'));
            exit();
         }
       }
      }
  // end check if login as administrator

    echo json_encode(array('success' => 'false','message' => 'Phone doestnt exist!!!'));
    exit();
   }

} else{

  echo json_encode(
      array('success' => 'false','message' => 'Missing phone or password parameter !!!')
    );
}