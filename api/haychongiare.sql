-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th8 01, 2019 lúc 12:02 PM
-- Phiên bản máy phục vụ: 10.1.35-MariaDB
-- Phiên bản PHP: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `shopperlaca`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `table_administrator`
--

CREATE TABLE `table_administrator` (
  `id_administrator` int(11) NOT NULL,
  `administrator_name` varchar(250) NOT NULL,
  `administrator_phone` varchar(20) NOT NULL,
  `administrator_password` varchar(250) NOT NULL,
  `administrator_email` varchar(250) NOT NULL,
  `administrator_avatar` varchar(250) NOT NULL,
  `status` enum('active','deactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `table_administrator`
--

INSERT INTO `table_administrator` (`id_administrator`, `administrator_name`, `administrator_phone`, `administrator_password`, `administrator_email`, `administrator_avatar`, `status`) VALUES
(1, 'Taylor Swift', '0999999999', 'e10adc3949ba59abbe56e057f20f883e', 'admin@admin.com', 'images/avatar/user-placeholder.png', 'active'),
(5, 'Tôi Tên Là admin 2', '1233212', 'e10adc3949ba59abbe56e057f20f883e', 'admin@admin.com', 'images/avatar/3fruit.jpg', 'active');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `table_agent`
--

CREATE TABLE `table_agent` (
  `id_agent` int(11) NOT NULL,
  `agent_name` varchar(250) NOT NULL,
  `agent_phone` varchar(50) NOT NULL,
  `agent_email` varchar(250) NOT NULL,
  `agent_password` varchar(250) NOT NULL,
  `agent_avatar` varchar(250) NOT NULL,
  `id_district` int(11) NOT NULL,
  `map_latitude` float NOT NULL,
  `map_longitude` float NOT NULL,
  `agent_address` varchar(250) NOT NULL,
  `status` enum('active','deactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `table_agent`
--

INSERT INTO `table_agent` (`id_agent`, `agent_name`, `agent_phone`, `agent_email`, `agent_password`, `agent_avatar`, `id_district`, `map_latitude`, `map_longitude`, `agent_address`, `status`) VALUES
(1, 'Shop Bùi Ngọc Diễm 2', '123456789', 'ngocdiem.bui2@qtctek.com', 'e10adc3949ba59abbe56e057f20f883e', 'images/avatar/user-placeholder.png', 762, 10.8059, 106.713, 'R2 Đường Nguyễn Gia Trí, Phường 25, Bình Thạnh, Hồ Chí Minh, Vietnam', 'active'),
(2, 'Shop Tăng Vĩ Quang', '0921212121', 'antoniquang@qtctek.com', 'e10adc3949ba59abbe56e057f20f883e', 'images/avatar/b10.jpg', 762, 10.8058, 106.716, '62/2/22B Đường Nguyễn Gia Trí, Phường 25, Bình Thạnh, Hồ Chí Minh, Vietnam', 'active'),
(7, 'Shop Tôi Tên Là', '88888888', 'toilaai@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'images/avatar/b7.jpg', 778, 123.256, 1232.34, '158 Nguyễn Hửu Trí, Bình Thạnh, Hồ Chí Minh', 'active'),
(20, 'Shop Bùi Ngọc Diễm 2', '012233', 'ngocdiem.bui@qtctek.com', 'e10adc3949ba59abbe56e057f20f883e', 'images/avatar/4fruit.jpg', 762, 10.8059, 106.713, 'R2 Đường Nguyễn Gia Trí, Phường 25, Bình Thạnh, Hồ Chí Minh, Vietnam', 'active'),
(21, 'Tăng Vĩ Quang 2', '012345', 'antoniquang@qtctek.com', 'e10adc3949ba59abbe56e057f20f883e', 'images/avatar/cake.jpg', 762, 10.8058, 106.716, '62/2/22B Đường Nguyễn Gia Trí, Phường 25, Bình Thạnh, Hồ Chí Minh, Vietnam', 'active'),
(22, 'Tôi Tên Là 2', '0123123', 'toilaai@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'images/avatar/user-placeholder.png', 778, 123.256, 1232.34, '158 Nguyễn Hửu Trí, Bình Thạnh, Hồ Chí Minh', 'active'),
(23, 'Trần Đăng Khoa 3', '9848407055', 'wolf1101617@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'images/avatar/user-placeholder.png', 0, 0, 0, '157/17/1 Đường D2, Phường 25, Quận Bình Thạnh', 'active'),
(24, 'Phạm Hoàng Huyến 4', '9841234566', 'qqaassdd19@yahoo.com.vn', 'e10adc3949ba59abbe56e057f20f883e', 'images/avatar/user-placeholder.png', 0, 0, 0, '135 nguyễn trung trực tp hcm', 'active'),
(25, 'Bùi Ngọc Diễm', '01229595656556', 'ngocdiem.bui@qtctek.com', 'e10adc3949ba59abbe56e057f20f883e', 'images/avatar/user-placeholder.png', 762, 10.8059, 106.713, 'R2 Đường Nguyễn Gia Trí, Phường 25, Bình Thạnh, Hồ Chí Minh, Vietnam', 'active'),
(27, 'Bùi Ngọc Diễm', '012295932112321', 'ngocdiem.bui@qtctek.com', 'e10adc3949ba59abbe56e057f20f883e', 'images/avatar/user-placeholder.png', 762, 10.8059, 106.713, 'R2 Đường Nguyễn Gia Trí, Phường 25, Bình Thạnh, Hồ Chí Minh, Vietnam', 'active'),
(28, 'Hoàng Bách', '10002000', 'hoangbach@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'images/avatar/user-placeholder.png', 764, 11.0364, 106.486, '113 TL7 , Củ Chi, Hồ Chí Minh, Việt Nam', 'active'),
(29, 'Sơn Ca', '10002001', 'sonca@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'images/avatar/user-placeholder.png', 764, 10.9843, 106.544, '202 DT8, Củ Chi, Hồ Chí Minh, Việt Nam', 'active'),
(30, 'Băng Châu', '10002002', 'bangchau@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'images/avatar/user-placeholder.png', 765, 10.8483, 106.657, '202 Lê Văn Thọ, Gò Vấp, Hồ Chí Minh, Việt Nam', 'active'),
(31, 'Văn Cao', '10002003', 'vancao@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'images/avatar/user-placeholder.png', 765, 10.8386, 106.673, '99 Nguyễn Văn Lượng, Phường 17, Gò Vấp, Hồ Chí Minh', 'active'),
(32, 'Hữu Cảnh', '10002004', 'huucanh@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'images/avatar/user-placeholder.png', 766, 10.8792, 106.581, '123 Nguyễn Văn Bứa, Hóc Môn, Hồ Chí Minh, Việt Nam', 'active'),
(33, 'Thanh Bạch', '10002005', 'thanhbach@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'images/avatar/user-placeholder.png', 766, 10.8962, 106.623, '189 Đăng Thúc Vịnh, Hóc Môn, Hồ Chí Minh, Việt Nam', 'active'),
(34, 'Nhật Ánh ', '10002006', 'nhatanh@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'images/avatar/user-placeholder.png', 767, 10.7012, 106.715, 'Nguyễn Hửu Thọ, Nhà Bè,  Hồ Chí Minh, Việt Nam', 'active'),
(35, 'Tùng Anh', '10002007', 'tunganh@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'images/avatar/user-placeholder.png', 767, 10.6038, 106.749, '1522 Liên Ấp 2-3, Hiệp Phước, Nhà Bè, Hồ Chí Minh', 'active'),
(36, 'Phan Anh', '10002008', 'phananh@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'images/avatar/user-placeholder.png', 768, 10.7956, 106.676, '72 Nguyễn Văn Trỗi, Phường 8, Phú Nhuận, Hồ Chí Minh', 'active'),
(37, 'Tuấn Anh', '10002009', 'tuananh@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'images/avatar/user-placeholder.png', 768, 10.8056, 106.679, '582-624 Nguyễn Kiệm, Phường 4, Phú Nhuận, Hồ Chí Minh', 'active'),
(38, 'Phương Anh', '10002010', 'phuonganh@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'images/avatar/user-placeholder.png', 769, 10.7699, 106.697, '104 Phường Nguyễn Thái Bìn, Quận 1, Hồ Chí Minh', 'active'),
(39, 'Tinh Anh', '10002011', 'tinhanh@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'images/avatar/user-placeholder.png', 769, 10.7837, 106.705, '23 Đinh Tiên Hoàng, Bến Nghé, Quận 1, Hồ Chí Minh', 'active'),
(40, 'Hữu Châu', '10002012', 'huuchau@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'images/avatar/user-placeholder.png', 770, 10.769, 106.67, '422  3/2, Phường 10, Quận 10, Hồ Chí Minh, Việt Nam', 'active'),
(41, 'Mỹ Chi', '10002013', 'mychi@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'images/avatar/user-placeholder.png', 770, 10.7794, 106.668, '149-133 Tô Hiến Thành, Phường 13, Quận 10, Hồ Chí Minh', 'active'),
(42, 'Linh Chi', '10002014', 'linhchi@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'images/avatar/user-placeholder.png', 771, 10.7589, 106.64, '66-108 Lạc Long Quân, Phường 1, Quận 11, Hồ Chí Minh', 'active'),
(43, 'Thùy Chi', '10002015', 'thuychi@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'images/avatar/user-placeholder.png', 771, 10.7648, 106.651, '143 Lê Thị Bạch Cát, Phường 11, Quận 11, Hồ Chí Minh', 'active'),
(44, 'Hữu Hoa', '10002016', 'huuhoa@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'images/avatar/user-placeholder.png', 772, 10.8641, 106.634, '251-233 Dương Thị Mười, Tân Thới Hiệp, Quận 12, Hồ Chí Minh', 'active'),
(45, 'Bảo Chấn', '10002017', 'baochan@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'images/avatar/user-placeholder.png', 772, 10.8725, 106.677, '459 Hà Huy Giáp, Quận 12, Hồ Chí Minh, Việt Nam', 'active'),
(46, 'Vân Dung', '10002018', 'vandung@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'images/avatar/user-placeholder.png', 773, 10.7954, 106.745, '88-168 Nguyễn Hoàng, An Phú, Quận 2, Hồ Chí Minh', 'active'),
(47, 'Vân Đúng', '10002019', 'vandung2@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'images/avatar/user-placeholder.png', 773, 10.7658, 106.78, '33 Cát Lái, Quận 2, Hồ Chí Minh, Việt Nam', 'active'),
(48, 'Vân Đại', '10002020', 'vandai@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'images/avatar/user-placeholder.png', 774, 10.773, 106.685, '287 Nguyễn Đình Chiểu, Phường 5, Quận 3, Hồ Chí Minh', 'active'),
(49, 'Trung Dũng', '10002021', 'trungdung@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'images/avatar/user-placeholder.png', 774, 10.7872, 106.679, '395-223 Đường Lê Văn Sỹ, Phường 13, Quận 3, Hồ Chí Minh', 'active'),
(50, 'Quang Dũng', '10002022', 'quangdung@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'images/avatar/user-placeholder.png', 775, 10.7557, 106.701, '23 Đường Khánh Hội, Phường 3, Quận 4, Hồ Chí Minh', 'active'),
(51, 'Việt Dũng', '10002023', 'vietdung@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'images/avatar/user-placeholder.png', 775, 10.7597, 106.713, '404 Nguyễn Tất Thành, Phường 1, Quận 4, Hồ Chí Minh', 'active'),
(52, 'Ngọc Diệp', '10002024', 'ngocdiep@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'images/avatar/user-placeholder.png', 776, 10.7551, 106.662, '257-225 Hồng Bàng, Phường 11, Quận 5, Hồ Chí Minh', 'active'),
(53, 'Tuấn Du', '10002025', 'tuandu@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'images/avatar/user-placeholder.png', 776, 10.7563, 106.676, '313-283 Nguyễn Trãi\nPhường 7, Quận 5, Hồ Chí Minh', 'active'),
(54, 'Ngọc Giàu', '10002026', 'ngocgiau@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'images/avatar/user-placeholder.png', 777, 10.7379, 106.635, '3-669 Đường Phạm Văn Chí, Phường 7, Quận 6, Hồ Chí Minh', 'active'),
(55, 'Nguyên Giáp ', '10002027', 'nguyengiap@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'images/avatar/user-placeholder.png', 777, 10.7497, 106.643, '176-198 Đường Hậu Giang, Phường 5, Quận 6, Hồ Chí Minh', 'active'),
(56, 'Thu Hà', '10002028', 'thuha@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'images/avatar/user-placeholder.png', 778, 10.7375, 106.711, 'Tầng 2 Đường số 30, Khu dân cư An Phú Hưng, Quận 7, Hồ Chí Minh, Việt Nam', 'active'),
(57, 'Thanh Hà ', '10002029', 'thanhha@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'images/avatar/user-placeholder.png', 778, 10.7315, 106.735, '321 Đường Phú Thuận, Phú Thuận, Quận 7, Hồ Chí Minh', 'active'),
(58, 'Mạnh Hải', '10002030', 'manhhai@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'images/avatar/user-placeholder.png', 783, 10.711, 106.626, '3395-3297 Phạm Thế Hiển, Phường 7, Quận 8, Hồ Chí Minh', 'active'),
(59, 'Quang Hải', '10002031', 'quanghai@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'images/avatar/user-placeholder.png', 783, 10.7424, 106.665, '1097 Phạm Thế Hiển, Phường 5, Quận 8, Hồ Chí Minh', 'active'),
(60, 'Ngọc Hân', '10002032', 'ngochan@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'images/avatar/user-placeholder.png', 784, 10.8072, 106.834, '154-170 Tam Đa, Trường Thạnh, Quận 9, Hồ Chí Minh', 'active'),
(61, 'Ngọc Hận', '10002033', 'ngochan2@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'images/avatar/user-placeholder.png', 784, 10.8491, 106.81, '36-46 Hoàng Hữu Nam, Long Thạnh Mỹ, Quận 9, Hồ Chí Minh', 'active'),
(62, 'Thanh Hằng', '10002034', 'thanhhang@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'images/avatar/user-placeholder.png', 785, 10.788, 106.652, '12 Lạc Long Quân, Phường 8, Tân Bình, Hồ Chí Minh', 'active'),
(63, 'Minh Hằng ', '10002035', 'minhhang@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'images/avatar/user-placeholder.png', 785, 10.8141, 106.677, '23 Đường Bạch Đằng, Phường 3, Gò Vấp, Hồ Chí Minh', 'active'),
(64, 'Bảo Hòa', '10002036', 'baohoa@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'images/avatar/user-placeholder.png', 786, 10.8059, 106.625, 'Hẻm 193 Lê Trọng Tấn, Sơn Ký, Tân Phú, Hồ Chí Minh', 'active'),
(65, 'Khắc Huy', '10002037', 'khachuy@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'images/avatar/user-placeholder.png', 786, 10.7704, 106.631, '23 Hòa Bình, Tân Thới Hoà, Tân Phú, Hồ Chí Min', 'active'),
(66, 'Ngọc Huy', '10002038', 'ngochuy@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'images/avatar/user-placeholder.png', 787, 10.8721, 106.734, '67-13 Đường Lê Thị Hoa, Bình Chiểu, Thủ Đức, Hồ Chí Minh', 'active'),
(67, 'Kiến Huy', '10002039', 'kienhuy@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'images/avatar/user-placeholder.png', 787, 10.8507, 106.763, '12 Linh Chiểu, Thủ Đức, Hồ Chí Minh, Việt Nam', 'active');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `table_category`
--

CREATE TABLE `table_category` (
  `id_category` int(11) NOT NULL,
  `category_name` varchar(250) NOT NULL,
  `category_img` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `table_category`
--

INSERT INTO `table_category` (`id_category`, `category_name`, `category_img`) VALUES
(1, 'Tivi', 'images/categories/tivi.jpg'),
(2, 'Tủ lạnh', 'images/categories/tulanh.jpg'),
(3, 'Máy giặt', 'images/categories/maygiac.jpg'),
(5, 'Điện gia dụng', 'images/categories/microwave.jpg'),
(8, 'Bánh kẹo', 'images/categories/0.jpg'),
(10, 'Trái cây', 'images/categories/1.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `table_city`
--

CREATE TABLE `table_city` (
  `id_city` int(11) UNSIGNED NOT NULL,
  `city_name` varchar(255) NOT NULL,
  `map_location` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `table_city`
--

INSERT INTO `table_city` (`id_city`, `city_name`, `map_location`) VALUES
(1, 'Hà Nội', '21.027764, 105.83416'),
(2, 'Hồ Chí Minh', '10.823099, 106.629664'),
(3, 'Hải Phòng', '20.844911, 106.688084'),
(4, 'Đà Nẵng', '16.054407, 108.202167'),
(5, 'Cần Thơ', '10.045162, 105.746854'),
(6, 'An Giang', '22.766206, 104.938885'),
(7, 'Bà Rịa - Vũng Tàu', '22.635689, 106.252214'),
(8, 'Bắc Giang', '22.303292, 105.876004'),
(9, 'Bắc Kạn', '21.776725, 105.22802'),
(10, 'Bạc Liêu', '22.338086, 104.148706'),
(11, 'Bắc Ninh', '21.804231, 103.107652'),
(12, 'Bến Tre', '22.368661, 103.311909'),
(13, 'Bình Định', '21.102228, 103.728917'),
(14, 'Bình Dương', '21.683792, 104.455136'),
(15, 'Bình Phước', '20.686127, 105.313118'),
(16, 'Bình Thuận', '21.561377, 105.876004'),
(17, 'Cà Mau', '21.853708, 106.761519'),
(18, 'Cao Bằng', '21.006382, 107.292514'),
(19, 'Đắk Lắk', '21.301495, 106.62913'),
(20, 'Đắk Nông', '21.268443, 105.204557'),
(21, 'Điện Biên', '21.360881, 105.547437'),
(22, 'Đồng Nai', '21.121444, 106.11105'),
(23, 'Đồng Tháp', '20.937341, 106.314554'),
(24, 'Gia Lai', '20.852571, 106.016997'),
(25, 'Hà Giang', '20.538694, 106.393478'),
(26, 'Hà Nam', '20.583520, 105.92299'),
(27, 'Hà Tĩnh', '20.279180, 106.205148'),
(28, 'Hải Dương', '20.212997, 105.92299'),
(29, 'Hậu Giang', '19.806692, 105.785182'),
(30, 'Hoà Bình', '19.234249, 104.920036'),
(31, 'Hưng Yên', '18.294378, 105.674525'),
(32, 'Khánh Hòa', '17.610271, 106.348747'),
(33, 'Kiên Giang', '16.794347, 106.963409'),
(34, 'Kon Tum', '16.467397, 107.590533'),
(35, 'Lai Châu', '15.539354, 108.019102'),
(36, 'Lâm Đồng', '15.122382, 108.800134'),
(37, 'Lạng Sơn', '14.173973, 109.050870'),
(38, 'Lào Cai', '13.111196, 109.295780'),
(39, 'Long An', '12.258510, 109.052608'),
(40, 'Nam Định', '11.673877, 108.862957'),
(41, 'Nghệ An', '11.090370, 108.072078'),
(42, 'Ninh Bình', '14.349740, 108.000461'),
(43, 'Ninh Thuận', '13.807894, 108.109375'),
(44, 'Phú Thọ', '12.710012, 108.237752'),
(45, 'Phú Yên', '12.264648, 107.609806'),
(46, 'Quảng Bình', '11.575279, 108.142867'),
(47, 'Quảng Nam', '11.751189, 106.723464'),
(48, 'Quảng Ngãi', '11.335155, 106.109885'),
(49, 'Quảng Ninh', '11.325402, 106.477017'),
(50, 'Quảng Trị', '11.068630, 107.167598'),
(51, 'Sóc Trăng', '10.541740, 107.242998'),
(52, 'Sơn La', '10.695572, 106.243121'),
(53, 'Tây Ninh', '10.449332, 106.34205'),
(54, 'Thái Bình', '10.108155, 106.440587'),
(55, 'Thái Nguyên', '9.812741, 106.299291'),
(56, 'Thanh Hóa', '10.239574, 105.957193'),
(57, 'Thừa Thiên Huế', '10.493799, 105.688179'),
(58, 'Tiền Giang', '10.521584, 105.125896'),
(59, 'Trà Vinh', '9.824959, 105.125896'),
(60, 'Tuyên Quang', '9.757898, 105.641253'),
(61, 'Vĩnh Long', '9.600369, 105.959954'),
(62, 'Vĩnh Phúc', '9.251556, 105.513647'),
(63, 'Yên Bái', '9.152673, 105.196079');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `table_customer`
--

CREATE TABLE `table_customer` (
  `id_customer` int(11) NOT NULL,
  `customer_phone` varchar(50) NOT NULL,
  `customer_password` varchar(250) NOT NULL,
  `customer_fullname` varchar(250) NOT NULL,
  `customer_email` varchar(250) NOT NULL,
  `customer_address` varchar(250) NOT NULL,
  `customer_avatar` varchar(250) NOT NULL,
  `total_point` int(11) NOT NULL,
  `status` enum('active','deactive') NOT NULL DEFAULT 'active',
  `id_district` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `table_customer`
--

INSERT INTO `table_customer` (`id_customer`, `customer_phone`, `customer_password`, `customer_fullname`, `customer_email`, `customer_address`, `customer_avatar`, `total_point`, `status`, `id_district`) VALUES
(1, '0984840705', 'e10adc3949ba59abbe56e057f20f883e', 'Trần Đăng Khoa', 'wolf1101617@gmail.com', '157/17/1 Đường D2, Phường 25, Quận Bình Thạnh', 'images/avatar/yqcnIvabLX4rcZ13yPOKqWN2xgaV0VX4DNWhnDM9wMeU5DqmvSxwVxww32VF.png', 0, 'active', 762),
(2, '0984123456', 'e10adc3949ba59abbe56e057f20f883e', 'Phạm Hoàng Huyến', 'qqaassdd19@yahoo.com.vn', '135 nguyễn trung trực tp hcm', 'images/users/5.jpg', 0, 'active', 762),
(7, '098484123652', 'e10adc3949ba59abbe56e057f20f883e', 'Tran trui trui', 'trui@gmail.com', 'nguyen xi go vap hcm', 'images/avatar/5fruit.jpg', 0, 'active', 762),
(9, '9848407055', 'e10adc3949ba59abbe56e057f20f883e', 'Trần Đăng Khoa', 'wolf1101617@gmail.com', '157/17/1 Đường D2, Phường 25, Quận Bình Thạnh', 'images/avatar/user-placeholder.png', 0, 'active', 762),
(10, '9841234566', 'e10adc3949ba59abbe56e057f20f883e', 'Phạm Hoàng Huyến', 'qqaassdd19@yahoo.com.vn', '135 nguyễn trung trực tp hcm', 'images/avatar/user-placeholder.png', 0, 'active', 762),
(11, '09848407055', 'e10adc3949ba59abbe56e057f20f883e', 'Trần Đăng Khoa', 'wolf1101617@gmail.com', '157/17/1 Đường D2, Phường 25, Quận Bình Thạnh', 'images/avatar/user-placeholder.png', 0, 'active', 762),
(12, '09841234566', 'e10adc3949ba59abbe56e057f20f883e', 'Phạm Hoàng Huyến', 'qqaassdd19@yahoo.com.vn', '135 nguyễn trung trực tp hcm', 'images/avatar/user-placeholder.png', 0, 'active', 762);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `table_customer_addition_address`
--

CREATE TABLE `table_customer_addition_address` (
  `id_customer_addition_address` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `addition_address` varchar(250) NOT NULL,
  `id_district` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `table_customer_addition_address`
--

INSERT INTO `table_customer_addition_address` (`id_customer_addition_address`, `id_customer`, `addition_address`, `id_district`) VALUES
(5, 1, '435-437 Xô Viết Nghệ Tĩnh, Phường 26, Bình Thạnh, Hồ Chí Minh, Việt Nam', 762),
(6, 1, 'QL1A, An Phú Đông, Quận 12, Hồ Chí Minh, Việt Nam', 772),
(7, 1, '113 Nguyễn Văn Tèo, Q9 , Hồ Chí Minh', 762),
(8, 1, '117 Nguyễn Văn Tèo, Q9 , Hồ Chí Minh', 762),
(9, 1, '1 Nguyễn Văn Tèo, Q9 , Hồ Chí Minh', 762),
(10, 1, '2 Nguyễn Văn Tèo, Q9 , Hồ Chí Minh', 762);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `table_customer_search_history`
--

CREATE TABLE `table_customer_search_history` (
  `id_customer_search_history` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `search_txt` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `table_customer_search_history`
--

INSERT INTO `table_customer_search_history` (`id_customer_search_history`, `id_customer`, `search_txt`) VALUES
(42, 1, 'TIVI'),
(43, 1, 'TIVI'),
(44, 1, 'TIVI'),
(45, 1, 'TIVI'),
(46, 1, 'TIVI'),
(47, 1, 'TIVI'),
(48, 1, 'TIVI'),
(49, 1, 'TIVI'),
(50, 1, 'TIVI'),
(51, 1, 'toilet');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `table_district`
--

CREATE TABLE `table_district` (
  `id_district` int(11) NOT NULL,
  `district_name` varchar(100) DEFAULT NULL,
  `map_location` varchar(100) DEFAULT NULL,
  `id_city` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `table_district`
--

INSERT INTO `table_district` (`id_district`, `district_name`, `map_location`, `id_city`) VALUES
(1, 'Ba Đình', '21.033781, 105.814054', 1),
(2, 'Hoàn Kiếm', '21.027964, 105.851013', 1),
(3, 'Tây Hồ', '21.081121, 105.818031', 1),
(4, 'Long Biên', '21.054863, 105.888497', 1),
(5, 'Cầu Giấy', '21.036237, 105.790583', 1),
(6, 'Đống Đa', '21.018072, 105.829949', 1),
(7, 'Hai Bà Trưng', '21.009057, 105.860751', 1),
(8, 'Hoàng Mai', '20.983698, 105.863626', 1),
(9, 'Thanh Xuân', '20.995982, 105.809724', 1),
(16, 'Sóc Sơn', '21.257313, 105.84802', 1),
(17, 'Đông Anh', '21.124530, 105.82714', 1),
(18, 'Gia Lâm', '21.010521, 105.952941', 1),
(19, 'Nam Từ Liêm', '21.003461, 105.770329', 1),
(20, 'Thanh Trì', '20.934442, 105.846229', 1),
(21, 'Bắc Từ Liêm', '21.073020, 105.770329', 1),
(24, 'Hà Giang', '22.802559, 104.978449', 25),
(26, 'Đồng Văn', '23.224672, 105.242885', 25),
(27, 'Mèo Vạc', '23.134105, 105.453672', 25),
(28, 'Yên Minh', '23.043495, 105.196079', 25),
(29, 'Quản Bạ', '23.087186, 104.985618', 25),
(30, 'Vị Xuyên', '22.724134, 104.892167', 25),
(31, 'Bắc Mê', '2.781148, 105.266293', 25),
(32, 'Hoàng Su Phì', '22.741717, 104.705431', 25),
(33, 'Xín Mần', '22.665916, 104.518921', 25),
(34, 'Bắc Quang', '22.445025, 104.892167', 25),
(35, 'Quang Bình', '22.462439, 104.705431', 25),
(40, 'Cao Bằng', '22.666637, 106.263985', 18),
(42, 'Bảo Lâm', '22.855622, 105.453672', 18),
(43, 'Bảo Lạc', '22.878625, 105.688179', 18),
(44, 'Thông Nông', '22.843909, 105.952099', 18),
(45, 'Hà Quảng', '22.902540, 106.13457', 18),
(46, 'Trà Lĩnh', '22.790347, 106.322834', 18),
(47, 'Trùng Khánh', '22.832383, 106.581979', 18),
(48, 'Hạ Lang', '22.704244, 106.699877', 18),
(49, 'Quảng Uyên', '22.682990, 106.464146', 18),
(50, 'Phục Hoà', '22.539268, 106.511271', 18),
(51, 'Hoà An', '22.753870, 106.22868', 18),
(52, 'Nguyên Bình', '22.623086, 105.92299', 18),
(53, 'Thạch An', '22.466356, 106.322834', 18),
(58, 'Bắc Kạn', '22.144268, 105.834543', 9),
(60, 'Pác Nặm', '22.612637, 105.670323', 9),
(61, 'Ba Bể', '22.363689, 105.735117', 9),
(62, 'Ngân Sơn', '22.428179, 106.016997', 9),
(63, 'Bạch Thông', '22.272424, 105.880408', 9),
(64, 'Chợ Đồn', '22.196499, 105.547437', 9),
(65, 'Chợ Mới', '10.482525, 105.477108', 9),
(66, 'Na Rì', '22.140660, 106.11105', 9),
(70, 'Tuyên Quang', '21.776725, 105.22802', 60),
(71, 'Lâm Bình', '22.598797, 105.231628', 60),
(72, 'Nà Hang', '2.493336, 105.359957', 60),
(73, 'Chiêm Hóa', '22.130676, 105.266293', 60),
(74, 'Hàm Yên', '22.083945, 105.027174', 60),
(75, 'Yên Sơn', '21.944799, 105.266293', 60),
(76, 'Sơn Dương', '21.657181, 105.359957', 60),
(80, 'Lào Cai', '22.480943, 103.975496', 38),
(82, 'Bát Xát', '22.553934, 103.682586', 38),
(83, 'Mường Khương', '22.678531, 104.123367', 38),
(84, 'Si Ma Cai', '22.665984, 104.262851', 38),
(85, 'Bắc Hà', '22.496547, 104.332644', 38),
(86, 'Bảo Thắng', '22.326700, 104.146605', 38),
(87, 'Bảo Yên', '22.276330, 104.44904', 38),
(88, 'Sa Pa', '22.249717, 103.960809', 38),
(89, 'Văn Bàn', '22.089411, 104.193092', 38),
(94, 'Điện Biên Phủ', '21.406390, 103.032155', 21),
(95, 'Mường Lay', '22.049873, 103.163499', 21),
(96, 'Mường Nhé', '22.083264, 102.575703', 21),
(97, 'Mường Chà', '21.859660, 103.035694', 21),
(98, 'Tủa Chùa', '21.923201, 103.404945', 21),
(99, 'Tuần Giáo', '21.642702, 103.404945', 21),
(100, 'Điện Biên', '21.204477, 103.035694', 21),
(101, 'Điện Biên Đông', '21.283509, 103.220183', 21),
(102, 'Mường Ảng', '21.564144, 103.220183', 21),
(103, 'Nậm Pồ', '22.194654, 102.45715', 21),
(105, 'Lai Châu', '22.073099, 103.157402', 35),
(106, 'Tam Đường', '22.349705, 103.61312', 35),
(107, 'Mường Tè', '22.400379, 102.713512', 35),
(108, 'Sìn Hồ', '22.304888, 103.31253', 35),
(109, 'Phong Thổ', '22.402606, 103.436727', 35),
(110, 'Than Uyên', '21.892211, 103.775263', 35),
(111, 'Tân Uyên', '22.086885, 103.682586', 35),
(112, 'Nậm Nhùn', '22.147532, 103.014171', 35),
(116, 'Sơn La', '21.326902, 103.914387', 52),
(118, 'Quỳnh Nhai', '21.713204, 103.682586', 52),
(119, 'Thuận Châu', '21.390065, 103.636272', 52),
(120, 'Mường La', '21.495112, 104.053676', 52),
(121, 'Bắc Yên', '21.276554, 104.425753', 52),
(122, 'Phù Yên', '21.158895, 104.705431', 52),
(123, 'Mộc Châu', '20.922082, 104.752094', 52),
(124, 'Yên Châu', '21.005001, 104.332644', 52),
(125, 'Mai Sơn', '21.121910, 104.053676', 52),
(126, 'Sông Mã', '21.059325, 103.682586', 52),
(127, 'Sốp Cộp', '20.887452, 103.497426', 52),
(128, 'Vân Hồ', '20.793105, 104.763762', 52),
(132, 'Yên Bái', '21.716769, 104.898588', 63),
(133, 'Nghĩa Lộ', '21.601877, 104.506265', 63),
(135, 'Lục Yên', '22.090005, 104.705431', 63),
(136, 'Văn Yên', '21.869843, 104.565527', 63),
(137, 'Mù Căng Chải', '21.767005, 104.146605', 63),
(138, 'Trấn Yên', '21.616008, 104.798771', 63),
(139, 'Trạm Tấu', '21.462938, 104.425753', 63),
(140, 'Văn Chấn', '21.429843, 104.798771', 63),
(141, 'Yên Bình', '21.760588, 105.061586', 63),
(148, 'Hòa Bình', '21.725345, 104.971012', 28),
(150, 'Đà Bắc', '20.838155, 105.172682', 28),
(151, 'Kỳ Sơn', '20.903023, 105.393238', 28),
(152, 'Lương Sơn', '20.871913, 105.504027', 28),
(153, 'Kim Bôi', '20.690113, 105.523991', 28),
(154, 'Cao Phong', '20.707220, 105.336536', 28),
(155, 'Tân Lạc', '20.622803, 105.242885', 28),
(156, 'Mai Châu', '20.690134, 105.008989', 28),
(157, 'Lạc Sơn', '20.441335, 105.453672', 28),
(158, 'Yên Thủy', '20.403225, 105.617794', 28),
(159, 'Lạc Thủy', '20.513672, 105.733346', 28),
(164, 'Thái Nguyên', '21.567156, 105.825204', 55),
(165, 'Sông Công', '21.477798, 105.842609', 55),
(167, 'Định Hóa', '21.887955, 105.617794', 55),
(168, 'Phú Lương', '21.786057, 105.711646', 55),
(169, 'Đồng Hỷ', '21.628639, 105.899496', 55),
(170, 'Võ Nhai', '21.779341, 106.016997', 55),
(171, 'Đại Từ', '21.630436, 105.641253', 55),
(172, 'Phổ Yên', '21.415762, 105.872995', 55),
(173, 'Phú Bình', '21.484977, 105.946487', 55),
(178, 'Lạng Sơn', '21.853708, 106.761519', 42),
(180, 'Tràng Định', '22.287299, 106.487707', 42),
(181, 'Bình Gia', '22.063991, 106.334086', 42),
(182, 'Văn Lãng', '22.092483, 106.581979', 42),
(183, 'Cao Lộc', '21.903630, 106.841437', 42),
(184, 'Văn Quan', '21.845359, 106.511271', 42),
(185, 'Bắc Sơn', '21.843773, 106.299291', 42),
(186, 'Hữu Lũng', '21.565982, 106.299291', 42),
(187, 'Chi Lăng', '21.650694, 106.605553', 42),
(188, 'Lộc Bình', '21.775759, 106.959472', 42),
(189, 'Đình Lập', '21.571198, 107.148452', 42),
(193, 'Hạ Long', '20.971198, 107.044807', 47),
(194, 'Móng Cái', '21.525944, 107.972367', 47),
(195, 'Cẩm Phả', '21.071894, 107.320102', 47),
(196, 'Uông Bí', '21.033908, 106.764821', 47),
(198, 'Bình Liêu', '21.541016, 107.432196', 47),
(199, 'Tiên Yên', '21.366688, 107.337579', 47),
(200, 'Đầm Hà', '21.361943, 107.597858', 47),
(201, 'Hải Hà', '21.418223, 107.71625', 47),
(202, 'Ba Chẽ', '21.294325, 107.148452', 47),
(203, 'Vân Đồn', '21.069398, 107.420226', 47),
(204, 'Hoành Bồ', '21.055185, 107.040517', 47),
(205, 'Đông Triều', '21.080289, 106.515025', 47),
(206, 'Quảng Yên', '20.938741, 106.796489', 47),
(207, 'Cô Tô', '21.106221, 107.834692', 47),
(213, 'Bắc Giang', '21.281992, 106.197477', 60),
(215, 'Yên Thế', '21.512877, 106.13457', 60),
(216, 'Tân Yên', '21.378520, 106.087533', 60),
(217, 'Lạng Giang', '21.378520, 106.087533', 60),
(218, 'Lục Nam', '21.299663, 106.417031', 60),
(219, 'Lục Ngạn', '21.435404, 106.676292', 60),
(220, 'Sơn Động', '21.352000, 106.88499', 60),
(221, 'Yên Dũng', '21.225731, 106.22868', 60),
(222, 'Việt Yên', '21.285863, 106.087533', 60),
(223, 'Hiệp Hòa', '21.355222, 105.979038', 60),
(227, 'Việt Trì', '21.357010, 105.352633', 46),
(228, 'Phú Thọ', '21.268443, 105.204557', 46),
(230, 'Đoan Hùng', '21.607164, 105.149287', 46),
(231, 'Hạ Hoà', '21.573599, 105.008989', 46),
(232, 'Thanh Ba', '21.467704, 105.149287', 46),
(233, 'Phù Ninh', '21.475326, 105.284461', 46),
(234, 'Yên Lập', '21.341062, 105.008989', 46),
(235, 'Cẩm Khê', '21.429804, 105.055742', 46),
(236, 'Tam Nông', '21.285868, 105.231183', 46),
(237, 'Lâm Thao', '21.302614, 105.301411', 46),
(238, 'Thanh Sơn', '21.024020, 105.172682', 46),
(239, 'Thanh Thuỷ', '21.114182, 105.280716', 46),
(240, 'Tân Sơn', '21.166552, 104.989485', 46),
(243, 'Vĩnh Yên', '21.307285, 105.616315', 34),
(244, 'Phúc Yên', '21.281597, 105.724974', 34),
(246, 'Lập Thạch', '21.437150, 105.477108', 34),
(247, 'Tam Dương', '21.371378, 105.559162', 34),
(248, 'Tam Đảo', '21.474706, 105.570887', 34),
(249, 'Bình Xuyên', '21.313857, 105.676446', 34),
(250, 'Mê Linh', '21.175343, 105.730804', 1),
(251, 'Yên Lạc', '21.196220, 105.570887', 62),
(252, 'Vĩnh Tường', '21.253774, 105.489917', 62),
(253, 'Sông Lô', '21.456467, 105.395094', 62),
(256, 'Bắc Ninh', '21.178177, 106.071026', 11),
(258, 'Yên Phong', '21.202957, 105.958162', 11),
(259, 'Quế Võ', '21.137731, 106.18162', 11),
(260, 'Tiên Du', '21.117831, 106.028751', 11),
(261, 'Từ Sơn', '21.118833, 105.959784', 11),
(262, 'Thuận Thành', '21.035778, 106.079257', 11),
(263, 'Gia Bình', '21.076407, 106.216914', 11),
(264, 'Lương Tài', '21.027815, 106.240447', 11),
(268, 'Hà Đông', '20.955835, 105.756366', 1),
(269, 'Sơn Tây', '21.116226, 105.495325', 1),
(271, 'Ba Vì', '21.199230, 105.423212', 1),
(272, 'Phúc Thọ', '21.124140, 105.593907', 1),
(273, 'Đan Phượng', '21.084855, 105.669096', 1),
(274, 'Hoài Đức', '21.024317, 105.698889', 1),
(275, 'Quốc Oai', '20.992463, 105.640425', 1),
(276, 'Thạch Thất', '20.990523, 105.525189', 1),
(277, 'Chương Mỹ', '20.874647, 105.671247', 1),
(278, 'Thanh Oai', '20.853216, 105.768851', 1),
(279, 'Thường Tín', '20.805544, 105.883858', 1),
(280, 'Phú Xuyên', '20.728073, 105.902937', 1),
(281, 'Ứng Hòa', '20.729614, 105.778206', 1),
(282, 'Mỹ Đức', '20.725768, 105.715751', 1),
(288, 'Hải Dương', '20.937341, 106.314554', 28),
(290, 'Chí Linh', '21.113250, 106.303195', 28),
(291, 'Nam Sách', '20.995464, 106.334606', 28),
(292, 'Kinh Môn', '21.011032, 106.527365', 28),
(293, 'Kim Thành', '20.898453, 106.514187', 28),
(294, 'Thanh Hà', '20.908358, 106.427609', 28),
(295, 'Cẩm Giàng', '20.947948, 106.22868', 28),
(296, 'Bình Giang', '20.870356, 106.193384', 28),
(297, 'Gia Lộc', '20.861230, 106.287521', 28),
(298, 'Tứ Kỳ', '20.816818, 106.411245', 28),
(299, 'Ninh Giang', '20.749109, 106.369927', 28),
(300, 'Thanh Miện', '20.782120, 106.220382', 28),
(303, 'Hồng Bàng', '20.859531, 106.666993', 3),
(304, 'Ngô Quyền', '20.856665, 106.69949', 3),
(305, 'Lê Chân', '20.834505, 106.683134', 3),
(306, 'Hải An', '20.830094, 106.721963', 3),
(307, 'Kiến An', '20.774670, 106.676498', 3),
(308, 'Đồ Sơn', '20.724753, 106.774253', 3),
(309, 'Dương Kinh', '20.844911, 106.688084', 3),
(311, 'Thuỷ Nguyên', '20.945133, 106.671554', 3),
(312, 'An Dương', '20.900356, 106.57887', 3),
(313, 'An Lão', '20.821422, 106.556548', 3),
(314, 'Kiến Thuỵ', '20.751570, 106.670133', 3),
(315, 'Tiên Lãng', '20.724040, 106.553597', 3),
(316, 'Vĩnh Bảo', '20.688914, 106.481426', 3),
(317, 'Cát Hải', '20.804105, 106.930227', 3),
(318, 'Bạch Long Vĩ', '20.131144, 107.731053', 3),
(323, 'Hưng Yên', '20.654682, 106.057849', 31),
(325, 'Văn Lâm', '20.985460, 106.046375', 31),
(326, 'Văn Giang', '20.941484, 105.956903', 31),
(327, 'Yên Mỹ', '20.886190, 106.028751', 31),
(328, 'Mỹ Hào', '20.925738, 106.099291', 31),
(329, 'Ân Thi', '20.809961, 106.099291', 31),
(330, 'Khoái Châu', '20.841546, 105.980425', 31),
(331, 'Kim Động', '20.732504, 106.056376', 31),
(332, 'Tiên Lữ', '20.691952, 106.12281', 31),
(333, 'Phù Cừ', '20.708337, 106.193384', 31),
(336, 'Thái Bình', '20.446347, 106.336583', 54),
(338, 'Quỳnh Phụ', '20.660825, 106.327686', 54),
(339, 'Hưng Hà', '20.590375, 106.216914', 54),
(340, 'Đông Hưng', '20.564092, 106.369927', 54),
(341, 'Thái Thụy', '20.565579, 106.56488', 54),
(342, 'Tiền Hải', '20.359823, 106.555478', 54),
(343, 'Kiến Xương', '20.420826, 106.417031', 54),
(344, 'Vũ Thư', '20.434379, 106.275751', 54),
(347, 'Phủ Lý', '20.531693, 105.917629', 26),
(349, 'Duy Tiên', '20.626842, 105.951554', 26),
(350, 'Kim Bảng', '20.563362, 105.856247', 26),
(351, 'Thanh Liêm', '20.469906, 105.899496', 26),
(352, 'Bình Lục', '20.504343, 106.047490', 26),
(353, 'Lý Nhân', '20.557941, 106.097564', 26),
(356, 'Nam Định', '20.438770, 106.159284', 40),
(358, 'Mỹ Lộc', '20.460491, 106.12281', 40),
(359, 'Vụ Bản', '20.370142, 106.099291', 40),
(360, 'Ý Yên', '20.368498, 105.993491', 40),
(361, 'Nghĩa Hưng', '20.073248, 106.18162', 40),
(362, 'Nam Trực', '20.335893, 106.216914', 40),
(363, 'Trực Ninh', '20.243376, 106.216914', 40),
(364, 'Xuân Trường', '20.299641, 106.361940', 40),
(365, 'Giao Thủy', '20.231409, 106.464146', 40),
(366, 'Hải Hậu', '20.156887, 106.275751', 40),
(369, 'Ninh Bình', '20.437300, 106.1543', 42),
(370, 'Tam Điệp', '20.222355, 106.181765', 42),
(372, 'Nho Quan', '20.319247, 105.743919', 42),
(373, 'Gia Viễn', '20.188102, 106.365109', 42),
(374, 'Hoa Lư', '20.285123, 105.906604', 42),
(375, 'Yên Khánh', '20.189250, 106.071065', 42),
(376, 'Kim Sơn', '20.046233, 106.099291', 42),
(377, 'Yên Mô', '20.137029, 105.993491', 42),
(380, 'Thanh Hóa', '19.806692, 105.785182', 56),
(381, 'Bỉm Sơn', '20.084895, 105.85752', 56),
(382, 'Sầm Sơn', '19.763501, 105.898123', 56),
(384, 'Mường Lát', '20.494133, 104.588836', 56),
(385, 'Quan Hóa', '20.483043, 104.985618', 56),
(386, 'Bá Thước', '20.365336, 105.266293', 56),
(387, 'Quan Sơn', '20.212333, 104.892167', 56),
(388, 'Lang Chánh', '20.166759, 105.149287', 56),
(389, 'Ngọc Lặc', '20.078589, 105.359957', 56),
(390, 'Cẩm Thủy', '20.184101, 105.477108', 56),
(391, 'Thạch Thành', '20.217781, 105.617794', 56),
(392, 'Hà Trung', '20.061709, 105.805547', 56),
(393, 'Vĩnh Lộc', '20.040805, 105.652983', 56),
(394, 'Yên Định', '20.040805, 105.652983', 56),
(395, 'Thọ Xuân', '19.905912, 105.477108', 56),
(396, 'Thường Xuân', '19.901279, 105.266293', 56),
(397, 'Triệu Sơn', '19.852539, 105.575768', 56),
(399, 'Hoằng Hóa', '19.823369, 105.907660', 56),
(400, 'Hậu Lộc', '19.926888, 105.887749', 56),
(401, 'Nga Sơn', '19.998188, 105.993491', 56),
(402, 'Như Xuân', '19.614914, 105.359957', 56),
(403, 'Như Thanh', '19.573312, 105.570887', 56),
(404, 'Nông Cống', '19.611328, 105.664714', 56),
(405, 'Đông Sơn', '19.808355, 105.697026', 56),
(406, 'Quảng Xương', '19.691338, 105.805547', 56),
(407, 'Tĩnh Gia', '19.438380, 105.774513', 56),
(412, 'Vinh', '18.679585, 105.681333', 41),
(413, 'Cửa Lò', '18.794225, 105.72524', 41),
(414, 'Thái Hoà', '19.324004, 105.420335', 41),
(415, 'Quế Phong', '19.686269, 104.956318', 41),
(416, 'Quỳ Châu', '19.546306, 105.079123', 41),
(417, 'Kỳ Sơn', '19.385470, 104.182791', 41),
(418, 'Tương Dương', '19.264013, 104.565527', 41),
(419, 'Nghĩa Đàn', '19.400335, 105.430238', 41),
(420, 'Quỳ Hợp', '19.352892, 105.172682', 41),
(421, 'Quỳnh Lưu', '19.220026, 105.641253', 41),
(422, 'Con Cuông', '19.013059, 104.798771', 41),
(423, 'Tân Kỳ', '19.074880, 105.172682', 41),
(424, 'Anh Sơn', '18.968805, 105.055742', 41),
(425, 'Diễn Châu', '19.017969, 105.570887', 41),
(426, 'Yên Thành', '19.051129, 105.453672', 41),
(427, 'Đô Lương', '18.899098, 105.336536', 41),
(428, 'Thanh Chương', '18.696774, 105.266293', 41),
(429, 'Nghi Lộc', '18.814204, 105.583566', 41),
(430, 'Nam Đàn', '18.698345, 105.523991', 41),
(431, 'Hưng Nguyên', '18.631674, 105.629523', 41),
(432, 'Hoàng Mai', '19.268332, 105.716197', 41),
(436, 'Hà Tĩnh', '18.355954, 105.887749', 27),
(437, 'Hồng Lĩnh', '18.529975, 105.706087', 27),
(439, 'Hương Sơn', '18.511801, 105.266293', 27),
(440, 'Đức Thọ', '18.505672, 105.617794', 27),
(441, 'Vũ Quang', '18.336594, 105.430238', 27),
(442, 'Nghi Xuân', '18.664230, 105.755656', 27),
(443, 'Can Lộc', '18.451601, 105.711646', 27),
(444, 'Hương Khê', '18.203756, 105.641253', 27),
(445, 'Thạch Hà', '18.301316, 105.852515', 27),
(446, 'Cẩm Xuyên', '18.172165, 106.016997', 27),
(447, 'Kỳ Anh', '18.055958, 106.299291', 27),
(448, 'Lộc Hà', '18.481758, 105.899496', 27),
(449, 'Kỳ Anh', '18.067319, 106.29698', 27),
(450, 'Đồng Hới', '17.465939, 106.598396', 46),
(452, 'Minh Hóa', '17.719816, 105.92299', 46),
(453, 'Tuyên Hóa', '17.931904, 105.972281', 46),
(454, 'Quảng Trạch', '17.864013, 106.393478', 46),
(455, 'Bố Trạch', '17.504708, 106.299291', 46),
(456, 'Quảng Ninh', '17.239458, 106.461625', 46),
(457, 'Lệ Thủy', '17.106491, 106.676292', 46),
(458, 'Ba Đồn', '17.753035, 106.423528', 46),
(461, 'Đông Hà', '16.808893, 107.08938', 50),
(462, 'Quảng Trị', '16.740307, 107.185468', 50),
(464, 'Vĩnh Linh', '17.074331, 107.053943', 50),
(465, 'Hướng Hóa', '16.649551, 106.676292', 50),
(466, 'Gio Linh', '16.916571, 107.030322', 50),
(467, 'Đa Krông', '16.534917, 106.959472', 50),
(468, 'Cam Lộ', '16.783695, 106.983087', 50),
(469, 'Triệu Phong', '16.809184, 107.219358', 50),
(470, 'Hải Lăng', '16.714002, 107.26664', 50),
(471, 'Cồn Cỏ', '17.160650, 107.340535', 50),
(474, 'Huế', '16.463712, 107.590863', 57),
(476, 'Phong Điền', '9.996766, 105.668661', 57),
(477, 'Quảng Điền', '16.590242, 107.515014', 57),
(478, 'Phú Vang', '16.491213, 107.739935', 57),
(479, 'Hương Thủy', '16.408957, 107.677252', 57),
(480, 'Hương Trà', '16.487057, 107.500951', 57),
(481, 'A Lưới', '16.230374, 107.337579', 57),
(482, 'Phú Lộc', '16.272543, 107.939476', 57),
(483, 'Nam Đông', '16.124969, 107.670742', 57),
(490, 'Liên Chiểu', '16.071770, 108.150382', 4),
(491, 'Thanh Khê', '16.064180, 108.187341', 4),
(492, 'Hải Châu', '16.047200, 108.219959', 4),
(493, 'Sơn Trà', '16.106998, 108.252182', 4),
(494, 'Ngũ Hành Sơn', '15.995506, 108.258805', 4),
(495, 'Cẩm Lệ', '16.015367, 108.196236', 4),
(497, 'Hòa Vang', '15.999988, 108.145799', 4),
(498, 'Hoàng Sa', '16.064571, 108.222148', 4),
(502, 'Tam Kỳ', '15.563829, 108.482168', 47),
(503, 'Hội An', '15.880058, 108.338047', 47),
(504, 'Tây Giang', '15.885263, 107.48903', 47),
(505, 'Đông Giang', '15.966025, 107.783163', 47),
(506, 'Đại Lộc', '15.849787, 108.066866', 47),
(507, 'Điện Bàn', '15.887913, 108.253744', 47),
(508, 'Duy Xuyên', '15.775110, 108.166585', 47),
(509, 'Quế Sơn', '15.684838, 108.166585', 47),
(510, 'Nam Giang', '15.662855, 107.621532', 47),
(511, 'Phước Sơn', '15.376252, 107.811', 47),
(512, 'Hiệp Đức', '15.559068, 108.080569', 47),
(513, 'Thăng Bình', '15.689035, 108.380131', 47),
(514, 'Tiên Phước', '15.496401, 108.261477', 47),
(515, 'Bắc Trà My', '15.320272, 108.214028', 47),
(516, 'Nam Trà My', '15.082661, 108.095435', 47),
(517, 'Núi Thành', '15.422942, 108.593812', 47),
(518, 'Phú Ninh', '15.574326, 108.403867', 47),
(519, 'Nông Sơn', '15.655798, 107.976887', 47),
(522, 'Quảng Ngãi', '15.121387, 108.804415', 48),
(524, 'Bình Sơn', '15.316649, 108.783857', 48),
(525, 'Trà Bồng', '15.251264, 108.498827', 48),
(526, 'Tây Trà', '15.173401, 108.356397', 48),
(527, 'Sơn Tịnh', '15.186094, 108.736337', 48),
(528, 'Tư Nghĩa', '15.106578, 108.748217', 48),
(529, 'Sơn Hà', '15.043194, 108.570064', 48),
(530, 'Sơn Tây', '14.948853, 108.356397', 48),
(531, 'Minh Long', '14.965926, 108.688823', 48),
(532, 'Nghĩa Hành', '15.002685, 108.783857', 48),
(533, 'Mộ Đức', '14.949804, 108.878915', 48),
(534, 'Đức Phổ', '14.762796, 108.973995', 48),
(535, 'Ba Tơ', '14.766379, 108.665068', 48),
(536, 'Lý Sơn', '15.383361, 109.110711', 48),
(540, 'Qui Nhơn', '13.782967, 109.219663', 13),
(542, 'An Lão', '20.821422, 106.556548', 13),
(543, 'Hoài Nhơn', '14.466639, 109.04532', 13),
(544, 'Hoài Ân', '14.304039, 108.855148', 13),
(545, 'Phù Mỹ', '14.215765, 109.116657', 13),
(546, 'Vĩnh Thạnh', '10.232270, 105.398703', 13),
(547, 'Tây Sơn', '13.947943, 108.855148', 13),
(548, 'Phù Cát', '14.013400, 109.054748', 13),
(549, 'An Nhơn', '13.886506, 109.113435', 13),
(550, 'Tuy Phước', '13.856503, 109.164221', 13),
(551, 'Vân Canh', '13.674033, 108.950223', 13),
(555, 'Tuy Hoà', '13.105706, 109.295048', 45),
(557, 'Sông Cầu', '13.580906, 109.199193', 45),
(558, 'Đồng Xuân', '13.408307, 108.950223', 45),
(559, 'Tuy An', '13.297735, 109.235576', 45),
(560, 'Sơn Hòa', '13.143169, 108.950223', 45),
(561, 'Sông Hinh', '12.878635, 108.950223', 45),
(562, 'Tây Hoà', '12.928581, 109.164221', 45),
(563, 'Phú Hoà', '13.060695, 109.164221', 45),
(564, 'Đông Hòa', '12.958064, 109.354527', 45),
(568, 'Nha Trang', '12.238791, 109.196749', 32),
(569, 'Cam Ranh', '11.966212, 109.191558', 32),
(570, 'Cam Lâm', '12.075390, 109.140438', 32),
(571, 'Vạn Ninh', '12.724344, 109.262699', 32),
(572, 'Ninh Hòa', '12.486496, 109.134581', 32),
(573, 'Khánh Vĩnh', '12.270595, 108.855148', 32),
(574, 'Diên Khánh', '12.257042, 109.04532', 32),
(575, 'Khánh Sơn', '12.024942, 108.926452', 32),
(576, 'Trường Sa', '10.723282, 115.826466', 32),
(582, 'Phan Rang-Tháp Chàm', '11.582568, 108.991207', 43),
(584, 'Bác Ái', '11.833415, 108.855148', 43),
(585, 'Ninh Sơn', '11.688870, 108.736337', 43),
(586, 'Ninh Hải', '11.703248, 109.164221', 43),
(587, 'Ninh Phước', '11.485043, 108.855148', 43),
(588, 'Thuận Bắc', '11.753333, 109.069098', 43),
(589, 'Thuận Nam', '11.476418, 108.91121', 43),
(593, 'Phan Thiết', '10.980460, 108.261477', 16),
(594, 'La Gi', '10.683699, 107.750447', 16),
(595, 'Tuy Phong', '11.317883, 108.65796', 16),
(596, 'Bắc Bình', '11.255183, 108.380131', 16),
(597, 'Hàm Thuận Bắc', '11.111686, 108.131963', 16),
(598, 'Hàm Thuận Nam', '10.850294, 107.905781', 16),
(599, 'Tánh Linh', '11.098064, 107.678501', 16),
(600, 'Đức Linh', '11.197729, 107.550515', 16),
(601, 'Hàm Tân', '10.693593, 107.621532', 16),
(602, 'Phú Quí', '10.533333, 108.95', 16),
(608, 'Kon Tum', '14.349740, 108.000461', 34),
(610, 'Đắk Glei', '15.113472, 107.71625', 34),
(611, 'Ngọc Hồi', '14.671025, 107.621532', 34),
(612, 'Đắk Tô', '14.656202, 107.811', 34),
(613, 'Kon Plông', '14.797689, 108.285205', 34),
(614, 'Kon Rẫy', '14.560757, 108.166585', 34),
(615, 'Đắk Hà', '14.641214, 108.000593', 34),
(616, 'Sa Thầy', '14.435578, 107.763621', 34),
(617, 'Tu Mơ Rông', '14.910579, 108.000593', 34),
(618, 'Ia H Drai', '14.018916, 107.447703', 34),
(622, 'Pleiku', '13.971836, 108.01508', 24),
(623, 'An Khê', '14.027926, 108.688823', 24),
(624, 'Ayun Pa', '13.374339, 108.398981', 24),
(625, 'KBang', '14.334806, 108.475085', 24),
(626, 'Đăk Đoa', '14.113541, 108.166585', 24),
(627, 'Chư Păh', '14.176531, 107.929482', 24),
(628, 'Ia Grai', '13.953910, 107.621532', 24),
(629, 'Mang Yang', '13.992802, 108.285205', 24),
(630, 'Kông Chro', '13.703722, 108.570064', 24),
(631, 'Đức Cơ', '13.775233, 107.621532', 24),
(632, 'Chư Prông', '13.541918, 107.763621', 24),
(633, 'Chư Sê', '13.739963, 108.095435', 24),
(634, 'Đăk Pơ', '13.946425, 108.593812', 24),
(635, 'Ia Pa', '13.526151, 108.570064', 24),
(637, 'Krông Pa', '13.216004, 108.672689', 24),
(638, 'Phú Thiện', '13.458931, 108.285205', 24),
(639, 'Chư Pưh', '13.473053, 108.095435', 24),
(643, 'Buôn Ma Thuột', '12.666194, 108.038248', 19),
(644, 'Buôn Hồ', '12.850047, 108.25418', 19),
(645, 'Ea H\'leo', '13.199814, 108.190306', 19),
(646, 'Ea Súp', '13.186223, 107.763621', 19),
(647, 'Buôn Đôn', '12.879161, 107.71625', 19),
(648, 'Cư M\'gar', '12.852565, 108.095435', 19),
(649, 'Krông Búk', '13.022683, 108.190306', 19),
(650, 'Krông Năng', '13.008919, 108.380131', 19),
(651, 'Ea Kar', '12.798178, 108.546316', 19),
(652, 'M\'Đrắk', '12.716559, 108.760096', 19),
(653, 'Krông Bông', '12.473032, 108.475085', 19),
(654, 'Krông Pắc', '12.743997, 108.380131', 19),
(655, 'Krông A Na', '12.482379, 108.024301', 19),
(656, 'Lắk', '12.316936, 108.190306', 19),
(657, 'Cư Kuin', '12.581059, 108.190306', 19),
(660, 'Gia Nghĩa', '12.004520, 107.683', 20),
(661, 'Đăk Glong', '12.101364, 107.802354', 20),
(662, 'Cư Jút', '12.657282, 107.865612', 20),
(663, 'Đắk Mil', '12.504954, 107.692567', 20),
(664, 'Krông Nô', '12.342647, 107.811', 20),
(665, 'Đắk Song', '12.232831, 107.621679', 20),
(666, 'Đắk R\'Lấp', '11.921334, 107.526847', 20),
(667, 'Tuy Đức', '12.157612, 107.434231', 20),
(672, 'Đà Lạt', '11.940419, 108.458313', 36),
(673, 'Bảo Lộc', '11.573105, 107.834692', 36),
(674, 'Đam Rông', '12.059822, 108.095435', 36),
(675, 'Lạc Dương', '12.121831, 108.475085', 36),
(676, 'Lâm Hà', '11.790683, 108.190306', 36),
(677, 'Đơn Dương', '11.790683, 108.190306', 36),
(678, 'Đức Trọng', '11.641927, 108.310292', 36),
(679, 'Di Linh', '11.641927, 108.310292', 36),
(680, 'Bảo Lâm', '11.733786, 107.71625', 36),
(681, 'Đạ Huoai', '11.410152, 107.645208', 36),
(682, 'Đạ Tẻh', '11.570518, 107.526847', 36),
(683, 'Cát Tiên', '11.690336, 107.36123', 36),
(688, 'Phước Long', '11.833733, 106.994894', 15),
(689, 'Đồng Xoài', '11.534407, 106.890492', 15),
(690, 'Bình Long', '11.709652, 106.591164', 15),
(691, 'Bù Gia Mập', '11.915545, 107.002501', 15),
(692, 'Lộc Ninh', '11.803677, 106.581979', 15),
(693, 'Bù Đốp', '11.989187, 106.794241', 15),
(694, 'Hớn Quản', '11.601462, 106.65271', 15),
(695, 'Đồng Phú', '11.512336, 106.990547', 15),
(696, 'Bù Đăng', '11.769337, 107.148452', 15),
(697, 'Chơn Thành', '11.469690, 106.65271', 15),
(698, 'Phú Riềng', '11.659213, 106.898467', 15),
(703, 'Tây Ninh', '11.335155, 106.109885', 53),
(705, 'Tân Biên', '11.572115, 106.016997', 53),
(706, 'Tân Châu', '11.561439, 106.205148', 53),
(707, 'Dương Minh Châu', '11.359591, 106.275751', 53),
(708, 'Châu Thành', '9.921625, 105.807355', 53),
(709, 'Hòa Thành', '11.268046, 106.146332', 53),
(710, 'Gò Dầu', '11.140278, 106.275751', 53),
(711, 'Bến Cầu', '11.150637, 106.087533', 53),
(712, 'Trảng Bàng', '11.032811, 106.364568', 53),
(718, 'Thủ Dầu Một', '10.992984, 106.655707', 14),
(719, 'Bàu Bàng', '11.243119, 106.63535', 14),
(720, 'Dầu Tiếng', '11.348909, 106.464146', 14),
(721, 'Bến Cát', '11.138341, 106.61245', 14),
(722, 'Phú Giáo', '11.265582, 106.770646', 14),
(723, 'Tân Uyên', '11.049492, 106.757675', 14),
(724, 'Dĩ An', '10.896476, 106.752742', 14),
(725, 'Thuận An', '10.924067, 106.713031', 14),
(726, 'Bắc Tân Uyên', '11.138547, 106.843591', 14),
(731, 'Biên Hòa', '10.957413, 106.842687', 22),
(732, 'Long Khánh', '10.932957, 107.2437', 22),
(734, 'Tân Phú', '11.427531, 107.36123', 22),
(735, 'Vĩnh Cửu', '11.304901, 107.060528', 22),
(736, 'Định Quán', '11.157678, 107.274053', 22),
(737, 'Trảng Bom', '10.966704, 107.030322', 22),
(738, 'Thống Nhất', '10.994359, 107.154716', 22),
(739, 'Cẩm Mỹ', '10.822570, 107.26664', 22),
(740, 'Long Thành', '10.793295, 107.01353', 22),
(741, 'Xuân Lộc', '10.965203, 107.432196', 22),
(742, 'Nhơn Trạch', '10.696884, 106.89077', 22),
(747, 'Vũng Tàu', '10.411380, 107.136224', 7),
(748, 'Bà Rịa', '10.508928, 107.181626', 7),
(750, 'Châu Đức', '10.628470, 107.242998', 7),
(751, 'Xuyên Mộc', '10.617768, 107.432196', 7),
(752, 'Long Điền', '10.444924, 107.231177', 7),
(753, 'Đất Đỏ', '10.472803, 107.31393', 7),
(754, 'Tân Thành', '10.564073, 107.059523', 7),
(755, 'Côn Đảo', '8.700928, 106.611447', 7),
(760, 'Bình Chánh', '10.775659, 106.700424', 2),
(761, 'Bình Tân', '10.867153, 106.641332', 2),
(762, 'Bình Thạnh', '10.849409, 106.753706', 2),
(763, 'Cần Giờ', '10.842840, 106.828685', 2),
(764, 'Củ Chi', '10.838678, 106.66529', 2),
(765, 'Gò Vấp', '10.810583, 106.709142', 2),
(766, 'Hóc Môn', '10.801466, 106.652597', 2),
(767, 'Nhà Bè', '10.790052, 106.62819', 2),
(768, 'Phú Nhuận', '10.799194, 106.680264', 2),
(769, 'Quận 1', '10.787273, 106.74981', 2),
(770, 'Quận 10', '10.784370, 106.684409', 2),
(771, 'Quận 11', '10.774596, 106.667954', 2),
(772, 'Quận 12', '10.762974, 106.650084', 2),
(773, 'Quận 2', '10.757826, 106.701297', 2),
(774, 'Quận 3', '10.754028, 106.663375', 2),
(775, 'Quận 4', '10.748093, 106.635236', 2),
(776, 'Quận 5', '10.724088, 106.628626', 2),
(777, 'Quận 6', '10.765258, 106.603854', 2),
(778, 'Quận 7', '10.734034, 106.721579', 2),
(783, 'Quận 8', '11.006668, 106.513197', 2),
(784, 'Quận 9', '10.883968, 106.587061', 2),
(785, 'Tân Bình', '10.687392, 106.593854', 2),
(786, 'Tân Phú', '10.695264, 106.704874', 2),
(787, 'Thủ Đức', '10.508327, 106.8635', 2),
(794, 'Tân An', '10.538341, 106.40513', 39),
(795, 'Kiến Tường', '10.778731, 105.927857', 39),
(796, 'Tân Hưng', '10.822652, 105.664714', 39),
(797, 'Vĩnh Hưng', '10.902861, 105.805547', 39),
(798, 'Mộc Hóa', '10.764249, 105.946487', 39),
(799, 'Tân Thạnh', '10.607803, 106.016997', 39),
(800, 'Thạnh Hóa', '10.664587, 106.18162', 39),
(801, 'Đức Huệ', '10.877780, 106.275751', 39),
(802, 'Đức Hòa', '10.902338, 106.418534', 39),
(803, 'Bến Lức', '10.641162, 106.485601', 39),
(804, 'Thủ Thừa', '10.700686, 106.322834', 39),
(805, 'Tân Trụ', '10.528009, 106.499489', 39),
(806, 'Cần Đước', '10.554945, 106.605553', 39),
(807, 'Cần Giuộc', '10.600968, 106.665036', 39),
(808, 'Châu Thành', '9.921625, 105.807355', 39),
(815, 'Mỹ Tho', '10.376528, 106.343889', 58),
(816, 'Gò Công', '10.364580, 106.678122', 58),
(817, 'Cai Lậy', '10.405064, 106.118672', 58),
(818, 'Tân Phước', '10.531421, 106.22868', 58),
(819, 'Cái Bè', '10.371887, 105.946487', 58),
(820, 'Cai Lậy', '10.428740, 106.11105', 58),
(821, 'Châu Thành', '9.921625, 105.807355', 58),
(822, 'Chợ Gạo', '10.379390, 106.45419', 58),
(823, 'Gò Công Tây', '10.337863, 106.605553', 58),
(824, 'Gò Công Đông', '10.373725, 106.747054', 58),
(825, 'Tân Phú Đông', '10.246243, 106.699877', 58),
(829, 'Bến Tre', '10.243356, 106.375551', 12),
(831, 'Châu Thành', '9.921625, 105.807355', 12),
(832, 'Chợ Lách', '10.241094, 106.169856', 12),
(833, 'Mỏ Cày Nam', '10.046840, 106.369927', 12),
(834, 'Giồng Trôm', '10.171884, 106.464146', 12),
(835, 'Bình Đại', '10.159690, 106.699877', 12),
(836, 'Ba Tri', '10.041785, 106.593674', 12),
(837, 'Thạnh Phú', '9.907723, 106.558407', 12),
(838, 'Mỏ Cày Bắc', '10.170076, 106.287521', 12),
(842, 'Trà Vinh', '9.951332, 106.334606', 59),
(844, 'Càng Long', '9.967409, 106.22868', 59),
(845, 'Cầu Kè', '9.887886, 106.087533', 59),
(846, 'Tiểu Cần', '9.796916, 106.18162', 59),
(847, 'Châu Thành', '9.921625, 105.807355', 59),
(848, 'Cầu Ngang', '9.783052, 106.464146', 59),
(849, 'Trà Cú', '9.706085, 106.275751', 59),
(850, 'Duyên Hải', '9.631184, 106.487707', 59),
(851, 'Duyên Hải', '9.633161, 106.497573', 59),
(855, 'Vĩnh Long', '10.239574, 105.957193', 61),
(857, 'Long Hồ', '10.198068, 105.946487', 61),
(858, 'Mang Thít', '10.180760, 106.075775', 61),
(859, 'Vũng Liêm', '10.058632, 106.13457', 61),
(860, 'Tam Bình', '10.067936, 105.946487', 61),
(861, 'Bình Minh', '10.070517, 105.822946', 61),
(862, 'Trà Ôn', '9.978996, 105.993491', 61),
(863, 'Bình Tân', '10.121889, 105.772886', 61),
(866, 'Cao Lãnh', '10.454972, 105.634035', 23),
(867, 'Sa Đéc', '10.290126, 105.751745', 23),
(868, 'Hồng Ngự', '10.808296, 105.34143', 23),
(869, 'Tân Hồng', '10.876115, 105.477108', 23),
(870, 'Hồng Ngự', '10.808296, 105.34143', 23),
(871, 'Tam Nông', '21.285868, 105.231183', 23),
(872, 'Tháp Mười', '10.530271, 105.82903', 23),
(873, 'Cao Lãnh', '10.465958, 105.705979', 23),
(874, 'Thanh Bình', '10.613529, 105.477108', 23),
(875, 'Lấp Vò', '10.357805, 105.630816', 23),
(876, 'Lai Vung', '10.255455, 105.664714', 23),
(877, 'Châu Thành', '9.921625, 105.807355', 23),
(884, 'Châu Đốc', '10.702239, 105.108726', 6),
(886, 'An Phú', '10.851217, 105.102508', 6),
(887, 'Tân Châu', '10.842354, 105.18435', 6),
(888, 'Phú Tân', '10.666615, 105.289704', 6),
(889, 'Châu Phú', '10.563026, 105.172682', 6),
(890, 'Tịnh Biên', '10.549107, 105.008989', 6),
(891, 'Tri Tôn', '10.397232, 104.985618', 6),
(892, 'Châu Thành', '9.921625, 105.807355', 6),
(893, 'Chợ Mới', '10.482525, 105.477108', 6),
(894, 'Thoại Sơn', '10.259510, 105.2608', 6),
(899, 'Rạch Giá', '10.021507, 105.091097', 33),
(900, 'Hà Tiên', '10.381909, 104.490173', 33),
(902, 'Kiên Lương', '10.032825, 104.550961', 33),
(903, 'Hòn Đất', '10.222700, 104.985618', 33),
(904, 'Tân Hiệp', '10.115436, 105.28344', 33),
(905, 'Châu Thành', '9.921625, 105.807355', 33),
(906, 'Giồng Riềng', '9.923822, 105.372885', 33),
(907, 'Gò Quao', '9.752508, 105.289704', 33),
(908, 'An Biên', '9.806456, 105.055742', 33),
(909, 'An Minh', '9.664718, 104.949565', 33),
(910, 'Vĩnh Thuận', '9.538413, 105.242885', 33),
(911, 'Phú Quốc', '10.222873, 103.962626', 33),
(912, 'Kiên Hải', '9.809136, 104.629634', 33),
(913, 'U Minh Thượng', '9.631113, 105.102508', 33),
(914, 'Giang Thành', '10.477136, 104.682105', 33),
(916, 'Ninh Kiều', '10.027254, 105.769804', 5),
(917, 'Ô Môn', '10.116494, 105.632646', 5),
(918, 'Bình Thuỷ', '10.062257, 105.738102', 5),
(919, 'Cái Răng', '9.999239, 105.804357', 5),
(923, 'Thốt Nốt', '10.240534, 105.533682', 5),
(924, 'Vĩnh Thạnh', '10.232270, 105.398703', 5),
(925, 'Cờ Đỏ', '10.097230, 105.430442', 5),
(926, 'Phong Điền', '9.996766, 105.668661', 5),
(927, 'Thới Lai', '10.068188, 105.559973', 5),
(930, 'Vị Thanh', '9.773192, 105.453708', 29),
(931, 'Ngã Bảy', '9.825257, 105.817288', 29),
(932, 'Châu Thành A', '9.926726, 105.631559', 29),
(933, 'Châu Thành', '9.921625, 105.807355', 29),
(934, 'Phụng Hiệp', '9.776213, 105.711646', 29),
(935, 'Vị Thuỷ', '9.826082, 105.570887', 29),
(936, 'Long Mỹ', '9.655285, 105.523991', 29),
(937, 'Long Mỹ', '9.669597, 105.565024', 29),
(941, 'Sóc Trăng', '9.602521, 105.973905', 94),
(942, 'Châu Thành', '9.921625, 105.807355', 51),
(943, 'Kế Sách', '9.831011, 105.92299', 51),
(944, 'Mỹ Tú', '9.599104, 105.805547', 51),
(945, 'Cù Lao Dung', '9.579152, 106.22868', 51),
(946, 'Long Phú', '9.628942, 106.087533', 51),
(947, 'Mỹ Xuyên', '9.465511, 105.899496', 51),
(948, 'Ngã Năm', '9.521517, 105.617794', 51),
(949, 'Thạnh Trị', '9.474141, 105.711646', 51),
(950, 'Vĩnh Châu', '9.324958, 105.980454', 51),
(951, 'Trần Đề', '9.499780, 106.087533', 51),
(954, 'Bạc Liêu', '9.294003, 105.721566', 10),
(956, 'Hồng Dân', '9.553903, 105.45205', 10),
(957, 'Phước Long', '9.400671, 105.430238', 10),
(958, 'Vĩnh Lợi', '9.345030, 105.711646', 10),
(959, 'Giá Rai', '9.260136, 105.375313', 10),
(960, 'Đông Hải', '9.163064, 105.453672', 10),
(961, 'Hoà Bình', '9.270459, 105.589739', 10),
(964, 'Cà Mau', '9.152673, 105.196079', 17),
(966, 'U Minh', '9.355443, 104.985618', 17),
(967, 'Thới Bình', '9.347363, 105.172682', 17),
(968, 'Trần Văn Thời', '9.100972, 104.892167', 17),
(969, 'Cái Nước', '8.986776, 105.055742', 17),
(970, 'Đầm Dơi', '8.999419, 105.266293', 17),
(971, 'Năm Căn', '8.815307, 105.055742', 17),
(972, 'Phú Tân', '10.666615, 105.289704', 17),
(973, 'Ngọc Hiển', '8.667726, 105.003237', 17);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `table_order`
--

CREATE TABLE `table_order` (
  `id_order` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `id_agent` varchar(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `delivery_status` enum('Chờ tiếp nhận','Chờ giao hàng','Đang giao hàng','Đã giao hàng') NOT NULL,
  `receiver_name` varchar(250) NOT NULL,
  `receiver_phone` varchar(250) NOT NULL,
  `receiver_id_district` int(11) NOT NULL,
  `alert_status` enum('yes','no') NOT NULL DEFAULT 'no',
  `order_customer_point` int(11) NOT NULL,
  `order_agent_point` int(11) NOT NULL,
  `receiver_address` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `table_order`
--

INSERT INTO `table_order` (`id_order`, `id_customer`, `id_agent`, `date_created`, `delivery_status`, `receiver_name`, `receiver_phone`, `receiver_id_district`, `alert_status`, `order_customer_point`, `order_agent_point`, `receiver_address`) VALUES
(18, 1, '1', '2019-04-04 16:28:20', 'Chờ giao hàng', 'Trần Đăng Khoa', '0984840705', 762, 'no', 0, 0, '157/17/1 Đường D2, Phường 25, Quận Bình Thạnh'),
(19, 1, '1', '2019-04-05 09:43:49', 'Đã giao hàng', 'Nguyễn Thị Bưởi', '0919191919', 762, 'no', 0, 0, '157/17/1 Đường D2, Phường 25, Quận Bình Thạnh'),
(22, 1, '22', '2019-04-05 14:53:30', 'Đã giao hàng', 'Nguyễn Thị Bưởi', '0919191919', 762, 'no', 0, 0, '157/17/1 Đường D2, Phường 25, Quận Bình Thạnh'),
(23, 1, '23', '2019-04-05 14:56:54', 'Đã giao hàng', 'Nguyễn Thị Bưởi', '0919191919', 762, 'no', 0, 0, '9999 Đường D2, Phường 25, Quận Bình Thạnh'),
(24, 1, '20', '2019-03-06 14:57:04', 'Đã giao hàng', 'Nguyễn Thị Bưởi', '0919191919', 762, 'no', 0, 0, '9999 Đường D2, Phường 25, Quận Bình Thạnh'),
(25, 1, '22', '2019-02-06 15:42:28', 'Đã giao hàng', 'Nguyễn Thị Bưởi', '0919191919', 762, 'no', 0, 0, '9999 Đường D2, Phường 25, Quận Bình Thạnh'),
(26, 1, '21', '2019-04-05 15:42:31', 'Đã giao hàng', 'Nguyễn Thị Bưởi 2', '0919191919', 762, 'no', 0, 0, '9999 Đường D2, Phường 25, Quận Bình Thạnh'),
(27, 1, '7', '2019-04-05 15:42:34', 'Chờ giao hàng', 'Nguyễn Thị Bưởi 2 3', '0919191919', 762, 'no', 0, 0, '9999 Đường D2, Phường 25, Quận Bình Thạnh'),
(28, 1, '1', '2019-04-05 15:43:03', 'Chờ giao hàng', 'Nguyễn Thị Bưởi 2 3', '0919191919', 762, 'no', 0, 0, '9999 Đường D2, Phường 25, Quận Bình Thạnh'),
(29, 1, '7', '2019-04-05 15:43:04', 'Đã giao hàng', 'Nguyễn Thị Bưởi 2 3', '0919191919', 762, 'no', 0, 0, '9999 Đường D2, Phường 25, Quận Bình Thạnh'),
(30, 1, '7', '2019-04-08 08:49:27', 'Chờ giao hàng', 'tran dang khoa', '0984840705', 762, 'no', 0, 0, '123456 test'),
(32, 1, '2', '2019-04-08 08:50:16', 'Đang giao hàng', 'tran dang khoa', '0984840705', 762, 'no', 0, 0, '123456 test'),
(39, 1, '1', '2019-04-12 02:18:45', 'Đã giao hàng', 'Trần Đăng Khoa', '0984840705', 763, 'no', 0, 0, '157/17/1 Đường D2, Phường 25, Quận Bình Thạnh'),
(40, 1, '1', '2019-04-12 02:56:31', 'Đã giao hàng', 'Trần Đăng Khoa', '0984840705', 307, 'no', 0, 0, '157/17/1 Đường D2, Phường 25, Quận Bình Thạnh'),
(41, 2, '1', '2019-04-12 03:32:19', 'Đã giao hàng', 'Phạm Hoàng Huyến', '0984123456', 306, 'no', 0, 0, '135 nguyễn trung trực tp hcm'),
(42, 7, '7', '2019-04-12 03:47:51', 'Đã giao hàng', 'Tran trui trui', '098484123652', 760, 'no', 0, 0, 'nguyen xi go vap hcm'),
(43, 1, '2', '2019-04-13 08:46:02', 'Đã giao hàng', 'tran dang khoa', '0984840705', 762, 'no', 0, 0, '123456 test'),
(44, 1, '2', '2019-04-13 08:48:11', 'Đã giao hàng', 'tran dang khoa', '0984840705', 762, 'no', 0, 0, '123456 test'),
(45, 1, '1', '2019-04-13 08:48:16', 'Đang giao hàng', 'tran dang khoa', '0984840705', 762, 'no', 0, 0, '123456 test'),
(46, 1, '', '2019-04-17 15:36:11', 'Chờ tiếp nhận', 'tran dang khoa', '0984840705', 762, 'no', 0, 0, '123456 test'),
(47, 1, '1', '2019-04-17 15:36:13', 'Đang giao hàng', 'tran dang khoa', '0984840705', 762, 'no', 0, 0, '123456 test'),
(48, 1, '', '2019-04-17 15:36:15', 'Chờ tiếp nhận', 'tran dang khoa', '0984840705', 762, 'no', 0, 0, '123456 test'),
(49, 1, '1', '2019-04-17 15:38:18', 'Chờ giao hàng', 'tran dang khoa', '0984840705', 762, 'no', 0, 0, '435-437 Xô Viết Nghệ Tĩnh, Phường 26, Bình Thạnh, Hồ Chí Minh, Việt Nam'),
(50, 1, '', '2019-04-17 15:38:19', 'Chờ tiếp nhận', 'tran dang khoa', '0984840705', 762, 'no', 0, 0, '435-437 Xô Viết Nghệ Tĩnh, Phường 26, Bình Thạnh, Hồ Chí Minh, Việt Nam'),
(51, 1, '', '2019-04-17 15:40:05', 'Chờ tiếp nhận', 'tran dang khoa', '0984840705', 772, 'no', 0, 0, 'QL1A, An Phú Đông, Quận 12, Hồ Chí Minh, Việt Nam');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `table_order_detail`
--

CREATE TABLE `table_order_detail` (
  `id_order_detail` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` int(11) NOT NULL,
  `pass_to_other` enum('yes','no') NOT NULL DEFAULT 'no'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `table_order_detail`
--

INSERT INTO `table_order_detail` (`id_order_detail`, `id_order`, `id_product`, `quantity`, `unit_price`, `pass_to_other`) VALUES
(29, 19, 1, 9, 22280000, 'no'),
(30, 19, 2, 9, 12321000, 'no'),
(31, 1, 1, 9, 22280000, 'no'),
(32, 1, 2, 9, 12321000, 'no'),
(33, 2, 1, 9, 22280000, 'no'),
(34, 2, 2, 9, 12321000, 'no'),
(35, 22, 1, 9, 22280000, 'no'),
(36, 22, 2, 9, 12321000, 'no'),
(37, 23, 1, 9, 22280000, 'no'),
(38, 23, 2, 9, 12321000, 'no'),
(39, 24, 1, 9, 22280000, 'no'),
(40, 24, 2, 9, 12321000, 'no'),
(41, 25, 1, 9, 22280000, 'no'),
(42, 25, 2, 9, 12321000, 'no'),
(43, 26, 1, 9, 22280000, 'no'),
(44, 26, 2, 9, 12321000, 'no'),
(45, 27, 1, 9, 22280000, 'no'),
(46, 27, 2, 9, 12321000, 'no'),
(47, 28, 69, 9, 35094000, 'no'),
(48, 28, 96, 9, 35946000, 'no'),
(49, 29, 69, 9, 35094000, 'no'),
(50, 29, 96, 9, 35946000, 'no'),
(51, 30, 1, 2, 22280000, 'no'),
(52, 30, 2, 8, 12321000, 'no'),
(55, 32, 1, 2, 22280000, 'no'),
(56, 32, 2, 8, 12321000, 'no'),
(66, 39, 1, 3, 22280000, 'no'),
(67, 40, 1, 2, 22280000, 'no'),
(68, 40, 0, 0, 22280000, 'no'),
(69, 41, 1, 2, 22280000, 'no'),
(70, 41, 0, 0, 22280000, 'no'),
(82, 42, 3, 5, 18171000, 'no'),
(83, 43, 1, 2, 22280000, 'no'),
(84, 43, 2, 8, 12321000, 'no'),
(85, 44, 1, 2, 22280000, 'no'),
(86, 44, 2, 8, 12321000, 'no'),
(91, 45, 1, 2, 22280000, 'no'),
(92, 45, 2, 8, 12321000, 'no'),
(93, 45, 99, 3, 1741000, 'no'),
(94, 45, 79, 3, 23535000, 'no'),
(95, 46, 46, 2, 24143000, 'no'),
(96, 46, 70, 8, 19900000, 'no'),
(97, 47, 46, 2, 24143000, 'no'),
(98, 47, 70, 8, 19900000, 'no'),
(99, 48, 46, 2, 24143000, 'no'),
(100, 48, 70, 8, 19900000, 'no'),
(101, 49, 46, 2, 24143000, 'no'),
(102, 49, 70, 8, 19900000, 'no'),
(103, 50, 46, 2, 24143000, 'no'),
(104, 50, 70, 8, 19900000, 'no'),
(105, 51, 46, 2, 24143000, 'no'),
(106, 51, 70, 8, 19900000, 'no'),
(113, 18, 70, 9, 19900000, 'no'),
(114, 18, 45, 9, 23029000, 'no');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `table_producer`
--

CREATE TABLE `table_producer` (
  `id_producer` int(11) NOT NULL,
  `producer_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `table_producer`
--

INSERT INTO `table_producer` (`id_producer`, `producer_name`) VALUES
(1, 'Samsung'),
(2, 'Toshiba'),
(3, 'Aqua'),
(4, 'Media'),
(5, 'Panasonic'),
(6, 'Mitsubishi'),
(9, 'LG'),
(11, 'Electrolux'),
(13, 'Beko'),
(16, 'Happycook'),
(17, 'Sunhouse'),
(18, 'Pioneer'),
(20, 'Asus'),
(21, 'HP'),
(27, 'Philips');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `table_product`
--

CREATE TABLE `table_product` (
  `id_product` int(11) NOT NULL,
  `id_category` int(11) NOT NULL,
  `id_producer` int(11) NOT NULL,
  `product_name` varchar(200) NOT NULL,
  `product_description` text NOT NULL,
  `product_price` bigint(20) NOT NULL,
  `product_additional_information` text NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_hot` enum('yes','no') NOT NULL DEFAULT 'no',
  `product_price_4compare1` bigint(50) NOT NULL,
  `product_price_4compare2` bigint(20) NOT NULL,
  `product_price_4compare3` bigint(20) NOT NULL,
  `customer_point` int(11) NOT NULL,
  `agent_point` int(11) NOT NULL,
  `shop1_name` varchar(250) NOT NULL,
  `shop2_name` varchar(250) NOT NULL,
  `shop3_name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `table_product`
--

INSERT INTO `table_product` (`id_product`, `id_category`, `id_producer`, `product_name`, `product_description`, `product_price`, `product_additional_information`, `date_created`, `is_hot`, `product_price_4compare1`, `product_price_4compare2`, `product_price_4compare3`, `customer_point`, `agent_point`, `shop1_name`, `shop2_name`, `shop3_name`) VALUES
(1, 1, 1, 'Smart Tivi Samsung 32 inch UA32N4300 vtbs1lv3277-1519804965 UA32N4300UA32N4300 1519804965     ', 'Độ ph&acirc;n giải HD sắc n&eacute;t c&ugrave;ng c&ocirc;ng nghệ HDR cho h&igrave;nh ảnh ch&acirc;n thực như thật<br />\r\nC&ocirc;ng nghệ X-Reality PRO tăng cường độ s&aacute;ng, độ n&eacute;t cho h&igrave;nh ảnh ho&agrave;n hảo<br />\r\nC&ocirc;ng nghệ &acirc;m thanh ClearAudio+ &acirc;m thanh r&otilde; r&agrave;ng cho bạn cảm gi&aacute;c như đang h&ograve;a m&igrave;nh v&agrave;o trong kh&ocirc;ng gian thưởng thức<br />\r\nHệ điều h&agrave;nh Linux trực quan dễ sử dụng đi k&egrave;m kho ứng dụng VEWD phong ph&uacute;, đa dạng<br />\r\nHỗ trợ chiếu m&agrave;n h&igrave;nh điện thoại l&ecirc;n tivi Screen Mirroring (Miracast)<br />\r\nC&ocirc;ng nghệ X-Protection PRO gi&uacute;p tivi hạn chế khỏi bụi bẩn, độ ẩm, d&ograve;ng d&ograve;ng d&ograve;ng ...', 22280000, '<strong>1. CH&Iacute;NH S&Aacute;CH BẢO H&Agrave;NH</strong>\r\n<p><strong>Điều kiện &aacute;p dụng:</strong></p>\r\n\r\n<p>- Kh&aacute;ch h&agrave;ng vui l&ograve;ng xuất tr&igrave;nh phiếu bảo h&agrave;nh để được &aacute;p dụng ch&iacute;nh s&aacute;ch bảo h&agrave;nh.</p>\r\n\r\n<p>- Sản phẩm được&nbsp;<strong>bảo h&agrave;nh miễn ph&iacute;</strong>&nbsp;trong suốt thời gian sử dụng trong c&aacute;c trường hợp sau:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + L&oacute;t tẩy, đệm l&oacute;t tẩy, d&aacute;n đế chống trơn, đế bị bong keo, m&ograve;n đinh g&oacute;t, đứt thun, đứt chỉ.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c chi tiết trang tr&iacute;, phụ kiện (kh&oacute;a, m&oacute;c, d&acirc;y k&eacute;o,... ). C&aacute;c phụ kiện gắn tr&ecirc;n sản phẩm nếu kh&ocirc;ng c&ograve;n phụ kiện thay thế sẽ thay bằng phụ kiện kh&aacute;c tương tự.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Lỗi sơn viền.</p>\r\n\r\n<p>- Ch&uacute;ng t&ocirc;i&nbsp;từ chối bảo h&agrave;nh sản phẩm đối với c&aacute;c trường hợp:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm kh&ocirc;ng c&oacute; phiếu bảo h&agrave;nh.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm qu&aacute; cũ (da v&agrave; đế qu&aacute; cũ, kh&ocirc;ng c&ograve;n độ b&aacute;m d&iacute;nh giữa da v&agrave; keo).</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm bị hư hỏng v&agrave; lỗi từ ph&iacute;a kh&aacute;ch h&agrave;ng g&acirc;y n&ecirc;n như trầy xước, đế m&ograve;n, sản phẩm kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn do bị động vật cắn, bảo quản kh&ocirc;ng tốt g&acirc;y ẩm mốc, phai nắng, n&oacute;ng chảy, &hellip;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c sản phẩm khuyến m&atilde;i, giảm gi&aacute;.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n<strong>2. QUY ĐỊNH ĐỔI SẢN PHẨM</strong>\r\n\r\n<p>- Sản phẩm được đổi trong v&ograve;ng 07 ng&agrave;y kể từ ng&agrave;y mua v&agrave; chỉ đổi 01 lần duy nhất với gi&aacute; trị bằng hoặc cao hơn, nếu thấp hơn sẽ kh&ocirc;ng được ho&agrave;n tiền.</p>\r\n\r\n<p>- Sản phẩm đổi phải c&ograve;n h&oacute;a đơn, phiếu bảo h&agrave;nh v&agrave; tem thương hiệu.</p>\r\n\r\n<p>- Sản phẩm phải c&ograve;n nguy&ecirc;n vẹn, đế kh&ocirc;ng bị trầy, bị dơ hoặc c&oacute; dấu hiệu đ&atilde; sử dụng.</p>\r\n\r\n<p>- Kh&ocirc;ng &aacute;p dụng ch&iacute;nh s&aacute;ch đổi đối với c&aacute;c sản phẩm đ&atilde; qu&aacute; thời gian đổi, sản phẩm đ&atilde; sử dụng, kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn.</p>\r\n\r\n<p>- C&aacute;c sản phẩm đ&atilde; được thay đổi một số chi tiết theo y&ecirc;u cầu kh&aacute;ch h&agrave;ng đều kh&ocirc;ng được đổi trả hoặc ho&agrave;n tiền.</p>\r\n\r\n<p>- C&aacute;c sản phẩm giảm gi&aacute;, khuyến m&atilde;i, h&agrave;ng tặng được &aacute;p dụng ch&iacute;nh s&aacute;ch đổi theo quy định của từng chương tr&igrave;nh.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n', '2019-04-09 04:21:31', 'yes', 27062000, 26705000, 23375000, 14, 5, 'Lazada', 'Tiki', 'Shopee'),
(2, 1, 2, 'Smart Tivi Toshiba 32 inch KDL-32W610F', 'Độ ph&acirc;n giải HD sắc n&eacute;t c&ugrave;ng c&ocirc;ng nghệ HDR cho h&igrave;nh ảnh ch&acirc;n thực như thật<br />\r\nC&ocirc;ng nghệ X-Reality PRO tăng cường độ s&aacute;ng, độ n&eacute;t cho h&igrave;nh ảnh ho&agrave;n hảo<br />\r\nC&ocirc;ng nghệ &acirc;m thanh ClearAudio+ &acirc;m thanh r&otilde; r&agrave;ng cho bạn cảm gi&aacute;c như đang h&ograve;a m&igrave;nh v&agrave;o trong kh&ocirc;ng gian thưởng thức<br />\r\nHệ điều h&agrave;nh Linux trực quan dễ sử dụng đi k&egrave;m kho ứng dụng VEWD phong ph&uacute;, đa dạng<br />\r\nHỗ trợ chiếu m&agrave;n h&igrave;nh điện thoại l&ecirc;n tivi Screen Mirroring (Miracast)<br />\r\nC&ocirc;ng nghệ X-Protection PRO gi&uacute;p tivi hạn chế khỏi bụi bẩn, độ ẩm, d&ograve;ng', 12321000, '<strong>1. CH&Iacute;NH S&Aacute;CH BẢO H&Agrave;NH</strong>\r\n<p><strong>Điều kiện &aacute;p dụng:</strong></p>\r\n\r\n<p>- Kh&aacute;ch h&agrave;ng vui l&ograve;ng xuất tr&igrave;nh phiếu bảo h&agrave;nh để được &aacute;p dụng ch&iacute;nh s&aacute;ch bảo h&agrave;nh.</p>\r\n\r\n<p>- Sản phẩm được&nbsp;<strong>bảo h&agrave;nh miễn ph&iacute;</strong>&nbsp;trong suốt thời gian sử dụng trong c&aacute;c trường hợp sau:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + L&oacute;t tẩy, đệm l&oacute;t tẩy, d&aacute;n đế chống trơn, đế bị bong keo, m&ograve;n đinh g&oacute;t, đứt thun, đứt chỉ.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c chi tiết trang tr&iacute;, phụ kiện (kh&oacute;a, m&oacute;c, d&acirc;y k&eacute;o,... ). C&aacute;c phụ kiện gắn tr&ecirc;n sản phẩm nếu kh&ocirc;ng c&ograve;n phụ kiện thay thế sẽ thay bằng phụ kiện kh&aacute;c tương tự.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Lỗi sơn viền.</p>\r\n\r\n<p>- Ch&uacute;ng t&ocirc;i&nbsp;từ chối bảo h&agrave;nh sản phẩm đối với c&aacute;c trường hợp:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm kh&ocirc;ng c&oacute; phiếu bảo h&agrave;nh.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm qu&aacute; cũ (da v&agrave; đế qu&aacute; cũ, kh&ocirc;ng c&ograve;n độ b&aacute;m d&iacute;nh giữa da v&agrave; keo).</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm bị hư hỏng v&agrave; lỗi từ ph&iacute;a kh&aacute;ch h&agrave;ng g&acirc;y n&ecirc;n như trầy xước, đế m&ograve;n, sản phẩm kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn do bị động vật cắn, bảo quản kh&ocirc;ng tốt g&acirc;y ẩm mốc, phai nắng, n&oacute;ng chảy, &hellip;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c sản phẩm khuyến m&atilde;i, giảm gi&aacute;.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n<strong>2. QUY ĐỊNH ĐỔI SẢN PHẨM</strong>\r\n\r\n<p>- Sản phẩm được đổi trong v&ograve;ng 07 ng&agrave;y kể từ ng&agrave;y mua v&agrave; chỉ đổi 01 lần duy nhất với gi&aacute; trị bằng hoặc cao hơn, nếu thấp hơn sẽ kh&ocirc;ng được ho&agrave;n tiền.</p>\r\n\r\n<p>- Sản phẩm đổi phải c&ograve;n h&oacute;a đơn, phiếu bảo h&agrave;nh v&agrave; tem thương hiệu.</p>\r\n\r\n<p>- Sản phẩm phải c&ograve;n nguy&ecirc;n vẹn, đế kh&ocirc;ng bị trầy, bị dơ hoặc c&oacute; dấu hiệu đ&atilde; sử dụng.</p>\r\n\r\n<p>- Kh&ocirc;ng &aacute;p dụng ch&iacute;nh s&aacute;ch đổi đối với c&aacute;c sản phẩm đ&atilde; qu&aacute; thời gian đổi, sản phẩm đ&atilde; sử dụng, kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn.</p>\r\n\r\n<p>- C&aacute;c sản phẩm đ&atilde; được thay đổi một số chi tiết theo y&ecirc;u cầu kh&aacute;ch h&agrave;ng đều kh&ocirc;ng được đổi trả hoặc ho&agrave;n tiền.</p>\r\n\r\n<p>- C&aacute;c sản phẩm giảm gi&aacute;, khuyến m&atilde;i, h&agrave;ng tặng được &aacute;p dụng ch&iacute;nh s&aacute;ch đổi theo quy định của từng chương tr&igrave;nh.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n', '2019-04-09 04:21:31', 'yes', 13831000, 13423000, 15863000, 6, 4, 'Lazada', 'Tiki', 'Shopee'),
(3, 1, 1, 'Tivi Samsung', 'Độ ph&acirc;n giải HD sắc n&eacute;t tr&ecirc;n m&agrave;n hinh tivi 32 inch<br />\r\nC&ocirc;ng nghệ Wide Color Enhancer cho dải m&agrave;u rộng, m&agrave;u sắc sống động rực rỡ<br />\r\nM&agrave;u đen s&acirc;u, m&agrave;u s&aacute;ng tươi mới hơn với c&ocirc;ng nghệ Contrast Enhancer<br />\r\nC&ocirc;ng suất loa l&ecirc;n đến 10W cho &acirc;m thanh r&otilde; r&agrave;ng, mạnh mẽ<br />\r\nT&iacute;ch hợp đầu thu DVB-T2 gi&uacute;p xem được nhiều k&ecirc;nh truyền h&igrave;nh miễn ph&iacute;', 18171000, '<strong>1. CH&Iacute;NH S&Aacute;CH BẢO H&Agrave;NH</strong>\r\n<p><strong>Điều kiện &aacute;p dụng:</strong></p>\r\n\r\n<p>- Kh&aacute;ch h&agrave;ng vui l&ograve;ng xuất tr&igrave;nh phiếu bảo h&agrave;nh để được &aacute;p dụng ch&iacute;nh s&aacute;ch bảo h&agrave;nh.</p>\r\n\r\n<p>- Sản phẩm được&nbsp;<strong>bảo h&agrave;nh miễn ph&iacute;</strong>&nbsp;trong suốt thời gian sử dụng trong c&aacute;c trường hợp sau:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + L&oacute;t tẩy, đệm l&oacute;t tẩy, d&aacute;n đế chống trơn, đế bị bong keo, m&ograve;n đinh g&oacute;t, đứt thun, đứt chỉ.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c chi tiết trang tr&iacute;, phụ kiện (kh&oacute;a, m&oacute;c, d&acirc;y k&eacute;o,... ). C&aacute;c phụ kiện gắn tr&ecirc;n sản phẩm nếu kh&ocirc;ng c&ograve;n phụ kiện thay thế sẽ thay bằng phụ kiện kh&aacute;c tương tự.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Lỗi sơn viền.</p>\r\n\r\n<p>- Ch&uacute;ng t&ocirc;i&nbsp;từ chối bảo h&agrave;nh sản phẩm đối với c&aacute;c trường hợp:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm kh&ocirc;ng c&oacute; phiếu bảo h&agrave;nh.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm qu&aacute; cũ (da v&agrave; đế qu&aacute; cũ, kh&ocirc;ng c&ograve;n độ b&aacute;m d&iacute;nh giữa da v&agrave; keo).</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm bị hư hỏng v&agrave; lỗi từ ph&iacute;a kh&aacute;ch h&agrave;ng g&acirc;y n&ecirc;n như trầy xước, đế m&ograve;n, sản phẩm kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn do bị động vật cắn, bảo quản kh&ocirc;ng tốt g&acirc;y ẩm mốc, phai nắng, n&oacute;ng chảy, &hellip;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c sản phẩm khuyến m&atilde;i, giảm gi&aacute;.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n<strong>2. QUY ĐỊNH ĐỔI SẢN PHẨM</strong>\r\n\r\n<p>- Sản phẩm được đổi trong v&ograve;ng 07 ng&agrave;y kể từ ng&agrave;y mua v&agrave; chỉ đổi 01 lần duy nhất với gi&aacute; trị bằng hoặc cao hơn, nếu thấp hơn sẽ kh&ocirc;ng được ho&agrave;n tiền.</p>\r\n\r\n<p>- Sản phẩm đổi phải c&ograve;n h&oacute;a đơn, phiếu bảo h&agrave;nh v&agrave; tem thương hiệu.</p>\r\n\r\n<p>- Sản phẩm phải c&ograve;n nguy&ecirc;n vẹn, đế kh&ocirc;ng bị trầy, bị dơ hoặc c&oacute; dấu hiệu đ&atilde; sử dụng.</p>\r\n\r\n<p>- Kh&ocirc;ng &aacute;p dụng ch&iacute;nh s&aacute;ch đổi đối với c&aacute;c sản phẩm đ&atilde; qu&aacute; thời gian đổi, sản phẩm đ&atilde; sử dụng, kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn.</p>\r\n\r\n<p>- C&aacute;c sản phẩm đ&atilde; được thay đổi một số chi tiết theo y&ecirc;u cầu kh&aacute;ch h&agrave;ng đều kh&ocirc;ng được đổi trả hoặc ho&agrave;n tiền.</p>\r\n\r\n<p>- C&aacute;c sản phẩm giảm gi&aacute;, khuyến m&atilde;i, h&agrave;ng tặng được &aacute;p dụng ch&iacute;nh s&aacute;ch đổi theo quy định của từng chương tr&igrave;nh.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n', '2019-04-09 04:21:31', 'no', 21631000, 22183000, 20942000, 11, 8, 'Lazada', 'Tiki', 'Shopee'),
(4, 1, 9, 'Smart Tivi LG 4K 43 inch 43UK6340PTF', 'Độ ph&acirc;n giải 4K sắc n&eacute;t gấp 4 lần tivi Full HD th&ocirc;ng thường<br />\r\nC&ocirc;ng nghệ Active HDR v&agrave; HDR Effect cho h&igrave;nh ảnh ch&acirc;n thật từng chi tiết<br />\r\nN&acirc;ng cấp h&igrave;nh ảnh độ ph&acirc;n giải thấp l&ecirc;n gần bằng 4K với 4K Upscaler<br />\r\nC&ocirc;ng nghệ &acirc;m thanh DTS Virtual:X mang đến &acirc;m thanh v&ograve;m sống động mạnh mẽ<br />\r\nH&ecirc;̣ đi&ecirc;̀u hành WebOS 4<br />\r\n0 d&ecirc;̃ sử dụng, đi kèm remote th&ocirc;ng minh h&ocirc;̃ trợ tìm ki&ecirc;́m giọng nói bằng ti&ecirc;́ng Vi&ecirc;̣t cả 3 mi&ecirc;̀n<br />\r\nH&ocirc;̃ trợ chi&ecirc;́u màn hình đi&ecirc;̣n thoại l&ecirc;n tivi và đi&ecirc;̀u khi&ecirc;̉n tivi bằng đi&ecirc;̣n thoa', 26786000, '<strong>1. CH&Iacute;NH S&Aacute;CH BẢO H&Agrave;NH</strong>\r\n<p><strong>Điều kiện &aacute;p dụng:</strong></p>\r\n\r\n<p>- Kh&aacute;ch h&agrave;ng vui l&ograve;ng xuất tr&igrave;nh phiếu bảo h&agrave;nh để được &aacute;p dụng ch&iacute;nh s&aacute;ch bảo h&agrave;nh.</p>\r\n\r\n<p>- Sản phẩm được&nbsp;<strong>bảo h&agrave;nh miễn ph&iacute;</strong>&nbsp;trong suốt thời gian sử dụng trong c&aacute;c trường hợp sau:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + L&oacute;t tẩy, đệm l&oacute;t tẩy, d&aacute;n đế chống trơn, đế bị bong keo, m&ograve;n đinh g&oacute;t, đứt thun, đứt chỉ.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c chi tiết trang tr&iacute;, phụ kiện (kh&oacute;a, m&oacute;c, d&acirc;y k&eacute;o,... ). C&aacute;c phụ kiện gắn tr&ecirc;n sản phẩm nếu kh&ocirc;ng c&ograve;n phụ kiện thay thế sẽ thay bằng phụ kiện kh&aacute;c tương tự.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Lỗi sơn viền.</p>\r\n\r\n<p>- Ch&uacute;ng t&ocirc;i&nbsp;từ chối bảo h&agrave;nh sản phẩm đối với c&aacute;c trường hợp:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm kh&ocirc;ng c&oacute; phiếu bảo h&agrave;nh.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm qu&aacute; cũ (da v&agrave; đế qu&aacute; cũ, kh&ocirc;ng c&ograve;n độ b&aacute;m d&iacute;nh giữa da v&agrave; keo).</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm bị hư hỏng v&agrave; lỗi từ ph&iacute;a kh&aacute;ch h&agrave;ng g&acirc;y n&ecirc;n như trầy xước, đế m&ograve;n, sản phẩm kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn do bị động vật cắn, bảo quản kh&ocirc;ng tốt g&acirc;y ẩm mốc, phai nắng, n&oacute;ng chảy, &hellip;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c sản phẩm khuyến m&atilde;i, giảm gi&aacute;.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n<strong>2. QUY ĐỊNH ĐỔI SẢN PHẨM</strong>\r\n\r\n<p>- Sản phẩm được đổi trong v&ograve;ng 07 ng&agrave;y kể từ ng&agrave;y mua v&agrave; chỉ đổi 01 lần duy nhất với gi&aacute; trị bằng hoặc cao hơn, nếu thấp hơn sẽ kh&ocirc;ng được ho&agrave;n tiền.</p>\r\n\r\n<p>- Sản phẩm đổi phải c&ograve;n h&oacute;a đơn, phiếu bảo h&agrave;nh v&agrave; tem thương hiệu.</p>\r\n\r\n<p>- Sản phẩm phải c&ograve;n nguy&ecirc;n vẹn, đế kh&ocirc;ng bị trầy, bị dơ hoặc c&oacute; dấu hiệu đ&atilde; sử dụng.</p>\r\n\r\n<p>- Kh&ocirc;ng &aacute;p dụng ch&iacute;nh s&aacute;ch đổi đối với c&aacute;c sản phẩm đ&atilde; qu&aacute; thời gian đổi, sản phẩm đ&atilde; sử dụng, kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn.</p>\r\n\r\n<p>- C&aacute;c sản phẩm đ&atilde; được thay đổi một số chi tiết theo y&ecirc;u cầu kh&aacute;ch h&agrave;ng đều kh&ocirc;ng được đổi trả hoặc ho&agrave;n tiền.</p>\r\n\r\n<p>- C&aacute;c sản phẩm giảm gi&aacute;, khuyến m&atilde;i, h&agrave;ng tặng được &aacute;p dụng ch&iacute;nh s&aacute;ch đổi theo quy định của từng chương tr&igrave;nh.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n', '2019-04-09 04:21:31', 'no', 30535000, 29781000, 28503000, 18, 9, 'Lazada', 'Tiki', 'Shopee'),
(5, 1, 3, 'Smart Tivi Samsung 32 inch UA32N4300', 'Độ ph&acirc;n giải 4K sắc n&eacute;t gấp 4 lần tivi Full HD th&ocirc;ng thường<br />\r\nC&ocirc;ng nghệ Active HDR v&agrave; HDR Effect cho h&igrave;nh ảnh ch&acirc;n thật từng chi tiết<br />\r\nN&acirc;ng cấp h&igrave;nh ảnh độ ph&acirc;n giải thấp l&ecirc;n gần bằng 4K với 4K Upscaler<br />\r\nC&ocirc;ng nghệ &acirc;m thanh DTS Virtual:X mang đến &acirc;m thanh v&ograve;m sống động mạnh mẽ<br />\r\nH&ecirc;̣ đi&ecirc;̀u hành WebOS 4<br />\r\n0 d&ecirc;̃ sử dụng, đi kèm remote th&ocirc;ng minh h&ocirc;̃ trợ tìm ki&ecirc;́m giọng nói bằng ti&ecirc;́ng Vi&ecirc;̣t cả 3 mi&ecirc;̀n<br />\r\nH&ocirc;̃ trợ chi&ecirc;́u màn hình đi&ecirc;̣n thoại l&ecirc;n tivi và đi&ecirc;̀u khi&ecirc;̉n tivi bằn', 25852000, '<strong>1. CH&Iacute;NH S&Aacute;CH BẢO H&Agrave;NH</strong>\r\n<p><strong>Điều kiện &aacute;p dụng:</strong></p>\r\n\r\n<p>- Kh&aacute;ch h&agrave;ng vui l&ograve;ng xuất tr&igrave;nh phiếu bảo h&agrave;nh để được &aacute;p dụng ch&iacute;nh s&aacute;ch bảo h&agrave;nh.</p>\r\n\r\n<p>- Sản phẩm được&nbsp;<strong>bảo h&agrave;nh miễn ph&iacute;</strong>&nbsp;trong suốt thời gian sử dụng trong c&aacute;c trường hợp sau:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + L&oacute;t tẩy, đệm l&oacute;t tẩy, d&aacute;n đế chống trơn, đế bị bong keo, m&ograve;n đinh g&oacute;t, đứt thun, đứt chỉ.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c chi tiết trang tr&iacute;, phụ kiện (kh&oacute;a, m&oacute;c, d&acirc;y k&eacute;o,... ). C&aacute;c phụ kiện gắn tr&ecirc;n sản phẩm nếu kh&ocirc;ng c&ograve;n phụ kiện thay thế sẽ thay bằng phụ kiện kh&aacute;c tương tự.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Lỗi sơn viền.</p>\r\n\r\n<p>- Ch&uacute;ng t&ocirc;i&nbsp;từ chối bảo h&agrave;nh sản phẩm đối với c&aacute;c trường hợp:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm kh&ocirc;ng c&oacute; phiếu bảo h&agrave;nh.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm qu&aacute; cũ (da v&agrave; đế qu&aacute; cũ, kh&ocirc;ng c&ograve;n độ b&aacute;m d&iacute;nh giữa da v&agrave; keo).</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm bị hư hỏng v&agrave; lỗi từ ph&iacute;a kh&aacute;ch h&agrave;ng g&acirc;y n&ecirc;n như trầy xước, đế m&ograve;n, sản phẩm kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn do bị động vật cắn, bảo quản kh&ocirc;ng tốt g&acirc;y ẩm mốc, phai nắng, n&oacute;ng chảy, &hellip;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c sản phẩm khuyến m&atilde;i, giảm gi&aacute;.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n<strong>2. QUY ĐỊNH ĐỔI SẢN PHẨM</strong>\r\n\r\n<p>- Sản phẩm được đổi trong v&ograve;ng 07 ng&agrave;y kể từ ng&agrave;y mua v&agrave; chỉ đổi 01 lần duy nhất với gi&aacute; trị bằng hoặc cao hơn, nếu thấp hơn sẽ kh&ocirc;ng được ho&agrave;n tiền.</p>\r\n\r\n<p>- Sản phẩm đổi phải c&ograve;n h&oacute;a đơn, phiếu bảo h&agrave;nh v&agrave; tem thương hiệu.</p>\r\n\r\n<p>- Sản phẩm phải c&ograve;n nguy&ecirc;n vẹn, đế kh&ocirc;ng bị trầy, bị dơ hoặc c&oacute; dấu hiệu đ&atilde; sử dụng.</p>\r\n\r\n<p>- Kh&ocirc;ng &aacute;p dụng ch&iacute;nh s&aacute;ch đổi đối với c&aacute;c sản phẩm đ&atilde; qu&aacute; thời gian đổi, sản phẩm đ&atilde; sử dụng, kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn.</p>\r\n\r\n<p>- C&aacute;c sản phẩm đ&atilde; được thay đổi một số chi tiết theo y&ecirc;u cầu kh&aacute;ch h&agrave;ng đều kh&ocirc;ng được đổi trả hoặc ho&agrave;n tiền.</p>\r\n\r\n<p>- C&aacute;c sản phẩm giảm gi&aacute;, khuyến m&atilde;i, h&agrave;ng tặng được &aacute;p dụng ch&iacute;nh s&aacute;ch đổi theo quy định của từng chương tr&igrave;nh.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n', '2019-04-09 04:21:31', 'no', 28164000, 29232000, 27710000, 10, 3, 'Lazada', 'Tiki', 'Shopee'),
(6, 1, 4, 'Internet Tivi Sony 40 inch KDL-40W650D', 'C&ocirc;ng nghệ X-Reality PRO cho độ n&eacute;t vượt trội, n&acirc;ng cấp chất lượng h&igrave;nh ảnh c&oacute; độ ph&acirc;n giải thấp l&ecirc;n gần Full HD nhất<br />\r\nC&ocirc;ng nghệ Clear Phase cho &acirc;m thanh tự nhi&ecirc;n v&agrave; trong trẻo hơn<br />\r\nC&ocirc;ng nghệ X-Protection PRO bảo vệ tivi gi&uacute;p hạn chế t&aacute;c động của: độ ẩm, s&eacute;t, bụi, sốc nguồn<br />\r\nĐộ ph&acirc;n giải Full HD mang đến những h&igrave;nh ảnh c&oacute; độ n&eacute;t cao cấp 2 lần HD', 43953000, '<strong>1. CH&Iacute;NH S&Aacute;CH BẢO H&Agrave;NH</strong>\r\n<p><strong>Điều kiện &aacute;p dụng:</strong></p>\r\n\r\n<p>- Kh&aacute;ch h&agrave;ng vui l&ograve;ng xuất tr&igrave;nh phiếu bảo h&agrave;nh để được &aacute;p dụng ch&iacute;nh s&aacute;ch bảo h&agrave;nh.</p>\r\n\r\n<p>- Sản phẩm được&nbsp;<strong>bảo h&agrave;nh miễn ph&iacute;</strong>&nbsp;trong suốt thời gian sử dụng trong c&aacute;c trường hợp sau:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + L&oacute;t tẩy, đệm l&oacute;t tẩy, d&aacute;n đế chống trơn, đế bị bong keo, m&ograve;n đinh g&oacute;t, đứt thun, đứt chỉ.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c chi tiết trang tr&iacute;, phụ kiện (kh&oacute;a, m&oacute;c, d&acirc;y k&eacute;o,... ). C&aacute;c phụ kiện gắn tr&ecirc;n sản phẩm nếu kh&ocirc;ng c&ograve;n phụ kiện thay thế sẽ thay bằng phụ kiện kh&aacute;c tương tự.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Lỗi sơn viền.</p>\r\n\r\n<p>- Ch&uacute;ng t&ocirc;i&nbsp;từ chối bảo h&agrave;nh sản phẩm đối với c&aacute;c trường hợp:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm kh&ocirc;ng c&oacute; phiếu bảo h&agrave;nh.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm qu&aacute; cũ (da v&agrave; đế qu&aacute; cũ, kh&ocirc;ng c&ograve;n độ b&aacute;m d&iacute;nh giữa da v&agrave; keo).</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm bị hư hỏng v&agrave; lỗi từ ph&iacute;a kh&aacute;ch h&agrave;ng g&acirc;y n&ecirc;n như trầy xước, đế m&ograve;n, sản phẩm kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn do bị động vật cắn, bảo quản kh&ocirc;ng tốt g&acirc;y ẩm mốc, phai nắng, n&oacute;ng chảy, &hellip;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c sản phẩm khuyến m&atilde;i, giảm gi&aacute;.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n<strong>2. QUY ĐỊNH ĐỔI SẢN PHẨM</strong>\r\n\r\n<p>- Sản phẩm được đổi trong v&ograve;ng 07 ng&agrave;y kể từ ng&agrave;y mua v&agrave; chỉ đổi 01 lần duy nhất với gi&aacute; trị bằng hoặc cao hơn, nếu thấp hơn sẽ kh&ocirc;ng được ho&agrave;n tiền.</p>\r\n\r\n<p>- Sản phẩm đổi phải c&ograve;n h&oacute;a đơn, phiếu bảo h&agrave;nh v&agrave; tem thương hiệu.</p>\r\n\r\n<p>- Sản phẩm phải c&ograve;n nguy&ecirc;n vẹn, đế kh&ocirc;ng bị trầy, bị dơ hoặc c&oacute; dấu hiệu đ&atilde; sử dụng.</p>\r\n\r\n<p>- Kh&ocirc;ng &aacute;p dụng ch&iacute;nh s&aacute;ch đổi đối với c&aacute;c sản phẩm đ&atilde; qu&aacute; thời gian đổi, sản phẩm đ&atilde; sử dụng, kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn.</p>\r\n\r\n<p>- C&aacute;c sản phẩm đ&atilde; được thay đổi một số chi tiết theo y&ecirc;u cầu kh&aacute;ch h&agrave;ng đều kh&ocirc;ng được đổi trả hoặc ho&agrave;n tiền.</p>\r\n\r\n<p>- C&aacute;c sản phẩm giảm gi&aacute;, khuyến m&atilde;i, h&agrave;ng tặng được &aacute;p dụng ch&iacute;nh s&aacute;ch đổi theo quy định của từng chương tr&igrave;nh.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n', '2019-04-09 04:21:31', 'no', 46478000, 46416000, 47993000, 12, 8, 'Lazada', 'Tiki', 'Shopee'),
(7, 1, 5, 'Tivi toshiba 30 inch KDL-40W650D', 'C&ocirc;ng nghệ X-Reality PRO cho độ n&eacute;t vượt trội, n&acirc;ng cấp chất lượng h&igrave;nh ảnh c&oacute; độ ph&acirc;n giải thấp l&ecirc;n gần Full HD nhất<br />\r\nC&ocirc;ng nghệ Clear Phase cho &acirc;m thanh tự nhi&ecirc;n v&agrave; trong trẻo hơn<br />\r\nC&ocirc;ng nghệ X-Protection PRO bảo vệ tivi gi&uacute;p hạn chế t&aacute;c động của: độ ẩm, s&eacute;t, bụi, sốc nguồn<br />\r\nĐộ ph&acirc;n giải Full HD mang đến những h&igrave;nh ảnh c&oacute; độ n&eacute;t cao cấp 2 lần HD', 6399000, '<strong>1. CH&Iacute;NH S&Aacute;CH BẢO H&Agrave;NH</strong>\r\n<p><strong>Điều kiện &aacute;p dụng:</strong></p>\r\n\r\n<p>- Kh&aacute;ch h&agrave;ng vui l&ograve;ng xuất tr&igrave;nh phiếu bảo h&agrave;nh để được &aacute;p dụng ch&iacute;nh s&aacute;ch bảo h&agrave;nh.</p>\r\n\r\n<p>- Sản phẩm được&nbsp;<strong>bảo h&agrave;nh miễn ph&iacute;</strong>&nbsp;trong suốt thời gian sử dụng trong c&aacute;c trường hợp sau:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + L&oacute;t tẩy, đệm l&oacute;t tẩy, d&aacute;n đế chống trơn, đế bị bong keo, m&ograve;n đinh g&oacute;t, đứt thun, đứt chỉ.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c chi tiết trang tr&iacute;, phụ kiện (kh&oacute;a, m&oacute;c, d&acirc;y k&eacute;o,... ). C&aacute;c phụ kiện gắn tr&ecirc;n sản phẩm nếu kh&ocirc;ng c&ograve;n phụ kiện thay thế sẽ thay bằng phụ kiện kh&aacute;c tương tự.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Lỗi sơn viền.</p>\r\n\r\n<p>- Ch&uacute;ng t&ocirc;i&nbsp;từ chối bảo h&agrave;nh sản phẩm đối với c&aacute;c trường hợp:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm kh&ocirc;ng c&oacute; phiếu bảo h&agrave;nh.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm qu&aacute; cũ (da v&agrave; đế qu&aacute; cũ, kh&ocirc;ng c&ograve;n độ b&aacute;m d&iacute;nh giữa da v&agrave; keo).</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm bị hư hỏng v&agrave; lỗi từ ph&iacute;a kh&aacute;ch h&agrave;ng g&acirc;y n&ecirc;n như trầy xước, đế m&ograve;n, sản phẩm kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn do bị động vật cắn, bảo quản kh&ocirc;ng tốt g&acirc;y ẩm mốc, phai nắng, n&oacute;ng chảy, &hellip;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c sản phẩm khuyến m&atilde;i, giảm gi&aacute;.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n<strong>2. QUY ĐỊNH ĐỔI SẢN PHẨM</strong>\r\n\r\n<p>- Sản phẩm được đổi trong v&ograve;ng 07 ng&agrave;y kể từ ng&agrave;y mua v&agrave; chỉ đổi 01 lần duy nhất với gi&aacute; trị bằng hoặc cao hơn, nếu thấp hơn sẽ kh&ocirc;ng được ho&agrave;n tiền.</p>\r\n\r\n<p>- Sản phẩm đổi phải c&ograve;n h&oacute;a đơn, phiếu bảo h&agrave;nh v&agrave; tem thương hiệu.</p>\r\n\r\n<p>- Sản phẩm phải c&ograve;n nguy&ecirc;n vẹn, đế kh&ocirc;ng bị trầy, bị dơ hoặc c&oacute; dấu hiệu đ&atilde; sử dụng.</p>\r\n\r\n<p>- Kh&ocirc;ng &aacute;p dụng ch&iacute;nh s&aacute;ch đổi đối với c&aacute;c sản phẩm đ&atilde; qu&aacute; thời gian đổi, sản phẩm đ&atilde; sử dụng, kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn.</p>\r\n\r\n<p>- C&aacute;c sản phẩm đ&atilde; được thay đổi một số chi tiết theo y&ecirc;u cầu kh&aacute;ch h&agrave;ng đều kh&ocirc;ng được đổi trả hoặc ho&agrave;n tiền.</p>\r\n\r\n<p>- C&aacute;c sản phẩm giảm gi&aacute;, khuyến m&atilde;i, h&agrave;ng tặng được &aacute;p dụng ch&iacute;nh s&aacute;ch đổi theo quy định của từng chương tr&igrave;nh.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n', '2019-04-09 04:21:31', 'no', 9213000, 8132000, 11176000, 2, 10, 'Lazada', 'Tiki', 'Shopee'),
(22, 1, 1, 'Tivi Asanzo 12 inch ES32T890', 'Tivi với kiểu d&aacute;ng hiện đại, đẳng cấp với viền m&agrave;n h&igrave;nh si&ecirc;u mỏng<br />\r\nĐộ ph&acirc;n giải HD c&ugrave;ng c&ocirc;ng nghệ Picture Wizard II cho h&igrave;nh ảnh trong trẻo, m&agrave;u sắc tự nhi&ecirc;n v&agrave; ch&acirc;n thật<br />\r\nC&ocirc;ng nghệ &acirc;m thanh loa Stereo mang đến &acirc;m thanh mạnh mẽ, sinh động<br />\r\nChế độ &acirc;m thanh Infinite cho &acirc;m thanh đa chiều, trung thực', 8272000, '<strong>1. CH&Iacute;NH S&Aacute;CH BẢO H&Agrave;NH</strong>\r\n<p><strong>Điều kiện &aacute;p dụng:</strong></p>\r\n\r\n<p>- Kh&aacute;ch h&agrave;ng vui l&ograve;ng xuất tr&igrave;nh phiếu bảo h&agrave;nh để được &aacute;p dụng ch&iacute;nh s&aacute;ch bảo h&agrave;nh.</p>\r\n\r\n<p>- Sản phẩm được&nbsp;<strong>bảo h&agrave;nh miễn ph&iacute;</strong>&nbsp;trong suốt thời gian sử dụng trong c&aacute;c trường hợp sau:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + L&oacute;t tẩy, đệm l&oacute;t tẩy, d&aacute;n đế chống trơn, đế bị bong keo, m&ograve;n đinh g&oacute;t, đứt thun, đứt chỉ.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c chi tiết trang tr&iacute;, phụ kiện (kh&oacute;a, m&oacute;c, d&acirc;y k&eacute;o,... ). C&aacute;c phụ kiện gắn tr&ecirc;n sản phẩm nếu kh&ocirc;ng c&ograve;n phụ kiện thay thế sẽ thay bằng phụ kiện kh&aacute;c tương tự.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Lỗi sơn viền.</p>\r\n\r\n<p>- Ch&uacute;ng t&ocirc;i&nbsp;từ chối bảo h&agrave;nh sản phẩm đối với c&aacute;c trường hợp:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm kh&ocirc;ng c&oacute; phiếu bảo h&agrave;nh.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm qu&aacute; cũ (da v&agrave; đế qu&aacute; cũ, kh&ocirc;ng c&ograve;n độ b&aacute;m d&iacute;nh giữa da v&agrave; keo).</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm bị hư hỏng v&agrave; lỗi từ ph&iacute;a kh&aacute;ch h&agrave;ng g&acirc;y n&ecirc;n như trầy xước, đế m&ograve;n, sản phẩm kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn do bị động vật cắn, bảo quản kh&ocirc;ng tốt g&acirc;y ẩm mốc, phai nắng, n&oacute;ng chảy, &hellip;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c sản phẩm khuyến m&atilde;i, giảm gi&aacute;.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n<strong>2. QUY ĐỊNH ĐỔI SẢN PHẨM</strong>\r\n\r\n<p>- Sản phẩm được đổi trong v&ograve;ng 07 ng&agrave;y kể từ ng&agrave;y mua v&agrave; chỉ đổi 01 lần duy nhất với gi&aacute; trị bằng hoặc cao hơn, nếu thấp hơn sẽ kh&ocirc;ng được ho&agrave;n tiền.</p>\r\n\r\n<p>- Sản phẩm đổi phải c&ograve;n h&oacute;a đơn, phiếu bảo h&agrave;nh v&agrave; tem thương hiệu.</p>\r\n\r\n<p>- Sản phẩm phải c&ograve;n nguy&ecirc;n vẹn, đế kh&ocirc;ng bị trầy, bị dơ hoặc c&oacute; dấu hiệu đ&atilde; sử dụng.</p>\r\n\r\n<p>- Kh&ocirc;ng &aacute;p dụng ch&iacute;nh s&aacute;ch đổi đối với c&aacute;c sản phẩm đ&atilde; qu&aacute; thời gian đổi, sản phẩm đ&atilde; sử dụng, kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn.</p>\r\n\r\n<p>- C&aacute;c sản phẩm đ&atilde; được thay đổi một số chi tiết theo y&ecirc;u cầu kh&aacute;ch h&agrave;ng đều kh&ocirc;ng được đổi trả hoặc ho&agrave;n tiền.</p>\r\n\r\n<p>- C&aacute;c sản phẩm giảm gi&aacute;, khuyến m&atilde;i, h&agrave;ng tặng được &aacute;p dụng ch&iacute;nh s&aacute;ch đổi theo quy định của từng chương tr&igrave;nh.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n', '2019-04-09 04:21:31', 'no', 12367000, 9961000, 9610000, 5, 6, 'Lazada', 'Tiki', 'Shopee'),
(43, 1, 1, 'Tivi Asanzo 32 inch ES32T890', 'Tivi với kiểu d&aacute;ng hiện đại, đẳng cấp với viền m&agrave;n h&igrave;nh si&ecirc;u mỏng<br />\r\nĐộ ph&acirc;n giải HD c&ugrave;ng c&ocirc;ng nghệ Picture Wizard II cho h&igrave;nh ảnh trong trẻo, m&agrave;u sắc tự nhi&ecirc;n v&agrave; ch&acirc;n thật<br />\r\nC&ocirc;ng nghệ &acirc;m thanh loa Stereo mang đến &acirc;m thanh mạnh mẽ, sinh động<br />\r\nChế độ &acirc;m thanh Infinite cho &acirc;m thanh đa chiều, trung thực', 34602000, '<strong>1. CH&Iacute;NH S&Aacute;CH BẢO H&Agrave;NH</strong>\r\n<p><strong>Điều kiện &aacute;p dụng:</strong></p>\r\n\r\n<p>- Kh&aacute;ch h&agrave;ng vui l&ograve;ng xuất tr&igrave;nh phiếu bảo h&agrave;nh để được &aacute;p dụng ch&iacute;nh s&aacute;ch bảo h&agrave;nh.</p>\r\n\r\n<p>- Sản phẩm được&nbsp;<strong>bảo h&agrave;nh miễn ph&iacute;</strong>&nbsp;trong suốt thời gian sử dụng trong c&aacute;c trường hợp sau:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + L&oacute;t tẩy, đệm l&oacute;t tẩy, d&aacute;n đế chống trơn, đế bị bong keo, m&ograve;n đinh g&oacute;t, đứt thun, đứt chỉ.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c chi tiết trang tr&iacute;, phụ kiện (kh&oacute;a, m&oacute;c, d&acirc;y k&eacute;o,... ). C&aacute;c phụ kiện gắn tr&ecirc;n sản phẩm nếu kh&ocirc;ng c&ograve;n phụ kiện thay thế sẽ thay bằng phụ kiện kh&aacute;c tương tự.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Lỗi sơn viền.</p>\r\n\r\n<p>- Ch&uacute;ng t&ocirc;i&nbsp;từ chối bảo h&agrave;nh sản phẩm đối với c&aacute;c trường hợp:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm kh&ocirc;ng c&oacute; phiếu bảo h&agrave;nh.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm qu&aacute; cũ (da v&agrave; đế qu&aacute; cũ, kh&ocirc;ng c&ograve;n độ b&aacute;m d&iacute;nh giữa da v&agrave; keo).</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm bị hư hỏng v&agrave; lỗi từ ph&iacute;a kh&aacute;ch h&agrave;ng g&acirc;y n&ecirc;n như trầy xước, đế m&ograve;n, sản phẩm kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn do bị động vật cắn, bảo quản kh&ocirc;ng tốt g&acirc;y ẩm mốc, phai nắng, n&oacute;ng chảy, &hellip;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c sản phẩm khuyến m&atilde;i, giảm gi&aacute;.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n<strong>2. QUY ĐỊNH ĐỔI SẢN PHẨM</strong>\r\n\r\n<p>- Sản phẩm được đổi trong v&ograve;ng 07 ng&agrave;y kể từ ng&agrave;y mua v&agrave; chỉ đổi 01 lần duy nhất với gi&aacute; trị bằng hoặc cao hơn, nếu thấp hơn sẽ kh&ocirc;ng được ho&agrave;n tiền.</p>\r\n\r\n<p>- Sản phẩm đổi phải c&ograve;n h&oacute;a đơn, phiếu bảo h&agrave;nh v&agrave; tem thương hiệu.</p>\r\n\r\n<p>- Sản phẩm phải c&ograve;n nguy&ecirc;n vẹn, đế kh&ocirc;ng bị trầy, bị dơ hoặc c&oacute; dấu hiệu đ&atilde; sử dụng.</p>\r\n\r\n<p>- Kh&ocirc;ng &aacute;p dụng ch&iacute;nh s&aacute;ch đổi đối với c&aacute;c sản phẩm đ&atilde; qu&aacute; thời gian đổi, sản phẩm đ&atilde; sử dụng, kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn.</p>\r\n\r\n<p>- C&aacute;c sản phẩm đ&atilde; được thay đổi một số chi tiết theo y&ecirc;u cầu kh&aacute;ch h&agrave;ng đều kh&ocirc;ng được đổi trả hoặc ho&agrave;n tiền.</p>\r\n\r\n<p>- C&aacute;c sản phẩm giảm gi&aacute;, khuyến m&atilde;i, h&agrave;ng tặng được &aacute;p dụng ch&iacute;nh s&aacute;ch đổi theo quy định của từng chương tr&igrave;nh.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n', '2019-04-09 04:21:31', 'no', 35396000, 34733000, 35025000, 7, 5, 'Lazada', 'Tiki', 'Shopee'),
(44, 2, 2, 'Tủ lạnh Samsung Inverter 236 lít RT22M4032DX/SV ', 'Đặc điểm nổi bật<br />Thiết kế sang trọng với sắc nâu thời thượng<br />Công nghệ Digital Inverter hiện đại không gây tiếng ồn, tiết kiệm điện năng<br />Công nghệ cấp đông mềm Power Cooling chế biến thực phẩm không cần rã đông<br />Ngăn rau quả cân bằng độ ẩm Big Box<br />', 19658000, '<strong>1. CH&Iacute;NH S&Aacute;CH BẢO H&Agrave;NH</strong>\r\n<p><strong>Điều kiện &aacute;p dụng:</strong></p>\r\n\r\n<p>- Kh&aacute;ch h&agrave;ng vui l&ograve;ng xuất tr&igrave;nh phiếu bảo h&agrave;nh để được &aacute;p dụng ch&iacute;nh s&aacute;ch bảo h&agrave;nh.</p>\r\n\r\n<p>- Sản phẩm được&nbsp;<strong>bảo h&agrave;nh miễn ph&iacute;</strong>&nbsp;trong suốt thời gian sử dụng trong c&aacute;c trường hợp sau:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + L&oacute;t tẩy, đệm l&oacute;t tẩy, d&aacute;n đế chống trơn, đế bị bong keo, m&ograve;n đinh g&oacute;t, đứt thun, đứt chỉ.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c chi tiết trang tr&iacute;, phụ kiện (kh&oacute;a, m&oacute;c, d&acirc;y k&eacute;o,... ). C&aacute;c phụ kiện gắn tr&ecirc;n sản phẩm nếu kh&ocirc;ng c&ograve;n phụ kiện thay thế sẽ thay bằng phụ kiện kh&aacute;c tương tự.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Lỗi sơn viền.</p>\r\n\r\n<p>- Ch&uacute;ng t&ocirc;i&nbsp;từ chối bảo h&agrave;nh sản phẩm đối với c&aacute;c trường hợp:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm kh&ocirc;ng c&oacute; phiếu bảo h&agrave;nh.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm qu&aacute; cũ (da v&agrave; đế qu&aacute; cũ, kh&ocirc;ng c&ograve;n độ b&aacute;m d&iacute;nh giữa da v&agrave; keo).</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm bị hư hỏng v&agrave; lỗi từ ph&iacute;a kh&aacute;ch h&agrave;ng g&acirc;y n&ecirc;n như trầy xước, đế m&ograve;n, sản phẩm kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn do bị động vật cắn, bảo quản kh&ocirc;ng tốt g&acirc;y ẩm mốc, phai nắng, n&oacute;ng chảy, &hellip;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c sản phẩm khuyến m&atilde;i, giảm gi&aacute;.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n<strong>2. QUY ĐỊNH ĐỔI SẢN PHẨM</strong>\r\n\r\n<p>- Sản phẩm được đổi trong v&ograve;ng 07 ng&agrave;y kể từ ng&agrave;y mua v&agrave; chỉ đổi 01 lần duy nhất với gi&aacute; trị bằng hoặc cao hơn, nếu thấp hơn sẽ kh&ocirc;ng được ho&agrave;n tiền.</p>\r\n\r\n<p>- Sản phẩm đổi phải c&ograve;n h&oacute;a đơn, phiếu bảo h&agrave;nh v&agrave; tem thương hiệu.</p>\r\n\r\n<p>- Sản phẩm phải c&ograve;n nguy&ecirc;n vẹn, đế kh&ocirc;ng bị trầy, bị dơ hoặc c&oacute; dấu hiệu đ&atilde; sử dụng.</p>\r\n\r\n<p>- Kh&ocirc;ng &aacute;p dụng ch&iacute;nh s&aacute;ch đổi đối với c&aacute;c sản phẩm đ&atilde; qu&aacute; thời gian đổi, sản phẩm đ&atilde; sử dụng, kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn.</p>\r\n\r\n<p>- C&aacute;c sản phẩm đ&atilde; được thay đổi một số chi tiết theo y&ecirc;u cầu kh&aacute;ch h&agrave;ng đều kh&ocirc;ng được đổi trả hoặc ho&agrave;n tiền.</p>\r\n\r\n<p>- C&aacute;c sản phẩm giảm gi&aacute;, khuyến m&atilde;i, h&agrave;ng tặng được &aacute;p dụng ch&iacute;nh s&aacute;ch đổi theo quy định của từng chương tr&igrave;nh.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n', '2019-04-09 04:21:31', 'no', 21653000, 23630000, 23586000, 19, 10, 'Lazada', 'Tiki', 'Shopee'),
(45, 2, 3, 'Tủ lạnh Samsung Inverter 236 lít RT22M4032DX/SV', 'Đặc điểm nổi bật<br />Thiết kế sang trọng với sắc nâu thời thượng<br />Công nghệ Digital Inverter hiện đại không gây tiếng ồn, tiết kiệm điện năng<br />Công nghệ cấp đông mềm Power Cooling chế biến thực phẩm không cần rã đông<br />Ngăn rau quả cân bằng độ ẩm Big Box<br />', 23029000, '<strong>1. CH&Iacute;NH S&Aacute;CH BẢO H&Agrave;NH</strong>\r\n<p><strong>Điều kiện &aacute;p dụng:</strong></p>\r\n\r\n<p>- Kh&aacute;ch h&agrave;ng vui l&ograve;ng xuất tr&igrave;nh phiếu bảo h&agrave;nh để được &aacute;p dụng ch&iacute;nh s&aacute;ch bảo h&agrave;nh.</p>\r\n\r\n<p>- Sản phẩm được&nbsp;<strong>bảo h&agrave;nh miễn ph&iacute;</strong>&nbsp;trong suốt thời gian sử dụng trong c&aacute;c trường hợp sau:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + L&oacute;t tẩy, đệm l&oacute;t tẩy, d&aacute;n đế chống trơn, đế bị bong keo, m&ograve;n đinh g&oacute;t, đứt thun, đứt chỉ.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c chi tiết trang tr&iacute;, phụ kiện (kh&oacute;a, m&oacute;c, d&acirc;y k&eacute;o,... ). C&aacute;c phụ kiện gắn tr&ecirc;n sản phẩm nếu kh&ocirc;ng c&ograve;n phụ kiện thay thế sẽ thay bằng phụ kiện kh&aacute;c tương tự.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Lỗi sơn viền.</p>\r\n\r\n<p>- Ch&uacute;ng t&ocirc;i&nbsp;từ chối bảo h&agrave;nh sản phẩm đối với c&aacute;c trường hợp:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm kh&ocirc;ng c&oacute; phiếu bảo h&agrave;nh.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm qu&aacute; cũ (da v&agrave; đế qu&aacute; cũ, kh&ocirc;ng c&ograve;n độ b&aacute;m d&iacute;nh giữa da v&agrave; keo).</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm bị hư hỏng v&agrave; lỗi từ ph&iacute;a kh&aacute;ch h&agrave;ng g&acirc;y n&ecirc;n như trầy xước, đế m&ograve;n, sản phẩm kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn do bị động vật cắn, bảo quản kh&ocirc;ng tốt g&acirc;y ẩm mốc, phai nắng, n&oacute;ng chảy, &hellip;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c sản phẩm khuyến m&atilde;i, giảm gi&aacute;.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n<strong>2. QUY ĐỊNH ĐỔI SẢN PHẨM</strong>\r\n\r\n<p>- Sản phẩm được đổi trong v&ograve;ng 07 ng&agrave;y kể từ ng&agrave;y mua v&agrave; chỉ đổi 01 lần duy nhất với gi&aacute; trị bằng hoặc cao hơn, nếu thấp hơn sẽ kh&ocirc;ng được ho&agrave;n tiền.</p>\r\n\r\n<p>- Sản phẩm đổi phải c&ograve;n h&oacute;a đơn, phiếu bảo h&agrave;nh v&agrave; tem thương hiệu.</p>\r\n\r\n<p>- Sản phẩm phải c&ograve;n nguy&ecirc;n vẹn, đế kh&ocirc;ng bị trầy, bị dơ hoặc c&oacute; dấu hiệu đ&atilde; sử dụng.</p>\r\n\r\n<p>- Kh&ocirc;ng &aacute;p dụng ch&iacute;nh s&aacute;ch đổi đối với c&aacute;c sản phẩm đ&atilde; qu&aacute; thời gian đổi, sản phẩm đ&atilde; sử dụng, kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn.</p>\r\n\r\n<p>- C&aacute;c sản phẩm đ&atilde; được thay đổi một số chi tiết theo y&ecirc;u cầu kh&aacute;ch h&agrave;ng đều kh&ocirc;ng được đổi trả hoặc ho&agrave;n tiền.</p>\r\n\r\n<p>- C&aacute;c sản phẩm giảm gi&aacute;, khuyến m&atilde;i, h&agrave;ng tặng được &aacute;p dụng ch&iacute;nh s&aacute;ch đổi theo quy định của từng chương tr&igrave;nh.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n', '2019-04-09 04:21:31', 'no', 27278000, 25222000, 26585000, 14, 10, 'Lazada', 'Tiki', 'Shopee'),
(46, 2, 4, 'Tủ lạnh Samsung Inverter 236 lít RT22M4032DX/SV ', 'Đặc điểm nổi bật<br />Thiết kế sang trọng với sắc nâu thời thượng<br />Công nghệ Digital Inverter hiện đại không gây tiếng ồn, tiết kiệm điện năng<br />Công nghệ cấp đông mềm Power Cooling chế biến thực phẩm không cần rã đông<br />Ngăn rau quả cân bằng độ ẩm Big Box<br />', 24143000, '<strong>1. CH&Iacute;NH S&Aacute;CH BẢO H&Agrave;NH</strong>\r\n<p><strong>Điều kiện &aacute;p dụng:</strong></p>\r\n\r\n<p>- Kh&aacute;ch h&agrave;ng vui l&ograve;ng xuất tr&igrave;nh phiếu bảo h&agrave;nh để được &aacute;p dụng ch&iacute;nh s&aacute;ch bảo h&agrave;nh.</p>\r\n\r\n<p>- Sản phẩm được&nbsp;<strong>bảo h&agrave;nh miễn ph&iacute;</strong>&nbsp;trong suốt thời gian sử dụng trong c&aacute;c trường hợp sau:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + L&oacute;t tẩy, đệm l&oacute;t tẩy, d&aacute;n đế chống trơn, đế bị bong keo, m&ograve;n đinh g&oacute;t, đứt thun, đứt chỉ.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c chi tiết trang tr&iacute;, phụ kiện (kh&oacute;a, m&oacute;c, d&acirc;y k&eacute;o,... ). C&aacute;c phụ kiện gắn tr&ecirc;n sản phẩm nếu kh&ocirc;ng c&ograve;n phụ kiện thay thế sẽ thay bằng phụ kiện kh&aacute;c tương tự.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Lỗi sơn viền.</p>\r\n\r\n<p>- Ch&uacute;ng t&ocirc;i&nbsp;từ chối bảo h&agrave;nh sản phẩm đối với c&aacute;c trường hợp:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm kh&ocirc;ng c&oacute; phiếu bảo h&agrave;nh.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm qu&aacute; cũ (da v&agrave; đế qu&aacute; cũ, kh&ocirc;ng c&ograve;n độ b&aacute;m d&iacute;nh giữa da v&agrave; keo).</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm bị hư hỏng v&agrave; lỗi từ ph&iacute;a kh&aacute;ch h&agrave;ng g&acirc;y n&ecirc;n như trầy xước, đế m&ograve;n, sản phẩm kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn do bị động vật cắn, bảo quản kh&ocirc;ng tốt g&acirc;y ẩm mốc, phai nắng, n&oacute;ng chảy, &hellip;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c sản phẩm khuyến m&atilde;i, giảm gi&aacute;.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n<strong>2. QUY ĐỊNH ĐỔI SẢN PHẨM</strong>\r\n\r\n<p>- Sản phẩm được đổi trong v&ograve;ng 07 ng&agrave;y kể từ ng&agrave;y mua v&agrave; chỉ đổi 01 lần duy nhất với gi&aacute; trị bằng hoặc cao hơn, nếu thấp hơn sẽ kh&ocirc;ng được ho&agrave;n tiền.</p>\r\n\r\n<p>- Sản phẩm đổi phải c&ograve;n h&oacute;a đơn, phiếu bảo h&agrave;nh v&agrave; tem thương hiệu.</p>\r\n\r\n<p>- Sản phẩm phải c&ograve;n nguy&ecirc;n vẹn, đế kh&ocirc;ng bị trầy, bị dơ hoặc c&oacute; dấu hiệu đ&atilde; sử dụng.</p>\r\n\r\n<p>- Kh&ocirc;ng &aacute;p dụng ch&iacute;nh s&aacute;ch đổi đối với c&aacute;c sản phẩm đ&atilde; qu&aacute; thời gian đổi, sản phẩm đ&atilde; sử dụng, kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn.</p>\r\n\r\n<p>- C&aacute;c sản phẩm đ&atilde; được thay đổi một số chi tiết theo y&ecirc;u cầu kh&aacute;ch h&agrave;ng đều kh&ocirc;ng được đổi trả hoặc ho&agrave;n tiền.</p>\r\n\r\n<p>- C&aacute;c sản phẩm giảm gi&aacute;, khuyến m&atilde;i, h&agrave;ng tặng được &aacute;p dụng ch&iacute;nh s&aacute;ch đổi theo quy định của từng chương tr&igrave;nh.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n', '2019-04-09 04:21:31', 'no', 26641000, 25910000, 26438000, 18, 2, 'Lazada', 'Tiki', 'Shopee'),
(47, 2, 5, 'Tủ lạnh Samsung Inverter 236 lít RT22M4032DX/SV', 'Đặc điểm nổi bật<br />Thiết kế sang trọng với sắc nâu thời thượng<br />Công nghệ Digital Inverter hiện đại không gây tiếng ồn, tiết kiệm điện năng<br />Công nghệ cấp đông mềm Power Cooling chế biến thực phẩm không cần rã đông<br />Ngăn rau quả cân bằng độ ẩm Big Box<br />', 9671000, '<strong>1. CH&Iacute;NH S&Aacute;CH BẢO H&Agrave;NH</strong>\r\n<p><strong>Điều kiện &aacute;p dụng:</strong></p>\r\n\r\n<p>- Kh&aacute;ch h&agrave;ng vui l&ograve;ng xuất tr&igrave;nh phiếu bảo h&agrave;nh để được &aacute;p dụng ch&iacute;nh s&aacute;ch bảo h&agrave;nh.</p>\r\n\r\n<p>- Sản phẩm được&nbsp;<strong>bảo h&agrave;nh miễn ph&iacute;</strong>&nbsp;trong suốt thời gian sử dụng trong c&aacute;c trường hợp sau:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + L&oacute;t tẩy, đệm l&oacute;t tẩy, d&aacute;n đế chống trơn, đế bị bong keo, m&ograve;n đinh g&oacute;t, đứt thun, đứt chỉ.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c chi tiết trang tr&iacute;, phụ kiện (kh&oacute;a, m&oacute;c, d&acirc;y k&eacute;o,... ). C&aacute;c phụ kiện gắn tr&ecirc;n sản phẩm nếu kh&ocirc;ng c&ograve;n phụ kiện thay thế sẽ thay bằng phụ kiện kh&aacute;c tương tự.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Lỗi sơn viền.</p>\r\n\r\n<p>- Ch&uacute;ng t&ocirc;i&nbsp;từ chối bảo h&agrave;nh sản phẩm đối với c&aacute;c trường hợp:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm kh&ocirc;ng c&oacute; phiếu bảo h&agrave;nh.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm qu&aacute; cũ (da v&agrave; đế qu&aacute; cũ, kh&ocirc;ng c&ograve;n độ b&aacute;m d&iacute;nh giữa da v&agrave; keo).</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm bị hư hỏng v&agrave; lỗi từ ph&iacute;a kh&aacute;ch h&agrave;ng g&acirc;y n&ecirc;n như trầy xước, đế m&ograve;n, sản phẩm kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn do bị động vật cắn, bảo quản kh&ocirc;ng tốt g&acirc;y ẩm mốc, phai nắng, n&oacute;ng chảy, &hellip;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c sản phẩm khuyến m&atilde;i, giảm gi&aacute;.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n<strong>2. QUY ĐỊNH ĐỔI SẢN PHẨM</strong>\r\n\r\n<p>- Sản phẩm được đổi trong v&ograve;ng 07 ng&agrave;y kể từ ng&agrave;y mua v&agrave; chỉ đổi 01 lần duy nhất với gi&aacute; trị bằng hoặc cao hơn, nếu thấp hơn sẽ kh&ocirc;ng được ho&agrave;n tiền.</p>\r\n\r\n<p>- Sản phẩm đổi phải c&ograve;n h&oacute;a đơn, phiếu bảo h&agrave;nh v&agrave; tem thương hiệu.</p>\r\n\r\n<p>- Sản phẩm phải c&ograve;n nguy&ecirc;n vẹn, đế kh&ocirc;ng bị trầy, bị dơ hoặc c&oacute; dấu hiệu đ&atilde; sử dụng.</p>\r\n\r\n<p>- Kh&ocirc;ng &aacute;p dụng ch&iacute;nh s&aacute;ch đổi đối với c&aacute;c sản phẩm đ&atilde; qu&aacute; thời gian đổi, sản phẩm đ&atilde; sử dụng, kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn.</p>\r\n\r\n<p>- C&aacute;c sản phẩm đ&atilde; được thay đổi một số chi tiết theo y&ecirc;u cầu kh&aacute;ch h&agrave;ng đều kh&ocirc;ng được đổi trả hoặc ho&agrave;n tiền.</p>\r\n\r\n<p>- C&aacute;c sản phẩm giảm gi&aacute;, khuyến m&atilde;i, h&agrave;ng tặng được &aacute;p dụng ch&iacute;nh s&aacute;ch đổi theo quy định của từng chương tr&igrave;nh.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n', '2019-04-09 04:21:31', 'no', 13727000, 14255000, 10098000, 5, 7, 'Lazada', 'Tiki', 'Shopee');
INSERT INTO `table_product` (`id_product`, `id_category`, `id_producer`, `product_name`, `product_description`, `product_price`, `product_additional_information`, `date_created`, `is_hot`, `product_price_4compare1`, `product_price_4compare2`, `product_price_4compare3`, `customer_point`, `agent_point`, `shop1_name`, `shop2_name`, `shop3_name`) VALUES
(48, 2, 6, 'Tủ lạnh Samsung Inverter 236 lít RT22M4032DX/SV ', 'Đặc điểm nổi bật<br />Thiết kế sang trọng với sắc nâu thời thượng<br />Công nghệ Digital Inverter hiện đại không gây tiếng ồn, tiết kiệm điện năng<br />Công nghệ cấp đông mềm Power Cooling chế biến thực phẩm không cần rã đông<br />Ngăn rau quả cân bằng độ ẩm Big Box<br />', 5009000, '<strong>1. CH&Iacute;NH S&Aacute;CH BẢO H&Agrave;NH</strong>\r\n<p><strong>Điều kiện &aacute;p dụng:</strong></p>\r\n\r\n<p>- Kh&aacute;ch h&agrave;ng vui l&ograve;ng xuất tr&igrave;nh phiếu bảo h&agrave;nh để được &aacute;p dụng ch&iacute;nh s&aacute;ch bảo h&agrave;nh.</p>\r\n\r\n<p>- Sản phẩm được&nbsp;<strong>bảo h&agrave;nh miễn ph&iacute;</strong>&nbsp;trong suốt thời gian sử dụng trong c&aacute;c trường hợp sau:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + L&oacute;t tẩy, đệm l&oacute;t tẩy, d&aacute;n đế chống trơn, đế bị bong keo, m&ograve;n đinh g&oacute;t, đứt thun, đứt chỉ.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c chi tiết trang tr&iacute;, phụ kiện (kh&oacute;a, m&oacute;c, d&acirc;y k&eacute;o,... ). C&aacute;c phụ kiện gắn tr&ecirc;n sản phẩm nếu kh&ocirc;ng c&ograve;n phụ kiện thay thế sẽ thay bằng phụ kiện kh&aacute;c tương tự.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Lỗi sơn viền.</p>\r\n\r\n<p>- Ch&uacute;ng t&ocirc;i&nbsp;từ chối bảo h&agrave;nh sản phẩm đối với c&aacute;c trường hợp:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm kh&ocirc;ng c&oacute; phiếu bảo h&agrave;nh.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm qu&aacute; cũ (da v&agrave; đế qu&aacute; cũ, kh&ocirc;ng c&ograve;n độ b&aacute;m d&iacute;nh giữa da v&agrave; keo).</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm bị hư hỏng v&agrave; lỗi từ ph&iacute;a kh&aacute;ch h&agrave;ng g&acirc;y n&ecirc;n như trầy xước, đế m&ograve;n, sản phẩm kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn do bị động vật cắn, bảo quản kh&ocirc;ng tốt g&acirc;y ẩm mốc, phai nắng, n&oacute;ng chảy, &hellip;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c sản phẩm khuyến m&atilde;i, giảm gi&aacute;.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n<strong>2. QUY ĐỊNH ĐỔI SẢN PHẨM</strong>\r\n\r\n<p>- Sản phẩm được đổi trong v&ograve;ng 07 ng&agrave;y kể từ ng&agrave;y mua v&agrave; chỉ đổi 01 lần duy nhất với gi&aacute; trị bằng hoặc cao hơn, nếu thấp hơn sẽ kh&ocirc;ng được ho&agrave;n tiền.</p>\r\n\r\n<p>- Sản phẩm đổi phải c&ograve;n h&oacute;a đơn, phiếu bảo h&agrave;nh v&agrave; tem thương hiệu.</p>\r\n\r\n<p>- Sản phẩm phải c&ograve;n nguy&ecirc;n vẹn, đế kh&ocirc;ng bị trầy, bị dơ hoặc c&oacute; dấu hiệu đ&atilde; sử dụng.</p>\r\n\r\n<p>- Kh&ocirc;ng &aacute;p dụng ch&iacute;nh s&aacute;ch đổi đối với c&aacute;c sản phẩm đ&atilde; qu&aacute; thời gian đổi, sản phẩm đ&atilde; sử dụng, kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn.</p>\r\n\r\n<p>- C&aacute;c sản phẩm đ&atilde; được thay đổi một số chi tiết theo y&ecirc;u cầu kh&aacute;ch h&agrave;ng đều kh&ocirc;ng được đổi trả hoặc ho&agrave;n tiền.</p>\r\n\r\n<p>- C&aacute;c sản phẩm giảm gi&aacute;, khuyến m&atilde;i, h&agrave;ng tặng được &aacute;p dụng ch&iacute;nh s&aacute;ch đổi theo quy định của từng chương tr&igrave;nh.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n', '2019-04-09 04:21:31', 'no', 7722000, 9350000, 6109000, 15, 2, 'Lazada', 'Tiki', 'Shopee'),
(49, 2, 6, 'Tủ lạnh Samsung Inverter 236 lít RT22M4032DX/SV', 'Đặc điểm nổi bật<br />Thiết kế sang trọng với sắc nâu thời thượng<br />Công nghệ Digital Inverter hiện đại không gây tiếng ồn, tiết kiệm điện năng<br />Công nghệ cấp đông mềm Power Cooling chế biến thực phẩm không cần rã đông<br />Ngăn rau quả cân bằng độ ẩm Big Box<br />', 3177000, '<strong>1. CH&Iacute;NH S&Aacute;CH BẢO H&Agrave;NH</strong>\r\n<p><strong>Điều kiện &aacute;p dụng:</strong></p>\r\n\r\n<p>- Kh&aacute;ch h&agrave;ng vui l&ograve;ng xuất tr&igrave;nh phiếu bảo h&agrave;nh để được &aacute;p dụng ch&iacute;nh s&aacute;ch bảo h&agrave;nh.</p>\r\n\r\n<p>- Sản phẩm được&nbsp;<strong>bảo h&agrave;nh miễn ph&iacute;</strong>&nbsp;trong suốt thời gian sử dụng trong c&aacute;c trường hợp sau:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + L&oacute;t tẩy, đệm l&oacute;t tẩy, d&aacute;n đế chống trơn, đế bị bong keo, m&ograve;n đinh g&oacute;t, đứt thun, đứt chỉ.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c chi tiết trang tr&iacute;, phụ kiện (kh&oacute;a, m&oacute;c, d&acirc;y k&eacute;o,... ). C&aacute;c phụ kiện gắn tr&ecirc;n sản phẩm nếu kh&ocirc;ng c&ograve;n phụ kiện thay thế sẽ thay bằng phụ kiện kh&aacute;c tương tự.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Lỗi sơn viền.</p>\r\n\r\n<p>- Ch&uacute;ng t&ocirc;i&nbsp;từ chối bảo h&agrave;nh sản phẩm đối với c&aacute;c trường hợp:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm kh&ocirc;ng c&oacute; phiếu bảo h&agrave;nh.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm qu&aacute; cũ (da v&agrave; đế qu&aacute; cũ, kh&ocirc;ng c&ograve;n độ b&aacute;m d&iacute;nh giữa da v&agrave; keo).</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm bị hư hỏng v&agrave; lỗi từ ph&iacute;a kh&aacute;ch h&agrave;ng g&acirc;y n&ecirc;n như trầy xước, đế m&ograve;n, sản phẩm kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn do bị động vật cắn, bảo quản kh&ocirc;ng tốt g&acirc;y ẩm mốc, phai nắng, n&oacute;ng chảy, &hellip;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c sản phẩm khuyến m&atilde;i, giảm gi&aacute;.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n<strong>2. QUY ĐỊNH ĐỔI SẢN PHẨM</strong>\r\n\r\n<p>- Sản phẩm được đổi trong v&ograve;ng 07 ng&agrave;y kể từ ng&agrave;y mua v&agrave; chỉ đổi 01 lần duy nhất với gi&aacute; trị bằng hoặc cao hơn, nếu thấp hơn sẽ kh&ocirc;ng được ho&agrave;n tiền.</p>\r\n\r\n<p>- Sản phẩm đổi phải c&ograve;n h&oacute;a đơn, phiếu bảo h&agrave;nh v&agrave; tem thương hiệu.</p>\r\n\r\n<p>- Sản phẩm phải c&ograve;n nguy&ecirc;n vẹn, đế kh&ocirc;ng bị trầy, bị dơ hoặc c&oacute; dấu hiệu đ&atilde; sử dụng.</p>\r\n\r\n<p>- Kh&ocirc;ng &aacute;p dụng ch&iacute;nh s&aacute;ch đổi đối với c&aacute;c sản phẩm đ&atilde; qu&aacute; thời gian đổi, sản phẩm đ&atilde; sử dụng, kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn.</p>\r\n\r\n<p>- C&aacute;c sản phẩm đ&atilde; được thay đổi một số chi tiết theo y&ecirc;u cầu kh&aacute;ch h&agrave;ng đều kh&ocirc;ng được đổi trả hoặc ho&agrave;n tiền.</p>\r\n\r\n<p>- C&aacute;c sản phẩm giảm gi&aacute;, khuyến m&atilde;i, h&agrave;ng tặng được &aacute;p dụng ch&iacute;nh s&aacute;ch đổi theo quy định của từng chương tr&igrave;nh.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n', '2019-04-09 04:21:31', 'no', 6230000, 6374000, 3997000, 15, 2, 'Lazada', 'Tiki', 'Shopee'),
(50, 2, 2, 'Tủ lạnh Samsung Inverter 236 lít RT22M4032DX/SV ', 'Đặc điểm nổi bật<br />Thiết kế sang trọng với sắc nâu thời thượng<br />Công nghệ Digital Inverter hiện đại không gây tiếng ồn, tiết kiệm điện năng<br />Công nghệ cấp đông mềm Power Cooling chế biến thực phẩm không cần rã đông<br />Ngăn rau quả cân bằng độ ẩm Big Box<br />', 24189000, '<strong>1. CH&Iacute;NH S&Aacute;CH BẢO H&Agrave;NH</strong>\r\n<p><strong>Điều kiện &aacute;p dụng:</strong></p>\r\n\r\n<p>- Kh&aacute;ch h&agrave;ng vui l&ograve;ng xuất tr&igrave;nh phiếu bảo h&agrave;nh để được &aacute;p dụng ch&iacute;nh s&aacute;ch bảo h&agrave;nh.</p>\r\n\r\n<p>- Sản phẩm được&nbsp;<strong>bảo h&agrave;nh miễn ph&iacute;</strong>&nbsp;trong suốt thời gian sử dụng trong c&aacute;c trường hợp sau:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + L&oacute;t tẩy, đệm l&oacute;t tẩy, d&aacute;n đế chống trơn, đế bị bong keo, m&ograve;n đinh g&oacute;t, đứt thun, đứt chỉ.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c chi tiết trang tr&iacute;, phụ kiện (kh&oacute;a, m&oacute;c, d&acirc;y k&eacute;o,... ). C&aacute;c phụ kiện gắn tr&ecirc;n sản phẩm nếu kh&ocirc;ng c&ograve;n phụ kiện thay thế sẽ thay bằng phụ kiện kh&aacute;c tương tự.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Lỗi sơn viền.</p>\r\n\r\n<p>- Ch&uacute;ng t&ocirc;i&nbsp;từ chối bảo h&agrave;nh sản phẩm đối với c&aacute;c trường hợp:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm kh&ocirc;ng c&oacute; phiếu bảo h&agrave;nh.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm qu&aacute; cũ (da v&agrave; đế qu&aacute; cũ, kh&ocirc;ng c&ograve;n độ b&aacute;m d&iacute;nh giữa da v&agrave; keo).</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm bị hư hỏng v&agrave; lỗi từ ph&iacute;a kh&aacute;ch h&agrave;ng g&acirc;y n&ecirc;n như trầy xước, đế m&ograve;n, sản phẩm kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn do bị động vật cắn, bảo quản kh&ocirc;ng tốt g&acirc;y ẩm mốc, phai nắng, n&oacute;ng chảy, &hellip;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c sản phẩm khuyến m&atilde;i, giảm gi&aacute;.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n<strong>2. QUY ĐỊNH ĐỔI SẢN PHẨM</strong>\r\n\r\n<p>- Sản phẩm được đổi trong v&ograve;ng 07 ng&agrave;y kể từ ng&agrave;y mua v&agrave; chỉ đổi 01 lần duy nhất với gi&aacute; trị bằng hoặc cao hơn, nếu thấp hơn sẽ kh&ocirc;ng được ho&agrave;n tiền.</p>\r\n\r\n<p>- Sản phẩm đổi phải c&ograve;n h&oacute;a đơn, phiếu bảo h&agrave;nh v&agrave; tem thương hiệu.</p>\r\n\r\n<p>- Sản phẩm phải c&ograve;n nguy&ecirc;n vẹn, đế kh&ocirc;ng bị trầy, bị dơ hoặc c&oacute; dấu hiệu đ&atilde; sử dụng.</p>\r\n\r\n<p>- Kh&ocirc;ng &aacute;p dụng ch&iacute;nh s&aacute;ch đổi đối với c&aacute;c sản phẩm đ&atilde; qu&aacute; thời gian đổi, sản phẩm đ&atilde; sử dụng, kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn.</p>\r\n\r\n<p>- C&aacute;c sản phẩm đ&atilde; được thay đổi một số chi tiết theo y&ecirc;u cầu kh&aacute;ch h&agrave;ng đều kh&ocirc;ng được đổi trả hoặc ho&agrave;n tiền.</p>\r\n\r\n<p>- C&aacute;c sản phẩm giảm gi&aacute;, khuyến m&atilde;i, h&agrave;ng tặng được &aacute;p dụng ch&iacute;nh s&aacute;ch đổi theo quy định của từng chương tr&igrave;nh.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n', '2019-04-09 04:21:31', 'no', 25234000, 27074000, 25214000, 1, 5, 'Lazada', 'Tiki', 'Shopee'),
(51, 2, 2, 'Tủ lạnh Samsung Inverter 236 lít RT22M4032DX/SV', 'Đặc điểm nổi bật<br />Thiết kế sang trọng với sắc nâu thời thượng<br />Công nghệ Digital Inverter hiện đại không gây tiếng ồn, tiết kiệm điện năng<br />Công nghệ cấp đông mềm Power Cooling chế biến thực phẩm không cần rã đông<br />Ngăn rau quả cân bằng độ ẩm Big Box<br />', 40299000, '<strong>1. CH&Iacute;NH S&Aacute;CH BẢO H&Agrave;NH</strong>\r\n<p><strong>Điều kiện &aacute;p dụng:</strong></p>\r\n\r\n<p>- Kh&aacute;ch h&agrave;ng vui l&ograve;ng xuất tr&igrave;nh phiếu bảo h&agrave;nh để được &aacute;p dụng ch&iacute;nh s&aacute;ch bảo h&agrave;nh.</p>\r\n\r\n<p>- Sản phẩm được&nbsp;<strong>bảo h&agrave;nh miễn ph&iacute;</strong>&nbsp;trong suốt thời gian sử dụng trong c&aacute;c trường hợp sau:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + L&oacute;t tẩy, đệm l&oacute;t tẩy, d&aacute;n đế chống trơn, đế bị bong keo, m&ograve;n đinh g&oacute;t, đứt thun, đứt chỉ.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c chi tiết trang tr&iacute;, phụ kiện (kh&oacute;a, m&oacute;c, d&acirc;y k&eacute;o,... ). C&aacute;c phụ kiện gắn tr&ecirc;n sản phẩm nếu kh&ocirc;ng c&ograve;n phụ kiện thay thế sẽ thay bằng phụ kiện kh&aacute;c tương tự.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Lỗi sơn viền.</p>\r\n\r\n<p>- Ch&uacute;ng t&ocirc;i&nbsp;từ chối bảo h&agrave;nh sản phẩm đối với c&aacute;c trường hợp:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm kh&ocirc;ng c&oacute; phiếu bảo h&agrave;nh.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm qu&aacute; cũ (da v&agrave; đế qu&aacute; cũ, kh&ocirc;ng c&ograve;n độ b&aacute;m d&iacute;nh giữa da v&agrave; keo).</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm bị hư hỏng v&agrave; lỗi từ ph&iacute;a kh&aacute;ch h&agrave;ng g&acirc;y n&ecirc;n như trầy xước, đế m&ograve;n, sản phẩm kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn do bị động vật cắn, bảo quản kh&ocirc;ng tốt g&acirc;y ẩm mốc, phai nắng, n&oacute;ng chảy, &hellip;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c sản phẩm khuyến m&atilde;i, giảm gi&aacute;.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n<strong>2. QUY ĐỊNH ĐỔI SẢN PHẨM</strong>\r\n\r\n<p>- Sản phẩm được đổi trong v&ograve;ng 07 ng&agrave;y kể từ ng&agrave;y mua v&agrave; chỉ đổi 01 lần duy nhất với gi&aacute; trị bằng hoặc cao hơn, nếu thấp hơn sẽ kh&ocirc;ng được ho&agrave;n tiền.</p>\r\n\r\n<p>- Sản phẩm đổi phải c&ograve;n h&oacute;a đơn, phiếu bảo h&agrave;nh v&agrave; tem thương hiệu.</p>\r\n\r\n<p>- Sản phẩm phải c&ograve;n nguy&ecirc;n vẹn, đế kh&ocirc;ng bị trầy, bị dơ hoặc c&oacute; dấu hiệu đ&atilde; sử dụng.</p>\r\n\r\n<p>- Kh&ocirc;ng &aacute;p dụng ch&iacute;nh s&aacute;ch đổi đối với c&aacute;c sản phẩm đ&atilde; qu&aacute; thời gian đổi, sản phẩm đ&atilde; sử dụng, kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn.</p>\r\n\r\n<p>- C&aacute;c sản phẩm đ&atilde; được thay đổi một số chi tiết theo y&ecirc;u cầu kh&aacute;ch h&agrave;ng đều kh&ocirc;ng được đổi trả hoặc ho&agrave;n tiền.</p>\r\n\r\n<p>- C&aacute;c sản phẩm giảm gi&aacute;, khuyến m&atilde;i, h&agrave;ng tặng được &aacute;p dụng ch&iacute;nh s&aacute;ch đổi theo quy định của từng chương tr&igrave;nh.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n', '2019-04-09 04:21:31', 'yes', 43147000, 42405000, 44504000, 20, 8, 'Lazada', 'Tiki', 'Shopee'),
(52, 2, 2, 'Tủ lạnh Samsung Inverter 236 lít RT22M4032DX/SV ', 'Đặc điểm nổi bật<br />Thiết kế sang trọng với sắc nâu thời thượng<br />Công nghệ Digital Inverter hiện đại không gây tiếng ồn, tiết kiệm điện năng<br />Công nghệ cấp đông mềm Power Cooling chế biến thực phẩm không cần rã đông<br />Ngăn rau quả cân bằng độ ẩm Big Box<br />', 28207000, '<strong>1. CH&Iacute;NH S&Aacute;CH BẢO H&Agrave;NH</strong>\r\n<p><strong>Điều kiện &aacute;p dụng:</strong></p>\r\n\r\n<p>- Kh&aacute;ch h&agrave;ng vui l&ograve;ng xuất tr&igrave;nh phiếu bảo h&agrave;nh để được &aacute;p dụng ch&iacute;nh s&aacute;ch bảo h&agrave;nh.</p>\r\n\r\n<p>- Sản phẩm được&nbsp;<strong>bảo h&agrave;nh miễn ph&iacute;</strong>&nbsp;trong suốt thời gian sử dụng trong c&aacute;c trường hợp sau:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + L&oacute;t tẩy, đệm l&oacute;t tẩy, d&aacute;n đế chống trơn, đế bị bong keo, m&ograve;n đinh g&oacute;t, đứt thun, đứt chỉ.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c chi tiết trang tr&iacute;, phụ kiện (kh&oacute;a, m&oacute;c, d&acirc;y k&eacute;o,... ). C&aacute;c phụ kiện gắn tr&ecirc;n sản phẩm nếu kh&ocirc;ng c&ograve;n phụ kiện thay thế sẽ thay bằng phụ kiện kh&aacute;c tương tự.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Lỗi sơn viền.</p>\r\n\r\n<p>- Ch&uacute;ng t&ocirc;i&nbsp;từ chối bảo h&agrave;nh sản phẩm đối với c&aacute;c trường hợp:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm kh&ocirc;ng c&oacute; phiếu bảo h&agrave;nh.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm qu&aacute; cũ (da v&agrave; đế qu&aacute; cũ, kh&ocirc;ng c&ograve;n độ b&aacute;m d&iacute;nh giữa da v&agrave; keo).</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm bị hư hỏng v&agrave; lỗi từ ph&iacute;a kh&aacute;ch h&agrave;ng g&acirc;y n&ecirc;n như trầy xước, đế m&ograve;n, sản phẩm kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn do bị động vật cắn, bảo quản kh&ocirc;ng tốt g&acirc;y ẩm mốc, phai nắng, n&oacute;ng chảy, &hellip;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c sản phẩm khuyến m&atilde;i, giảm gi&aacute;.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n<strong>2. QUY ĐỊNH ĐỔI SẢN PHẨM</strong>\r\n\r\n<p>- Sản phẩm được đổi trong v&ograve;ng 07 ng&agrave;y kể từ ng&agrave;y mua v&agrave; chỉ đổi 01 lần duy nhất với gi&aacute; trị bằng hoặc cao hơn, nếu thấp hơn sẽ kh&ocirc;ng được ho&agrave;n tiền.</p>\r\n\r\n<p>- Sản phẩm đổi phải c&ograve;n h&oacute;a đơn, phiếu bảo h&agrave;nh v&agrave; tem thương hiệu.</p>\r\n\r\n<p>- Sản phẩm phải c&ograve;n nguy&ecirc;n vẹn, đế kh&ocirc;ng bị trầy, bị dơ hoặc c&oacute; dấu hiệu đ&atilde; sử dụng.</p>\r\n\r\n<p>- Kh&ocirc;ng &aacute;p dụng ch&iacute;nh s&aacute;ch đổi đối với c&aacute;c sản phẩm đ&atilde; qu&aacute; thời gian đổi, sản phẩm đ&atilde; sử dụng, kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn.</p>\r\n\r\n<p>- C&aacute;c sản phẩm đ&atilde; được thay đổi một số chi tiết theo y&ecirc;u cầu kh&aacute;ch h&agrave;ng đều kh&ocirc;ng được đổi trả hoặc ho&agrave;n tiền.</p>\r\n\r\n<p>- C&aacute;c sản phẩm giảm gi&aacute;, khuyến m&atilde;i, h&agrave;ng tặng được &aacute;p dụng ch&iacute;nh s&aacute;ch đổi theo quy định của từng chương tr&igrave;nh.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n', '2019-04-09 04:21:31', 'yes', 30833000, 33082000, 28704000, 18, 5, 'Lazada', 'Tiki', 'Shopee'),
(53, 2, 2, 'Tủ lạnh Samsung Inverter 236 lít RT22M4032DX/SV', 'Đặc điểm nổi bật<br />Thiết kế sang trọng với sắc nâu thời thượng<br />Công nghệ Digital Inverter hiện đại không gây tiếng ồn, tiết kiệm điện năng<br />Công nghệ cấp đông mềm Power Cooling chế biến thực phẩm không cần rã đông<br />Ngăn rau quả cân bằng độ ẩm Big Box<br />', 45678000, '<strong>1. CH&Iacute;NH S&Aacute;CH BẢO H&Agrave;NH</strong>\r\n<p><strong>Điều kiện &aacute;p dụng:</strong></p>\r\n\r\n<p>- Kh&aacute;ch h&agrave;ng vui l&ograve;ng xuất tr&igrave;nh phiếu bảo h&agrave;nh để được &aacute;p dụng ch&iacute;nh s&aacute;ch bảo h&agrave;nh.</p>\r\n\r\n<p>- Sản phẩm được&nbsp;<strong>bảo h&agrave;nh miễn ph&iacute;</strong>&nbsp;trong suốt thời gian sử dụng trong c&aacute;c trường hợp sau:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + L&oacute;t tẩy, đệm l&oacute;t tẩy, d&aacute;n đế chống trơn, đế bị bong keo, m&ograve;n đinh g&oacute;t, đứt thun, đứt chỉ.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c chi tiết trang tr&iacute;, phụ kiện (kh&oacute;a, m&oacute;c, d&acirc;y k&eacute;o,... ). C&aacute;c phụ kiện gắn tr&ecirc;n sản phẩm nếu kh&ocirc;ng c&ograve;n phụ kiện thay thế sẽ thay bằng phụ kiện kh&aacute;c tương tự.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Lỗi sơn viền.</p>\r\n\r\n<p>- Ch&uacute;ng t&ocirc;i&nbsp;từ chối bảo h&agrave;nh sản phẩm đối với c&aacute;c trường hợp:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm kh&ocirc;ng c&oacute; phiếu bảo h&agrave;nh.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm qu&aacute; cũ (da v&agrave; đế qu&aacute; cũ, kh&ocirc;ng c&ograve;n độ b&aacute;m d&iacute;nh giữa da v&agrave; keo).</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm bị hư hỏng v&agrave; lỗi từ ph&iacute;a kh&aacute;ch h&agrave;ng g&acirc;y n&ecirc;n như trầy xước, đế m&ograve;n, sản phẩm kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn do bị động vật cắn, bảo quản kh&ocirc;ng tốt g&acirc;y ẩm mốc, phai nắng, n&oacute;ng chảy, &hellip;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c sản phẩm khuyến m&atilde;i, giảm gi&aacute;.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n<strong>2. QUY ĐỊNH ĐỔI SẢN PHẨM</strong>\r\n\r\n<p>- Sản phẩm được đổi trong v&ograve;ng 07 ng&agrave;y kể từ ng&agrave;y mua v&agrave; chỉ đổi 01 lần duy nhất với gi&aacute; trị bằng hoặc cao hơn, nếu thấp hơn sẽ kh&ocirc;ng được ho&agrave;n tiền.</p>\r\n\r\n<p>- Sản phẩm đổi phải c&ograve;n h&oacute;a đơn, phiếu bảo h&agrave;nh v&agrave; tem thương hiệu.</p>\r\n\r\n<p>- Sản phẩm phải c&ograve;n nguy&ecirc;n vẹn, đế kh&ocirc;ng bị trầy, bị dơ hoặc c&oacute; dấu hiệu đ&atilde; sử dụng.</p>\r\n\r\n<p>- Kh&ocirc;ng &aacute;p dụng ch&iacute;nh s&aacute;ch đổi đối với c&aacute;c sản phẩm đ&atilde; qu&aacute; thời gian đổi, sản phẩm đ&atilde; sử dụng, kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn.</p>\r\n\r\n<p>- C&aacute;c sản phẩm đ&atilde; được thay đổi một số chi tiết theo y&ecirc;u cầu kh&aacute;ch h&agrave;ng đều kh&ocirc;ng được đổi trả hoặc ho&agrave;n tiền.</p>\r\n\r\n<p>- C&aacute;c sản phẩm giảm gi&aacute;, khuyến m&atilde;i, h&agrave;ng tặng được &aacute;p dụng ch&iacute;nh s&aacute;ch đổi theo quy định của từng chương tr&igrave;nh.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n', '2019-04-09 04:21:31', 'no', 46666000, 48730000, 47292000, 20, 10, 'Lazada', 'Tiki', 'Shopee'),
(54, 2, 2, 'Tủ lạnh Samsung Inverter 236 lít RT22M4032DX/SV ', 'Đặc điểm nổi bật<br />Thiết kế sang trọng với sắc nâu thời thượng<br />Công nghệ Digital Inverter hiện đại không gây tiếng ồn, tiết kiệm điện năng<br />Công nghệ cấp đông mềm Power Cooling chế biến thực phẩm không cần rã đông<br />Ngăn rau quả cân bằng độ ẩm Big Box<br />', 35972000, '<strong>1. CH&Iacute;NH S&Aacute;CH BẢO H&Agrave;NH</strong>\r\n<p><strong>Điều kiện &aacute;p dụng:</strong></p>\r\n\r\n<p>- Kh&aacute;ch h&agrave;ng vui l&ograve;ng xuất tr&igrave;nh phiếu bảo h&agrave;nh để được &aacute;p dụng ch&iacute;nh s&aacute;ch bảo h&agrave;nh.</p>\r\n\r\n<p>- Sản phẩm được&nbsp;<strong>bảo h&agrave;nh miễn ph&iacute;</strong>&nbsp;trong suốt thời gian sử dụng trong c&aacute;c trường hợp sau:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + L&oacute;t tẩy, đệm l&oacute;t tẩy, d&aacute;n đế chống trơn, đế bị bong keo, m&ograve;n đinh g&oacute;t, đứt thun, đứt chỉ.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c chi tiết trang tr&iacute;, phụ kiện (kh&oacute;a, m&oacute;c, d&acirc;y k&eacute;o,... ). C&aacute;c phụ kiện gắn tr&ecirc;n sản phẩm nếu kh&ocirc;ng c&ograve;n phụ kiện thay thế sẽ thay bằng phụ kiện kh&aacute;c tương tự.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Lỗi sơn viền.</p>\r\n\r\n<p>- Ch&uacute;ng t&ocirc;i&nbsp;từ chối bảo h&agrave;nh sản phẩm đối với c&aacute;c trường hợp:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm kh&ocirc;ng c&oacute; phiếu bảo h&agrave;nh.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm qu&aacute; cũ (da v&agrave; đế qu&aacute; cũ, kh&ocirc;ng c&ograve;n độ b&aacute;m d&iacute;nh giữa da v&agrave; keo).</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm bị hư hỏng v&agrave; lỗi từ ph&iacute;a kh&aacute;ch h&agrave;ng g&acirc;y n&ecirc;n như trầy xước, đế m&ograve;n, sản phẩm kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn do bị động vật cắn, bảo quản kh&ocirc;ng tốt g&acirc;y ẩm mốc, phai nắng, n&oacute;ng chảy, &hellip;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c sản phẩm khuyến m&atilde;i, giảm gi&aacute;.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n<strong>2. QUY ĐỊNH ĐỔI SẢN PHẨM</strong>\r\n\r\n<p>- Sản phẩm được đổi trong v&ograve;ng 07 ng&agrave;y kể từ ng&agrave;y mua v&agrave; chỉ đổi 01 lần duy nhất với gi&aacute; trị bằng hoặc cao hơn, nếu thấp hơn sẽ kh&ocirc;ng được ho&agrave;n tiền.</p>\r\n\r\n<p>- Sản phẩm đổi phải c&ograve;n h&oacute;a đơn, phiếu bảo h&agrave;nh v&agrave; tem thương hiệu.</p>\r\n\r\n<p>- Sản phẩm phải c&ograve;n nguy&ecirc;n vẹn, đế kh&ocirc;ng bị trầy, bị dơ hoặc c&oacute; dấu hiệu đ&atilde; sử dụng.</p>\r\n\r\n<p>- Kh&ocirc;ng &aacute;p dụng ch&iacute;nh s&aacute;ch đổi đối với c&aacute;c sản phẩm đ&atilde; qu&aacute; thời gian đổi, sản phẩm đ&atilde; sử dụng, kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn.</p>\r\n\r\n<p>- C&aacute;c sản phẩm đ&atilde; được thay đổi một số chi tiết theo y&ecirc;u cầu kh&aacute;ch h&agrave;ng đều kh&ocirc;ng được đổi trả hoặc ho&agrave;n tiền.</p>\r\n\r\n<p>- C&aacute;c sản phẩm giảm gi&aacute;, khuyến m&atilde;i, h&agrave;ng tặng được &aacute;p dụng ch&iacute;nh s&aacute;ch đổi theo quy định của từng chương tr&igrave;nh.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n', '2019-04-09 04:21:31', 'no', 36843000, 36900000, 39907000, 18, 9, 'Lazada', 'Tiki', 'Shopee'),
(55, 2, 2, 'Tủ lạnh Samsung Inverter 236 lít RT22M4032DX/SV', 'Đặc điểm nổi bật<br />Thiết kế sang trọng với sắc nâu thời thượng<br />Công nghệ Digital Inverter hiện đại không gây tiếng ồn, tiết kiệm điện năng<br />Công nghệ cấp đông mềm Power Cooling chế biến thực phẩm không cần rã đông<br />Ngăn rau quả cân bằng độ ẩm Big Box<br />', 35149000, '<strong>1. CH&Iacute;NH S&Aacute;CH BẢO H&Agrave;NH</strong>\r\n<p><strong>Điều kiện &aacute;p dụng:</strong></p>\r\n\r\n<p>- Kh&aacute;ch h&agrave;ng vui l&ograve;ng xuất tr&igrave;nh phiếu bảo h&agrave;nh để được &aacute;p dụng ch&iacute;nh s&aacute;ch bảo h&agrave;nh.</p>\r\n\r\n<p>- Sản phẩm được&nbsp;<strong>bảo h&agrave;nh miễn ph&iacute;</strong>&nbsp;trong suốt thời gian sử dụng trong c&aacute;c trường hợp sau:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + L&oacute;t tẩy, đệm l&oacute;t tẩy, d&aacute;n đế chống trơn, đế bị bong keo, m&ograve;n đinh g&oacute;t, đứt thun, đứt chỉ.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c chi tiết trang tr&iacute;, phụ kiện (kh&oacute;a, m&oacute;c, d&acirc;y k&eacute;o,... ). C&aacute;c phụ kiện gắn tr&ecirc;n sản phẩm nếu kh&ocirc;ng c&ograve;n phụ kiện thay thế sẽ thay bằng phụ kiện kh&aacute;c tương tự.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Lỗi sơn viền.</p>\r\n\r\n<p>- Ch&uacute;ng t&ocirc;i&nbsp;từ chối bảo h&agrave;nh sản phẩm đối với c&aacute;c trường hợp:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm kh&ocirc;ng c&oacute; phiếu bảo h&agrave;nh.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm qu&aacute; cũ (da v&agrave; đế qu&aacute; cũ, kh&ocirc;ng c&ograve;n độ b&aacute;m d&iacute;nh giữa da v&agrave; keo).</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm bị hư hỏng v&agrave; lỗi từ ph&iacute;a kh&aacute;ch h&agrave;ng g&acirc;y n&ecirc;n như trầy xước, đế m&ograve;n, sản phẩm kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn do bị động vật cắn, bảo quản kh&ocirc;ng tốt g&acirc;y ẩm mốc, phai nắng, n&oacute;ng chảy, &hellip;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c sản phẩm khuyến m&atilde;i, giảm gi&aacute;.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n<strong>2. QUY ĐỊNH ĐỔI SẢN PHẨM</strong>\r\n\r\n<p>- Sản phẩm được đổi trong v&ograve;ng 07 ng&agrave;y kể từ ng&agrave;y mua v&agrave; chỉ đổi 01 lần duy nhất với gi&aacute; trị bằng hoặc cao hơn, nếu thấp hơn sẽ kh&ocirc;ng được ho&agrave;n tiền.</p>\r\n\r\n<p>- Sản phẩm đổi phải c&ograve;n h&oacute;a đơn, phiếu bảo h&agrave;nh v&agrave; tem thương hiệu.</p>\r\n\r\n<p>- Sản phẩm phải c&ograve;n nguy&ecirc;n vẹn, đế kh&ocirc;ng bị trầy, bị dơ hoặc c&oacute; dấu hiệu đ&atilde; sử dụng.</p>\r\n\r\n<p>- Kh&ocirc;ng &aacute;p dụng ch&iacute;nh s&aacute;ch đổi đối với c&aacute;c sản phẩm đ&atilde; qu&aacute; thời gian đổi, sản phẩm đ&atilde; sử dụng, kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn.</p>\r\n\r\n<p>- C&aacute;c sản phẩm đ&atilde; được thay đổi một số chi tiết theo y&ecirc;u cầu kh&aacute;ch h&agrave;ng đều kh&ocirc;ng được đổi trả hoặc ho&agrave;n tiền.</p>\r\n\r\n<p>- C&aacute;c sản phẩm giảm gi&aacute;, khuyến m&atilde;i, h&agrave;ng tặng được &aacute;p dụng ch&iacute;nh s&aacute;ch đổi theo quy định của từng chương tr&igrave;nh.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n', '2019-04-09 04:21:31', 'no', 35208000, 37864000, 38617000, 10, 7, 'Lazada', 'Tiki', 'Shopee'),
(56, 2, 2, 'Tủ lạnh Samsung Inverter 236 lít RT22M4032DX/SV ', 'Đặc điểm nổi bật<br />Thiết kế sang trọng với sắc nâu thời thượng<br />Công nghệ Digital Inverter hiện đại không gây tiếng ồn, tiết kiệm điện năng<br />Công nghệ cấp đông mềm Power Cooling chế biến thực phẩm không cần rã đông<br />Ngăn rau quả cân bằng độ ẩm Big Box<br />', 14896000, '<strong>1. CH&Iacute;NH S&Aacute;CH BẢO H&Agrave;NH</strong>\r\n<p><strong>Điều kiện &aacute;p dụng:</strong></p>\r\n\r\n<p>- Kh&aacute;ch h&agrave;ng vui l&ograve;ng xuất tr&igrave;nh phiếu bảo h&agrave;nh để được &aacute;p dụng ch&iacute;nh s&aacute;ch bảo h&agrave;nh.</p>\r\n\r\n<p>- Sản phẩm được&nbsp;<strong>bảo h&agrave;nh miễn ph&iacute;</strong>&nbsp;trong suốt thời gian sử dụng trong c&aacute;c trường hợp sau:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + L&oacute;t tẩy, đệm l&oacute;t tẩy, d&aacute;n đế chống trơn, đế bị bong keo, m&ograve;n đinh g&oacute;t, đứt thun, đứt chỉ.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c chi tiết trang tr&iacute;, phụ kiện (kh&oacute;a, m&oacute;c, d&acirc;y k&eacute;o,... ). C&aacute;c phụ kiện gắn tr&ecirc;n sản phẩm nếu kh&ocirc;ng c&ograve;n phụ kiện thay thế sẽ thay bằng phụ kiện kh&aacute;c tương tự.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Lỗi sơn viền.</p>\r\n\r\n<p>- Ch&uacute;ng t&ocirc;i&nbsp;từ chối bảo h&agrave;nh sản phẩm đối với c&aacute;c trường hợp:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm kh&ocirc;ng c&oacute; phiếu bảo h&agrave;nh.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm qu&aacute; cũ (da v&agrave; đế qu&aacute; cũ, kh&ocirc;ng c&ograve;n độ b&aacute;m d&iacute;nh giữa da v&agrave; keo).</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm bị hư hỏng v&agrave; lỗi từ ph&iacute;a kh&aacute;ch h&agrave;ng g&acirc;y n&ecirc;n như trầy xước, đế m&ograve;n, sản phẩm kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn do bị động vật cắn, bảo quản kh&ocirc;ng tốt g&acirc;y ẩm mốc, phai nắng, n&oacute;ng chảy, &hellip;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c sản phẩm khuyến m&atilde;i, giảm gi&aacute;.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n<strong>2. QUY ĐỊNH ĐỔI SẢN PHẨM</strong>\r\n\r\n<p>- Sản phẩm được đổi trong v&ograve;ng 07 ng&agrave;y kể từ ng&agrave;y mua v&agrave; chỉ đổi 01 lần duy nhất với gi&aacute; trị bằng hoặc cao hơn, nếu thấp hơn sẽ kh&ocirc;ng được ho&agrave;n tiền.</p>\r\n\r\n<p>- Sản phẩm đổi phải c&ograve;n h&oacute;a đơn, phiếu bảo h&agrave;nh v&agrave; tem thương hiệu.</p>\r\n\r\n<p>- Sản phẩm phải c&ograve;n nguy&ecirc;n vẹn, đế kh&ocirc;ng bị trầy, bị dơ hoặc c&oacute; dấu hiệu đ&atilde; sử dụng.</p>\r\n\r\n<p>- Kh&ocirc;ng &aacute;p dụng ch&iacute;nh s&aacute;ch đổi đối với c&aacute;c sản phẩm đ&atilde; qu&aacute; thời gian đổi, sản phẩm đ&atilde; sử dụng, kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn.</p>\r\n\r\n<p>- C&aacute;c sản phẩm đ&atilde; được thay đổi một số chi tiết theo y&ecirc;u cầu kh&aacute;ch h&agrave;ng đều kh&ocirc;ng được đổi trả hoặc ho&agrave;n tiền.</p>\r\n\r\n<p>- C&aacute;c sản phẩm giảm gi&aacute;, khuyến m&atilde;i, h&agrave;ng tặng được &aacute;p dụng ch&iacute;nh s&aacute;ch đổi theo quy định của từng chương tr&igrave;nh.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n', '2019-04-09 04:21:31', 'no', 18607000, 16452000, 18639000, 13, 1, 'Lazada', 'Tiki', 'Shopee'),
(68, 3, 5, 'Máy giặt Panasonic 11.5 kg NA-F115A5WRV', 'Công nghệ giặt StainMaster - giặt sạch mạnh mẽ các vết bẩn khó chịu như mồ hôi, bùn đất và nước sốt<br />Hệ thống Active Foam - thẩm thấu cực nhanh trên quần áo, giúp đánh bật hoàn toàn các vết bẩn cứng đầu<br />Chế độ sấy gió 90 phút - tiết kiệm thời gian phơi quần áo<br />Lồng giặt SAZANAMI - hạn chế hư tổn quần áo<br />Tính năng vệ sinh lồng giặt - giúp loại bỏ các cặn bã tích tụ trong lồng giặt<br />', 37668000, '<strong>1. CH&Iacute;NH S&Aacute;CH BẢO H&Agrave;NH</strong>\r\n<p><strong>Điều kiện &aacute;p dụng:</strong></p>\r\n\r\n<p>- Kh&aacute;ch h&agrave;ng vui l&ograve;ng xuất tr&igrave;nh phiếu bảo h&agrave;nh để được &aacute;p dụng ch&iacute;nh s&aacute;ch bảo h&agrave;nh.</p>\r\n\r\n<p>- Sản phẩm được&nbsp;<strong>bảo h&agrave;nh miễn ph&iacute;</strong>&nbsp;trong suốt thời gian sử dụng trong c&aacute;c trường hợp sau:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + L&oacute;t tẩy, đệm l&oacute;t tẩy, d&aacute;n đế chống trơn, đế bị bong keo, m&ograve;n đinh g&oacute;t, đứt thun, đứt chỉ.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c chi tiết trang tr&iacute;, phụ kiện (kh&oacute;a, m&oacute;c, d&acirc;y k&eacute;o,... ). C&aacute;c phụ kiện gắn tr&ecirc;n sản phẩm nếu kh&ocirc;ng c&ograve;n phụ kiện thay thế sẽ thay bằng phụ kiện kh&aacute;c tương tự.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Lỗi sơn viền.</p>\r\n\r\n<p>- Ch&uacute;ng t&ocirc;i&nbsp;từ chối bảo h&agrave;nh sản phẩm đối với c&aacute;c trường hợp:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm kh&ocirc;ng c&oacute; phiếu bảo h&agrave;nh.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm qu&aacute; cũ (da v&agrave; đế qu&aacute; cũ, kh&ocirc;ng c&ograve;n độ b&aacute;m d&iacute;nh giữa da v&agrave; keo).</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm bị hư hỏng v&agrave; lỗi từ ph&iacute;a kh&aacute;ch h&agrave;ng g&acirc;y n&ecirc;n như trầy xước, đế m&ograve;n, sản phẩm kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn do bị động vật cắn, bảo quản kh&ocirc;ng tốt g&acirc;y ẩm mốc, phai nắng, n&oacute;ng chảy, &hellip;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c sản phẩm khuyến m&atilde;i, giảm gi&aacute;.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n<strong>2. QUY ĐỊNH ĐỔI SẢN PHẨM</strong>\r\n\r\n<p>- Sản phẩm được đổi trong v&ograve;ng 07 ng&agrave;y kể từ ng&agrave;y mua v&agrave; chỉ đổi 01 lần duy nhất với gi&aacute; trị bằng hoặc cao hơn, nếu thấp hơn sẽ kh&ocirc;ng được ho&agrave;n tiền.</p>\r\n\r\n<p>- Sản phẩm đổi phải c&ograve;n h&oacute;a đơn, phiếu bảo h&agrave;nh v&agrave; tem thương hiệu.</p>\r\n\r\n<p>- Sản phẩm phải c&ograve;n nguy&ecirc;n vẹn, đế kh&ocirc;ng bị trầy, bị dơ hoặc c&oacute; dấu hiệu đ&atilde; sử dụng.</p>\r\n\r\n<p>- Kh&ocirc;ng &aacute;p dụng ch&iacute;nh s&aacute;ch đổi đối với c&aacute;c sản phẩm đ&atilde; qu&aacute; thời gian đổi, sản phẩm đ&atilde; sử dụng, kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn.</p>\r\n\r\n<p>- C&aacute;c sản phẩm đ&atilde; được thay đổi một số chi tiết theo y&ecirc;u cầu kh&aacute;ch h&agrave;ng đều kh&ocirc;ng được đổi trả hoặc ho&agrave;n tiền.</p>\r\n\r\n<p>- C&aacute;c sản phẩm giảm gi&aacute;, khuyến m&atilde;i, h&agrave;ng tặng được &aacute;p dụng ch&iacute;nh s&aacute;ch đổi theo quy định của từng chương tr&igrave;nh.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n', '2019-04-09 04:21:31', 'no', 40031000, 38167000, 39821000, 10, 3, 'Lazada', 'Tiki', 'Shopee'),
(69, 3, 5, 'Máy giặt Toshiba Inverter 10 kg AW-DUH1100GV', 'Động cơ truyền động trực tiếp S-DD Inverter vận hành êm, tiết kiệm điện<br />Công nghệ UFB siêu bọt khí NANO cho hiệu quả giặt sạch tối ưu<br />Mâm giặt Power Pulsator xoáy sâu đồ giặt, hòa tan bột giặt hiệu quả<br />Hiệu ứng thác nước đôi mạnh mẽ giặt sạch vượt trội<br />Lồng giặt ngôi sao pha lê bảo về quần áo bền đẹp<br />Vắt cực khô tiết kiệm thời gian<br />', 35094000, '<strong>1. CH&Iacute;NH S&Aacute;CH BẢO H&Agrave;NH</strong>\r\n<p><strong>Điều kiện &aacute;p dụng:</strong></p>\r\n\r\n<p>- Kh&aacute;ch h&agrave;ng vui l&ograve;ng xuất tr&igrave;nh phiếu bảo h&agrave;nh để được &aacute;p dụng ch&iacute;nh s&aacute;ch bảo h&agrave;nh.</p>\r\n\r\n<p>- Sản phẩm được&nbsp;<strong>bảo h&agrave;nh miễn ph&iacute;</strong>&nbsp;trong suốt thời gian sử dụng trong c&aacute;c trường hợp sau:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + L&oacute;t tẩy, đệm l&oacute;t tẩy, d&aacute;n đế chống trơn, đế bị bong keo, m&ograve;n đinh g&oacute;t, đứt thun, đứt chỉ.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c chi tiết trang tr&iacute;, phụ kiện (kh&oacute;a, m&oacute;c, d&acirc;y k&eacute;o,... ). C&aacute;c phụ kiện gắn tr&ecirc;n sản phẩm nếu kh&ocirc;ng c&ograve;n phụ kiện thay thế sẽ thay bằng phụ kiện kh&aacute;c tương tự.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Lỗi sơn viền.</p>\r\n\r\n<p>- Ch&uacute;ng t&ocirc;i&nbsp;từ chối bảo h&agrave;nh sản phẩm đối với c&aacute;c trường hợp:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm kh&ocirc;ng c&oacute; phiếu bảo h&agrave;nh.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm qu&aacute; cũ (da v&agrave; đế qu&aacute; cũ, kh&ocirc;ng c&ograve;n độ b&aacute;m d&iacute;nh giữa da v&agrave; keo).</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm bị hư hỏng v&agrave; lỗi từ ph&iacute;a kh&aacute;ch h&agrave;ng g&acirc;y n&ecirc;n như trầy xước, đế m&ograve;n, sản phẩm kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn do bị động vật cắn, bảo quản kh&ocirc;ng tốt g&acirc;y ẩm mốc, phai nắng, n&oacute;ng chảy, &hellip;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c sản phẩm khuyến m&atilde;i, giảm gi&aacute;.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n<strong>2. QUY ĐỊNH ĐỔI SẢN PHẨM</strong>\r\n\r\n<p>- Sản phẩm được đổi trong v&ograve;ng 07 ng&agrave;y kể từ ng&agrave;y mua v&agrave; chỉ đổi 01 lần duy nhất với gi&aacute; trị bằng hoặc cao hơn, nếu thấp hơn sẽ kh&ocirc;ng được ho&agrave;n tiền.</p>\r\n\r\n<p>- Sản phẩm đổi phải c&ograve;n h&oacute;a đơn, phiếu bảo h&agrave;nh v&agrave; tem thương hiệu.</p>\r\n\r\n<p>- Sản phẩm phải c&ograve;n nguy&ecirc;n vẹn, đế kh&ocirc;ng bị trầy, bị dơ hoặc c&oacute; dấu hiệu đ&atilde; sử dụng.</p>\r\n\r\n<p>- Kh&ocirc;ng &aacute;p dụng ch&iacute;nh s&aacute;ch đổi đối với c&aacute;c sản phẩm đ&atilde; qu&aacute; thời gian đổi, sản phẩm đ&atilde; sử dụng, kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn.</p>\r\n\r\n<p>- C&aacute;c sản phẩm đ&atilde; được thay đổi một số chi tiết theo y&ecirc;u cầu kh&aacute;ch h&agrave;ng đều kh&ocirc;ng được đổi trả hoặc ho&agrave;n tiền.</p>\r\n\r\n<p>- C&aacute;c sản phẩm giảm gi&aacute;, khuyến m&atilde;i, h&agrave;ng tặng được &aacute;p dụng ch&iacute;nh s&aacute;ch đổi theo quy định của từng chương tr&igrave;nh.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n', '2019-04-09 04:21:31', 'no', 38958000, 38513000, 39684000, 9, 7, 'Lazada', 'Tiki', 'Shopee'),
(70, 3, 5, 'Máy giặt Panasonic 11.5 kg NA-F115A5WRV', 'Công nghệ giặt StainMaster - giặt sạch mạnh mẽ các vết bẩn khó chịu như mồ hôi, bùn đất và nước sốt<br />Hệ thống Active Foam - thẩm thấu cực nhanh trên quần áo, giúp đánh bật hoàn toàn các vết bẩn cứng đầu<br />Chế độ sấy gió 90 phút - tiết kiệm thời gian phơi quần áo<br />Lồng giặt SAZANAMI - hạn chế hư tổn quần áo<br />Tính năng vệ sinh lồng giặt - giúp loại bỏ các cặn bã tích tụ trong lồng giặt<br />', 19900000, '<strong>1. CH&Iacute;NH S&Aacute;CH BẢO H&Agrave;NH</strong>\r\n<p><strong>Điều kiện &aacute;p dụng:</strong></p>\r\n\r\n<p>- Kh&aacute;ch h&agrave;ng vui l&ograve;ng xuất tr&igrave;nh phiếu bảo h&agrave;nh để được &aacute;p dụng ch&iacute;nh s&aacute;ch bảo h&agrave;nh.</p>\r\n\r\n<p>- Sản phẩm được&nbsp;<strong>bảo h&agrave;nh miễn ph&iacute;</strong>&nbsp;trong suốt thời gian sử dụng trong c&aacute;c trường hợp sau:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + L&oacute;t tẩy, đệm l&oacute;t tẩy, d&aacute;n đế chống trơn, đế bị bong keo, m&ograve;n đinh g&oacute;t, đứt thun, đứt chỉ.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c chi tiết trang tr&iacute;, phụ kiện (kh&oacute;a, m&oacute;c, d&acirc;y k&eacute;o,... ). C&aacute;c phụ kiện gắn tr&ecirc;n sản phẩm nếu kh&ocirc;ng c&ograve;n phụ kiện thay thế sẽ thay bằng phụ kiện kh&aacute;c tương tự.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Lỗi sơn viền.</p>\r\n\r\n<p>- Ch&uacute;ng t&ocirc;i&nbsp;từ chối bảo h&agrave;nh sản phẩm đối với c&aacute;c trường hợp:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm kh&ocirc;ng c&oacute; phiếu bảo h&agrave;nh.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm qu&aacute; cũ (da v&agrave; đế qu&aacute; cũ, kh&ocirc;ng c&ograve;n độ b&aacute;m d&iacute;nh giữa da v&agrave; keo).</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm bị hư hỏng v&agrave; lỗi từ ph&iacute;a kh&aacute;ch h&agrave;ng g&acirc;y n&ecirc;n như trầy xước, đế m&ograve;n, sản phẩm kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn do bị động vật cắn, bảo quản kh&ocirc;ng tốt g&acirc;y ẩm mốc, phai nắng, n&oacute;ng chảy, &hellip;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c sản phẩm khuyến m&atilde;i, giảm gi&aacute;.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n<strong>2. QUY ĐỊNH ĐỔI SẢN PHẨM</strong>\r\n\r\n<p>- Sản phẩm được đổi trong v&ograve;ng 07 ng&agrave;y kể từ ng&agrave;y mua v&agrave; chỉ đổi 01 lần duy nhất với gi&aacute; trị bằng hoặc cao hơn, nếu thấp hơn sẽ kh&ocirc;ng được ho&agrave;n tiền.</p>\r\n\r\n<p>- Sản phẩm đổi phải c&ograve;n h&oacute;a đơn, phiếu bảo h&agrave;nh v&agrave; tem thương hiệu.</p>\r\n\r\n<p>- Sản phẩm phải c&ograve;n nguy&ecirc;n vẹn, đế kh&ocirc;ng bị trầy, bị dơ hoặc c&oacute; dấu hiệu đ&atilde; sử dụng.</p>\r\n\r\n<p>- Kh&ocirc;ng &aacute;p dụng ch&iacute;nh s&aacute;ch đổi đối với c&aacute;c sản phẩm đ&atilde; qu&aacute; thời gian đổi, sản phẩm đ&atilde; sử dụng, kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn.</p>\r\n\r\n<p>- C&aacute;c sản phẩm đ&atilde; được thay đổi một số chi tiết theo y&ecirc;u cầu kh&aacute;ch h&agrave;ng đều kh&ocirc;ng được đổi trả hoặc ho&agrave;n tiền.</p>\r\n\r\n<p>- C&aacute;c sản phẩm giảm gi&aacute;, khuyến m&atilde;i, h&agrave;ng tặng được &aacute;p dụng ch&iacute;nh s&aacute;ch đổi theo quy định của từng chương tr&igrave;nh.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n', '2019-04-09 04:21:31', 'no', 21798000, 20016000, 24735000, 4, 1, 'Lazada', 'Tiki', 'Shopee'),
(71, 3, 5, 'Máy giặt Toshiba Inverter 10 kg AW-DUH1100GV', 'Động cơ truyền động trực tiếp S-DD Inverter vận hành êm, tiết kiệm điện<br />Công nghệ UFB siêu bọt khí NANO cho hiệu quả giặt sạch tối ưu<br />Mâm giặt Power Pulsator xoáy sâu đồ giặt, hòa tan bột giặt hiệu quả<br />Hiệu ứng thác nước đôi mạnh mẽ giặt sạch vượt trội<br />Lồng giặt ngôi sao pha lê bảo về quần áo bền đẹp<br />Vắt cực khô tiết kiệm thời gian<br />', 6385000, '<strong>1. CH&Iacute;NH S&Aacute;CH BẢO H&Agrave;NH</strong>\r\n<p><strong>Điều kiện &aacute;p dụng:</strong></p>\r\n\r\n<p>- Kh&aacute;ch h&agrave;ng vui l&ograve;ng xuất tr&igrave;nh phiếu bảo h&agrave;nh để được &aacute;p dụng ch&iacute;nh s&aacute;ch bảo h&agrave;nh.</p>\r\n\r\n<p>- Sản phẩm được&nbsp;<strong>bảo h&agrave;nh miễn ph&iacute;</strong>&nbsp;trong suốt thời gian sử dụng trong c&aacute;c trường hợp sau:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + L&oacute;t tẩy, đệm l&oacute;t tẩy, d&aacute;n đế chống trơn, đế bị bong keo, m&ograve;n đinh g&oacute;t, đứt thun, đứt chỉ.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c chi tiết trang tr&iacute;, phụ kiện (kh&oacute;a, m&oacute;c, d&acirc;y k&eacute;o,... ). C&aacute;c phụ kiện gắn tr&ecirc;n sản phẩm nếu kh&ocirc;ng c&ograve;n phụ kiện thay thế sẽ thay bằng phụ kiện kh&aacute;c tương tự.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Lỗi sơn viền.</p>\r\n\r\n<p>- Ch&uacute;ng t&ocirc;i&nbsp;từ chối bảo h&agrave;nh sản phẩm đối với c&aacute;c trường hợp:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm kh&ocirc;ng c&oacute; phiếu bảo h&agrave;nh.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm qu&aacute; cũ (da v&agrave; đế qu&aacute; cũ, kh&ocirc;ng c&ograve;n độ b&aacute;m d&iacute;nh giữa da v&agrave; keo).</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm bị hư hỏng v&agrave; lỗi từ ph&iacute;a kh&aacute;ch h&agrave;ng g&acirc;y n&ecirc;n như trầy xước, đế m&ograve;n, sản phẩm kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn do bị động vật cắn, bảo quản kh&ocirc;ng tốt g&acirc;y ẩm mốc, phai nắng, n&oacute;ng chảy, &hellip;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c sản phẩm khuyến m&atilde;i, giảm gi&aacute;.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n<strong>2. QUY ĐỊNH ĐỔI SẢN PHẨM</strong>\r\n\r\n<p>- Sản phẩm được đổi trong v&ograve;ng 07 ng&agrave;y kể từ ng&agrave;y mua v&agrave; chỉ đổi 01 lần duy nhất với gi&aacute; trị bằng hoặc cao hơn, nếu thấp hơn sẽ kh&ocirc;ng được ho&agrave;n tiền.</p>\r\n\r\n<p>- Sản phẩm đổi phải c&ograve;n h&oacute;a đơn, phiếu bảo h&agrave;nh v&agrave; tem thương hiệu.</p>\r\n\r\n<p>- Sản phẩm phải c&ograve;n nguy&ecirc;n vẹn, đế kh&ocirc;ng bị trầy, bị dơ hoặc c&oacute; dấu hiệu đ&atilde; sử dụng.</p>\r\n\r\n<p>- Kh&ocirc;ng &aacute;p dụng ch&iacute;nh s&aacute;ch đổi đối với c&aacute;c sản phẩm đ&atilde; qu&aacute; thời gian đổi, sản phẩm đ&atilde; sử dụng, kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn.</p>\r\n\r\n<p>- C&aacute;c sản phẩm đ&atilde; được thay đổi một số chi tiết theo y&ecirc;u cầu kh&aacute;ch h&agrave;ng đều kh&ocirc;ng được đổi trả hoặc ho&agrave;n tiền.</p>\r\n\r\n<p>- C&aacute;c sản phẩm giảm gi&aacute;, khuyến m&atilde;i, h&agrave;ng tặng được &aacute;p dụng ch&iacute;nh s&aacute;ch đổi theo quy định của từng chương tr&igrave;nh.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n', '2019-04-09 04:21:31', 'no', 10545000, 10624000, 8321000, 9, 7, 'Lazada', 'Tiki', 'Shopee'),
(72, 3, 5, 'Máy giặt Panasonic 11.5 kg NA-F115A5WRV', 'Công nghệ giặt StainMaster - giặt sạch mạnh mẽ các vết bẩn khó chịu như mồ hôi, bùn đất và nước sốt<br />Hệ thống Active Foam - thẩm thấu cực nhanh trên quần áo, giúp đánh bật hoàn toàn các vết bẩn cứng đầu<br />Chế độ sấy gió 90 phút - tiết kiệm thời gian phơi quần áo<br />Lồng giặt SAZANAMI - hạn chế hư tổn quần áo<br />Tính năng vệ sinh lồng giặt - giúp loại bỏ các cặn bã tích tụ trong lồng giặt<br />', 30683000, '<strong>1. CH&Iacute;NH S&Aacute;CH BẢO H&Agrave;NH</strong>\r\n<p><strong>Điều kiện &aacute;p dụng:</strong></p>\r\n\r\n<p>- Kh&aacute;ch h&agrave;ng vui l&ograve;ng xuất tr&igrave;nh phiếu bảo h&agrave;nh để được &aacute;p dụng ch&iacute;nh s&aacute;ch bảo h&agrave;nh.</p>\r\n\r\n<p>- Sản phẩm được&nbsp;<strong>bảo h&agrave;nh miễn ph&iacute;</strong>&nbsp;trong suốt thời gian sử dụng trong c&aacute;c trường hợp sau:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + L&oacute;t tẩy, đệm l&oacute;t tẩy, d&aacute;n đế chống trơn, đế bị bong keo, m&ograve;n đinh g&oacute;t, đứt thun, đứt chỉ.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c chi tiết trang tr&iacute;, phụ kiện (kh&oacute;a, m&oacute;c, d&acirc;y k&eacute;o,... ). C&aacute;c phụ kiện gắn tr&ecirc;n sản phẩm nếu kh&ocirc;ng c&ograve;n phụ kiện thay thế sẽ thay bằng phụ kiện kh&aacute;c tương tự.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Lỗi sơn viền.</p>\r\n\r\n<p>- Ch&uacute;ng t&ocirc;i&nbsp;từ chối bảo h&agrave;nh sản phẩm đối với c&aacute;c trường hợp:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm kh&ocirc;ng c&oacute; phiếu bảo h&agrave;nh.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm qu&aacute; cũ (da v&agrave; đế qu&aacute; cũ, kh&ocirc;ng c&ograve;n độ b&aacute;m d&iacute;nh giữa da v&agrave; keo).</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm bị hư hỏng v&agrave; lỗi từ ph&iacute;a kh&aacute;ch h&agrave;ng g&acirc;y n&ecirc;n như trầy xước, đế m&ograve;n, sản phẩm kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn do bị động vật cắn, bảo quản kh&ocirc;ng tốt g&acirc;y ẩm mốc, phai nắng, n&oacute;ng chảy, &hellip;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c sản phẩm khuyến m&atilde;i, giảm gi&aacute;.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n<strong>2. QUY ĐỊNH ĐỔI SẢN PHẨM</strong>\r\n\r\n<p>- Sản phẩm được đổi trong v&ograve;ng 07 ng&agrave;y kể từ ng&agrave;y mua v&agrave; chỉ đổi 01 lần duy nhất với gi&aacute; trị bằng hoặc cao hơn, nếu thấp hơn sẽ kh&ocirc;ng được ho&agrave;n tiền.</p>\r\n\r\n<p>- Sản phẩm đổi phải c&ograve;n h&oacute;a đơn, phiếu bảo h&agrave;nh v&agrave; tem thương hiệu.</p>\r\n\r\n<p>- Sản phẩm phải c&ograve;n nguy&ecirc;n vẹn, đế kh&ocirc;ng bị trầy, bị dơ hoặc c&oacute; dấu hiệu đ&atilde; sử dụng.</p>\r\n\r\n<p>- Kh&ocirc;ng &aacute;p dụng ch&iacute;nh s&aacute;ch đổi đối với c&aacute;c sản phẩm đ&atilde; qu&aacute; thời gian đổi, sản phẩm đ&atilde; sử dụng, kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn.</p>\r\n\r\n<p>- C&aacute;c sản phẩm đ&atilde; được thay đổi một số chi tiết theo y&ecirc;u cầu kh&aacute;ch h&agrave;ng đều kh&ocirc;ng được đổi trả hoặc ho&agrave;n tiền.</p>\r\n\r\n<p>- C&aacute;c sản phẩm giảm gi&aacute;, khuyến m&atilde;i, h&agrave;ng tặng được &aacute;p dụng ch&iacute;nh s&aacute;ch đổi theo quy định của từng chương tr&igrave;nh.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n', '2019-04-09 04:21:31', 'no', 33035000, 35410000, 32358000, 10, 6, 'Lazada', 'Tiki', 'Shopee');
INSERT INTO `table_product` (`id_product`, `id_category`, `id_producer`, `product_name`, `product_description`, `product_price`, `product_additional_information`, `date_created`, `is_hot`, `product_price_4compare1`, `product_price_4compare2`, `product_price_4compare3`, `customer_point`, `agent_point`, `shop1_name`, `shop2_name`, `shop3_name`) VALUES
(73, 3, 5, 'Máy giặt Toshiba Inverter 10 kg AW-DUH1100GV', 'Động cơ truyền động trực tiếp S-DD Inverter vận hành êm, tiết kiệm điện<br />Công nghệ UFB siêu bọt khí NANO cho hiệu quả giặt sạch tối ưu<br />Mâm giặt Power Pulsator xoáy sâu đồ giặt, hòa tan bột giặt hiệu quả<br />Hiệu ứng thác nước đôi mạnh mẽ giặt sạch vượt trội<br />Lồng giặt ngôi sao pha lê bảo về quần áo bền đẹp<br />Vắt cực khô tiết kiệm thời gian<br />', 12688000, '<strong>1. CH&Iacute;NH S&Aacute;CH BẢO H&Agrave;NH</strong>\r\n<p><strong>Điều kiện &aacute;p dụng:</strong></p>\r\n\r\n<p>- Kh&aacute;ch h&agrave;ng vui l&ograve;ng xuất tr&igrave;nh phiếu bảo h&agrave;nh để được &aacute;p dụng ch&iacute;nh s&aacute;ch bảo h&agrave;nh.</p>\r\n\r\n<p>- Sản phẩm được&nbsp;<strong>bảo h&agrave;nh miễn ph&iacute;</strong>&nbsp;trong suốt thời gian sử dụng trong c&aacute;c trường hợp sau:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + L&oacute;t tẩy, đệm l&oacute;t tẩy, d&aacute;n đế chống trơn, đế bị bong keo, m&ograve;n đinh g&oacute;t, đứt thun, đứt chỉ.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c chi tiết trang tr&iacute;, phụ kiện (kh&oacute;a, m&oacute;c, d&acirc;y k&eacute;o,... ). C&aacute;c phụ kiện gắn tr&ecirc;n sản phẩm nếu kh&ocirc;ng c&ograve;n phụ kiện thay thế sẽ thay bằng phụ kiện kh&aacute;c tương tự.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Lỗi sơn viền.</p>\r\n\r\n<p>- Ch&uacute;ng t&ocirc;i&nbsp;từ chối bảo h&agrave;nh sản phẩm đối với c&aacute;c trường hợp:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm kh&ocirc;ng c&oacute; phiếu bảo h&agrave;nh.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm qu&aacute; cũ (da v&agrave; đế qu&aacute; cũ, kh&ocirc;ng c&ograve;n độ b&aacute;m d&iacute;nh giữa da v&agrave; keo).</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm bị hư hỏng v&agrave; lỗi từ ph&iacute;a kh&aacute;ch h&agrave;ng g&acirc;y n&ecirc;n như trầy xước, đế m&ograve;n, sản phẩm kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn do bị động vật cắn, bảo quản kh&ocirc;ng tốt g&acirc;y ẩm mốc, phai nắng, n&oacute;ng chảy, &hellip;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c sản phẩm khuyến m&atilde;i, giảm gi&aacute;.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n<strong>2. QUY ĐỊNH ĐỔI SẢN PHẨM</strong>\r\n\r\n<p>- Sản phẩm được đổi trong v&ograve;ng 07 ng&agrave;y kể từ ng&agrave;y mua v&agrave; chỉ đổi 01 lần duy nhất với gi&aacute; trị bằng hoặc cao hơn, nếu thấp hơn sẽ kh&ocirc;ng được ho&agrave;n tiền.</p>\r\n\r\n<p>- Sản phẩm đổi phải c&ograve;n h&oacute;a đơn, phiếu bảo h&agrave;nh v&agrave; tem thương hiệu.</p>\r\n\r\n<p>- Sản phẩm phải c&ograve;n nguy&ecirc;n vẹn, đế kh&ocirc;ng bị trầy, bị dơ hoặc c&oacute; dấu hiệu đ&atilde; sử dụng.</p>\r\n\r\n<p>- Kh&ocirc;ng &aacute;p dụng ch&iacute;nh s&aacute;ch đổi đối với c&aacute;c sản phẩm đ&atilde; qu&aacute; thời gian đổi, sản phẩm đ&atilde; sử dụng, kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn.</p>\r\n\r\n<p>- C&aacute;c sản phẩm đ&atilde; được thay đổi một số chi tiết theo y&ecirc;u cầu kh&aacute;ch h&agrave;ng đều kh&ocirc;ng được đổi trả hoặc ho&agrave;n tiền.</p>\r\n\r\n<p>- C&aacute;c sản phẩm giảm gi&aacute;, khuyến m&atilde;i, h&agrave;ng tặng được &aacute;p dụng ch&iacute;nh s&aacute;ch đổi theo quy định của từng chương tr&igrave;nh.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n', '2019-04-09 04:21:31', 'no', 13482000, 14347000, 15396000, 1, 5, 'Lazada', 'Tiki', 'Shopee'),
(74, 3, 5, 'Máy giặt Panasonic 11.5 kg NA-F115A5WRV', 'Công nghệ giặt StainMaster - giặt sạch mạnh mẽ các vết bẩn khó chịu như mồ hôi, bùn đất và nước sốt<br />Hệ thống Active Foam - thẩm thấu cực nhanh trên quần áo, giúp đánh bật hoàn toàn các vết bẩn cứng đầu<br />Chế độ sấy gió 90 phút - tiết kiệm thời gian phơi quần áo<br />Lồng giặt SAZANAMI - hạn chế hư tổn quần áo<br />Tính năng vệ sinh lồng giặt - giúp loại bỏ các cặn bã tích tụ trong lồng giặt<br />', 8105000, '<strong>1. CH&Iacute;NH S&Aacute;CH BẢO H&Agrave;NH</strong>\r\n<p><strong>Điều kiện &aacute;p dụng:</strong></p>\r\n\r\n<p>- Kh&aacute;ch h&agrave;ng vui l&ograve;ng xuất tr&igrave;nh phiếu bảo h&agrave;nh để được &aacute;p dụng ch&iacute;nh s&aacute;ch bảo h&agrave;nh.</p>\r\n\r\n<p>- Sản phẩm được&nbsp;<strong>bảo h&agrave;nh miễn ph&iacute;</strong>&nbsp;trong suốt thời gian sử dụng trong c&aacute;c trường hợp sau:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + L&oacute;t tẩy, đệm l&oacute;t tẩy, d&aacute;n đế chống trơn, đế bị bong keo, m&ograve;n đinh g&oacute;t, đứt thun, đứt chỉ.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c chi tiết trang tr&iacute;, phụ kiện (kh&oacute;a, m&oacute;c, d&acirc;y k&eacute;o,... ). C&aacute;c phụ kiện gắn tr&ecirc;n sản phẩm nếu kh&ocirc;ng c&ograve;n phụ kiện thay thế sẽ thay bằng phụ kiện kh&aacute;c tương tự.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Lỗi sơn viền.</p>\r\n\r\n<p>- Ch&uacute;ng t&ocirc;i&nbsp;từ chối bảo h&agrave;nh sản phẩm đối với c&aacute;c trường hợp:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm kh&ocirc;ng c&oacute; phiếu bảo h&agrave;nh.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm qu&aacute; cũ (da v&agrave; đế qu&aacute; cũ, kh&ocirc;ng c&ograve;n độ b&aacute;m d&iacute;nh giữa da v&agrave; keo).</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm bị hư hỏng v&agrave; lỗi từ ph&iacute;a kh&aacute;ch h&agrave;ng g&acirc;y n&ecirc;n như trầy xước, đế m&ograve;n, sản phẩm kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn do bị động vật cắn, bảo quản kh&ocirc;ng tốt g&acirc;y ẩm mốc, phai nắng, n&oacute;ng chảy, &hellip;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c sản phẩm khuyến m&atilde;i, giảm gi&aacute;.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n<strong>2. QUY ĐỊNH ĐỔI SẢN PHẨM</strong>\r\n\r\n<p>- Sản phẩm được đổi trong v&ograve;ng 07 ng&agrave;y kể từ ng&agrave;y mua v&agrave; chỉ đổi 01 lần duy nhất với gi&aacute; trị bằng hoặc cao hơn, nếu thấp hơn sẽ kh&ocirc;ng được ho&agrave;n tiền.</p>\r\n\r\n<p>- Sản phẩm đổi phải c&ograve;n h&oacute;a đơn, phiếu bảo h&agrave;nh v&agrave; tem thương hiệu.</p>\r\n\r\n<p>- Sản phẩm phải c&ograve;n nguy&ecirc;n vẹn, đế kh&ocirc;ng bị trầy, bị dơ hoặc c&oacute; dấu hiệu đ&atilde; sử dụng.</p>\r\n\r\n<p>- Kh&ocirc;ng &aacute;p dụng ch&iacute;nh s&aacute;ch đổi đối với c&aacute;c sản phẩm đ&atilde; qu&aacute; thời gian đổi, sản phẩm đ&atilde; sử dụng, kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn.</p>\r\n\r\n<p>- C&aacute;c sản phẩm đ&atilde; được thay đổi một số chi tiết theo y&ecirc;u cầu kh&aacute;ch h&agrave;ng đều kh&ocirc;ng được đổi trả hoặc ho&agrave;n tiền.</p>\r\n\r\n<p>- C&aacute;c sản phẩm giảm gi&aacute;, khuyến m&atilde;i, h&agrave;ng tặng được &aacute;p dụng ch&iacute;nh s&aacute;ch đổi theo quy định của từng chương tr&igrave;nh.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n', '2019-04-09 04:21:31', 'no', 8443000, 9698000, 10078000, 7, 4, 'Lazada', 'Tiki', 'Shopee'),
(75, 3, 5, 'Máy giặt Toshiba Inverter 10 kg AW-DUH1100GV', 'Động cơ truyền động trực tiếp S-DD Inverter vận hành êm, tiết kiệm điện<br />Công nghệ UFB siêu bọt khí NANO cho hiệu quả giặt sạch tối ưu<br />Mâm giặt Power Pulsator xoáy sâu đồ giặt, hòa tan bột giặt hiệu quả<br />Hiệu ứng thác nước đôi mạnh mẽ giặt sạch vượt trội<br />Lồng giặt ngôi sao pha lê bảo về quần áo bền đẹp<br />Vắt cực khô tiết kiệm thời gian<br />', 12975000, '<strong>1. CH&Iacute;NH S&Aacute;CH BẢO H&Agrave;NH</strong>\r\n<p><strong>Điều kiện &aacute;p dụng:</strong></p>\r\n\r\n<p>- Kh&aacute;ch h&agrave;ng vui l&ograve;ng xuất tr&igrave;nh phiếu bảo h&agrave;nh để được &aacute;p dụng ch&iacute;nh s&aacute;ch bảo h&agrave;nh.</p>\r\n\r\n<p>- Sản phẩm được&nbsp;<strong>bảo h&agrave;nh miễn ph&iacute;</strong>&nbsp;trong suốt thời gian sử dụng trong c&aacute;c trường hợp sau:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + L&oacute;t tẩy, đệm l&oacute;t tẩy, d&aacute;n đế chống trơn, đế bị bong keo, m&ograve;n đinh g&oacute;t, đứt thun, đứt chỉ.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c chi tiết trang tr&iacute;, phụ kiện (kh&oacute;a, m&oacute;c, d&acirc;y k&eacute;o,... ). C&aacute;c phụ kiện gắn tr&ecirc;n sản phẩm nếu kh&ocirc;ng c&ograve;n phụ kiện thay thế sẽ thay bằng phụ kiện kh&aacute;c tương tự.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Lỗi sơn viền.</p>\r\n\r\n<p>- Ch&uacute;ng t&ocirc;i&nbsp;từ chối bảo h&agrave;nh sản phẩm đối với c&aacute;c trường hợp:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm kh&ocirc;ng c&oacute; phiếu bảo h&agrave;nh.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm qu&aacute; cũ (da v&agrave; đế qu&aacute; cũ, kh&ocirc;ng c&ograve;n độ b&aacute;m d&iacute;nh giữa da v&agrave; keo).</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm bị hư hỏng v&agrave; lỗi từ ph&iacute;a kh&aacute;ch h&agrave;ng g&acirc;y n&ecirc;n như trầy xước, đế m&ograve;n, sản phẩm kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn do bị động vật cắn, bảo quản kh&ocirc;ng tốt g&acirc;y ẩm mốc, phai nắng, n&oacute;ng chảy, &hellip;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c sản phẩm khuyến m&atilde;i, giảm gi&aacute;.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n<strong>2. QUY ĐỊNH ĐỔI SẢN PHẨM</strong>\r\n\r\n<p>- Sản phẩm được đổi trong v&ograve;ng 07 ng&agrave;y kể từ ng&agrave;y mua v&agrave; chỉ đổi 01 lần duy nhất với gi&aacute; trị bằng hoặc cao hơn, nếu thấp hơn sẽ kh&ocirc;ng được ho&agrave;n tiền.</p>\r\n\r\n<p>- Sản phẩm đổi phải c&ograve;n h&oacute;a đơn, phiếu bảo h&agrave;nh v&agrave; tem thương hiệu.</p>\r\n\r\n<p>- Sản phẩm phải c&ograve;n nguy&ecirc;n vẹn, đế kh&ocirc;ng bị trầy, bị dơ hoặc c&oacute; dấu hiệu đ&atilde; sử dụng.</p>\r\n\r\n<p>- Kh&ocirc;ng &aacute;p dụng ch&iacute;nh s&aacute;ch đổi đối với c&aacute;c sản phẩm đ&atilde; qu&aacute; thời gian đổi, sản phẩm đ&atilde; sử dụng, kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn.</p>\r\n\r\n<p>- C&aacute;c sản phẩm đ&atilde; được thay đổi một số chi tiết theo y&ecirc;u cầu kh&aacute;ch h&agrave;ng đều kh&ocirc;ng được đổi trả hoặc ho&agrave;n tiền.</p>\r\n\r\n<p>- C&aacute;c sản phẩm giảm gi&aacute;, khuyến m&atilde;i, h&agrave;ng tặng được &aacute;p dụng ch&iacute;nh s&aacute;ch đổi theo quy định của từng chương tr&igrave;nh.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n', '2019-04-09 04:21:31', 'no', 16396000, 15905000, 16403000, 7, 7, 'Lazada', 'Tiki', 'Shopee'),
(76, 3, 5, 'Máy giặt Panasonic 11.5 kg NA-F115A5WRV', 'Công nghệ giặt StainMaster - giặt sạch mạnh mẽ các vết bẩn khó chịu như mồ hôi, bùn đất và nước sốt<br />Hệ thống Active Foam - thẩm thấu cực nhanh trên quần áo, giúp đánh bật hoàn toàn các vết bẩn cứng đầu<br />Chế độ sấy gió 90 phút - tiết kiệm thời gian phơi quần áo<br />Lồng giặt SAZANAMI - hạn chế hư tổn quần áo<br />Tính năng vệ sinh lồng giặt - giúp loại bỏ các cặn bã tích tụ trong lồng giặt<br />', 44862000, '<strong>1. CH&Iacute;NH S&Aacute;CH BẢO H&Agrave;NH</strong>\r\n<p><strong>Điều kiện &aacute;p dụng:</strong></p>\r\n\r\n<p>- Kh&aacute;ch h&agrave;ng vui l&ograve;ng xuất tr&igrave;nh phiếu bảo h&agrave;nh để được &aacute;p dụng ch&iacute;nh s&aacute;ch bảo h&agrave;nh.</p>\r\n\r\n<p>- Sản phẩm được&nbsp;<strong>bảo h&agrave;nh miễn ph&iacute;</strong>&nbsp;trong suốt thời gian sử dụng trong c&aacute;c trường hợp sau:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + L&oacute;t tẩy, đệm l&oacute;t tẩy, d&aacute;n đế chống trơn, đế bị bong keo, m&ograve;n đinh g&oacute;t, đứt thun, đứt chỉ.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c chi tiết trang tr&iacute;, phụ kiện (kh&oacute;a, m&oacute;c, d&acirc;y k&eacute;o,... ). C&aacute;c phụ kiện gắn tr&ecirc;n sản phẩm nếu kh&ocirc;ng c&ograve;n phụ kiện thay thế sẽ thay bằng phụ kiện kh&aacute;c tương tự.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Lỗi sơn viền.</p>\r\n\r\n<p>- Ch&uacute;ng t&ocirc;i&nbsp;từ chối bảo h&agrave;nh sản phẩm đối với c&aacute;c trường hợp:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm kh&ocirc;ng c&oacute; phiếu bảo h&agrave;nh.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm qu&aacute; cũ (da v&agrave; đế qu&aacute; cũ, kh&ocirc;ng c&ograve;n độ b&aacute;m d&iacute;nh giữa da v&agrave; keo).</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm bị hư hỏng v&agrave; lỗi từ ph&iacute;a kh&aacute;ch h&agrave;ng g&acirc;y n&ecirc;n như trầy xước, đế m&ograve;n, sản phẩm kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn do bị động vật cắn, bảo quản kh&ocirc;ng tốt g&acirc;y ẩm mốc, phai nắng, n&oacute;ng chảy, &hellip;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c sản phẩm khuyến m&atilde;i, giảm gi&aacute;.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n<strong>2. QUY ĐỊNH ĐỔI SẢN PHẨM</strong>\r\n\r\n<p>- Sản phẩm được đổi trong v&ograve;ng 07 ng&agrave;y kể từ ng&agrave;y mua v&agrave; chỉ đổi 01 lần duy nhất với gi&aacute; trị bằng hoặc cao hơn, nếu thấp hơn sẽ kh&ocirc;ng được ho&agrave;n tiền.</p>\r\n\r\n<p>- Sản phẩm đổi phải c&ograve;n h&oacute;a đơn, phiếu bảo h&agrave;nh v&agrave; tem thương hiệu.</p>\r\n\r\n<p>- Sản phẩm phải c&ograve;n nguy&ecirc;n vẹn, đế kh&ocirc;ng bị trầy, bị dơ hoặc c&oacute; dấu hiệu đ&atilde; sử dụng.</p>\r\n\r\n<p>- Kh&ocirc;ng &aacute;p dụng ch&iacute;nh s&aacute;ch đổi đối với c&aacute;c sản phẩm đ&atilde; qu&aacute; thời gian đổi, sản phẩm đ&atilde; sử dụng, kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn.</p>\r\n\r\n<p>- C&aacute;c sản phẩm đ&atilde; được thay đổi một số chi tiết theo y&ecirc;u cầu kh&aacute;ch h&agrave;ng đều kh&ocirc;ng được đổi trả hoặc ho&agrave;n tiền.</p>\r\n\r\n<p>- C&aacute;c sản phẩm giảm gi&aacute;, khuyến m&atilde;i, h&agrave;ng tặng được &aacute;p dụng ch&iacute;nh s&aacute;ch đổi theo quy định của từng chương tr&igrave;nh.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n', '2019-04-09 04:21:31', 'no', 45153000, 46606000, 46114000, 20, 3, 'Lazada', 'Tiki', 'Shopee'),
(77, 3, 5, 'Máy giặt Toshiba Inverter 10 kg AW-DUH1100GV', 'Động cơ truyền động trực tiếp S-DD Inverter vận hành êm, tiết kiệm điện<br />Công nghệ UFB siêu bọt khí NANO cho hiệu quả giặt sạch tối ưu<br />Mâm giặt Power Pulsator xoáy sâu đồ giặt, hòa tan bột giặt hiệu quả<br />Hiệu ứng thác nước đôi mạnh mẽ giặt sạch vượt trội<br />Lồng giặt ngôi sao pha lê bảo về quần áo bền đẹp<br />Vắt cực khô tiết kiệm thời gian<br />', 27628000, '<strong>1. CH&Iacute;NH S&Aacute;CH BẢO H&Agrave;NH</strong>\r\n<p><strong>Điều kiện &aacute;p dụng:</strong></p>\r\n\r\n<p>- Kh&aacute;ch h&agrave;ng vui l&ograve;ng xuất tr&igrave;nh phiếu bảo h&agrave;nh để được &aacute;p dụng ch&iacute;nh s&aacute;ch bảo h&agrave;nh.</p>\r\n\r\n<p>- Sản phẩm được&nbsp;<strong>bảo h&agrave;nh miễn ph&iacute;</strong>&nbsp;trong suốt thời gian sử dụng trong c&aacute;c trường hợp sau:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + L&oacute;t tẩy, đệm l&oacute;t tẩy, d&aacute;n đế chống trơn, đế bị bong keo, m&ograve;n đinh g&oacute;t, đứt thun, đứt chỉ.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c chi tiết trang tr&iacute;, phụ kiện (kh&oacute;a, m&oacute;c, d&acirc;y k&eacute;o,... ). C&aacute;c phụ kiện gắn tr&ecirc;n sản phẩm nếu kh&ocirc;ng c&ograve;n phụ kiện thay thế sẽ thay bằng phụ kiện kh&aacute;c tương tự.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Lỗi sơn viền.</p>\r\n\r\n<p>- Ch&uacute;ng t&ocirc;i&nbsp;từ chối bảo h&agrave;nh sản phẩm đối với c&aacute;c trường hợp:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm kh&ocirc;ng c&oacute; phiếu bảo h&agrave;nh.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm qu&aacute; cũ (da v&agrave; đế qu&aacute; cũ, kh&ocirc;ng c&ograve;n độ b&aacute;m d&iacute;nh giữa da v&agrave; keo).</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm bị hư hỏng v&agrave; lỗi từ ph&iacute;a kh&aacute;ch h&agrave;ng g&acirc;y n&ecirc;n như trầy xước, đế m&ograve;n, sản phẩm kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn do bị động vật cắn, bảo quản kh&ocirc;ng tốt g&acirc;y ẩm mốc, phai nắng, n&oacute;ng chảy, &hellip;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c sản phẩm khuyến m&atilde;i, giảm gi&aacute;.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n<strong>2. QUY ĐỊNH ĐỔI SẢN PHẨM</strong>\r\n\r\n<p>- Sản phẩm được đổi trong v&ograve;ng 07 ng&agrave;y kể từ ng&agrave;y mua v&agrave; chỉ đổi 01 lần duy nhất với gi&aacute; trị bằng hoặc cao hơn, nếu thấp hơn sẽ kh&ocirc;ng được ho&agrave;n tiền.</p>\r\n\r\n<p>- Sản phẩm đổi phải c&ograve;n h&oacute;a đơn, phiếu bảo h&agrave;nh v&agrave; tem thương hiệu.</p>\r\n\r\n<p>- Sản phẩm phải c&ograve;n nguy&ecirc;n vẹn, đế kh&ocirc;ng bị trầy, bị dơ hoặc c&oacute; dấu hiệu đ&atilde; sử dụng.</p>\r\n\r\n<p>- Kh&ocirc;ng &aacute;p dụng ch&iacute;nh s&aacute;ch đổi đối với c&aacute;c sản phẩm đ&atilde; qu&aacute; thời gian đổi, sản phẩm đ&atilde; sử dụng, kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn.</p>\r\n\r\n<p>- C&aacute;c sản phẩm đ&atilde; được thay đổi một số chi tiết theo y&ecirc;u cầu kh&aacute;ch h&agrave;ng đều kh&ocirc;ng được đổi trả hoặc ho&agrave;n tiền.</p>\r\n\r\n<p>- C&aacute;c sản phẩm giảm gi&aacute;, khuyến m&atilde;i, h&agrave;ng tặng được &aacute;p dụng ch&iacute;nh s&aacute;ch đổi theo quy định của từng chương tr&igrave;nh.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n', '2019-04-09 04:21:31', 'no', 32389000, 29450000, 31111000, 11, 7, 'Lazada', 'Tiki', 'Shopee'),
(78, 3, 5, 'Máy giặt Panasonic 11.5 kg NA-F115A5WRV', 'Công nghệ giặt StainMaster - giặt sạch mạnh mẽ các vết bẩn khó chịu như mồ hôi, bùn đất và nước sốt<br />Hệ thống Active Foam - thẩm thấu cực nhanh trên quần áo, giúp đánh bật hoàn toàn các vết bẩn cứng đầu<br />Chế độ sấy gió 90 phút - tiết kiệm thời gian phơi quần áo<br />Lồng giặt SAZANAMI - hạn chế hư tổn quần áo<br />Tính năng vệ sinh lồng giặt - giúp loại bỏ các cặn bã tích tụ trong lồng giặt<br />', 45995000, '<strong>1. CH&Iacute;NH S&Aacute;CH BẢO H&Agrave;NH</strong>\r\n<p><strong>Điều kiện &aacute;p dụng:</strong></p>\r\n\r\n<p>- Kh&aacute;ch h&agrave;ng vui l&ograve;ng xuất tr&igrave;nh phiếu bảo h&agrave;nh để được &aacute;p dụng ch&iacute;nh s&aacute;ch bảo h&agrave;nh.</p>\r\n\r\n<p>- Sản phẩm được&nbsp;<strong>bảo h&agrave;nh miễn ph&iacute;</strong>&nbsp;trong suốt thời gian sử dụng trong c&aacute;c trường hợp sau:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + L&oacute;t tẩy, đệm l&oacute;t tẩy, d&aacute;n đế chống trơn, đế bị bong keo, m&ograve;n đinh g&oacute;t, đứt thun, đứt chỉ.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c chi tiết trang tr&iacute;, phụ kiện (kh&oacute;a, m&oacute;c, d&acirc;y k&eacute;o,... ). C&aacute;c phụ kiện gắn tr&ecirc;n sản phẩm nếu kh&ocirc;ng c&ograve;n phụ kiện thay thế sẽ thay bằng phụ kiện kh&aacute;c tương tự.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Lỗi sơn viền.</p>\r\n\r\n<p>- Ch&uacute;ng t&ocirc;i&nbsp;từ chối bảo h&agrave;nh sản phẩm đối với c&aacute;c trường hợp:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm kh&ocirc;ng c&oacute; phiếu bảo h&agrave;nh.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm qu&aacute; cũ (da v&agrave; đế qu&aacute; cũ, kh&ocirc;ng c&ograve;n độ b&aacute;m d&iacute;nh giữa da v&agrave; keo).</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm bị hư hỏng v&agrave; lỗi từ ph&iacute;a kh&aacute;ch h&agrave;ng g&acirc;y n&ecirc;n như trầy xước, đế m&ograve;n, sản phẩm kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn do bị động vật cắn, bảo quản kh&ocirc;ng tốt g&acirc;y ẩm mốc, phai nắng, n&oacute;ng chảy, &hellip;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c sản phẩm khuyến m&atilde;i, giảm gi&aacute;.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n<strong>2. QUY ĐỊNH ĐỔI SẢN PHẨM</strong>\r\n\r\n<p>- Sản phẩm được đổi trong v&ograve;ng 07 ng&agrave;y kể từ ng&agrave;y mua v&agrave; chỉ đổi 01 lần duy nhất với gi&aacute; trị bằng hoặc cao hơn, nếu thấp hơn sẽ kh&ocirc;ng được ho&agrave;n tiền.</p>\r\n\r\n<p>- Sản phẩm đổi phải c&ograve;n h&oacute;a đơn, phiếu bảo h&agrave;nh v&agrave; tem thương hiệu.</p>\r\n\r\n<p>- Sản phẩm phải c&ograve;n nguy&ecirc;n vẹn, đế kh&ocirc;ng bị trầy, bị dơ hoặc c&oacute; dấu hiệu đ&atilde; sử dụng.</p>\r\n\r\n<p>- Kh&ocirc;ng &aacute;p dụng ch&iacute;nh s&aacute;ch đổi đối với c&aacute;c sản phẩm đ&atilde; qu&aacute; thời gian đổi, sản phẩm đ&atilde; sử dụng, kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn.</p>\r\n\r\n<p>- C&aacute;c sản phẩm đ&atilde; được thay đổi một số chi tiết theo y&ecirc;u cầu kh&aacute;ch h&agrave;ng đều kh&ocirc;ng được đổi trả hoặc ho&agrave;n tiền.</p>\r\n\r\n<p>- C&aacute;c sản phẩm giảm gi&aacute;, khuyến m&atilde;i, h&agrave;ng tặng được &aacute;p dụng ch&iacute;nh s&aacute;ch đổi theo quy định của từng chương tr&igrave;nh.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n', '2019-04-09 04:21:31', 'no', 49376000, 49279000, 49036000, 18, 6, 'Lazada', 'Tiki', 'Shopee'),
(79, 3, 5, 'Máy giặt Toshiba Inverter 10 kg AW-DUH1100GV', 'Động cơ truyền động trực tiếp S-DD Inverter vận h&agrave;nh &ecirc;m, tiết kiệm điện<br />\r\nC&ocirc;ng nghệ UFB si&ecirc;u bọt kh&iacute; NANO cho hiệu quả giặt sạch tối ưu<br />\r\nM&acirc;m giặt Power Pulsator xo&aacute;y s&acirc;u đồ giặt, h&ograve;a tan bột giặt hiệu quả<br />\r\nHiệu ứng th&aacute;c nước đ&ocirc;i mạnh mẽ giặt sạch vượt trội<br />\r\nLồng giặt ng&ocirc;i sao pha l&ecirc; bảo về quần &aacute;o bền đẹp<br />\r\nVắt cực kh&ocirc; tiết kiệm thời gian', 23535000, '<strong>1. CH&Iacute;NH S&Aacute;CH BẢO H&Agrave;NH</strong>\r\n<p><strong>Điều kiện &aacute;p dụng:</strong></p>\r\n\r\n<p>- Kh&aacute;ch h&agrave;ng vui l&ograve;ng xuất tr&igrave;nh phiếu bảo h&agrave;nh để được &aacute;p dụng ch&iacute;nh s&aacute;ch bảo h&agrave;nh.</p>\r\n\r\n<p>- Sản phẩm được&nbsp;<strong>bảo h&agrave;nh miễn ph&iacute;</strong>&nbsp;trong suốt thời gian sử dụng trong c&aacute;c trường hợp sau:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + L&oacute;t tẩy, đệm l&oacute;t tẩy, d&aacute;n đế chống trơn, đế bị bong keo, m&ograve;n đinh g&oacute;t, đứt thun, đứt chỉ.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c chi tiết trang tr&iacute;, phụ kiện (kh&oacute;a, m&oacute;c, d&acirc;y k&eacute;o,... ). C&aacute;c phụ kiện gắn tr&ecirc;n sản phẩm nếu kh&ocirc;ng c&ograve;n phụ kiện thay thế sẽ thay bằng phụ kiện kh&aacute;c tương tự.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Lỗi sơn viền.</p>\r\n\r\n<p>- Ch&uacute;ng t&ocirc;i&nbsp;từ chối bảo h&agrave;nh sản phẩm đối với c&aacute;c trường hợp:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm kh&ocirc;ng c&oacute; phiếu bảo h&agrave;nh.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm qu&aacute; cũ (da v&agrave; đế qu&aacute; cũ, kh&ocirc;ng c&ograve;n độ b&aacute;m d&iacute;nh giữa da v&agrave; keo).</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm bị hư hỏng v&agrave; lỗi từ ph&iacute;a kh&aacute;ch h&agrave;ng g&acirc;y n&ecirc;n như trầy xước, đế m&ograve;n, sản phẩm kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn do bị động vật cắn, bảo quản kh&ocirc;ng tốt g&acirc;y ẩm mốc, phai nắng, n&oacute;ng chảy, &hellip;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c sản phẩm khuyến m&atilde;i, giảm gi&aacute;.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n<strong>2. QUY ĐỊNH ĐỔI SẢN PHẨM</strong>\r\n\r\n<p>- Sản phẩm được đổi trong v&ograve;ng 07 ng&agrave;y kể từ ng&agrave;y mua v&agrave; chỉ đổi 01 lần duy nhất với gi&aacute; trị bằng hoặc cao hơn, nếu thấp hơn sẽ kh&ocirc;ng được ho&agrave;n tiền.</p>\r\n\r\n<p>- Sản phẩm đổi phải c&ograve;n h&oacute;a đơn, phiếu bảo h&agrave;nh v&agrave; tem thương hiệu.</p>\r\n\r\n<p>- Sản phẩm phải c&ograve;n nguy&ecirc;n vẹn, đế kh&ocirc;ng bị trầy, bị dơ hoặc c&oacute; dấu hiệu đ&atilde; sử dụng.</p>\r\n\r\n<p>- Kh&ocirc;ng &aacute;p dụng ch&iacute;nh s&aacute;ch đổi đối với c&aacute;c sản phẩm đ&atilde; qu&aacute; thời gian đổi, sản phẩm đ&atilde; sử dụng, kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn.</p>\r\n\r\n<p>- C&aacute;c sản phẩm đ&atilde; được thay đổi một số chi tiết theo y&ecirc;u cầu kh&aacute;ch h&agrave;ng đều kh&ocirc;ng được đổi trả hoặc ho&agrave;n tiền.</p>\r\n\r\n<p>- C&aacute;c sản phẩm giảm gi&aacute;, khuyến m&atilde;i, h&agrave;ng tặng được &aacute;p dụng ch&iacute;nh s&aacute;ch đổi theo quy định của từng chương tr&igrave;nh.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n', '2019-04-27 07:23:34', 'no', 26273000, 24348000, 24237000, 16, 7, 'Lazada', 'Tiki', 'Shopee'),
(96, 5, 11, 'Quạt điều hòa Daikio DKA-05000A', 'Quạt điều hòa công suất 210 W, diện tích làm mát 30 – 40 m2<br />3 tốc độ gió, chế độ đảo gió 4 chiều làm mát nhanh hơn, rộng hơn<br />Dung tích bình chứa nước lớn 55 lít, cho thời gian sử dụng 10 – 13 tiếng<br />', 35946000, '<strong>1. CH&Iacute;NH S&Aacute;CH BẢO H&Agrave;NH</strong>\r\n<p><strong>Điều kiện &aacute;p dụng:</strong></p>\r\n\r\n<p>- Kh&aacute;ch h&agrave;ng vui l&ograve;ng xuất tr&igrave;nh phiếu bảo h&agrave;nh để được &aacute;p dụng ch&iacute;nh s&aacute;ch bảo h&agrave;nh.</p>\r\n\r\n<p>- Sản phẩm được&nbsp;<strong>bảo h&agrave;nh miễn ph&iacute;</strong>&nbsp;trong suốt thời gian sử dụng trong c&aacute;c trường hợp sau:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + L&oacute;t tẩy, đệm l&oacute;t tẩy, d&aacute;n đế chống trơn, đế bị bong keo, m&ograve;n đinh g&oacute;t, đứt thun, đứt chỉ.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c chi tiết trang tr&iacute;, phụ kiện (kh&oacute;a, m&oacute;c, d&acirc;y k&eacute;o,... ). C&aacute;c phụ kiện gắn tr&ecirc;n sản phẩm nếu kh&ocirc;ng c&ograve;n phụ kiện thay thế sẽ thay bằng phụ kiện kh&aacute;c tương tự.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Lỗi sơn viền.</p>\r\n\r\n<p>- Ch&uacute;ng t&ocirc;i&nbsp;từ chối bảo h&agrave;nh sản phẩm đối với c&aacute;c trường hợp:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm kh&ocirc;ng c&oacute; phiếu bảo h&agrave;nh.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm qu&aacute; cũ (da v&agrave; đế qu&aacute; cũ, kh&ocirc;ng c&ograve;n độ b&aacute;m d&iacute;nh giữa da v&agrave; keo).</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm bị hư hỏng v&agrave; lỗi từ ph&iacute;a kh&aacute;ch h&agrave;ng g&acirc;y n&ecirc;n như trầy xước, đế m&ograve;n, sản phẩm kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn do bị động vật cắn, bảo quản kh&ocirc;ng tốt g&acirc;y ẩm mốc, phai nắng, n&oacute;ng chảy, &hellip;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c sản phẩm khuyến m&atilde;i, giảm gi&aacute;.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n<strong>2. QUY ĐỊNH ĐỔI SẢN PHẨM</strong>\r\n\r\n<p>- Sản phẩm được đổi trong v&ograve;ng 07 ng&agrave;y kể từ ng&agrave;y mua v&agrave; chỉ đổi 01 lần duy nhất với gi&aacute; trị bằng hoặc cao hơn, nếu thấp hơn sẽ kh&ocirc;ng được ho&agrave;n tiền.</p>\r\n\r\n<p>- Sản phẩm đổi phải c&ograve;n h&oacute;a đơn, phiếu bảo h&agrave;nh v&agrave; tem thương hiệu.</p>\r\n\r\n<p>- Sản phẩm phải c&ograve;n nguy&ecirc;n vẹn, đế kh&ocirc;ng bị trầy, bị dơ hoặc c&oacute; dấu hiệu đ&atilde; sử dụng.</p>\r\n\r\n<p>- Kh&ocirc;ng &aacute;p dụng ch&iacute;nh s&aacute;ch đổi đối với c&aacute;c sản phẩm đ&atilde; qu&aacute; thời gian đổi, sản phẩm đ&atilde; sử dụng, kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn.</p>\r\n\r\n<p>- C&aacute;c sản phẩm đ&atilde; được thay đổi một số chi tiết theo y&ecirc;u cầu kh&aacute;ch h&agrave;ng đều kh&ocirc;ng được đổi trả hoặc ho&agrave;n tiền.</p>\r\n\r\n<p>- C&aacute;c sản phẩm giảm gi&aacute;, khuyến m&atilde;i, h&agrave;ng tặng được &aacute;p dụng ch&iacute;nh s&aacute;ch đổi theo quy định của từng chương tr&igrave;nh.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n', '2019-04-09 04:21:31', 'no', 37199000, 38175000, 36629000, 10, 10, 'Lazada', 'Tiki', 'Shopee'),
(97, 5, 13, 'Quạt điều hòa Daikio DKA-01500B', 'Quạt điều hòa Daiko hoạt động với công suất 100 W, làm mát không khí nhanh, ít tốn điện<br />Có 3 tốc độ gió, chế độ đảo chiều gió linh hoạt<br />Chức năng hẹn giờ tắt, tạo ion lọc không khí tiện dụng<br />Thương hiệu nổi tiếng Việt Nam – Daikio, sản phẩm đẹp, chất lượng<br />', 13207000, '<strong>1. CH&Iacute;NH S&Aacute;CH BẢO H&Agrave;NH</strong>\r\n<p><strong>Điều kiện &aacute;p dụng:</strong></p>\r\n\r\n<p>- Kh&aacute;ch h&agrave;ng vui l&ograve;ng xuất tr&igrave;nh phiếu bảo h&agrave;nh để được &aacute;p dụng ch&iacute;nh s&aacute;ch bảo h&agrave;nh.</p>\r\n\r\n<p>- Sản phẩm được&nbsp;<strong>bảo h&agrave;nh miễn ph&iacute;</strong>&nbsp;trong suốt thời gian sử dụng trong c&aacute;c trường hợp sau:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + L&oacute;t tẩy, đệm l&oacute;t tẩy, d&aacute;n đế chống trơn, đế bị bong keo, m&ograve;n đinh g&oacute;t, đứt thun, đứt chỉ.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c chi tiết trang tr&iacute;, phụ kiện (kh&oacute;a, m&oacute;c, d&acirc;y k&eacute;o,... ). C&aacute;c phụ kiện gắn tr&ecirc;n sản phẩm nếu kh&ocirc;ng c&ograve;n phụ kiện thay thế sẽ thay bằng phụ kiện kh&aacute;c tương tự.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Lỗi sơn viền.</p>\r\n\r\n<p>- Ch&uacute;ng t&ocirc;i&nbsp;từ chối bảo h&agrave;nh sản phẩm đối với c&aacute;c trường hợp:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm kh&ocirc;ng c&oacute; phiếu bảo h&agrave;nh.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm qu&aacute; cũ (da v&agrave; đế qu&aacute; cũ, kh&ocirc;ng c&ograve;n độ b&aacute;m d&iacute;nh giữa da v&agrave; keo).</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm bị hư hỏng v&agrave; lỗi từ ph&iacute;a kh&aacute;ch h&agrave;ng g&acirc;y n&ecirc;n như trầy xước, đế m&ograve;n, sản phẩm kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn do bị động vật cắn, bảo quản kh&ocirc;ng tốt g&acirc;y ẩm mốc, phai nắng, n&oacute;ng chảy, &hellip;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c sản phẩm khuyến m&atilde;i, giảm gi&aacute;.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n<strong>2. QUY ĐỊNH ĐỔI SẢN PHẨM</strong>\r\n\r\n<p>- Sản phẩm được đổi trong v&ograve;ng 07 ng&agrave;y kể từ ng&agrave;y mua v&agrave; chỉ đổi 01 lần duy nhất với gi&aacute; trị bằng hoặc cao hơn, nếu thấp hơn sẽ kh&ocirc;ng được ho&agrave;n tiền.</p>\r\n\r\n<p>- Sản phẩm đổi phải c&ograve;n h&oacute;a đơn, phiếu bảo h&agrave;nh v&agrave; tem thương hiệu.</p>\r\n\r\n<p>- Sản phẩm phải c&ograve;n nguy&ecirc;n vẹn, đế kh&ocirc;ng bị trầy, bị dơ hoặc c&oacute; dấu hiệu đ&atilde; sử dụng.</p>\r\n\r\n<p>- Kh&ocirc;ng &aacute;p dụng ch&iacute;nh s&aacute;ch đổi đối với c&aacute;c sản phẩm đ&atilde; qu&aacute; thời gian đổi, sản phẩm đ&atilde; sử dụng, kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn.</p>\r\n\r\n<p>- C&aacute;c sản phẩm đ&atilde; được thay đổi một số chi tiết theo y&ecirc;u cầu kh&aacute;ch h&agrave;ng đều kh&ocirc;ng được đổi trả hoặc ho&agrave;n tiền.</p>\r\n\r\n<p>- C&aacute;c sản phẩm giảm gi&aacute;, khuyến m&atilde;i, h&agrave;ng tặng được &aacute;p dụng ch&iacute;nh s&aacute;ch đổi theo quy định của từng chương tr&igrave;nh.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n', '2019-04-09 04:21:31', 'no', 18155000, 18097000, 15793000, 6, 9, 'Lazada', 'Tiki', 'Shopee'),
(98, 5, 11, 'Quạt điều hòa Daikio DKA-05000A', 'Quạt điều hòa công suất 210 W, diện tích làm mát 30 – 40 m2<br />3 tốc độ gió, chế độ đảo gió 4 chiều làm mát nhanh hơn, rộng hơn<br />Dung tích bình chứa nước lớn 55 lít, cho thời gian sử dụng 10 – 13 tiếng<br />', 27099000, '<strong>1. CH&Iacute;NH S&Aacute;CH BẢO H&Agrave;NH</strong>\r\n<p><strong>Điều kiện &aacute;p dụng:</strong></p>\r\n\r\n<p>- Kh&aacute;ch h&agrave;ng vui l&ograve;ng xuất tr&igrave;nh phiếu bảo h&agrave;nh để được &aacute;p dụng ch&iacute;nh s&aacute;ch bảo h&agrave;nh.</p>\r\n\r\n<p>- Sản phẩm được&nbsp;<strong>bảo h&agrave;nh miễn ph&iacute;</strong>&nbsp;trong suốt thời gian sử dụng trong c&aacute;c trường hợp sau:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + L&oacute;t tẩy, đệm l&oacute;t tẩy, d&aacute;n đế chống trơn, đế bị bong keo, m&ograve;n đinh g&oacute;t, đứt thun, đứt chỉ.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c chi tiết trang tr&iacute;, phụ kiện (kh&oacute;a, m&oacute;c, d&acirc;y k&eacute;o,... ). C&aacute;c phụ kiện gắn tr&ecirc;n sản phẩm nếu kh&ocirc;ng c&ograve;n phụ kiện thay thế sẽ thay bằng phụ kiện kh&aacute;c tương tự.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Lỗi sơn viền.</p>\r\n\r\n<p>- Ch&uacute;ng t&ocirc;i&nbsp;từ chối bảo h&agrave;nh sản phẩm đối với c&aacute;c trường hợp:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm kh&ocirc;ng c&oacute; phiếu bảo h&agrave;nh.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm qu&aacute; cũ (da v&agrave; đế qu&aacute; cũ, kh&ocirc;ng c&ograve;n độ b&aacute;m d&iacute;nh giữa da v&agrave; keo).</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm bị hư hỏng v&agrave; lỗi từ ph&iacute;a kh&aacute;ch h&agrave;ng g&acirc;y n&ecirc;n như trầy xước, đế m&ograve;n, sản phẩm kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn do bị động vật cắn, bảo quản kh&ocirc;ng tốt g&acirc;y ẩm mốc, phai nắng, n&oacute;ng chảy, &hellip;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c sản phẩm khuyến m&atilde;i, giảm gi&aacute;.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n<strong>2. QUY ĐỊNH ĐỔI SẢN PHẨM</strong>\r\n\r\n<p>- Sản phẩm được đổi trong v&ograve;ng 07 ng&agrave;y kể từ ng&agrave;y mua v&agrave; chỉ đổi 01 lần duy nhất với gi&aacute; trị bằng hoặc cao hơn, nếu thấp hơn sẽ kh&ocirc;ng được ho&agrave;n tiền.</p>\r\n\r\n<p>- Sản phẩm đổi phải c&ograve;n h&oacute;a đơn, phiếu bảo h&agrave;nh v&agrave; tem thương hiệu.</p>\r\n\r\n<p>- Sản phẩm phải c&ograve;n nguy&ecirc;n vẹn, đế kh&ocirc;ng bị trầy, bị dơ hoặc c&oacute; dấu hiệu đ&atilde; sử dụng.</p>\r\n\r\n<p>- Kh&ocirc;ng &aacute;p dụng ch&iacute;nh s&aacute;ch đổi đối với c&aacute;c sản phẩm đ&atilde; qu&aacute; thời gian đổi, sản phẩm đ&atilde; sử dụng, kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn.</p>\r\n\r\n<p>- C&aacute;c sản phẩm đ&atilde; được thay đổi một số chi tiết theo y&ecirc;u cầu kh&aacute;ch h&agrave;ng đều kh&ocirc;ng được đổi trả hoặc ho&agrave;n tiền.</p>\r\n\r\n<p>- C&aacute;c sản phẩm giảm gi&aacute;, khuyến m&atilde;i, h&agrave;ng tặng được &aacute;p dụng ch&iacute;nh s&aacute;ch đổi theo quy định của từng chương tr&igrave;nh.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n', '2019-04-09 04:21:31', 'no', 30945000, 28012000, 31929000, 16, 3, 'Lazada', 'Tiki', 'Shopee'),
(99, 5, 13, 'Quạt điều hòa Daikio DKA-01500B', 'Quạt điều hòa Daiko hoạt động với công suất 100 W, làm mát không khí nhanh, ít tốn điện<br />Có 3 tốc độ gió, chế độ đảo chiều gió linh hoạt<br />Chức năng hẹn giờ tắt, tạo ion lọc không khí tiện dụng<br />Thương hiệu nổi tiếng Việt Nam – Daikio, sản phẩm đẹp, chất lượng<br />', 1741000, '<strong>1. CH&Iacute;NH S&Aacute;CH BẢO H&Agrave;NH</strong>\r\n<p><strong>Điều kiện &aacute;p dụng:</strong></p>\r\n\r\n<p>- Kh&aacute;ch h&agrave;ng vui l&ograve;ng xuất tr&igrave;nh phiếu bảo h&agrave;nh để được &aacute;p dụng ch&iacute;nh s&aacute;ch bảo h&agrave;nh.</p>\r\n\r\n<p>- Sản phẩm được&nbsp;<strong>bảo h&agrave;nh miễn ph&iacute;</strong>&nbsp;trong suốt thời gian sử dụng trong c&aacute;c trường hợp sau:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + L&oacute;t tẩy, đệm l&oacute;t tẩy, d&aacute;n đế chống trơn, đế bị bong keo, m&ograve;n đinh g&oacute;t, đứt thun, đứt chỉ.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c chi tiết trang tr&iacute;, phụ kiện (kh&oacute;a, m&oacute;c, d&acirc;y k&eacute;o,... ). C&aacute;c phụ kiện gắn tr&ecirc;n sản phẩm nếu kh&ocirc;ng c&ograve;n phụ kiện thay thế sẽ thay bằng phụ kiện kh&aacute;c tương tự.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Lỗi sơn viền.</p>\r\n\r\n<p>- Ch&uacute;ng t&ocirc;i&nbsp;từ chối bảo h&agrave;nh sản phẩm đối với c&aacute;c trường hợp:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm kh&ocirc;ng c&oacute; phiếu bảo h&agrave;nh.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm qu&aacute; cũ (da v&agrave; đế qu&aacute; cũ, kh&ocirc;ng c&ograve;n độ b&aacute;m d&iacute;nh giữa da v&agrave; keo).</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm bị hư hỏng v&agrave; lỗi từ ph&iacute;a kh&aacute;ch h&agrave;ng g&acirc;y n&ecirc;n như trầy xước, đế m&ograve;n, sản phẩm kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn do bị động vật cắn, bảo quản kh&ocirc;ng tốt g&acirc;y ẩm mốc, phai nắng, n&oacute;ng chảy, &hellip;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c sản phẩm khuyến m&atilde;i, giảm gi&aacute;.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n<strong>2. QUY ĐỊNH ĐỔI SẢN PHẨM</strong>\r\n\r\n<p>- Sản phẩm được đổi trong v&ograve;ng 07 ng&agrave;y kể từ ng&agrave;y mua v&agrave; chỉ đổi 01 lần duy nhất với gi&aacute; trị bằng hoặc cao hơn, nếu thấp hơn sẽ kh&ocirc;ng được ho&agrave;n tiền.</p>\r\n\r\n<p>- Sản phẩm đổi phải c&ograve;n h&oacute;a đơn, phiếu bảo h&agrave;nh v&agrave; tem thương hiệu.</p>\r\n\r\n<p>- Sản phẩm phải c&ograve;n nguy&ecirc;n vẹn, đế kh&ocirc;ng bị trầy, bị dơ hoặc c&oacute; dấu hiệu đ&atilde; sử dụng.</p>\r\n\r\n<p>- Kh&ocirc;ng &aacute;p dụng ch&iacute;nh s&aacute;ch đổi đối với c&aacute;c sản phẩm đ&atilde; qu&aacute; thời gian đổi, sản phẩm đ&atilde; sử dụng, kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn.</p>\r\n\r\n<p>- C&aacute;c sản phẩm đ&atilde; được thay đổi một số chi tiết theo y&ecirc;u cầu kh&aacute;ch h&agrave;ng đều kh&ocirc;ng được đổi trả hoặc ho&agrave;n tiền.</p>\r\n\r\n<p>- C&aacute;c sản phẩm giảm gi&aacute;, khuyến m&atilde;i, h&agrave;ng tặng được &aacute;p dụng ch&iacute;nh s&aacute;ch đổi theo quy định của từng chương tr&igrave;nh.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n', '2019-04-09 04:21:31', 'no', 5778000, 4137000, 4386000, 20, 4, 'Lazada', 'Tiki', 'Shopee'),
(100, 5, 11, 'Quạt điều hòa Daikio DKA-05000A', 'Quạt điều hòa công suất 210 W, diện tích làm mát 30 – 40 m2<br />3 tốc độ gió, chế độ đảo gió 4 chiều làm mát nhanh hơn, rộng hơn<br />Dung tích bình chứa nước lớn 55 lít, cho thời gian sử dụng 10 – 13 tiếng<br />', 33659000, '<strong>1. CH&Iacute;NH S&Aacute;CH BẢO H&Agrave;NH</strong>\r\n<p><strong>Điều kiện &aacute;p dụng:</strong></p>\r\n\r\n<p>- Kh&aacute;ch h&agrave;ng vui l&ograve;ng xuất tr&igrave;nh phiếu bảo h&agrave;nh để được &aacute;p dụng ch&iacute;nh s&aacute;ch bảo h&agrave;nh.</p>\r\n\r\n<p>- Sản phẩm được&nbsp;<strong>bảo h&agrave;nh miễn ph&iacute;</strong>&nbsp;trong suốt thời gian sử dụng trong c&aacute;c trường hợp sau:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + L&oacute;t tẩy, đệm l&oacute;t tẩy, d&aacute;n đế chống trơn, đế bị bong keo, m&ograve;n đinh g&oacute;t, đứt thun, đứt chỉ.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c chi tiết trang tr&iacute;, phụ kiện (kh&oacute;a, m&oacute;c, d&acirc;y k&eacute;o,... ). C&aacute;c phụ kiện gắn tr&ecirc;n sản phẩm nếu kh&ocirc;ng c&ograve;n phụ kiện thay thế sẽ thay bằng phụ kiện kh&aacute;c tương tự.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Lỗi sơn viền.</p>\r\n\r\n<p>- Ch&uacute;ng t&ocirc;i&nbsp;từ chối bảo h&agrave;nh sản phẩm đối với c&aacute;c trường hợp:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm kh&ocirc;ng c&oacute; phiếu bảo h&agrave;nh.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm qu&aacute; cũ (da v&agrave; đế qu&aacute; cũ, kh&ocirc;ng c&ograve;n độ b&aacute;m d&iacute;nh giữa da v&agrave; keo).</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm bị hư hỏng v&agrave; lỗi từ ph&iacute;a kh&aacute;ch h&agrave;ng g&acirc;y n&ecirc;n như trầy xước, đế m&ograve;n, sản phẩm kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn do bị động vật cắn, bảo quản kh&ocirc;ng tốt g&acirc;y ẩm mốc, phai nắng, n&oacute;ng chảy, &hellip;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c sản phẩm khuyến m&atilde;i, giảm gi&aacute;.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n<strong>2. QUY ĐỊNH ĐỔI SẢN PHẨM</strong>\r\n\r\n<p>- Sản phẩm được đổi trong v&ograve;ng 07 ng&agrave;y kể từ ng&agrave;y mua v&agrave; chỉ đổi 01 lần duy nhất với gi&aacute; trị bằng hoặc cao hơn, nếu thấp hơn sẽ kh&ocirc;ng được ho&agrave;n tiền.</p>\r\n\r\n<p>- Sản phẩm đổi phải c&ograve;n h&oacute;a đơn, phiếu bảo h&agrave;nh v&agrave; tem thương hiệu.</p>\r\n\r\n<p>- Sản phẩm phải c&ograve;n nguy&ecirc;n vẹn, đế kh&ocirc;ng bị trầy, bị dơ hoặc c&oacute; dấu hiệu đ&atilde; sử dụng.</p>\r\n\r\n<p>- Kh&ocirc;ng &aacute;p dụng ch&iacute;nh s&aacute;ch đổi đối với c&aacute;c sản phẩm đ&atilde; qu&aacute; thời gian đổi, sản phẩm đ&atilde; sử dụng, kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn.</p>\r\n\r\n<p>- C&aacute;c sản phẩm đ&atilde; được thay đổi một số chi tiết theo y&ecirc;u cầu kh&aacute;ch h&agrave;ng đều kh&ocirc;ng được đổi trả hoặc ho&agrave;n tiền.</p>\r\n\r\n<p>- C&aacute;c sản phẩm giảm gi&aacute;, khuyến m&atilde;i, h&agrave;ng tặng được &aacute;p dụng ch&iacute;nh s&aacute;ch đổi theo quy định của từng chương tr&igrave;nh.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n', '2019-04-09 04:21:31', 'no', 36107000, 38018000, 35221000, 1, 10, 'Lazada', 'Tiki', 'Shopee'),
(101, 5, 13, 'Quạt điều hòa Daikio DKA-01500B', 'Quạt điều hòa Daiko hoạt động với công suất 100 W, làm mát không khí nhanh, ít tốn điện<br />Có 3 tốc độ gió, chế độ đảo chiều gió linh hoạt<br />Chức năng hẹn giờ tắt, tạo ion lọc không khí tiện dụng<br />Thương hiệu nổi tiếng Việt Nam – Daikio, sản phẩm đẹp, chất lượng<br />', 44067000, '<strong>1. CH&Iacute;NH S&Aacute;CH BẢO H&Agrave;NH</strong>\r\n<p><strong>Điều kiện &aacute;p dụng:</strong></p>\r\n\r\n<p>- Kh&aacute;ch h&agrave;ng vui l&ograve;ng xuất tr&igrave;nh phiếu bảo h&agrave;nh để được &aacute;p dụng ch&iacute;nh s&aacute;ch bảo h&agrave;nh.</p>\r\n\r\n<p>- Sản phẩm được&nbsp;<strong>bảo h&agrave;nh miễn ph&iacute;</strong>&nbsp;trong suốt thời gian sử dụng trong c&aacute;c trường hợp sau:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + L&oacute;t tẩy, đệm l&oacute;t tẩy, d&aacute;n đế chống trơn, đế bị bong keo, m&ograve;n đinh g&oacute;t, đứt thun, đứt chỉ.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c chi tiết trang tr&iacute;, phụ kiện (kh&oacute;a, m&oacute;c, d&acirc;y k&eacute;o,... ). C&aacute;c phụ kiện gắn tr&ecirc;n sản phẩm nếu kh&ocirc;ng c&ograve;n phụ kiện thay thế sẽ thay bằng phụ kiện kh&aacute;c tương tự.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Lỗi sơn viền.</p>\r\n\r\n<p>- Ch&uacute;ng t&ocirc;i&nbsp;từ chối bảo h&agrave;nh sản phẩm đối với c&aacute;c trường hợp:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm kh&ocirc;ng c&oacute; phiếu bảo h&agrave;nh.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm qu&aacute; cũ (da v&agrave; đế qu&aacute; cũ, kh&ocirc;ng c&ograve;n độ b&aacute;m d&iacute;nh giữa da v&agrave; keo).</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm bị hư hỏng v&agrave; lỗi từ ph&iacute;a kh&aacute;ch h&agrave;ng g&acirc;y n&ecirc;n như trầy xước, đế m&ograve;n, sản phẩm kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn do bị động vật cắn, bảo quản kh&ocirc;ng tốt g&acirc;y ẩm mốc, phai nắng, n&oacute;ng chảy, &hellip;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c sản phẩm khuyến m&atilde;i, giảm gi&aacute;.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n<strong>2. QUY ĐỊNH ĐỔI SẢN PHẨM</strong>\r\n\r\n<p>- Sản phẩm được đổi trong v&ograve;ng 07 ng&agrave;y kể từ ng&agrave;y mua v&agrave; chỉ đổi 01 lần duy nhất với gi&aacute; trị bằng hoặc cao hơn, nếu thấp hơn sẽ kh&ocirc;ng được ho&agrave;n tiền.</p>\r\n\r\n<p>- Sản phẩm đổi phải c&ograve;n h&oacute;a đơn, phiếu bảo h&agrave;nh v&agrave; tem thương hiệu.</p>\r\n\r\n<p>- Sản phẩm phải c&ograve;n nguy&ecirc;n vẹn, đế kh&ocirc;ng bị trầy, bị dơ hoặc c&oacute; dấu hiệu đ&atilde; sử dụng.</p>\r\n\r\n<p>- Kh&ocirc;ng &aacute;p dụng ch&iacute;nh s&aacute;ch đổi đối với c&aacute;c sản phẩm đ&atilde; qu&aacute; thời gian đổi, sản phẩm đ&atilde; sử dụng, kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn.</p>\r\n\r\n<p>- C&aacute;c sản phẩm đ&atilde; được thay đổi một số chi tiết theo y&ecirc;u cầu kh&aacute;ch h&agrave;ng đều kh&ocirc;ng được đổi trả hoặc ho&agrave;n tiền.</p>\r\n\r\n<p>- C&aacute;c sản phẩm giảm gi&aacute;, khuyến m&atilde;i, h&agrave;ng tặng được &aacute;p dụng ch&iacute;nh s&aacute;ch đổi theo quy định của từng chương tr&igrave;nh.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n', '2019-04-09 04:21:31', 'no', 45941000, 47541000, 45880000, 13, 5, 'Lazada', 'Tiki', 'Shopee'),
(102, 5, 8, 'Bếp hồng ngoại Sunhouse SHD 6017', 'Mặt bếp hồng ngoại làm bằng kính chịu nhiệt chất lượng tốt, bền bỉ<br />Sử dụng được tất cả các loại nồi<br />5 chế độ nấu: nướng, chiên, nấu nước, nấu lẩu và nấu súp<br />', 3820000, '<strong>1. CH&Iacute;NH S&Aacute;CH BẢO H&Agrave;NH</strong>\r\n<p><strong>Điều kiện &aacute;p dụng:</strong></p>\r\n\r\n<p>- Kh&aacute;ch h&agrave;ng vui l&ograve;ng xuất tr&igrave;nh phiếu bảo h&agrave;nh để được &aacute;p dụng ch&iacute;nh s&aacute;ch bảo h&agrave;nh.</p>\r\n\r\n<p>- Sản phẩm được&nbsp;<strong>bảo h&agrave;nh miễn ph&iacute;</strong>&nbsp;trong suốt thời gian sử dụng trong c&aacute;c trường hợp sau:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + L&oacute;t tẩy, đệm l&oacute;t tẩy, d&aacute;n đế chống trơn, đế bị bong keo, m&ograve;n đinh g&oacute;t, đứt thun, đứt chỉ.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c chi tiết trang tr&iacute;, phụ kiện (kh&oacute;a, m&oacute;c, d&acirc;y k&eacute;o,... ). C&aacute;c phụ kiện gắn tr&ecirc;n sản phẩm nếu kh&ocirc;ng c&ograve;n phụ kiện thay thế sẽ thay bằng phụ kiện kh&aacute;c tương tự.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Lỗi sơn viền.</p>\r\n\r\n<p>- Ch&uacute;ng t&ocirc;i&nbsp;từ chối bảo h&agrave;nh sản phẩm đối với c&aacute;c trường hợp:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm kh&ocirc;ng c&oacute; phiếu bảo h&agrave;nh.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm qu&aacute; cũ (da v&agrave; đế qu&aacute; cũ, kh&ocirc;ng c&ograve;n độ b&aacute;m d&iacute;nh giữa da v&agrave; keo).</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm bị hư hỏng v&agrave; lỗi từ ph&iacute;a kh&aacute;ch h&agrave;ng g&acirc;y n&ecirc;n như trầy xước, đế m&ograve;n, sản phẩm kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn do bị động vật cắn, bảo quản kh&ocirc;ng tốt g&acirc;y ẩm mốc, phai nắng, n&oacute;ng chảy, &hellip;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c sản phẩm khuyến m&atilde;i, giảm gi&aacute;.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n<strong>2. QUY ĐỊNH ĐỔI SẢN PHẨM</strong>\r\n\r\n<p>- Sản phẩm được đổi trong v&ograve;ng 07 ng&agrave;y kể từ ng&agrave;y mua v&agrave; chỉ đổi 01 lần duy nhất với gi&aacute; trị bằng hoặc cao hơn, nếu thấp hơn sẽ kh&ocirc;ng được ho&agrave;n tiền.</p>\r\n\r\n<p>- Sản phẩm đổi phải c&ograve;n h&oacute;a đơn, phiếu bảo h&agrave;nh v&agrave; tem thương hiệu.</p>\r\n\r\n<p>- Sản phẩm phải c&ograve;n nguy&ecirc;n vẹn, đế kh&ocirc;ng bị trầy, bị dơ hoặc c&oacute; dấu hiệu đ&atilde; sử dụng.</p>\r\n\r\n<p>- Kh&ocirc;ng &aacute;p dụng ch&iacute;nh s&aacute;ch đổi đối với c&aacute;c sản phẩm đ&atilde; qu&aacute; thời gian đổi, sản phẩm đ&atilde; sử dụng, kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn.</p>\r\n\r\n<p>- C&aacute;c sản phẩm đ&atilde; được thay đổi một số chi tiết theo y&ecirc;u cầu kh&aacute;ch h&agrave;ng đều kh&ocirc;ng được đổi trả hoặc ho&agrave;n tiền.</p>\r\n\r\n<p>- C&aacute;c sản phẩm giảm gi&aacute;, khuyến m&atilde;i, h&agrave;ng tặng được &aacute;p dụng ch&iacute;nh s&aacute;ch đổi theo quy định của từng chương tr&igrave;nh.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n', '2019-04-09 04:21:31', 'no', 3892000, 3882000, 4883000, 12, 6, 'Lazada', 'Tiki', 'Shopee');
INSERT INTO `table_product` (`id_product`, `id_category`, `id_producer`, `product_name`, `product_description`, `product_price`, `product_additional_information`, `date_created`, `is_hot`, `product_price_4compare1`, `product_price_4compare2`, `product_price_4compare3`, `customer_point`, `agent_point`, `shop1_name`, `shop2_name`, `shop3_name`) VALUES
(103, 5, 11, 'Bếp hồng ngoại Midea MIR-T2018DC', 'Công suất hoạt động 2000 W, mặt bếp bằng kính chịu nhiệt cao cấp, bền bỉ<br />6 chế độ nấu tự động gồm nấu lẩu, nướng, xào, đun nước, nấu canh, hâm sữa<br />Có khóa bảng điều khiển, đèn báo khi mặt bếp còn nóng tiện dụng<br />Đến từ nhãn hiệu tin cậy Midea của Trung Quốc, được nhiều người tin dùng<br />', 7342000, '<strong>1. CH&Iacute;NH S&Aacute;CH BẢO H&Agrave;NH</strong>\r\n<p><strong>Điều kiện &aacute;p dụng:</strong></p>\r\n\r\n<p>- Kh&aacute;ch h&agrave;ng vui l&ograve;ng xuất tr&igrave;nh phiếu bảo h&agrave;nh để được &aacute;p dụng ch&iacute;nh s&aacute;ch bảo h&agrave;nh.</p>\r\n\r\n<p>- Sản phẩm được&nbsp;<strong>bảo h&agrave;nh miễn ph&iacute;</strong>&nbsp;trong suốt thời gian sử dụng trong c&aacute;c trường hợp sau:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + L&oacute;t tẩy, đệm l&oacute;t tẩy, d&aacute;n đế chống trơn, đế bị bong keo, m&ograve;n đinh g&oacute;t, đứt thun, đứt chỉ.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c chi tiết trang tr&iacute;, phụ kiện (kh&oacute;a, m&oacute;c, d&acirc;y k&eacute;o,... ). C&aacute;c phụ kiện gắn tr&ecirc;n sản phẩm nếu kh&ocirc;ng c&ograve;n phụ kiện thay thế sẽ thay bằng phụ kiện kh&aacute;c tương tự.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Lỗi sơn viền.</p>\r\n\r\n<p>- Ch&uacute;ng t&ocirc;i&nbsp;từ chối bảo h&agrave;nh sản phẩm đối với c&aacute;c trường hợp:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm kh&ocirc;ng c&oacute; phiếu bảo h&agrave;nh.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm qu&aacute; cũ (da v&agrave; đế qu&aacute; cũ, kh&ocirc;ng c&ograve;n độ b&aacute;m d&iacute;nh giữa da v&agrave; keo).</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm bị hư hỏng v&agrave; lỗi từ ph&iacute;a kh&aacute;ch h&agrave;ng g&acirc;y n&ecirc;n như trầy xước, đế m&ograve;n, sản phẩm kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn do bị động vật cắn, bảo quản kh&ocirc;ng tốt g&acirc;y ẩm mốc, phai nắng, n&oacute;ng chảy, &hellip;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c sản phẩm khuyến m&atilde;i, giảm gi&aacute;.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n<strong>2. QUY ĐỊNH ĐỔI SẢN PHẨM</strong>\r\n\r\n<p>- Sản phẩm được đổi trong v&ograve;ng 07 ng&agrave;y kể từ ng&agrave;y mua v&agrave; chỉ đổi 01 lần duy nhất với gi&aacute; trị bằng hoặc cao hơn, nếu thấp hơn sẽ kh&ocirc;ng được ho&agrave;n tiền.</p>\r\n\r\n<p>- Sản phẩm đổi phải c&ograve;n h&oacute;a đơn, phiếu bảo h&agrave;nh v&agrave; tem thương hiệu.</p>\r\n\r\n<p>- Sản phẩm phải c&ograve;n nguy&ecirc;n vẹn, đế kh&ocirc;ng bị trầy, bị dơ hoặc c&oacute; dấu hiệu đ&atilde; sử dụng.</p>\r\n\r\n<p>- Kh&ocirc;ng &aacute;p dụng ch&iacute;nh s&aacute;ch đổi đối với c&aacute;c sản phẩm đ&atilde; qu&aacute; thời gian đổi, sản phẩm đ&atilde; sử dụng, kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn.</p>\r\n\r\n<p>- C&aacute;c sản phẩm đ&atilde; được thay đổi một số chi tiết theo y&ecirc;u cầu kh&aacute;ch h&agrave;ng đều kh&ocirc;ng được đổi trả hoặc ho&agrave;n tiền.</p>\r\n\r\n<p>- C&aacute;c sản phẩm giảm gi&aacute;, khuyến m&atilde;i, h&agrave;ng tặng được &aacute;p dụng ch&iacute;nh s&aacute;ch đổi theo quy định của từng chương tr&igrave;nh.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n', '2019-04-09 04:21:31', 'no', 7500000, 10132000, 8486000, 10, 3, 'Lazada', 'Tiki', 'Shopee'),
(104, 5, 8, 'Bếp hồng ngoại Sunhouse SHD 6017', 'Mặt bếp hồng ngoại làm bằng kính chịu nhiệt chất lượng tốt, bền bỉ<br />Sử dụng được tất cả các loại nồi<br />5 chế độ nấu: nướng, chiên, nấu nước, nấu lẩu và nấu súp<br />', 45308000, '<strong>1. CH&Iacute;NH S&Aacute;CH BẢO H&Agrave;NH</strong>\r\n<p><strong>Điều kiện &aacute;p dụng:</strong></p>\r\n\r\n<p>- Kh&aacute;ch h&agrave;ng vui l&ograve;ng xuất tr&igrave;nh phiếu bảo h&agrave;nh để được &aacute;p dụng ch&iacute;nh s&aacute;ch bảo h&agrave;nh.</p>\r\n\r\n<p>- Sản phẩm được&nbsp;<strong>bảo h&agrave;nh miễn ph&iacute;</strong>&nbsp;trong suốt thời gian sử dụng trong c&aacute;c trường hợp sau:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + L&oacute;t tẩy, đệm l&oacute;t tẩy, d&aacute;n đế chống trơn, đế bị bong keo, m&ograve;n đinh g&oacute;t, đứt thun, đứt chỉ.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c chi tiết trang tr&iacute;, phụ kiện (kh&oacute;a, m&oacute;c, d&acirc;y k&eacute;o,... ). C&aacute;c phụ kiện gắn tr&ecirc;n sản phẩm nếu kh&ocirc;ng c&ograve;n phụ kiện thay thế sẽ thay bằng phụ kiện kh&aacute;c tương tự.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Lỗi sơn viền.</p>\r\n\r\n<p>- Ch&uacute;ng t&ocirc;i&nbsp;từ chối bảo h&agrave;nh sản phẩm đối với c&aacute;c trường hợp:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm kh&ocirc;ng c&oacute; phiếu bảo h&agrave;nh.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm qu&aacute; cũ (da v&agrave; đế qu&aacute; cũ, kh&ocirc;ng c&ograve;n độ b&aacute;m d&iacute;nh giữa da v&agrave; keo).</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm bị hư hỏng v&agrave; lỗi từ ph&iacute;a kh&aacute;ch h&agrave;ng g&acirc;y n&ecirc;n như trầy xước, đế m&ograve;n, sản phẩm kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn do bị động vật cắn, bảo quản kh&ocirc;ng tốt g&acirc;y ẩm mốc, phai nắng, n&oacute;ng chảy, &hellip;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c sản phẩm khuyến m&atilde;i, giảm gi&aacute;.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n<strong>2. QUY ĐỊNH ĐỔI SẢN PHẨM</strong>\r\n\r\n<p>- Sản phẩm được đổi trong v&ograve;ng 07 ng&agrave;y kể từ ng&agrave;y mua v&agrave; chỉ đổi 01 lần duy nhất với gi&aacute; trị bằng hoặc cao hơn, nếu thấp hơn sẽ kh&ocirc;ng được ho&agrave;n tiền.</p>\r\n\r\n<p>- Sản phẩm đổi phải c&ograve;n h&oacute;a đơn, phiếu bảo h&agrave;nh v&agrave; tem thương hiệu.</p>\r\n\r\n<p>- Sản phẩm phải c&ograve;n nguy&ecirc;n vẹn, đế kh&ocirc;ng bị trầy, bị dơ hoặc c&oacute; dấu hiệu đ&atilde; sử dụng.</p>\r\n\r\n<p>- Kh&ocirc;ng &aacute;p dụng ch&iacute;nh s&aacute;ch đổi đối với c&aacute;c sản phẩm đ&atilde; qu&aacute; thời gian đổi, sản phẩm đ&atilde; sử dụng, kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn.</p>\r\n\r\n<p>- C&aacute;c sản phẩm đ&atilde; được thay đổi một số chi tiết theo y&ecirc;u cầu kh&aacute;ch h&agrave;ng đều kh&ocirc;ng được đổi trả hoặc ho&agrave;n tiền.</p>\r\n\r\n<p>- C&aacute;c sản phẩm giảm gi&aacute;, khuyến m&atilde;i, h&agrave;ng tặng được &aacute;p dụng ch&iacute;nh s&aacute;ch đổi theo quy định của từng chương tr&igrave;nh.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n', '2019-04-09 04:21:31', 'no', 45555000, 45581000, 47090000, 19, 9, 'Lazada', 'Tiki', 'Shopee'),
(105, 5, 11, 'Bếp hồng ngoại Midea MIR-T2018DC', 'Công suất hoạt động 2000 W, mặt bếp bằng kính chịu nhiệt cao cấp, bền bỉ<br />6 chế độ nấu tự động gồm nấu lẩu, nướng, xào, đun nước, nấu canh, hâm sữa<br />Có khóa bảng điều khiển, đèn báo khi mặt bếp còn nóng tiện dụng<br />Đến từ nhãn hiệu tin cậy Midea của Trung Quốc, được nhiều người tin dùng<br />', 24452000, '<strong>1. CH&Iacute;NH S&Aacute;CH BẢO H&Agrave;NH</strong>\r\n<p><strong>Điều kiện &aacute;p dụng:</strong></p>\r\n\r\n<p>- Kh&aacute;ch h&agrave;ng vui l&ograve;ng xuất tr&igrave;nh phiếu bảo h&agrave;nh để được &aacute;p dụng ch&iacute;nh s&aacute;ch bảo h&agrave;nh.</p>\r\n\r\n<p>- Sản phẩm được&nbsp;<strong>bảo h&agrave;nh miễn ph&iacute;</strong>&nbsp;trong suốt thời gian sử dụng trong c&aacute;c trường hợp sau:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + L&oacute;t tẩy, đệm l&oacute;t tẩy, d&aacute;n đế chống trơn, đế bị bong keo, m&ograve;n đinh g&oacute;t, đứt thun, đứt chỉ.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c chi tiết trang tr&iacute;, phụ kiện (kh&oacute;a, m&oacute;c, d&acirc;y k&eacute;o,... ). C&aacute;c phụ kiện gắn tr&ecirc;n sản phẩm nếu kh&ocirc;ng c&ograve;n phụ kiện thay thế sẽ thay bằng phụ kiện kh&aacute;c tương tự.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Lỗi sơn viền.</p>\r\n\r\n<p>- Ch&uacute;ng t&ocirc;i&nbsp;từ chối bảo h&agrave;nh sản phẩm đối với c&aacute;c trường hợp:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm kh&ocirc;ng c&oacute; phiếu bảo h&agrave;nh.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm qu&aacute; cũ (da v&agrave; đế qu&aacute; cũ, kh&ocirc;ng c&ograve;n độ b&aacute;m d&iacute;nh giữa da v&agrave; keo).</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm bị hư hỏng v&agrave; lỗi từ ph&iacute;a kh&aacute;ch h&agrave;ng g&acirc;y n&ecirc;n như trầy xước, đế m&ograve;n, sản phẩm kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn do bị động vật cắn, bảo quản kh&ocirc;ng tốt g&acirc;y ẩm mốc, phai nắng, n&oacute;ng chảy, &hellip;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c sản phẩm khuyến m&atilde;i, giảm gi&aacute;.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n<strong>2. QUY ĐỊNH ĐỔI SẢN PHẨM</strong>\r\n\r\n<p>- Sản phẩm được đổi trong v&ograve;ng 07 ng&agrave;y kể từ ng&agrave;y mua v&agrave; chỉ đổi 01 lần duy nhất với gi&aacute; trị bằng hoặc cao hơn, nếu thấp hơn sẽ kh&ocirc;ng được ho&agrave;n tiền.</p>\r\n\r\n<p>- Sản phẩm đổi phải c&ograve;n h&oacute;a đơn, phiếu bảo h&agrave;nh v&agrave; tem thương hiệu.</p>\r\n\r\n<p>- Sản phẩm phải c&ograve;n nguy&ecirc;n vẹn, đế kh&ocirc;ng bị trầy, bị dơ hoặc c&oacute; dấu hiệu đ&atilde; sử dụng.</p>\r\n\r\n<p>- Kh&ocirc;ng &aacute;p dụng ch&iacute;nh s&aacute;ch đổi đối với c&aacute;c sản phẩm đ&atilde; qu&aacute; thời gian đổi, sản phẩm đ&atilde; sử dụng, kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn.</p>\r\n\r\n<p>- C&aacute;c sản phẩm đ&atilde; được thay đổi một số chi tiết theo y&ecirc;u cầu kh&aacute;ch h&agrave;ng đều kh&ocirc;ng được đổi trả hoặc ho&agrave;n tiền.</p>\r\n\r\n<p>- C&aacute;c sản phẩm giảm gi&aacute;, khuyến m&atilde;i, h&agrave;ng tặng được &aacute;p dụng ch&iacute;nh s&aacute;ch đổi theo quy định của từng chương tr&igrave;nh.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n', '2019-04-09 04:21:31', 'no', 28133000, 26174000, 28123000, 12, 4, 'Lazada', 'Tiki', 'Shopee'),
(106, 5, 9, 'Bình đun siêu tốc Sharp 1.8 lít EKJ-18VP-PK', 'Bình đun siêu tốc có công suất 1950 W, ruột bằng inox sáng bóng<br />Xoay 360 độ trên đế tiếp điện, bình có lưới lọc cặn, đèn hoạt động<br />Thương hiệu uy tín Nhật Bản – Sharp, được nhiều người tin dùng<br />', 41838000, '<strong>1. CH&Iacute;NH S&Aacute;CH BẢO H&Agrave;NH</strong>\r\n<p><strong>Điều kiện &aacute;p dụng:</strong></p>\r\n\r\n<p>- Kh&aacute;ch h&agrave;ng vui l&ograve;ng xuất tr&igrave;nh phiếu bảo h&agrave;nh để được &aacute;p dụng ch&iacute;nh s&aacute;ch bảo h&agrave;nh.</p>\r\n\r\n<p>- Sản phẩm được&nbsp;<strong>bảo h&agrave;nh miễn ph&iacute;</strong>&nbsp;trong suốt thời gian sử dụng trong c&aacute;c trường hợp sau:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + L&oacute;t tẩy, đệm l&oacute;t tẩy, d&aacute;n đế chống trơn, đế bị bong keo, m&ograve;n đinh g&oacute;t, đứt thun, đứt chỉ.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c chi tiết trang tr&iacute;, phụ kiện (kh&oacute;a, m&oacute;c, d&acirc;y k&eacute;o,... ). C&aacute;c phụ kiện gắn tr&ecirc;n sản phẩm nếu kh&ocirc;ng c&ograve;n phụ kiện thay thế sẽ thay bằng phụ kiện kh&aacute;c tương tự.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Lỗi sơn viền.</p>\r\n\r\n<p>- Ch&uacute;ng t&ocirc;i&nbsp;từ chối bảo h&agrave;nh sản phẩm đối với c&aacute;c trường hợp:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm kh&ocirc;ng c&oacute; phiếu bảo h&agrave;nh.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm qu&aacute; cũ (da v&agrave; đế qu&aacute; cũ, kh&ocirc;ng c&ograve;n độ b&aacute;m d&iacute;nh giữa da v&agrave; keo).</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm bị hư hỏng v&agrave; lỗi từ ph&iacute;a kh&aacute;ch h&agrave;ng g&acirc;y n&ecirc;n như trầy xước, đế m&ograve;n, sản phẩm kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn do bị động vật cắn, bảo quản kh&ocirc;ng tốt g&acirc;y ẩm mốc, phai nắng, n&oacute;ng chảy, &hellip;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c sản phẩm khuyến m&atilde;i, giảm gi&aacute;.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n<strong>2. QUY ĐỊNH ĐỔI SẢN PHẨM</strong>\r\n\r\n<p>- Sản phẩm được đổi trong v&ograve;ng 07 ng&agrave;y kể từ ng&agrave;y mua v&agrave; chỉ đổi 01 lần duy nhất với gi&aacute; trị bằng hoặc cao hơn, nếu thấp hơn sẽ kh&ocirc;ng được ho&agrave;n tiền.</p>\r\n\r\n<p>- Sản phẩm đổi phải c&ograve;n h&oacute;a đơn, phiếu bảo h&agrave;nh v&agrave; tem thương hiệu.</p>\r\n\r\n<p>- Sản phẩm phải c&ograve;n nguy&ecirc;n vẹn, đế kh&ocirc;ng bị trầy, bị dơ hoặc c&oacute; dấu hiệu đ&atilde; sử dụng.</p>\r\n\r\n<p>- Kh&ocirc;ng &aacute;p dụng ch&iacute;nh s&aacute;ch đổi đối với c&aacute;c sản phẩm đ&atilde; qu&aacute; thời gian đổi, sản phẩm đ&atilde; sử dụng, kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn.</p>\r\n\r\n<p>- C&aacute;c sản phẩm đ&atilde; được thay đổi một số chi tiết theo y&ecirc;u cầu kh&aacute;ch h&agrave;ng đều kh&ocirc;ng được đổi trả hoặc ho&agrave;n tiền.</p>\r\n\r\n<p>- C&aacute;c sản phẩm giảm gi&aacute;, khuyến m&atilde;i, h&agrave;ng tặng được &aacute;p dụng ch&iacute;nh s&aacute;ch đổi theo quy định của từng chương tr&igrave;nh.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n', '2019-04-09 04:21:31', 'no', 43366000, 41891000, 46781000, 4, 6, 'Lazada', 'Tiki', 'Shopee'),
(107, 5, 8, 'Bình siêu tốc Midea 1.7 lít MK-317DR', 'Thân bình 2 lớp cách nhiệt tốt, ruột bình bằng thép không gỉ sáng đẹp<br />Bình đun dung tích 1<br />7 lít, nấu đủ nước nóng cho 3, 4 người dùng<br />Cảm biến nhiệt Strix siêu bền<br />Tự ngắt điện khi nước sôi và khi bình cạn nước<br />', 46768000, '<strong>1. CH&Iacute;NH S&Aacute;CH BẢO H&Agrave;NH</strong>\r\n<p><strong>Điều kiện &aacute;p dụng:</strong></p>\r\n\r\n<p>- Kh&aacute;ch h&agrave;ng vui l&ograve;ng xuất tr&igrave;nh phiếu bảo h&agrave;nh để được &aacute;p dụng ch&iacute;nh s&aacute;ch bảo h&agrave;nh.</p>\r\n\r\n<p>- Sản phẩm được&nbsp;<strong>bảo h&agrave;nh miễn ph&iacute;</strong>&nbsp;trong suốt thời gian sử dụng trong c&aacute;c trường hợp sau:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + L&oacute;t tẩy, đệm l&oacute;t tẩy, d&aacute;n đế chống trơn, đế bị bong keo, m&ograve;n đinh g&oacute;t, đứt thun, đứt chỉ.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c chi tiết trang tr&iacute;, phụ kiện (kh&oacute;a, m&oacute;c, d&acirc;y k&eacute;o,... ). C&aacute;c phụ kiện gắn tr&ecirc;n sản phẩm nếu kh&ocirc;ng c&ograve;n phụ kiện thay thế sẽ thay bằng phụ kiện kh&aacute;c tương tự.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Lỗi sơn viền.</p>\r\n\r\n<p>- Ch&uacute;ng t&ocirc;i&nbsp;từ chối bảo h&agrave;nh sản phẩm đối với c&aacute;c trường hợp:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm kh&ocirc;ng c&oacute; phiếu bảo h&agrave;nh.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm qu&aacute; cũ (da v&agrave; đế qu&aacute; cũ, kh&ocirc;ng c&ograve;n độ b&aacute;m d&iacute;nh giữa da v&agrave; keo).</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm bị hư hỏng v&agrave; lỗi từ ph&iacute;a kh&aacute;ch h&agrave;ng g&acirc;y n&ecirc;n như trầy xước, đế m&ograve;n, sản phẩm kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn do bị động vật cắn, bảo quản kh&ocirc;ng tốt g&acirc;y ẩm mốc, phai nắng, n&oacute;ng chảy, &hellip;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c sản phẩm khuyến m&atilde;i, giảm gi&aacute;.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n<strong>2. QUY ĐỊNH ĐỔI SẢN PHẨM</strong>\r\n\r\n<p>- Sản phẩm được đổi trong v&ograve;ng 07 ng&agrave;y kể từ ng&agrave;y mua v&agrave; chỉ đổi 01 lần duy nhất với gi&aacute; trị bằng hoặc cao hơn, nếu thấp hơn sẽ kh&ocirc;ng được ho&agrave;n tiền.</p>\r\n\r\n<p>- Sản phẩm đổi phải c&ograve;n h&oacute;a đơn, phiếu bảo h&agrave;nh v&agrave; tem thương hiệu.</p>\r\n\r\n<p>- Sản phẩm phải c&ograve;n nguy&ecirc;n vẹn, đế kh&ocirc;ng bị trầy, bị dơ hoặc c&oacute; dấu hiệu đ&atilde; sử dụng.</p>\r\n\r\n<p>- Kh&ocirc;ng &aacute;p dụng ch&iacute;nh s&aacute;ch đổi đối với c&aacute;c sản phẩm đ&atilde; qu&aacute; thời gian đổi, sản phẩm đ&atilde; sử dụng, kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn.</p>\r\n\r\n<p>- C&aacute;c sản phẩm đ&atilde; được thay đổi một số chi tiết theo y&ecirc;u cầu kh&aacute;ch h&agrave;ng đều kh&ocirc;ng được đổi trả hoặc ho&agrave;n tiền.</p>\r\n\r\n<p>- C&aacute;c sản phẩm giảm gi&aacute;, khuyến m&atilde;i, h&agrave;ng tặng được &aacute;p dụng ch&iacute;nh s&aacute;ch đổi theo quy định của từng chương tr&igrave;nh.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n', '2019-04-09 04:21:31', 'no', 49962000, 49022000, 47064000, 20, 3, 'Lazada', 'Tiki', 'Shopee'),
(234, 1, 1, 'Tivi Asanzo 12 inch ES32T890', 'Tivi với kiểu d&aacute;ng hiện đại, đẳng cấp với viền m&agrave;n h&igrave;nh si&ecirc;u mỏng<br />\r\nĐộ ph&acirc;n giải HD c&ugrave;ng c&ocirc;ng nghệ Picture Wizard II cho h&igrave;nh ảnh trong trẻo, m&agrave;u sắc tự nhi&ecirc;n v&agrave; ch&acirc;n thật<br />\r\nC&ocirc;ng nghệ &acirc;m thanh loa Stereo mang đến &acirc;m thanh mạnh mẽ, sinh động<br />\r\nChế độ &acirc;m thanh Infinite cho &acirc;m thanh đa chiều, trung thực', 47077000, '<strong>1. CH&Iacute;NH S&Aacute;CH BẢO H&Agrave;NH</strong>\r\n<p><strong>Điều kiện &aacute;p dụng:</strong></p>\r\n\r\n<p>- Kh&aacute;ch h&agrave;ng vui l&ograve;ng xuất tr&igrave;nh phiếu bảo h&agrave;nh để được &aacute;p dụng ch&iacute;nh s&aacute;ch bảo h&agrave;nh.</p>\r\n\r\n<p>- Sản phẩm được&nbsp;<strong>bảo h&agrave;nh miễn ph&iacute;</strong>&nbsp;trong suốt thời gian sử dụng trong c&aacute;c trường hợp sau:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + L&oacute;t tẩy, đệm l&oacute;t tẩy, d&aacute;n đế chống trơn, đế bị bong keo, m&ograve;n đinh g&oacute;t, đứt thun, đứt chỉ.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c chi tiết trang tr&iacute;, phụ kiện (kh&oacute;a, m&oacute;c, d&acirc;y k&eacute;o,... ). C&aacute;c phụ kiện gắn tr&ecirc;n sản phẩm nếu kh&ocirc;ng c&ograve;n phụ kiện thay thế sẽ thay bằng phụ kiện kh&aacute;c tương tự.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Lỗi sơn viền.</p>\r\n\r\n<p>- Ch&uacute;ng t&ocirc;i&nbsp;từ chối bảo h&agrave;nh sản phẩm đối với c&aacute;c trường hợp:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm kh&ocirc;ng c&oacute; phiếu bảo h&agrave;nh.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm qu&aacute; cũ (da v&agrave; đế qu&aacute; cũ, kh&ocirc;ng c&ograve;n độ b&aacute;m d&iacute;nh giữa da v&agrave; keo).</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm bị hư hỏng v&agrave; lỗi từ ph&iacute;a kh&aacute;ch h&agrave;ng g&acirc;y n&ecirc;n như trầy xước, đế m&ograve;n, sản phẩm kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn do bị động vật cắn, bảo quản kh&ocirc;ng tốt g&acirc;y ẩm mốc, phai nắng, n&oacute;ng chảy, &hellip;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c sản phẩm khuyến m&atilde;i, giảm gi&aacute;.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n<strong>2. QUY ĐỊNH ĐỔI SẢN PHẨM</strong>\r\n\r\n<p>- Sản phẩm được đổi trong v&ograve;ng 07 ng&agrave;y kể từ ng&agrave;y mua v&agrave; chỉ đổi 01 lần duy nhất với gi&aacute; trị bằng hoặc cao hơn, nếu thấp hơn sẽ kh&ocirc;ng được ho&agrave;n tiền.</p>\r\n\r\n<p>- Sản phẩm đổi phải c&ograve;n h&oacute;a đơn, phiếu bảo h&agrave;nh v&agrave; tem thương hiệu.</p>\r\n\r\n<p>- Sản phẩm phải c&ograve;n nguy&ecirc;n vẹn, đế kh&ocirc;ng bị trầy, bị dơ hoặc c&oacute; dấu hiệu đ&atilde; sử dụng.</p>\r\n\r\n<p>- Kh&ocirc;ng &aacute;p dụng ch&iacute;nh s&aacute;ch đổi đối với c&aacute;c sản phẩm đ&atilde; qu&aacute; thời gian đổi, sản phẩm đ&atilde; sử dụng, kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn.</p>\r\n\r\n<p>- C&aacute;c sản phẩm đ&atilde; được thay đổi một số chi tiết theo y&ecirc;u cầu kh&aacute;ch h&agrave;ng đều kh&ocirc;ng được đổi trả hoặc ho&agrave;n tiền.</p>\r\n\r\n<p>- C&aacute;c sản phẩm giảm gi&aacute;, khuyến m&atilde;i, h&agrave;ng tặng được &aacute;p dụng ch&iacute;nh s&aacute;ch đổi theo quy định của từng chương tr&igrave;nh.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n', '2019-04-09 04:21:31', 'no', 51995000, 47188000, 48720000, 6, 5, 'Lazada', 'Tiki', 'Shopee'),
(235, 1, 2, 'Smart Tivi Toshiba 32 inch KDL-32W610F', 'Độ ph&acirc;n giải HD sắc n&eacute;t c&ugrave;ng c&ocirc;ng nghệ HDR cho h&igrave;nh ảnh ch&acirc;n thực như thật<br />\r\nC&ocirc;ng nghệ X-Reality PRO tăng cường độ s&aacute;ng, độ n&eacute;t cho h&igrave;nh ảnh ho&agrave;n hảo<br />\r\nC&ocirc;ng nghệ &acirc;m thanh ClearAudio+ &acirc;m thanh r&otilde; r&agrave;ng cho bạn cảm gi&aacute;c như đang h&ograve;a m&igrave;nh v&agrave;o trong kh&ocirc;ng gian thưởng thức<br />\r\nHệ điều h&agrave;nh Linux trực quan dễ sử dụng đi k&egrave;m kho ứng dụng VEWD phong ph&uacute;, đa dạng<br />\r\nHỗ trợ chiếu m&agrave;n h&igrave;nh điện thoại l&ecirc;n tivi Screen Mirroring (Miracast)<br />\r\nC&ocirc;ng nghệ X-Protection PRO gi&uacute;p tivi hạn chế khỏi bụi bẩn, độ ẩm, d&ograve;ng', 42234000, '<strong>1. CH&Iacute;NH S&Aacute;CH BẢO H&Agrave;NH</strong>\r\n<p><strong>Điều kiện &aacute;p dụng:</strong></p>\r\n\r\n<p>- Kh&aacute;ch h&agrave;ng vui l&ograve;ng xuất tr&igrave;nh phiếu bảo h&agrave;nh để được &aacute;p dụng ch&iacute;nh s&aacute;ch bảo h&agrave;nh.</p>\r\n\r\n<p>- Sản phẩm được&nbsp;<strong>bảo h&agrave;nh miễn ph&iacute;</strong>&nbsp;trong suốt thời gian sử dụng trong c&aacute;c trường hợp sau:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + L&oacute;t tẩy, đệm l&oacute;t tẩy, d&aacute;n đế chống trơn, đế bị bong keo, m&ograve;n đinh g&oacute;t, đứt thun, đứt chỉ.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c chi tiết trang tr&iacute;, phụ kiện (kh&oacute;a, m&oacute;c, d&acirc;y k&eacute;o,... ). C&aacute;c phụ kiện gắn tr&ecirc;n sản phẩm nếu kh&ocirc;ng c&ograve;n phụ kiện thay thế sẽ thay bằng phụ kiện kh&aacute;c tương tự.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Lỗi sơn viền.</p>\r\n\r\n<p>- Ch&uacute;ng t&ocirc;i&nbsp;từ chối bảo h&agrave;nh sản phẩm đối với c&aacute;c trường hợp:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm kh&ocirc;ng c&oacute; phiếu bảo h&agrave;nh.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm qu&aacute; cũ (da v&agrave; đế qu&aacute; cũ, kh&ocirc;ng c&ograve;n độ b&aacute;m d&iacute;nh giữa da v&agrave; keo).</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm bị hư hỏng v&agrave; lỗi từ ph&iacute;a kh&aacute;ch h&agrave;ng g&acirc;y n&ecirc;n như trầy xước, đế m&ograve;n, sản phẩm kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn do bị động vật cắn, bảo quản kh&ocirc;ng tốt g&acirc;y ẩm mốc, phai nắng, n&oacute;ng chảy, &hellip;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c sản phẩm khuyến m&atilde;i, giảm gi&aacute;.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n<strong>2. QUY ĐỊNH ĐỔI SẢN PHẨM</strong>\r\n\r\n<p>- Sản phẩm được đổi trong v&ograve;ng 07 ng&agrave;y kể từ ng&agrave;y mua v&agrave; chỉ đổi 01 lần duy nhất với gi&aacute; trị bằng hoặc cao hơn, nếu thấp hơn sẽ kh&ocirc;ng được ho&agrave;n tiền.</p>\r\n\r\n<p>- Sản phẩm đổi phải c&ograve;n h&oacute;a đơn, phiếu bảo h&agrave;nh v&agrave; tem thương hiệu.</p>\r\n\r\n<p>- Sản phẩm phải c&ograve;n nguy&ecirc;n vẹn, đế kh&ocirc;ng bị trầy, bị dơ hoặc c&oacute; dấu hiệu đ&atilde; sử dụng.</p>\r\n\r\n<p>- Kh&ocirc;ng &aacute;p dụng ch&iacute;nh s&aacute;ch đổi đối với c&aacute;c sản phẩm đ&atilde; qu&aacute; thời gian đổi, sản phẩm đ&atilde; sử dụng, kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn.</p>\r\n\r\n<p>- C&aacute;c sản phẩm đ&atilde; được thay đổi một số chi tiết theo y&ecirc;u cầu kh&aacute;ch h&agrave;ng đều kh&ocirc;ng được đổi trả hoặc ho&agrave;n tiền.</p>\r\n\r\n<p>- C&aacute;c sản phẩm giảm gi&aacute;, khuyến m&atilde;i, h&agrave;ng tặng được &aacute;p dụng ch&iacute;nh s&aacute;ch đổi theo quy định của từng chương tr&igrave;nh.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n', '2019-04-09 04:21:31', 'no', 42559000, 47037000, 46909000, 5, 2, 'Lazada', 'Tiki', 'Shopee'),
(236, 1, 2, 'Smart Tivi Toshiba 32 inch KDL-32W610F', 'Độ ph&acirc;n giải HD sắc n&eacute;t c&ugrave;ng c&ocirc;ng nghệ HDR cho h&igrave;nh ảnh ch&acirc;n thực như thật<br />\r\nC&ocirc;ng nghệ X-Reality PRO tăng cường độ s&aacute;ng, độ n&eacute;t cho h&igrave;nh ảnh ho&agrave;n hảo<br />\r\nC&ocirc;ng nghệ &acirc;m thanh ClearAudio+ &acirc;m thanh r&otilde; r&agrave;ng cho bạn cảm gi&aacute;c như đang h&ograve;a m&igrave;nh v&agrave;o trong kh&ocirc;ng gian thưởng thức<br />\r\nHệ điều h&agrave;nh Linux trực quan dễ sử dụng đi k&egrave;m kho ứng dụng VEWD phong ph&uacute;, đa dạng<br />\r\nHỗ trợ chiếu m&agrave;n h&igrave;nh điện thoại l&ecirc;n tivi Screen Mirroring (Miracast)<br />\r\nC&ocirc;ng nghệ X-Protection PRO gi&uacute;p tivi hạn chế khỏi bụi bẩn, độ ẩm, d&ograve;ng', 24367000, '<strong>1. CH&Iacute;NH S&Aacute;CH BẢO H&Agrave;NH</strong>\r\n<p><strong>Điều kiện &aacute;p dụng:</strong></p>\r\n\r\n<p>- Kh&aacute;ch h&agrave;ng vui l&ograve;ng xuất tr&igrave;nh phiếu bảo h&agrave;nh để được &aacute;p dụng ch&iacute;nh s&aacute;ch bảo h&agrave;nh.</p>\r\n\r\n<p>- Sản phẩm được&nbsp;<strong>bảo h&agrave;nh miễn ph&iacute;</strong>&nbsp;trong suốt thời gian sử dụng trong c&aacute;c trường hợp sau:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + L&oacute;t tẩy, đệm l&oacute;t tẩy, d&aacute;n đế chống trơn, đế bị bong keo, m&ograve;n đinh g&oacute;t, đứt thun, đứt chỉ.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c chi tiết trang tr&iacute;, phụ kiện (kh&oacute;a, m&oacute;c, d&acirc;y k&eacute;o,... ). C&aacute;c phụ kiện gắn tr&ecirc;n sản phẩm nếu kh&ocirc;ng c&ograve;n phụ kiện thay thế sẽ thay bằng phụ kiện kh&aacute;c tương tự.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Lỗi sơn viền.</p>\r\n\r\n<p>- Ch&uacute;ng t&ocirc;i&nbsp;từ chối bảo h&agrave;nh sản phẩm đối với c&aacute;c trường hợp:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm kh&ocirc;ng c&oacute; phiếu bảo h&agrave;nh.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm qu&aacute; cũ (da v&agrave; đế qu&aacute; cũ, kh&ocirc;ng c&ograve;n độ b&aacute;m d&iacute;nh giữa da v&agrave; keo).</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm bị hư hỏng v&agrave; lỗi từ ph&iacute;a kh&aacute;ch h&agrave;ng g&acirc;y n&ecirc;n như trầy xước, đế m&ograve;n, sản phẩm kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn do bị động vật cắn, bảo quản kh&ocirc;ng tốt g&acirc;y ẩm mốc, phai nắng, n&oacute;ng chảy, &hellip;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c sản phẩm khuyến m&atilde;i, giảm gi&aacute;.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n<strong>2. QUY ĐỊNH ĐỔI SẢN PHẨM</strong>\r\n\r\n<p>- Sản phẩm được đổi trong v&ograve;ng 07 ng&agrave;y kể từ ng&agrave;y mua v&agrave; chỉ đổi 01 lần duy nhất với gi&aacute; trị bằng hoặc cao hơn, nếu thấp hơn sẽ kh&ocirc;ng được ho&agrave;n tiền.</p>\r\n\r\n<p>- Sản phẩm đổi phải c&ograve;n h&oacute;a đơn, phiếu bảo h&agrave;nh v&agrave; tem thương hiệu.</p>\r\n\r\n<p>- Sản phẩm phải c&ograve;n nguy&ecirc;n vẹn, đế kh&ocirc;ng bị trầy, bị dơ hoặc c&oacute; dấu hiệu đ&atilde; sử dụng.</p>\r\n\r\n<p>- Kh&ocirc;ng &aacute;p dụng ch&iacute;nh s&aacute;ch đổi đối với c&aacute;c sản phẩm đ&atilde; qu&aacute; thời gian đổi, sản phẩm đ&atilde; sử dụng, kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn.</p>\r\n\r\n<p>- C&aacute;c sản phẩm đ&atilde; được thay đổi một số chi tiết theo y&ecirc;u cầu kh&aacute;ch h&agrave;ng đều kh&ocirc;ng được đổi trả hoặc ho&agrave;n tiền.</p>\r\n\r\n<p>- C&aacute;c sản phẩm giảm gi&aacute;, khuyến m&atilde;i, h&agrave;ng tặng được &aacute;p dụng ch&iacute;nh s&aacute;ch đổi theo quy định của từng chương tr&igrave;nh.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n', '2019-04-09 04:21:31', 'no', 27374000, 27386000, 24660000, 2, 8, 'Lazada', 'Tiki', 'Shopee'),
(237, 1, 1, 'Smart Tivi Samsung 32 inch UA32N4666', 'Độ ph&acirc;n giải HD sắc n&eacute;t tr&ecirc;n m&agrave;n hinh tivi 32 inch<br />\r\nC&ocirc;ng nghệ Wide Color Enhancer cho dải m&agrave;u rộng, m&agrave;u sắc sống động rực rỡ<br />\r\nM&agrave;u đen s&acirc;u, m&agrave;u s&aacute;ng tươi mới hơn với c&ocirc;ng nghệ Contrast Enhancer<br />\r\nC&ocirc;ng suất loa l&ecirc;n đến 10W cho &acirc;m thanh r&otilde; r&agrave;ng, mạnh mẽ<br />\r\nT&iacute;ch hợp đầu thu DVB-T2 gi&uacute;p xem được nhiều k&ecirc;nh truyền h&igrave;nh miễn ph&iacute;', 38320000, '<strong>1. CH&Iacute;NH S&Aacute;CH BẢO H&Agrave;NH</strong>\r\n<p><strong>Điều kiện &aacute;p dụng:</strong></p>\r\n\r\n<p>- Kh&aacute;ch h&agrave;ng vui l&ograve;ng xuất tr&igrave;nh phiếu bảo h&agrave;nh để được &aacute;p dụng ch&iacute;nh s&aacute;ch bảo h&agrave;nh.</p>\r\n\r\n<p>- Sản phẩm được&nbsp;<strong>bảo h&agrave;nh miễn ph&iacute;</strong>&nbsp;trong suốt thời gian sử dụng trong c&aacute;c trường hợp sau:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + L&oacute;t tẩy, đệm l&oacute;t tẩy, d&aacute;n đế chống trơn, đế bị bong keo, m&ograve;n đinh g&oacute;t, đứt thun, đứt chỉ.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c chi tiết trang tr&iacute;, phụ kiện (kh&oacute;a, m&oacute;c, d&acirc;y k&eacute;o,... ). C&aacute;c phụ kiện gắn tr&ecirc;n sản phẩm nếu kh&ocirc;ng c&ograve;n phụ kiện thay thế sẽ thay bằng phụ kiện kh&aacute;c tương tự.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Lỗi sơn viền.</p>\r\n\r\n<p>- Ch&uacute;ng t&ocirc;i&nbsp;từ chối bảo h&agrave;nh sản phẩm đối với c&aacute;c trường hợp:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm kh&ocirc;ng c&oacute; phiếu bảo h&agrave;nh.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm qu&aacute; cũ (da v&agrave; đế qu&aacute; cũ, kh&ocirc;ng c&ograve;n độ b&aacute;m d&iacute;nh giữa da v&agrave; keo).</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Sản phẩm bị hư hỏng v&agrave; lỗi từ ph&iacute;a kh&aacute;ch h&agrave;ng g&acirc;y n&ecirc;n như trầy xước, đế m&ograve;n, sản phẩm kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn do bị động vật cắn, bảo quản kh&ocirc;ng tốt g&acirc;y ẩm mốc, phai nắng, n&oacute;ng chảy, &hellip;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + C&aacute;c sản phẩm khuyến m&atilde;i, giảm gi&aacute;.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n<strong>2. QUY ĐỊNH ĐỔI SẢN PHẨM</strong>\r\n\r\n<p>- Sản phẩm được đổi trong v&ograve;ng 07 ng&agrave;y kể từ ng&agrave;y mua v&agrave; chỉ đổi 01 lần duy nhất với gi&aacute; trị bằng hoặc cao hơn, nếu thấp hơn sẽ kh&ocirc;ng được ho&agrave;n tiền.</p>\r\n\r\n<p>- Sản phẩm đổi phải c&ograve;n h&oacute;a đơn, phiếu bảo h&agrave;nh v&agrave; tem thương hiệu.</p>\r\n\r\n<p>- Sản phẩm phải c&ograve;n nguy&ecirc;n vẹn, đế kh&ocirc;ng bị trầy, bị dơ hoặc c&oacute; dấu hiệu đ&atilde; sử dụng.</p>\r\n\r\n<p>- Kh&ocirc;ng &aacute;p dụng ch&iacute;nh s&aacute;ch đổi đối với c&aacute;c sản phẩm đ&atilde; qu&aacute; thời gian đổi, sản phẩm đ&atilde; sử dụng, kh&ocirc;ng c&ograve;n nguy&ecirc;n vẹn.</p>\r\n\r\n<p>- C&aacute;c sản phẩm đ&atilde; được thay đổi một số chi tiết theo y&ecirc;u cầu kh&aacute;ch h&agrave;ng đều kh&ocirc;ng được đổi trả hoặc ho&agrave;n tiền.</p>\r\n\r\n<p>- C&aacute;c sản phẩm giảm gi&aacute;, khuyến m&atilde;i, h&agrave;ng tặng được &aacute;p dụng ch&iacute;nh s&aacute;ch đổi theo quy định của từng chương tr&igrave;nh.</p>\r\n\r\n<p>- Trong mọi trường hợp, quyết định của ch&uacute;ng t&ocirc;i&nbsp;l&agrave; quyết định cuối c&ugrave;ng.</p>\r\n', '2019-04-09 04:21:31', 'no', 40643000, 40637000, 43308000, 17, 7, 'Lazada', 'Tiki', 'Shopee');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `table_product_detail`
--

CREATE TABLE `table_product_detail` (
  `id_product_detail` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `photo_link` varchar(255) NOT NULL,
  `is_avatar` enum('yes','no') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `table_product_detail`
--

INSERT INTO `table_product_detail` (`id_product_detail`, `id_product`, `photo_link`, `is_avatar`) VALUES
(1, 1, 'images/products/tivi1.jpg', 'yes'),
(2, 2, 'images/products/tivi2.jpg', 'yes'),
(3, 3, 'images/products/tivi3.jpg', 'yes'),
(4, 4, 'images/products/tivi4.jpg', 'yes'),
(5, 5, 'images/products/tivi5.jpg', 'yes'),
(6, 6, 'images/products/tivi6.jpg', 'yes'),
(7, 7, 'images/products/tivi7.jpg', 'yes'),
(8, 22, 'images/products/tivi8.jpg', 'yes'),
(9, 43, 'images/products/tivi9.jpg', 'yes'),
(10, 234, 'images/products/tivi10.jpg', 'yes'),
(11, 235, 'images/products/tivi11.jpg', 'yes'),
(12, 236, 'images/products/tivi12.jpg', 'yes'),
(13, 237, 'images/products/tivi13.jpg', 'yes'),
(14, 44, 'images/products/tulanh1.jpg', 'yes'),
(15, 45, 'images/products/tulanh2.jpg', 'yes'),
(16, 46, 'images/products/tulanh3.jpg', 'yes'),
(17, 47, 'images/products/tulanh4.jpg', 'yes'),
(18, 48, 'images/products/tulanh5.jpg', 'yes'),
(19, 49, 'images/products/tulanh6.jpg', 'yes'),
(20, 50, 'images/products/tulanh7.jpg', 'yes'),
(21, 51, 'images/products/tulanh8.jpg', 'yes'),
(22, 52, 'images/products/tulanh9.jpg', 'yes'),
(23, 53, 'images/products/tulanh10.jpg', 'yes'),
(24, 54, 'images/products/tulanh11.jpg', 'yes'),
(25, 55, 'images/products/tulanh12.jpg', 'yes'),
(26, 56, 'images/products/tulanh13.jpg', 'yes'),
(32, 68, 'images/products/maygiac1.jpg', 'yes'),
(33, 69, 'images/products/maygiac2.jpg', 'yes'),
(34, 70, 'images/products/maygiac3.jpg', 'yes'),
(35, 71, 'images/products/maygiac4.jpg', 'yes'),
(36, 72, 'images/products/maygiac5.jpg', 'yes'),
(37, 73, 'images/products/maygiac6.jpg', 'yes'),
(38, 74, 'images/products/maygiac7.jpg', 'yes'),
(39, 75, 'images/products/maygiac8.jpg', 'yes'),
(40, 76, 'images/products/maygiac9.jpg', 'yes'),
(41, 77, 'images/products/maygiac10.jpg', 'yes'),
(42, 78, 'images/products/maygiac11.jpg', 'yes'),
(43, 79, 'images/products/maygiac12.jpg', 'yes'),
(44, 96, 'images/products/micro1.jpg', 'yes'),
(45, 97, 'images/products/micro2.jpg', 'yes'),
(46, 98, 'images/products/micro3.jpg', 'yes'),
(47, 99, 'images/products/micro4.jpg', 'yes'),
(48, 100, 'images/products/micro5.jpg', 'yes'),
(49, 101, 'images/products/micro6.jpg', 'yes'),
(50, 102, 'images/products/micro7.jpg', 'yes'),
(51, 103, 'images/products/micro8.jpg', 'yes'),
(52, 104, 'images/products/micro9.jpg', 'yes'),
(53, 105, 'images/products/micro10.jpg', 'yes'),
(54, 106, 'images/products/micro11.jpg', 'yes'),
(55, 107, 'images/products/micro12.jpg', 'yes'),
(56, 1, 'images/products/tivi15.jpg', 'no'),
(57, 1, 'images/products/tivi16.jpg', 'no'),
(58, 1, 'images/products/tivi17.jpg', 'no'),
(59, 237, 'images/products/0.jpg', 'no'),
(60, 237, 'images/products/1.jpg', 'no'),
(61, 237, 'images/products/2.jpg', 'no'),
(62, 79, 'images/products/3.jpg', 'no'),
(63, 79, 'images/products/4.jpg', 'no');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `table_slider`
--

CREATE TABLE `table_slider` (
  `id_slider` int(255) NOT NULL,
  `content1` varchar(255) NOT NULL,
  `content2` text NOT NULL,
  `photo_link` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `table_slider`
--

INSERT INTO `table_slider` (`id_slider`, `content1`, `content2`, `photo_link`) VALUES
(13, 'Chào mừng bạn đến với', 'Điện đèn gia dụng', 'images/sliders/2.jpg'),
(14, 'Chào mừng bạn đến với', 'Điện đèn gia dụng', 'images/sliders/3.jpg'),
(15, 'Chào mừng bạn đến với', 'Điện đèn gia dụng', 'images/sliders/4.jpg'),
(16, 'Chào mừng bạn đến với', 'Điện đèn gia dụng', 'images/sliders/5.jpg'),
(17, 'Chào mừng bạn đến với', 'Điện đèn gia dụng', 'images/sliders/6.jpg'),
(18, 'Chào mừng bạn đến với', 'Điện đèn gia dụng', 'images/sliders/7.jpg'),
(19, 'Chào mừng bạn đến với', 'Điện đèn gia dụng', 'images/sliders/0.jpg'),
(20, 'Chào mừng bạn đến với', 'Điện đèn gia dụng', 'images/sliders/Lightwell-1920x950-01.jpg'),
(21, 'Chào mừng bạn đến với', 'Điện đèn gia dụng', 'images/sliders/1.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `table_storage`
--

CREATE TABLE `table_storage` (
  `id_storage` int(11) NOT NULL,
  `id_agent` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `safe_quantity` int(11) NOT NULL,
  `is_alert` enum('yes','no') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `table_storage`
--

INSERT INTO `table_storage` (`id_storage`, `id_agent`, `id_product`, `quantity`, `safe_quantity`, `is_alert`) VALUES
(51, 1, 1, 101, 11, 'no'),
(52, 1, 2, 29, 13, 'no'),
(53, 1, 3, 65, 28, 'no'),
(54, 1, 4, 55, 21, 'no'),
(55, 1, 5, 123, 25, 'no'),
(56, 1, 6, 31, 29, 'no'),
(57, 1, 7, 63, 15, 'no'),
(58, 1, 22, 62, 30, 'no'),
(59, 1, 43, 123, 20, 'no'),
(60, 1, 44, 22, 23, 'yes'),
(61, 1, 45, 100, 12, 'no'),
(62, 1, 46, 58, 24, 'no'),
(63, 1, 47, 138, 12, 'no'),
(64, 1, 48, 141, 26, 'no'),
(65, 1, 49, 25, 23, 'no'),
(66, 1, 50, 91, 10, 'no'),
(67, 1, 51, 139, 24, 'no'),
(68, 1, 52, 130, 19, 'no'),
(69, 1, 53, 81, 11, 'no'),
(70, 1, 54, 49, 27, 'no'),
(71, 1, 55, 65, 16, 'no'),
(72, 1, 56, 130, 17, 'no'),
(73, 1, 68, 106, 21, 'no'),
(74, 1, 69, 26, 30, 'yes'),
(75, 1, 70, 81, 23, 'no'),
(76, 1, 71, 118, 19, 'no'),
(77, 1, 72, 146, 25, 'no'),
(78, 1, 73, 85, 15, 'no'),
(79, 1, 74, 137, 22, 'no'),
(80, 1, 75, 30, 19, 'no'),
(81, 1, 76, 25, 20, 'no'),
(82, 1, 77, 35, 18, 'no'),
(83, 1, 78, 131, 12, 'no'),
(84, 1, 79, 55, 18, 'no'),
(85, 1, 96, 91, 12, 'no'),
(86, 1, 97, 78, 27, 'no'),
(87, 1, 98, 37, 23, 'no'),
(88, 1, 99, 45, 16, 'no'),
(89, 1, 100, 95, 14, 'no'),
(90, 1, 101, 148, 28, 'no'),
(91, 1, 102, 100, 27, 'no'),
(92, 1, 103, 122, 23, 'no'),
(93, 1, 104, 64, 29, 'no'),
(94, 1, 105, 24, 25, 'yes'),
(95, 1, 106, 64, 18, 'no'),
(96, 1, 107, 57, 11, 'no'),
(97, 1, 234, 82, 22, 'no'),
(98, 1, 235, 22, 30, 'yes'),
(99, 1, 236, 75, 29, 'no'),
(100, 1, 237, 120, 10, 'no'),
(101, 2, 1, 131, 29, 'no'),
(102, 2, 2, 140, 26, 'no'),
(103, 2, 3, 143, 11, 'no'),
(104, 2, 4, 110, 20, 'no'),
(105, 2, 5, 54, 15, 'no'),
(106, 2, 6, 77, 17, 'no'),
(107, 2, 7, 30, 20, 'no'),
(108, 2, 22, 79, 21, 'no'),
(109, 2, 43, 21, 20, 'no'),
(110, 2, 44, 77, 17, 'no'),
(111, 2, 45, 54, 16, 'no'),
(112, 2, 46, 31, 18, 'no'),
(113, 2, 47, 110, 27, 'no'),
(114, 2, 48, 51, 27, 'no'),
(115, 2, 49, 106, 16, 'no'),
(116, 2, 50, 39, 26, 'no'),
(117, 2, 51, 44, 19, 'no'),
(118, 2, 52, 55, 11, 'no'),
(119, 2, 53, 98, 22, 'no'),
(120, 2, 54, 109, 24, 'no'),
(121, 2, 55, 25, 18, 'no'),
(122, 2, 56, 25, 19, 'no'),
(123, 2, 68, 101, 18, 'no'),
(124, 2, 69, 72, 25, 'no'),
(125, 2, 70, 142, 17, 'no'),
(126, 2, 71, 105, 11, 'no'),
(127, 2, 72, 112, 29, 'no'),
(128, 2, 73, 50, 15, 'no'),
(129, 2, 74, 105, 10, 'no'),
(130, 2, 75, 89, 16, 'no'),
(131, 2, 76, 148, 17, 'no'),
(132, 2, 77, 70, 25, 'no'),
(133, 2, 78, 28, 16, 'no'),
(134, 2, 79, 81, 18, 'no'),
(135, 2, 96, 76, 22, 'no'),
(136, 2, 97, 40, 18, 'no'),
(137, 2, 98, 59, 13, 'no'),
(138, 2, 99, 23, 12, 'no'),
(139, 2, 100, 120, 30, 'no'),
(140, 2, 101, 28, 30, 'yes'),
(141, 2, 102, 117, 16, 'no'),
(142, 2, 103, 76, 24, 'no'),
(143, 2, 104, 78, 27, 'no'),
(144, 2, 105, 96, 26, 'no'),
(145, 2, 106, 109, 13, 'no'),
(146, 2, 107, 53, 28, 'no'),
(147, 2, 234, 142, 20, 'no'),
(148, 2, 235, 148, 17, 'no'),
(149, 2, 236, 114, 26, 'no'),
(150, 2, 237, 104, 19, 'no'),
(151, 0, 238, 0, 0, 'no'),
(152, 0, 239, 0, 0, 'no');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `table_suggestion`
--

CREATE TABLE `table_suggestion` (
  `id_suggestion` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `id_category` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `table_suggestion`
--

INSERT INTO `table_suggestion` (`id_suggestion`, `id_customer`, `id_category`) VALUES
(1, 1, 1),
(2, 1, 3),
(3, 1, 5),
(4, 1, 2);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `table_administrator`
--
ALTER TABLE `table_administrator`
  ADD PRIMARY KEY (`id_administrator`);

--
-- Chỉ mục cho bảng `table_agent`
--
ALTER TABLE `table_agent`
  ADD PRIMARY KEY (`id_agent`);

--
-- Chỉ mục cho bảng `table_category`
--
ALTER TABLE `table_category`
  ADD PRIMARY KEY (`id_category`);

--
-- Chỉ mục cho bảng `table_city`
--
ALTER TABLE `table_city`
  ADD PRIMARY KEY (`id_city`);

--
-- Chỉ mục cho bảng `table_customer`
--
ALTER TABLE `table_customer`
  ADD PRIMARY KEY (`id_customer`);

--
-- Chỉ mục cho bảng `table_customer_addition_address`
--
ALTER TABLE `table_customer_addition_address`
  ADD PRIMARY KEY (`id_customer_addition_address`);

--
-- Chỉ mục cho bảng `table_customer_search_history`
--
ALTER TABLE `table_customer_search_history`
  ADD PRIMARY KEY (`id_customer_search_history`);

--
-- Chỉ mục cho bảng `table_district`
--
ALTER TABLE `table_district`
  ADD PRIMARY KEY (`id_district`),
  ADD KEY `fk_district_city` (`id_city`);

--
-- Chỉ mục cho bảng `table_order`
--
ALTER TABLE `table_order`
  ADD PRIMARY KEY (`id_order`);

--
-- Chỉ mục cho bảng `table_order_detail`
--
ALTER TABLE `table_order_detail`
  ADD PRIMARY KEY (`id_order_detail`);

--
-- Chỉ mục cho bảng `table_producer`
--
ALTER TABLE `table_producer`
  ADD PRIMARY KEY (`id_producer`);

--
-- Chỉ mục cho bảng `table_product`
--
ALTER TABLE `table_product`
  ADD PRIMARY KEY (`id_product`);

--
-- Chỉ mục cho bảng `table_product_detail`
--
ALTER TABLE `table_product_detail`
  ADD PRIMARY KEY (`id_product_detail`);

--
-- Chỉ mục cho bảng `table_slider`
--
ALTER TABLE `table_slider`
  ADD PRIMARY KEY (`id_slider`);

--
-- Chỉ mục cho bảng `table_storage`
--
ALTER TABLE `table_storage`
  ADD PRIMARY KEY (`id_storage`);

--
-- Chỉ mục cho bảng `table_suggestion`
--
ALTER TABLE `table_suggestion`
  ADD PRIMARY KEY (`id_suggestion`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `table_administrator`
--
ALTER TABLE `table_administrator`
  MODIFY `id_administrator` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `table_agent`
--
ALTER TABLE `table_agent`
  MODIFY `id_agent` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT cho bảng `table_category`
--
ALTER TABLE `table_category`
  MODIFY `id_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `table_city`
--
ALTER TABLE `table_city`
  MODIFY `id_city` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT cho bảng `table_customer`
--
ALTER TABLE `table_customer`
  MODIFY `id_customer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `table_customer_addition_address`
--
ALTER TABLE `table_customer_addition_address`
  MODIFY `id_customer_addition_address` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `table_customer_search_history`
--
ALTER TABLE `table_customer_search_history`
  MODIFY `id_customer_search_history` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT cho bảng `table_order`
--
ALTER TABLE `table_order`
  MODIFY `id_order` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT cho bảng `table_order_detail`
--
ALTER TABLE `table_order_detail`
  MODIFY `id_order_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT cho bảng `table_producer`
--
ALTER TABLE `table_producer`
  MODIFY `id_producer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT cho bảng `table_product`
--
ALTER TABLE `table_product`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=238;

--
-- AUTO_INCREMENT cho bảng `table_product_detail`
--
ALTER TABLE `table_product_detail`
  MODIFY `id_product_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT cho bảng `table_slider`
--
ALTER TABLE `table_slider`
  MODIFY `id_slider` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `table_storage`
--
ALTER TABLE `table_storage`
  MODIFY `id_storage` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=153;

--
-- AUTO_INCREMENT cho bảng `table_suggestion`
--
ALTER TABLE `table_suggestion`
  MODIFY `id_suggestion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
