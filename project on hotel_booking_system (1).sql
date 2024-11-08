

CREATE TABLE `guests` (
  `id` int(11) primary key auto_increment,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL
) 


INSERT INTO `guests` (`id`, `name`, `email`, `phone`) VALUES
(1, 'Halland', 'halland@gmail.com', '01523323435'),
(2, 'Kalu Mia', 'kalumia47@gmail.com', '0152432344');


CREATE TABLE `payments` (
  `id` int(11) primary key auto_increment,
  `reservation_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_method` varchar(50) NOT NULL
) 


INSERT INTO `payments` (`id`, `reservation_id`, `amount`, `payment_date`, `payment_method`) VALUES
(1, 2, 53000.00, '2024-11-13', 'Mobile'),
(2, 1, 30000.00, '2024-11-12', 'Bkash');



CREATE TABLE `reservations` (
  `id` int(11) primary key auto_increment,
  `guest_id` int(11) DEFAULT NULL,
  `room_id` varchar(10) NOT NULL,
  `check_in_date` date DEFAULT NULL,
  `check_out_date` date DEFAULT NULL,
  `status` enum('confirmed','pending','cancelled') DEFAULT NULL,
  `staff_id` int(11) NOT NULL,
  FOREIGN key guest_id REFERENCES guests(id)
) 

INSERT INTO `reservations` (`id`, `guest_id`, `room_id`, `check_in_date`, `check_out_date`, `status`, `staff_id`) VALUES
(1, 1, '1', '2024-11-05', '2024-11-14', 'pending', 0),
(2, 2, '1', '2024-11-07', '2024-11-21', 'confirmed', 0);


CREATE TABLE `rooms` (
  `id` varchar(10) primary key auto_increment,
  `types` enum('Single','Double','Suite','Deluxe','Family') DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `status` enum('available','not available') DEFAULT NULL
)


INSERT INTO `rooms` (`id`, `types`, `price`, `status`) VALUES
('', 'Double', 23000.00, 'not available'),
('1', 'Single', 7000.00, 'available');


CREATE TABLE `staff` (
  `id` int(11) primary key auto_increment,
  `name` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL
)
--

INSERT INTO `staff` (`id`, `name`, `role`, `phone`) VALUES
(1, 'Bellal', 'IT manager', '023972424'),
(2, 'Hasan', 'Food and Beverage Manager', '0136713613');

