<?php
require '../../lib/phpspreadsheet/vendor/autoload.php';
require '../../../config/db_config.php';
 
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Reader\Csv;
use PhpOffice\PhpSpreadsheet\Reader\Xlsx;
 
$file_mimes = array('text/x-comma-separated-values', 'text/comma-separated-values', 'application/octet-stream', 'application/vnd.ms-excel', 'application/x-csv', 'text/x-csv', 'text/csv', 'application/csv', 'application/excel', 'application/vnd.msexcel', 'text/plain', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
 
if(isset($_FILES['file']['name']) && in_array($_FILES['file']['type'], $file_mimes)) {
    
    $txt_return='';

    $arr_file = explode('.', $_FILES['file']['name']);
    $extension = end($arr_file);
 
    if('csv' == $extension) {
        $reader = new \PhpOffice\PhpSpreadsheet\Reader\Csv();
    } elseif('xlsx' == $extension) {
        $reader = new \PhpOffice\PhpSpreadsheet\Reader\Xlsx();
    } else {
        $reader = new \PhpOffice\PhpSpreadsheet\Reader\Xls();
    }
 
    $spreadsheet = $reader->load($_FILES['file']['tmp_name']);
     
    $sheetData = $spreadsheet->getActiveSheet()->toArray();
    // print("<pre>".print_r($sheetData,true)."</pre>");

    for( $i=1; $i < count($sheetData) ; $i++ ){
        
    if ($sheetData[$i][2]=='') continue;
    //check if phone exist
        $sql = "SELECT * FROM table_agent WHERE agent_phone = '".$sheetData[$i][2]."' ";
        $result = mysqli_query($conn,$sql);
        if( mysqli_num_rows($result) > 0 ){
            //return error
            $txt_return .= "Không thể thêm dòng ".$i." vì số điện thoại ".$sheetData[$i][2]." đã tồn tại <br>";
            continue;
        }

        $sql2 = "SELECT * FROM table_customer WHERE customer_phone = '".$sheetData[$i][2]."' ";
        $result2 = mysqli_query($conn,$sql2);
        if( mysqli_num_rows($result2)>0 ){
            //return error
            $txt_return .= "Không thể thêm dòng ".$i." vì số điện thoại ".$sheetData[$i][2]." đã tồn tại <br>";
            continue;
        }

        $sql3 = "SELECT * FROM table_administrator WHERE administrator_phone = '".$sheetData[$i][2]."' ";
        $result3 = mysqli_query($conn,$sql3);
        if( mysqli_num_rows($result3)>0 ){
            //return error
            $txt_return .= "Không thể thêm dòng ".$i." vì số điện thoại ".$sheetData[$i][2]." đã tồn tại <br>";
            continue;
        }
    //end check

    //add to DB
    $sql5 = "INSERT INTO table_administrator
    SET administrator_name = '".$sheetData[$i][1]."',
        administrator_phone = '".$sheetData[$i][2]."',
        administrator_email = '".$sheetData[$i][3]."',
        administrator_avatar = 'images/avatar/user-placeholder.png',
        administrator_password = '".md5('123456')."'
    ";
   
    $result5 = mysqli_query($conn,$sql5);

    if($result5){
        $txt_return .= 'Thêm quản trị viên '.$sheetData[$i][1].' thành công ! <br>' ;
    } else {
        $txt_return .= 'Thêm quản trị viên '.$sheetData[$i][1].' thất bại ! <br>' ;
    }

    // end add to DB

   }
    echo $txt_return;
}
?>