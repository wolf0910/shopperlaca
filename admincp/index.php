<?php 
session_start();
if(isset($_SESSION['id_administrator'])){
   echo '
   <script>    
      window.location="admincp.php";
   </script>"
   ';
}
?>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Admin Control Panel</title>
      <link href="css/bootstrap.min.css" rel="stylesheet">
      <link href="css/animate.css" rel="stylesheet">
      <link href="css/style_login.css" rel="stylesheet">
      <link rel="shortcut icon" type="image/x-icon" href="../images/favicon.ico">
   </head>
   <body class="gray-bg">
      <div class="loginColumns animated fadeInDown">
         <div class="row">
            <div class="col-md-6">
               <img src="../images/logo/logos.png">
               <h2 class="font-bold">Trang Quản Trị </h2>
               <p>Chúng tôi tự hào luôn mang đến cho quí khách những sản phẩm có giá trị và dịch vụ tốt nhất.</p>
            </div>
            <div class="col-md-6">
               <div class="inqbox-content">
                  <form class="m-t" role="form" method="POST" action="login_handle.php">
                     <div class="form-group">
                        <input type="text" class="form-control" name="myusername" placeholder="Tài khoản">
                     </div>
                     <div class="form-group">
                        <input type="password" class="form-control" id="password" name="mypassword" placeholder="mật khẩu">
                     </div>
                     <button type="submit" class="btn btn-primary block full-width m-b">Đăng nhập</button>
               
                  </form>
                  <p class="m-t">
                     <small>Hệ thống đăng nhập phần mềm &copy; 2018 QTC Development </small>
                  </p>
               </div>
            </div>
         </div>
         <hr/>
         <div class="row">
            <div class="col-md-6">
               2018 © Công Ty Cổ Phần Công Nghệ QTC
            </div>
            <div class="col-md-6 text-right">
               <small>© 2017-2018</small>
            </div>
         </div>
      </div>
   </body>
</html>