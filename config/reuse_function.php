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
  return strip_tags(html_entity_decode($string));
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

?>