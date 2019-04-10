<?php
require '../../lib/phpspreadsheet/vendor/autoload.php';
require '../../../config/db_config.php';

use PhpOffice\PhpSpreadsheet\IOFactory;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

// Create new Spreadsheet object
$spreadsheet = new Spreadsheet();

// Set document properties
$spreadsheet->getProperties()->setCreator('Haychongiare')
    ->setLastModifiedBy('Haychongiare')
    ->setTitle('Office 2007 XLSX Test Document')
    ->setSubject('Office 2007 XLSX Test Document')
    ->setDescription('Agents data.')
    ->setKeywords('office 2007 openxml php')
    ->setCategory('Test result file');

// Add some data
$spreadsheet->setActiveSheetIndex(0)
    ->setCellValue('A1', 'STT')
    ->setCellValue('B1', 'Họ tên')
    ->setCellValue('C1', 'Số điện thoại')
    ->setCellValue('D1', 'Địa chỉ')
    ->setCellValue('E1', 'Thành phố')
    ->setCellValue('F1', 'Quận huyện')
    ->setCellValue('G1', 'Latitude')
    ->setCellValue('H1', 'Longitude');

// Miscellaneous glyphs, UTF-8

$sql = "SELECT * FROM table_agent,table_city,table_district WHERE table_agent.id_district=table_district.id_district AND table_city.id_city= table_district.id_city ";
$result = mysqli_query($conn,$sql);
$stt=2;
while( $row = mysqli_fetch_array($result) ){
    $spreadsheet->setActiveSheetIndex(0)
    ->setCellValue('A'.$stt, ($stt-1) )
    ->setCellValue('B'.$stt, $row['agent_name'])
    ->setCellValue('C'.$stt, $row['agent_phone'])
    ->setCellValue('D'.$stt, $row['agent_address'])
    ->setCellValue('E'.$stt, $row['city_name'])
    ->setCellValue('F'.$stt, $row['district_name'])
    ->setCellValue('G'.$stt, $row['map_latitude'])
    ->setCellValue('H'.$stt, $row['map_longitude']);
    $stt++;
}

// Rename worksheet
$spreadsheet->getActiveSheet()->setTitle('Agents');

// Set active sheet index to the first sheet, so Excel opens this as the first sheet
$spreadsheet->setActiveSheetIndex(0);

// Redirect output to a client’s web browser (Xlsx)
header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
header('Content-Disposition: attachment;filename="Agents.xlsx"');
header('Cache-Control: max-age=0');
// If you're serving to IE 9, then the following may be needed
header('Cache-Control: max-age=1');

// If you're serving to IE over SSL, then the following may be needed
header('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
header('Last-Modified: ' . gmdate('D, d M Y H:i:s') . ' GMT'); // always modified
header('Cache-Control: cache, must-revalidate'); // HTTP/1.1
header('Pragma: public'); // HTTP/1.0

$writer = IOFactory::createWriter($spreadsheet, 'Xlsx');
$writer->save('php://output');
exit;