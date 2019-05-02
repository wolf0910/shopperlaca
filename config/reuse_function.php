<?php 
// FORMAT TO VND PRICE
function vnd_format($num1){
	$result=number_format($num1,0,',','.').' Đ';
	return $result;
} 

// SHORTEN STRING
function get_words( $str, $wordCount) {
  return implode( 
    '', 
    array_slice( 
      preg_split(
        '/([\s,\.;\?\!]+)/', 
        $str, 
        $wordCount*2+1, 
        PREG_SPLIT_DELIM_CAPTURE
      ),
      0,
      $wordCount*2-1
    )
  );
}
// stripUnicode
function stripUnicode($str){
  if(!$str) return false;
   $unicode = array(
      'a'=>'á|à|ả|ã|ạ|ă|ắ|ặ|ằ|ẳ|ẵ|â|ấ|ầ|ẩ|ẫ|ậ',
      'd'=>'đ',
      'e'=>'é|è|ẻ|ẽ|ẹ|ê|ế|ề|ể|ễ|ệ',
      'i'=>'í|ì|ỉ|ĩ|ị',
      'o'=>'ó|ò|ỏ|õ|ọ|ô|ố|ồ|ổ|ỗ|ộ|ơ|ớ|ờ|ở|ỡ|ợ',
      'u'=>'ú|ù|ủ|ũ|ụ|ư|ứ|ừ|ử|ữ|ự',
      'y'=>'ý|ỳ|ỷ|ỹ|ỵ',
   );
  foreach($unicode as $nonUnicode=>$uni) $str = preg_replace("/($uni)/i",$nonUnicode,$str);
  return $str;
}

// Normalize ckeditor text
function stripCKeditor($string){
  return strip_tags(html_entity_decode($string, ENT_COMPAT, 'UTF-8'));
}

// turn \r\n to \n because mobile use \n as linebreak
function changeLineBreak($string){
  return preg_replace("/\r\n/","\n",$string);
}


function getRandomString($length) {
  $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
  $string = '';
  for ($i = 0; $i < $length; $i++) {
      $string .= $characters[mt_rand(0, strlen($characters) - 1)];
  }
  return $string;
}



/*
Description: Distance calculation from the latitude/longitude of 2 points
*/
function distanceCalculation($point1_lat, $point1_long, $point2_lat, $point2_long, $unit = 'km', $decimals = 2) {
  // Calculate the distance in degrees
  $degrees = rad2deg(acos((sin(deg2rad($point1_lat))*sin(deg2rad($point2_lat))) + (cos(deg2rad($point1_lat))*cos(deg2rad($point2_lat))*cos(deg2rad($point1_long-$point2_long)))));
 
  // Convert the distance in degrees to the chosen unit (kilometres, miles or nautical miles)
  switch($unit) {
    case 'km':
      $distance = $degrees * 111.13384; // 1 degree = 111.13384 km, based on the average diameter of the Earth (12,735 km)
      break;
    case 'mi':
      $distance = $degrees * 69.05482; // 1 degree = 69.05482 miles, based on the average diameter of the Earth (7,913.1 miles)
      break;
    case 'nmi':
      $distance =  $degrees * 59.97662; // 1 degree = 59.97662 nautic miles, based on the average diameter of the Earth (6,876.3 nautical miles)
  }
  return round($distance, $decimals);
}


// Create random string
function generateRandomString($length) {
    $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $charactersLength = strlen($characters);
    $randomString = '';
    for ($i = 0; $i < $length; $i++) {
        $randomString .= $characters[rand(0, $charactersLength - 1)];
    }
    return $randomString;
}





?>