-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: MYSQL5036.site4now.net
-- Generation Time: Apr 12, 2026 at 01:47 PM
-- Server version: 5.6.26
-- PHP Version: 8.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_a78b79_support`
--

-- --------------------------------------------------------

--
-- Table structure for table `ost_api_key`
--

DROP TABLE IF EXISTS `ost_api_key`;
CREATE TABLE `ost_api_key` (
  `id` int(10) UNSIGNED NOT NULL,
  `isactive` tinyint(1) NOT NULL DEFAULT '1',
  `ipaddr` varchar(64) NOT NULL,
  `apikey` varchar(255) NOT NULL,
  `can_create_tickets` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `can_exec_cron` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `notes` text,
  `updated` datetime NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost_api_key`
--

TRUNCATE TABLE `ost_api_key`;
-- --------------------------------------------------------

--
-- Table structure for table `ost_attachment`
--

DROP TABLE IF EXISTS `ost_attachment`;
CREATE TABLE `ost_attachment` (
  `id` int(10) UNSIGNED NOT NULL,
  `object_id` int(11) UNSIGNED NOT NULL,
  `type` char(1) NOT NULL,
  `file_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `inline` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `lang` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost_attachment`
--

TRUNCATE TABLE `ost_attachment`;
--
-- Dumping data for table `ost_attachment`
--

INSERT INTO `ost_attachment` (`id`, `object_id`, `type`, `file_id`, `name`, `inline`, `lang`) VALUES
(1, 1, 'C', 2, NULL, 0, NULL),
(2, 8, 'T', 1, NULL, 1, NULL),
(3, 9, 'T', 1, NULL, 1, NULL),
(4, 10, 'T', 1, NULL, 1, NULL),
(5, 11, 'T', 1, NULL, 1, NULL),
(6, 12, 'T', 1, NULL, 1, NULL),
(7, 13, 'T', 1, NULL, 1, NULL),
(8, 14, 'T', 1, NULL, 1, NULL),
(9, 16, 'T', 1, NULL, 1, NULL),
(10, 17, 'T', 1, NULL, 1, NULL),
(11, 18, 'T', 1, NULL, 1, NULL),
(12, 19, 'T', 1, NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ost_canned_response`
--

DROP TABLE IF EXISTS `ost_canned_response`;
CREATE TABLE `ost_canned_response` (
  `canned_id` int(10) UNSIGNED NOT NULL,
  `dept_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `isenabled` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `title` varchar(255) NOT NULL DEFAULT '',
  `response` text NOT NULL,
  `lang` varchar(16) NOT NULL DEFAULT 'en_US',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost_canned_response`
--

TRUNCATE TABLE `ost_canned_response`;
--
-- Dumping data for table `ost_canned_response`
--

INSERT INTO `ost_canned_response` (`canned_id`, `dept_id`, `isenabled`, `title`, `response`, `lang`, `notes`, `created`, `updated`) VALUES
(1, 0, 1, 'What is osTicket (sample)?', 'osTicket is a widely-used open source support ticket system, an\nattractive alternative to higher-cost and complex customer support\nsystems - simple, lightweight, reliable, open source, web-based and easy\nto setup and use.', 'en_US', NULL, '2025-11-29 04:12:35', '2025-11-29 04:12:35'),
(2, 0, 1, 'Sample (with variables)', 'Hi %{ticket.name.first},\n<br>\n<br>\nYour ticket #%{ticket.number} created on %{ticket.create_date} is in\n%{ticket.dept.name} department.', 'en_US', NULL, '2025-11-29 04:12:35', '2025-11-29 04:12:35');

-- --------------------------------------------------------

--
-- Table structure for table `ost_config`
--

DROP TABLE IF EXISTS `ost_config`;
CREATE TABLE `ost_config` (
  `id` int(11) UNSIGNED NOT NULL,
  `namespace` varchar(64) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost_config`
--

TRUNCATE TABLE `ost_config`;
--
-- Dumping data for table `ost_config`
--

INSERT INTO `ost_config` (`id`, `namespace`, `key`, `value`, `updated`) VALUES
(1, 'core', 'admin_email', 'admin@gapshop.net', '2025-11-29 12:12:35'),
(2, 'core', 'helpdesk_url', 'http://support.gapshop.net/', '2025-11-29 12:12:35'),
(3, 'core', 'helpdesk_title', 'gapShop SupportDesk', '2025-11-29 14:12:08'),
(4, 'core', 'schema_signature', '5fb92bef17f3b603659e024c01cc7a59', '2025-11-29 12:12:35'),
(5, 'schedule.1', 'configuration', '{\"holidays\":[4]}', '2025-11-29 12:12:34'),
(6, 'core', 'time_format', 'hh:mm a', '2025-11-29 12:12:34'),
(7, 'core', 'date_format', 'MM/dd/y', '2025-11-29 12:12:34'),
(8, 'core', 'datetime_format', 'MM/dd/y h:mm a', '2025-11-29 12:12:34'),
(9, 'core', 'daydatetime_format', 'EEE, MMM d y h:mm a', '2025-11-29 12:12:34'),
(10, 'core', 'default_priority_id', '2', '2025-11-29 12:12:34'),
(11, 'core', 'enable_daylight_saving', '', '2025-11-29 12:12:34'),
(12, 'core', 'reply_separator', '-- reply above this line --', '2025-11-29 12:12:34'),
(13, 'core', 'isonline', '1', '2025-11-29 12:12:34'),
(14, 'core', 'staff_ip_binding', '', '2025-11-29 12:12:34'),
(15, 'core', 'staff_max_logins', '4', '2025-11-29 12:12:34'),
(16, 'core', 'staff_login_timeout', '2', '2025-11-29 12:12:34'),
(17, 'core', 'staff_session_timeout', '30', '2025-11-29 12:12:34'),
(18, 'core', 'passwd_reset_period', '', '2025-11-29 12:12:34'),
(19, 'core', 'client_max_logins', '4', '2025-11-29 12:12:34'),
(20, 'core', 'client_login_timeout', '2', '2025-11-29 12:12:34'),
(21, 'core', 'client_session_timeout', '30', '2025-11-29 12:12:34'),
(22, 'core', 'max_page_size', '25', '2025-11-29 12:12:34'),
(23, 'core', 'max_open_tickets', '', '2025-11-29 12:12:34'),
(24, 'core', 'autolock_minutes', '3', '2025-11-29 12:12:34'),
(25, 'core', 'default_smtp_id', '0', '2025-11-29 14:22:16'),
(26, 'core', 'use_email_priority', '0', '2025-11-29 14:22:16'),
(27, 'core', 'enable_kb', '1', '2025-11-29 14:17:20'),
(28, 'core', 'enable_premade', '1', '2025-11-29 12:12:34'),
(29, 'core', 'enable_captcha', '', '2025-11-29 12:12:34'),
(30, 'core', 'enable_auto_cron', '1', '2025-11-29 14:22:16'),
(31, 'core', 'enable_mail_polling', '1', '2025-11-29 14:22:16'),
(32, 'core', 'send_sys_errors', '1', '2025-11-29 12:12:34'),
(33, 'core', 'send_sql_errors', '1', '2025-11-29 12:12:34'),
(34, 'core', 'send_login_errors', '1', '2025-11-29 12:12:34'),
(35, 'core', 'save_email_headers', '1', '2025-11-29 12:12:34'),
(36, 'core', 'strip_quoted_reply', '1', '2025-11-29 12:12:34'),
(37, 'core', 'ticket_autoresponder', '', '2025-11-29 12:12:34'),
(38, 'core', 'message_autoresponder', '', '2025-11-29 12:12:34'),
(39, 'core', 'ticket_notice_active', '1', '2025-11-29 12:12:34'),
(40, 'core', 'ticket_alert_active', '1', '2025-11-29 12:12:34'),
(41, 'core', 'ticket_alert_admin', '1', '2025-11-29 12:12:34'),
(42, 'core', 'ticket_alert_dept_manager', '1', '2025-11-29 12:12:34'),
(43, 'core', 'ticket_alert_dept_members', '', '2025-11-29 12:12:34'),
(44, 'core', 'message_alert_active', '1', '2025-11-29 12:12:34'),
(45, 'core', 'message_alert_laststaff', '1', '2025-11-29 12:12:34'),
(46, 'core', 'message_alert_assigned', '1', '2025-11-29 12:12:34'),
(47, 'core', 'message_alert_dept_manager', '', '2025-11-29 12:12:34'),
(48, 'core', 'note_alert_active', '', '2025-11-29 12:12:34'),
(49, 'core', 'note_alert_laststaff', '1', '2025-11-29 12:12:34'),
(50, 'core', 'note_alert_assigned', '1', '2025-11-29 12:12:34'),
(51, 'core', 'note_alert_dept_manager', '', '2025-11-29 12:12:34'),
(52, 'core', 'transfer_alert_active', '', '2025-11-29 12:12:34'),
(53, 'core', 'transfer_alert_assigned', '', '2025-11-29 12:12:34'),
(54, 'core', 'transfer_alert_dept_manager', '1', '2025-11-29 12:12:34'),
(55, 'core', 'transfer_alert_dept_members', '', '2025-11-29 12:12:34'),
(56, 'core', 'overdue_alert_active', '1', '2025-11-29 12:12:34'),
(57, 'core', 'overdue_alert_assigned', '1', '2025-11-29 12:12:34'),
(58, 'core', 'overdue_alert_dept_manager', '1', '2025-11-29 12:12:34'),
(59, 'core', 'overdue_alert_dept_members', '', '2025-11-29 12:12:34'),
(60, 'core', 'assigned_alert_active', '1', '2025-11-29 12:12:34'),
(61, 'core', 'assigned_alert_staff', '1', '2025-11-29 12:12:34'),
(62, 'core', 'assigned_alert_team_lead', '', '2025-11-29 12:12:34'),
(63, 'core', 'assigned_alert_team_members', '', '2025-11-29 12:12:34'),
(64, 'core', 'auto_claim_tickets', '1', '2025-11-29 12:12:34'),
(65, 'core', 'auto_refer_closed', '1', '2025-11-29 12:12:34'),
(66, 'core', 'collaborator_ticket_visibility', '1', '2025-11-29 12:12:34'),
(67, 'core', 'require_topic_to_close', '', '2025-11-29 12:12:34'),
(68, 'core', 'show_related_tickets', '1', '2025-11-29 12:12:34'),
(69, 'core', 'show_assigned_tickets', '1', '2025-11-29 12:12:34'),
(70, 'core', 'show_answered_tickets', '', '2025-11-29 12:12:34'),
(71, 'core', 'hide_staff_name', '', '2025-11-29 12:12:34'),
(72, 'core', 'disable_agent_collabs', '', '2025-11-29 12:12:34'),
(73, 'core', 'overlimit_notice_active', '', '2025-11-29 12:12:34'),
(74, 'core', 'email_attachments', '1', '2025-11-29 12:12:34'),
(75, 'core', 'ticket_number_format', '######', '2025-11-29 12:12:34'),
(76, 'core', 'ticket_sequence_id', '', '2025-11-29 12:12:34'),
(77, 'core', 'queue_bucket_counts', '', '2025-11-29 12:12:34'),
(78, 'core', 'allow_external_images', '', '2025-11-29 12:12:34'),
(79, 'core', 'task_number_format', '#', '2025-11-29 12:12:34'),
(80, 'core', 'task_sequence_id', '2', '2025-11-29 12:12:34'),
(81, 'core', 'log_level', '2', '2025-11-29 12:12:34'),
(82, 'core', 'log_graceperiod', '3', '2025-11-29 14:12:08'),
(83, 'core', 'client_registration', 'public', '2025-11-29 12:12:35'),
(84, 'core', 'default_ticket_queue', '1', '2025-11-29 12:12:35'),
(85, 'core', 'embedded_domain_whitelist', 'youtube.com, dailymotion.com, vimeo.com, player.vimeo.com, web.microsoftstream.com', '2025-11-29 12:12:35'),
(86, 'core', 'max_file_size', '67108864', '2025-11-29 12:12:35'),
(87, 'core', 'landing_page_id', '1', '2025-11-29 12:12:35'),
(88, 'core', 'thank-you_page_id', '2', '2025-11-29 12:12:35'),
(89, 'core', 'offline_page_id', '3', '2025-11-29 12:12:35'),
(90, 'core', 'system_language', 'en_US', '2025-11-29 12:12:35'),
(91, 'mysqlsearch', 'reindex', '0', '2025-11-29 12:19:01'),
(92, 'core', 'default_email_id', '1', '2025-11-29 12:12:35'),
(93, 'core', 'alert_email_id', '0', '2025-12-01 03:17:40'),
(94, 'core', 'default_dept_id', '1', '2025-11-29 12:12:35'),
(95, 'core', 'default_sla_id', '1', '2025-11-29 12:12:35'),
(96, 'core', 'schedule_id', '1', '2025-11-29 12:12:35'),
(97, 'core', 'default_template_id', '1', '2025-11-29 12:12:35'),
(98, 'core', 'default_timezone', 'America/Chicago', '2025-11-29 14:12:08'),
(99, 'core', 'default_storage_bk', 'D', '2025-11-29 14:12:08'),
(100, 'core', 'force_https', '', '2025-11-29 14:12:08'),
(101, 'core', 'date_formats', '', '2025-11-29 14:12:08'),
(102, 'core', 'default_locale', '', '2025-11-29 14:12:08'),
(103, 'core', 'secondary_langs', '', '2025-11-29 14:12:08'),
(104, 'core', 'enable_avatars', '1', '2025-11-29 14:12:08'),
(105, 'core', 'enable_richtext', '1', '2025-11-29 14:12:08'),
(106, 'core', 'files_req_auth', '1', '2025-11-29 14:12:08'),
(107, 'core', 'allow_iframes', '', '2025-11-29 14:12:08'),
(108, 'core', 'acl', '', '2025-11-29 14:12:08'),
(109, 'core', 'acl_backend', '', '2025-11-29 14:12:08'),
(110, 'staff.1', 'datetime_format', 'relative', '2025-11-29 14:13:01'),
(111, 'staff.1', 'default_from_name', 'email', '2025-11-29 14:13:01'),
(112, 'staff.1', 'default_2fa', '', '2025-11-29 14:13:01'),
(113, 'staff.1', 'thread_view_order', '', '2025-11-29 14:13:01'),
(114, 'staff.1', 'default_ticket_queue_id', '0', '2025-11-29 14:13:01'),
(115, 'staff.1', 'reply_redirect', 'Ticket', '2025-11-29 14:13:01'),
(116, 'staff.1', 'img_att_view', 'download', '2025-11-29 14:13:01'),
(117, 'staff.1', 'editor_spacing', 'double', '2025-11-29 14:13:01'),
(118, 'core', 'restrict_kb', '0', '2026-04-06 11:42:12'),
(119, 'core', 'verify_email_addrs', '1', '2025-11-29 14:22:16'),
(120, 'core', 'accept_unregistered_email', '1', '2025-11-29 14:22:16'),
(121, 'core', 'add_email_collabs', '1', '2025-11-29 14:22:16'),
(122, 'core', 'client_logo_id', '3', '2025-11-29 14:32:25'),
(123, 'core', 'staff_logo_id', '3', '2025-11-29 14:32:25'),
(124, 'core', 'staff_backdrop_id', '', '2025-11-29 14:31:47'),
(125, 'email.1.account.1', 'username', 'support@gapshop.net', '2025-12-01 18:39:38'),
(126, 'email.1.account.1', 'passwd', '$2$JDEk+yd0vhmMUe93whEaJk+uscZI0JBi0cFmMSZhUKFFKLo=', '2025-12-01 18:39:38'),
(127, 'email.1.account.2', 'username', 'support@gapshop.net', '2025-12-01 18:40:56'),
(128, 'email.1.account.2', 'passwd', '$2$JDEkZsOcGzoOybAa07b2t4x3vggPfK18HSljK15DjoxdMD8=', '2025-12-01 18:40:56'),
(129, 'pwreset', 'VWeynt0EdaUa7U04W6pKZ6tNZl8oRLVvrzRQheW6Z53QAn7r', '2', '2025-12-01 22:25:36'),
(130, 'pwreset', 'h2E0xaqVvDVMAysZKbj0gieE0LUCu5nJrJ6cbgCEwrSxe1M3', '2', '2025-12-01 22:25:49');

-- --------------------------------------------------------

--
-- Table structure for table `ost_content`
--

DROP TABLE IF EXISTS `ost_content`;
CREATE TABLE `ost_content` (
  `id` int(10) UNSIGNED NOT NULL,
  `isactive` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `type` varchar(32) NOT NULL DEFAULT 'other',
  `name` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost_content`
--

TRUNCATE TABLE `ost_content`;
--
-- Dumping data for table `ost_content`
--

INSERT INTO `ost_content` (`id`, `isactive`, `type`, `name`, `body`, `notes`, `created`, `updated`) VALUES
(1, 1, 'landing', 'Landing', '<h1>Welcome to the Support Center</h1> <p> In order to streamline support requests and better serve you, we utilize a support ticket system. Every support request is assigned a unique ticket number which you can use to track the progress and responses online. For your reference we provide complete archives and history of all your support requests. A valid email address is required to submit a ticket. </p>', 'The Landing Page refers to the content of the Customer Portal\'s initial view. The template modifies the content seen above the two links <strong>Open a New Ticket</strong> and <strong>Check Ticket Status</strong>.', '2025-11-29 04:12:35', '2025-11-29 04:12:35'),
(2, 1, 'thank-you', 'Thank You', '<div>%{ticket.name},\n<br>\n<br>\nThank you for contacting us.\n<br>\n<br>\nA support ticket request has been created and a representative will be\ngetting back to you shortly if necessary.</p>\n<br>\n<br>\nSupport Team\n</div>', 'This template defines the content displayed on the Thank-You page after a\nClient submits a new ticket in the Client Portal.', '2025-11-29 04:12:35', '2025-11-29 04:12:35'),
(3, 1, 'offline', 'Offline', '<div><h1>\n<span style=\"font-size: medium\">Support Ticket System Offline</span>\n</h1>\n<p>Thank you for your interest in contacting us.</p>\n<p>Our helpdesk is offline at the moment, please check back at a later\ntime.</p>\n</div>', 'The Offline Page appears in the Customer Portal when the Help Desk is offline.', '2025-11-29 04:12:35', '2025-11-29 04:12:35'),
(4, 1, 'registration-staff', 'Welcome to osTicket', '<h3><strong>Hi %{recipient.name.first},</strong></h3> <div> We\'ve created an account for you at our help desk at %{url}.<br /> <br /> Please follow the link below to confirm your account and gain access to your tickets.<br /> <br /> <a href=\"%{link}\">%{link}</a><br /> <br /> <em style=\"font-size: small\">Your friendly Customer Support System<br /> %{company.name}</em> </div>', 'This template defines the initial email (optional) sent to Agents when an account is created on their behalf.', '2025-11-29 04:12:35', '2025-11-29 04:12:35'),
(5, 1, 'pwreset-staff', 'osTicket Staff Password Reset', '<h3><strong>Hi %{staff.name.first},</strong></h3> <div> A password reset request has been submitted on your behalf for the helpdesk at %{url}.<br /> <br /> If you feel that this has been done in error, delete and disregard this email. Your account is still secure and no one has been given access to it. It is not locked and your password has not been reset. Someone could have mistakenly entered your email address.<br /> <br /> Follow the link below to login to the help desk and change your password.<br /> <br /> <a href=\"%{link}\">%{link}</a><br /> <br /> <em style=\"font-size: small\">Your friendly Customer Support System</em> <br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" alt=\"Powered by osTicket\" width=\"126\" height=\"19\" style=\"width: 126px\" /> </div>', 'This template defines the email sent to Staff who select the <strong>Forgot My Password</strong> link on the Staff Control Panel Log In page.', '2025-11-29 04:12:35', '2025-11-29 04:12:35'),
(6, 1, 'banner-staff', 'Authentication Required', '', 'This is the initial message and banner shown on the Staff Log In page. The first input field refers to the red-formatted text that appears at the top. The latter textarea is for the banner content which should serve as a disclaimer.', '2025-11-29 04:12:35', '2025-11-29 04:12:35'),
(7, 1, 'registration-client', 'Welcome to %{company.name}', '<h3><strong>Hi %{recipient.name.first},</strong></h3> <div> We\'ve created an account for you at our help desk at %{url}.<br /> <br /> Please follow the link below to confirm your account and gain access to your tickets.<br /> <br /> <a href=\"%{link}\">%{link}</a><br /> <br /> <em style=\"font-size: small\">Your friendly Customer Support System <br /> %{company.name}</em> </div>', 'This template defines the email sent to Clients when their account has been created in the Client Portal or by an Agent on their behalf. This email serves as an email address verification. Please use %{link} somewhere in the body.', '2025-11-29 04:12:35', '2025-11-29 04:12:35'),
(8, 1, 'pwreset-client', '%{company.name} Help Desk Access', '<h3><strong>Hi %{user.name.first},</strong></h3> <div> A password reset request has been submitted on your behalf for the helpdesk at %{url}.<br /> <br /> If you feel that this has been done in error, delete and disregard this email. Your account is still secure and no one has been given access to it. It is not locked and your password has not been reset. Someone could have mistakenly entered your email address.<br /> <br /> Follow the link below to login to the help desk and change your password.<br /> <br /> <a href=\"%{link}\">%{link}</a><br /> <br /> <em style=\"font-size: small\">Your friendly Customer Support System <br /> %{company.name}</em> </div>', 'This template defines the email sent to Clients who select the <strong>Forgot My Password</strong> link on the Client Log In page.', '2025-11-29 04:12:35', '2025-11-29 04:12:35'),
(9, 1, 'banner-client', 'Sign in to %{company.name}', 'To better serve you, we encourage our Clients to register for an account.', 'This composes the header on the Client Log In page. It can be useful to inform your Clients about your log in and registration policies.', '2025-11-29 04:12:35', '2025-11-29 04:12:35'),
(10, 1, 'registration-confirm', 'Account registration', '<div><strong>Thanks for registering for an account.</strong><br/> <br /> We\'ve just sent you an email to the address you entered. Please follow the link in the email to confirm your account and gain access to your tickets. </div>', 'This templates defines the page shown to Clients after completing the registration form. The template should mention that the system is sending them an email confirmation link and what is the next step in the registration process.', '2025-11-29 04:12:35', '2025-11-29 04:12:35'),
(11, 1, 'registration-thanks', 'Account Confirmed!', '<div> <strong>Thanks for registering for an account.</strong><br /> <br /> You\'ve confirmed your email address and successfully activated your account. You may proceed to open a new ticket or manage existing tickets.<br /> <br /> <em>Your friendly support center</em><br /> %{company.name} </div>', 'This template defines the content displayed after Clients successfully register by confirming their account. This page should inform the user that registration is complete and that the Client can now submit a ticket or access existing tickets.', '2025-11-29 04:12:35', '2025-11-29 04:12:35'),
(12, 1, 'access-link', 'Ticket [#%{ticket.number}] Access Link', '<h3><strong>Hi %{recipient.name.first},</strong></h3> <div> An access link request for ticket #%{ticket.number} has been submitted on your behalf for the helpdesk at %{url}.<br /> <br /> Follow the link below to check the status of the ticket #%{ticket.number}.<br /> <br /> <a href=\"%{recipient.ticket_link}\">%{recipient.ticket_link}</a><br /> <br /> If you <strong>did not</strong> make the request, please delete and disregard this email. Your account is still secure and no one has been given access to the ticket. Someone could have mistakenly entered your email address.<br /> <br /> --<br /> %{company.name} </div>', 'This template defines the notification for Clients that an access link was sent to their email. The ticket number and email address trigger the access link.', '2025-11-29 04:12:35', '2025-11-29 04:12:35'),
(13, 1, 'email2fa-staff', 'osTicket Two Factor Authentication', '<h3><strong>Hi %{staff.name.first},</strong></h3> <div> You have just logged into for the helpdesk at %{url}.<br /> <br /> Use the verification code below to finish logging into the helpdesk.<br /> <br /> %{otp}<br /> <br /> <em style=\"font-size: small\">Your friendly Customer Support System</em> <br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" alt=\"Powered by osTicket\" width=\"126\" height=\"19\" style=\"width: 126px\" /> </div>', 'This template defines the email sent to Staff who use Email for Two Factor Authentication', '2025-11-29 04:12:35', '2025-11-29 04:12:35');

-- --------------------------------------------------------

--
-- Table structure for table `ost_department`
--

DROP TABLE IF EXISTS `ost_department`;
CREATE TABLE `ost_department` (
  `id` int(11) UNSIGNED NOT NULL,
  `pid` int(11) UNSIGNED DEFAULT NULL,
  `tpl_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `sla_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `schedule_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `email_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `autoresp_email_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `manager_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `flags` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL DEFAULT '',
  `signature` text NOT NULL,
  `ispublic` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `group_membership` tinyint(1) NOT NULL DEFAULT '0',
  `ticket_auto_response` tinyint(1) NOT NULL DEFAULT '1',
  `message_auto_response` tinyint(1) NOT NULL DEFAULT '0',
  `path` varchar(128) NOT NULL DEFAULT '/',
  `updated` datetime NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost_department`
--

TRUNCATE TABLE `ost_department`;
--
-- Dumping data for table `ost_department`
--

INSERT INTO `ost_department` (`id`, `pid`, `tpl_id`, `sla_id`, `schedule_id`, `email_id`, `autoresp_email_id`, `manager_id`, `flags`, `name`, `signature`, `ispublic`, `group_membership`, `ticket_auto_response`, `message_auto_response`, `path`, `updated`, `created`) VALUES
(1, NULL, 0, 0, 0, 0, 0, 0, 4, 'Support', 'Support Department', 1, 1, 1, 1, '/1/', '2025-11-29 04:12:33', '2025-11-29 04:12:33'),
(2, NULL, 0, 1, 0, 0, 0, 0, 4, 'Sales', 'Sales and Customer Retention', 1, 1, 1, 1, '/2/', '2025-11-29 04:12:33', '2025-11-29 04:12:33'),
(3, NULL, 0, 0, 0, 0, 0, 0, 4, 'Maintenance', 'Maintenance Department', 1, 0, 1, 1, '/3/', '2026-04-09 08:55:38', '2025-11-29 04:12:33'),
(4, NULL, 0, 0, 0, 0, 0, 0, 0, 'Customer Service', '', 1, 0, 1, 0, '/', '2026-04-09 17:44:37', '2026-04-09 08:58:50');

-- --------------------------------------------------------

--
-- Table structure for table `ost_draft`
--

DROP TABLE IF EXISTS `ost_draft`;
CREATE TABLE `ost_draft` (
  `id` int(11) UNSIGNED NOT NULL,
  `staff_id` int(11) UNSIGNED NOT NULL,
  `namespace` varchar(32) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `extra` text,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost_draft`
--

TRUNCATE TABLE `ost_draft`;
-- --------------------------------------------------------

--
-- Table structure for table `ost_email`
--

DROP TABLE IF EXISTS `ost_email`;
CREATE TABLE `ost_email` (
  `email_id` int(11) UNSIGNED NOT NULL,
  `noautoresp` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `priority_id` int(11) UNSIGNED NOT NULL DEFAULT '2',
  `dept_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `topic_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `email` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost_email`
--

TRUNCATE TABLE `ost_email`;
--
-- Dumping data for table `ost_email`
--

INSERT INTO `ost_email` (`email_id`, `noautoresp`, `priority_id`, `dept_id`, `topic_id`, `email`, `name`, `notes`, `created`, `updated`) VALUES
(1, 0, 2, 1, 0, 'support@gapshop.net', 'Support', NULL, '2025-11-29 04:12:35', '2025-11-29 04:12:35');

-- --------------------------------------------------------

--
-- Table structure for table `ost_email_account`
--

DROP TABLE IF EXISTS `ost_email_account`;
CREATE TABLE `ost_email_account` (
  `id` int(11) UNSIGNED NOT NULL,
  `email_id` int(11) UNSIGNED NOT NULL,
  `type` enum('mailbox','smtp') NOT NULL DEFAULT 'mailbox',
  `auth_bk` varchar(128) NOT NULL,
  `auth_id` varchar(16) DEFAULT NULL,
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `host` varchar(128) NOT NULL DEFAULT '',
  `port` int(11) NOT NULL,
  `folder` varchar(255) DEFAULT NULL,
  `protocol` enum('IMAP','POP','SMTP','OTHER') NOT NULL DEFAULT 'OTHER',
  `encryption` enum('NONE','AUTO','SSL') NOT NULL DEFAULT 'AUTO',
  `fetchfreq` tinyint(3) UNSIGNED NOT NULL DEFAULT '5',
  `fetchmax` tinyint(4) UNSIGNED DEFAULT '30',
  `postfetch` enum('archive','delete','nothing') NOT NULL DEFAULT 'nothing',
  `archivefolder` varchar(255) DEFAULT NULL,
  `allow_spoofing` tinyint(1) UNSIGNED DEFAULT '0',
  `num_errors` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `last_error_msg` tinytext,
  `last_error` datetime DEFAULT NULL,
  `last_activity` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost_email_account`
--

TRUNCATE TABLE `ost_email_account`;
--
-- Dumping data for table `ost_email_account`
--

INSERT INTO `ost_email_account` (`id`, `email_id`, `type`, `auth_bk`, `auth_id`, `active`, `host`, `port`, `folder`, `protocol`, `encryption`, `fetchfreq`, `fetchmax`, `postfetch`, `archivefolder`, `allow_spoofing`, `num_errors`, `last_error_msg`, `last_error`, `last_activity`, `created`, `updated`) VALUES
(1, 1, 'mailbox', 'basic', NULL, 1, 'mail.gapshop.net', 995, NULL, 'POP', 'AUTO', 5, 30, 'nothing', NULL, 0, 0, NULL, NULL, '2026-04-06 05:08:44', '2025-11-30 19:13:49', '2026-04-06 05:08:44'),
(2, 1, 'smtp', 'basic', NULL, 1, 'mail.gapshop.net', 8889, NULL, 'SMTP', 'AUTO', 5, 30, 'nothing', NULL, 0, 0, NULL, NULL, NULL, '2025-11-30 19:13:49', '2025-12-01 10:40:37');

-- --------------------------------------------------------

--
-- Table structure for table `ost_email_template`
--

DROP TABLE IF EXISTS `ost_email_template`;
CREATE TABLE `ost_email_template` (
  `id` int(11) UNSIGNED NOT NULL,
  `tpl_id` int(11) UNSIGNED NOT NULL,
  `code_name` varchar(32) NOT NULL,
  `subject` varchar(255) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost_email_template`
--

TRUNCATE TABLE `ost_email_template`;
--
-- Dumping data for table `ost_email_template`
--

INSERT INTO `ost_email_template` (`id`, `tpl_id`, `code_name`, `subject`, `body`, `notes`, `created`, `updated`) VALUES
(1, 1, 'ticket.autoresp', 'Support Ticket Opened [#%{ticket.number}]', '<h3><strong>Dear %{recipient.name.first},</strong></h3> <p>A request for support has been created and assigned #%{ticket.number}. A representative will follow-up with you as soon as possible. You can <a href=\"%%7Brecipient.ticket_link%7D\">view this ticket\'s progress online</a>. </p> <br /> <div style=\"color:rgb(127, 127, 127)\">Your %{company.name} Team, <br /> %{signature} </div> <hr /> <div style=\"color:rgb(127, 127, 127);font-size:small\"><em>If you wish to provide additional comments or information regarding the issue, please reply to this email or <a href=\"%%7Brecipient.ticket_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login to your account</span></a> for a complete archive of your support requests.</em></div>', NULL, '2025-11-29 04:12:35', '2025-11-29 04:12:35'),
(2, 1, 'ticket.autoreply', 'Re: %{ticket.subject} [#%{ticket.number}]', '<h3><strong>Dear %{recipient.name.first},</strong></h3> A request for support has been created and assigned ticket <a href=\"%%7Brecipient.ticket_link%7D\">#%{ticket.number}</a> with the following automatic reply <br /> <br /> Topic: <strong>%{ticket.topic.name}</strong> <br /> Subject: <strong>%{ticket.subject}</strong> <br /> <br /> %{response} <br /> <br /> <div style=\"color:rgb(127, 127, 127)\">Your %{company.name} Team,<br /> %{signature}</div> <hr /> <div style=\"color:rgb(127, 127, 127);font-size:small\"><em>We hope this response has sufficiently answered your questions. If you wish to provide additional comments or information, please reply to this email or <a href=\"%%7Brecipient.ticket_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login to your account</span></a> for a complete archive of your support requests.</em></div>', NULL, '2025-11-29 04:12:35', '2025-11-29 04:12:35'),
(3, 1, 'message.autoresp', 'Message Confirmation', '<h3><strong>Dear %{recipient.name.first},</strong></h3> Your reply to support request <a href=\"%%7Brecipient.ticket_link%7D\">#%{ticket.number}</a> has been noted <br /> <br /> <div style=\"color:rgb(127, 127, 127)\">Your %{company.name} Team,<br /> %{signature} </div> <hr /> <div style=\"color:rgb(127, 127, 127);font-size:small;text-align:center\"><em>You can view the support request progress <a href=\"%%7Brecipient.ticket_link%7D\">online here</a></em> </div>', NULL, '2025-11-29 04:12:35', '2025-11-29 04:12:35'),
(4, 1, 'ticket.notice', '%{ticket.subject} [#%{ticket.number}]', '<h3><strong>Dear %{recipient.name.first},</strong></h3> Our customer care team has created a ticket, <a href=\"%%7Brecipient.ticket_link%7D\">#%{ticket.number}</a> on your behalf, with the following details and summary: <br /> <br /> Topic: <strong>%{ticket.topic.name}</strong> <br /> Subject: <strong>%{ticket.subject}</strong> <br /> <br /> %{message} <br /> <br /> %{response} <br /> <br /> If need be, a representative will follow-up with you as soon as possible. You can also <a href=\"%%7Brecipient.ticket_link%7D\">view this ticket\'s progress online</a>. <br /> <br /> <div style=\"color:rgb(127, 127, 127)\">Your %{company.name} Team,<br /> %{signature}</div> <hr /> <div style=\"color:rgb(127, 127, 127);font-size:small\"><em>If you wish to provide additional comments or information regarding the issue, please reply to this email or <a href=\"%%7Brecipient.ticket_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login to your account</span></a> for a complete archive of your support requests.</em></div>', NULL, '2025-11-29 04:12:35', '2025-11-29 04:12:35'),
(5, 1, 'ticket.overlimit', 'Open Tickets Limit Reached', '<h3><strong>Dear %{ticket.name.first},</strong></h3> You have reached the maximum number of open tickets allowed. To be able to open another ticket, one of your pending tickets must be closed. To update or add comments to an open ticket simply <a href=\"%%7Burl%7D/tickets.php?e=%%7Bticket.email%7D\">login to our helpdesk</a>. <br /> <br /> Thank you,<br /> Support Ticket System', NULL, '2025-11-29 04:12:35', '2025-11-29 04:12:35'),
(6, 1, 'ticket.reply', 'Re: %{ticket.subject} [#%{ticket.number}]', '<h3><strong>Dear %{recipient.name.first},</strong></h3> %{response} <br /> <br /> <div style=\"color:rgb(127, 127, 127)\">Your %{company.name} Team,<br /> %{signature} </div> <hr /> <div style=\"color:rgb(127, 127, 127);font-size:small;text-align:center\"><em>We hope this response has sufficiently answered your questions. If not, please do not send another email. Instead, reply to this email or <a href=\"%%7Brecipient.ticket_link%7D\" style=\"color:rgb(84, 141, 212)\">login to your account</a> for a complete archive of all your support requests and responses.</em></div>', NULL, '2025-11-29 04:12:35', '2025-11-29 04:12:35'),
(7, 1, 'ticket.activity.notice', 'Re: %{ticket.subject} [#%{ticket.number}]', '<h3><strong>Dear %{recipient.name.first},</strong></h3> <div><em>%{poster.name}</em> just logged a message to a ticket in which you participate. </div> <br /> %{message} <br /> <br /> <hr /> <div style=\"color:rgb(127, 127, 127);font-size:small;text-align:center\"><em>You\'re getting this email because you are a collaborator on ticket <a href=\"%%7Brecipient.ticket_link%7D\" style=\"color:rgb(84, 141, 212)\">#%{ticket.number}</a>. To participate, simply reply to this email or <a href=\"%%7Brecipient.ticket_link%7D\" style=\"color:rgb(84, 141, 212)\">click here</a> for a complete archive of the ticket thread.</em> </div>', NULL, '2025-11-29 04:12:35', '2025-11-29 04:12:35'),
(8, 1, 'ticket.alert', 'New Ticket Alert', '<h2>Hi %{recipient.name},</h2> New ticket #%{ticket.number} created <br /> <br /> <table><tbody><tr><td><strong>From</strong>: </td> <td>%{ticket.name} &lt;%{ticket.email}&gt; </td> </tr> <tr><td><strong>Department</strong>: </td> <td>%{ticket.dept.name} </td> </tr> </tbody> </table> <br /> %{message} <br /> <br /> <hr /> <div>To view or respond to the ticket, please <a href=\"%%7Bticket.staff_link%7D\">login</a> to the support ticket system</div> <em style=\"font-size:small\">Your friendly Customer Support System</em> <br /> <a href=\"https://osticket.com/\"><img width=\"126\" height=\"19\" style=\"width:126px\" alt=\"Powered By osTicket\" src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" /></a>', NULL, '2025-11-29 04:12:35', '2025-11-29 04:12:35'),
(9, 1, 'message.alert', 'New Message Alert', '<h3><strong>Hi %{recipient.name},</strong></h3> New message appended to ticket <a href=\"%%7Bticket.staff_link%7D\">#%{ticket.number}</a> <br /> <br /> <table><tbody><tr><td><strong>From</strong>: </td> <td>%{poster.name} &lt;%{ticket.email}&gt; </td> </tr> <tr><td><strong>Department</strong>: </td> <td>%{ticket.dept.name} </td> </tr> </tbody> </table> <br /> %{message} <br /> <br /> <hr /> <div>To view or respond to the ticket, please <a href=\"%%7Bticket.staff_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login</span></a> to the support ticket system</div> <em style=\"color:rgb(127,127,127);font-size:small\">Your friendly Customer Support System</em><br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" alt=\"Powered by osTicket\" width=\"126\" height=\"19\" style=\"width:126px\" />', NULL, '2025-11-29 04:12:35', '2025-11-29 04:12:35'),
(10, 1, 'note.alert', 'New Internal Activity Alert', '<h3><strong>Hi %{recipient.name},</strong></h3> An agent has logged activity on ticket <a href=\"%%7Bticket.staff_link%7D\">#%{ticket.number}</a> <br /> <br /> <table><tbody><tr><td><strong>From</strong>: </td> <td>%{note.poster} </td> </tr> <tr><td><strong>Title</strong>: </td> <td>%{note.title} </td> </tr> </tbody> </table> <br /> %{note.message} <br /> <br /> <hr /> To view/respond to the ticket, please <a href=\"%%7Bticket.staff_link%7D\">login</a> to the support ticket system <br /> <br /> <em style=\"font-size:small\">Your friendly Customer Support System</em> <br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" alt=\"Powered by osTicket\" width=\"126\" height=\"19\" style=\"width:126px\" />', NULL, '2025-11-29 04:12:35', '2025-11-29 04:12:35'),
(11, 1, 'assigned.alert', 'Ticket Assigned to you', '<h3><strong>Hi %{assignee.name.first},</strong></h3> Ticket <a href=\"%%7Bticket.staff_link%7D\">#%{ticket.number}</a> has been assigned to you by %{assigner.name.short} <br /> <br /> <table><tbody><tr><td><strong>From</strong>: </td> <td>%{ticket.name} &lt;%{ticket.email}&gt; </td> </tr> <tr><td><strong>Subject</strong>: </td> <td>%{ticket.subject} </td> </tr> </tbody> </table> <br /> %{comments} <br /> <br /> <hr /> <div>To view/respond to the ticket, please <a href=\"%%7Bticket.staff_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login</span></a> to the support ticket system</div> <em style=\"font-size:small\">Your friendly Customer Support System</em> <br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" alt=\"Powered by osTicket\" width=\"126\" height=\"19\" style=\"width:126px\" />', NULL, '2025-11-29 04:12:35', '2025-11-29 04:12:35'),
(12, 1, 'transfer.alert', 'Ticket #%{ticket.number} transfer - %{ticket.dept.name}', '<h3>Hi %{recipient.name},</h3> Ticket <a href=\"%%7Bticket.staff_link%7D\">#%{ticket.number}</a> has been transferred to the %{ticket.dept.name} department by <strong>%{staff.name.short}</strong> <br /> <br /> <blockquote>%{comments} </blockquote> <hr /> <div>To view or respond to the ticket, please <a href=\"%%7Bticket.staff_link%7D\">login</a> to the support ticket system. </div> <em style=\"font-size:small\">Your friendly Customer Support System</em> <br /> <a href=\"https://osticket.com/\"><img width=\"126\" height=\"19\" alt=\"Powered By osTicket\" style=\"width:126px\" src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" /></a>', NULL, '2025-11-29 04:12:35', '2025-11-29 04:12:35'),
(13, 1, 'ticket.overdue', 'Stale Ticket Alert', '<h3><strong>Hi %{recipient.name}</strong>,</h3> A ticket, <a href=\"%%7Bticket.staff_link%7D\">#%{ticket.number}</a> is seriously overdue. <br /> <br /> We should all work hard to guarantee that all tickets are being addressed in a timely manner. <br /> <br /> Signed,<br /> %{ticket.dept.manager.name} <hr /> <div>To view or respond to the ticket, please <a href=\"%%7Bticket.staff_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login</span></a> to the support ticket system. You\'re receiving this notice because the ticket is assigned directly to you or to a team or department of which you\'re a member.</div> <em style=\"font-size:small\">Your friendly <span style=\"font-size:smaller\">(although with limited patience)</span> Customer Support System</em><br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" height=\"19\" alt=\"Powered by osTicket\" width=\"126\" style=\"width:126px\" />', NULL, '2025-11-29 04:12:35', '2025-11-29 04:12:35'),
(14, 1, 'task.alert', 'New Task Alert', '<h2>Hi %{recipient.name},</h2> New task <a href=\"%%7Btask.staff_link%7D\">#%{task.number}</a> created <br /> <br /> <table><tbody><tr><td><strong>Department</strong>: </td> <td>%{task.dept.name} </td> </tr> </tbody> </table> <br /> %{task.description} <br /> <br /> <hr /> <div>To view or respond to the task, please <a href=\"%%7Btask.staff_link%7D\">login</a> to the support system</div> <em style=\"font-size:small\">Your friendly Customer Support System</em> <br /> <a href=\"https://osticket.com/\"><img width=\"126\" height=\"19\" style=\"width:126px\" alt=\"Powered By osTicket\" src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" /></a>', NULL, '2025-11-29 04:12:35', '2025-11-29 04:12:35'),
(15, 1, 'task.activity.notice', 'Re: %{task.title} [#%{task.number}]', '<h3><strong>Dear %{recipient.name.first},</strong></h3> <div><em>%{poster.name}</em> just logged a message to a task in which you participate. </div> <br /> %{message} <br /> <br /> <hr /> <div style=\"color:rgb(127, 127, 127);font-size:small;text-align:center\"><em>You\'re getting this email because you are a collaborator on task #%{task.number}. To participate, simply reply to this email.</em> </div>', NULL, '2025-11-29 04:12:35', '2025-11-29 04:12:35'),
(16, 1, 'task.activity.alert', 'Task Activity [#%{task.number}] - %{activity.title}', '<h3><strong>Hi %{recipient.name},</strong></h3> Task <a href=\"%%7Btask.staff_link%7D\">#%{task.number}</a> updated: %{activity.description} <br /> <br /> %{message} <br /> <br /> <hr /> <div>To view or respond to the task, please <a href=\"%%7Btask.staff_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login</span></a> to the support system</div> <em style=\"color:rgb(127,127,127);font-size:small\">Your friendly Customer Support System</em><br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" alt=\"Powered by osTicket\" width=\"126\" height=\"19\" style=\"width:126px\" />', NULL, '2025-11-29 04:12:35', '2025-11-29 04:12:35'),
(17, 1, 'task.assignment.alert', 'Task Assigned to you', '<h3><strong>Hi %{assignee.name.first},</strong></h3> Task <a href=\"%%7Btask.staff_link%7D\">#%{task.number}</a> has been assigned to you by %{assigner.name.short} <br /> <br /> %{comments} <br /> <br /> <hr /> <div>To view/respond to the task, please <a href=\"%%7Btask.staff_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login</span></a> to the support system</div> <em style=\"font-size:small\">Your friendly Customer Support System</em> <br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" alt=\"Powered by osTicket\" width=\"126\" height=\"19\" style=\"width:126px\" />', NULL, '2025-11-29 04:12:35', '2025-11-29 04:12:35'),
(18, 1, 'task.transfer.alert', 'Task #%{task.number} transfer - %{task.dept.name}', '<h3>Hi %{recipient.name},</h3> Task <a href=\"%%7Btask.staff_link%7D\">#%{task.number}</a> has been transferred to the %{task.dept.name} department by <strong>%{staff.name.short}</strong> <br /> <br /> <blockquote>%{comments} </blockquote> <hr /> <div>To view or respond to the task, please <a href=\"%%7Btask.staff_link%7D\">login</a> to the support system. </div> <em style=\"font-size:small\">Your friendly Customer Support System</em> <br /> <a href=\"https://osticket.com/\"><img width=\"126\" height=\"19\" alt=\"Powered By osTicket\" style=\"width:126px\" src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" /></a>', NULL, '2025-11-29 04:12:35', '2025-11-29 04:12:35'),
(19, 1, 'task.overdue.alert', 'Stale Task Alert', '<h3><strong>Hi %{recipient.name}</strong>,</h3> A task, <a href=\"%%7Btask.staff_link%7D\">#%{task.number}</a> is seriously overdue. <br /> <br /> We should all work hard to guarantee that all tasks are being addressed in a timely manner. <br /> <br /> Signed,<br /> %{task.dept.manager.name} <hr /> <div>To view or respond to the task, please <a href=\"%%7Btask.staff_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login</span></a> to the support system. You\'re receiving this notice because the task is assigned directly to you or to a team or department of which you\'re a member.</div> <em style=\"font-size:small\">Your friendly <span style=\"font-size:smaller\">(although with limited patience)</span> Customer Support System</em><br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" height=\"19\" alt=\"Powered by osTicket\" width=\"126\" style=\"width:126px\" />', NULL, '2025-11-29 04:12:35', '2025-11-29 04:12:35');

-- --------------------------------------------------------

--
-- Table structure for table `ost_email_template_group`
--

DROP TABLE IF EXISTS `ost_email_template_group`;
CREATE TABLE `ost_email_template_group` (
  `tpl_id` int(11) NOT NULL,
  `isactive` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL DEFAULT '',
  `lang` varchar(16) NOT NULL DEFAULT 'en_US',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost_email_template_group`
--

TRUNCATE TABLE `ost_email_template_group`;
--
-- Dumping data for table `ost_email_template_group`
--

INSERT INTO `ost_email_template_group` (`tpl_id`, `isactive`, `name`, `lang`, `notes`, `created`, `updated`) VALUES
(1, 1, 'osTicket Default Template (HTML)', 'en_US', 'Default osTicket templates', '2025-11-29 04:12:35', '2025-11-29 12:12:35');

-- --------------------------------------------------------

--
-- Table structure for table `ost_event`
--

DROP TABLE IF EXISTS `ost_event`;
CREATE TABLE `ost_event` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(60) NOT NULL,
  `description` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost_event`
--

TRUNCATE TABLE `ost_event`;
--
-- Dumping data for table `ost_event`
--

INSERT INTO `ost_event` (`id`, `name`, `description`) VALUES
(1, 'created', NULL),
(2, 'closed', NULL),
(3, 'reopened', NULL),
(4, 'assigned', NULL),
(5, 'released', NULL),
(6, 'transferred', NULL),
(7, 'referred', NULL),
(8, 'overdue', NULL),
(9, 'edited', NULL),
(10, 'viewed', NULL),
(11, 'error', NULL),
(12, 'collab', NULL),
(13, 'resent', NULL),
(14, 'deleted', NULL),
(15, 'merged', NULL),
(16, 'unlinked', NULL),
(17, 'linked', NULL),
(18, 'login', NULL),
(19, 'logout', NULL),
(20, 'message', NULL),
(21, 'note', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ost_faq`
--

DROP TABLE IF EXISTS `ost_faq`;
CREATE TABLE `ost_faq` (
  `faq_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `ispublished` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `question` varchar(255) NOT NULL,
  `answer` text NOT NULL,
  `keywords` tinytext,
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost_faq`
--

TRUNCATE TABLE `ost_faq`;
--
-- Dumping data for table `ost_faq`
--

INSERT INTO `ost_faq` (`faq_id`, `category_id`, `ispublished`, `question`, `answer`, `keywords`, `notes`, `created`, `updated`) VALUES
(1, 1, 1, 'Password Change', '<p>There is no password update necessary, the system uses the OTP(one time password) method. There are no passwords to store, they cannot be hacked or compromised and there is no forgetting passwords and needing to change them every so often for security reasons. Once you log in to the system using the code that is sent to you, that code is no longer active and cannot be used again. Unless your email gets compromised, there is no way for this method to be hacked.</p>', ' ', NULL, '2026-04-06 04:36:37', '2026-04-06 04:42:49'),
(2, 2, 1, 'Does DeskFlow offer Technical Support', '<p>Yes.</p> <p><strong>DeskFlow</strong>, <strong>TeamFlow </strong>and <strong>CallFlow </strong>all have technical support services available. However, the method of contacting the support staff depends on the service tier for your enterprise. Phone  and priority support is available only for the Scale tier. Priority email and chat support is available for the Growth plan. The Starter plan has email support, only. There is no SLA for email support when on the Starter plan.</p>', ' ', NULL, '2026-04-06 04:51:54', '2026-04-06 04:52:12'),
(3, 2, 1, 'What Browser Does gapShop Recommend?', '<p><strong>gapShop</strong>, and all applications, function properly on any compliant browser. Any of the major brands will work properly on the platform. However, we do have a preference, it is <strong>Vivaldi</strong>.</p> <p>At Vivaldi, they \"Respect Your Privacy\", it is a fast and feature rich browser that is also highly secure.</p> <p>For a straight comparison of the 2 major browsers and Vivaldi, see the link here:</p> <p><a href=\"https://www.alphr.com/chrome-vs-edge-vs-firefox-vs-vivaldi/\">Chrome vs. Edge vs. Firefox vs. Vivaldi: Which Browser Is Better?</a></p> <p>For more information on Vivaldi:</p> <p><a href=\"https://vivaldi.com\">https://vivaldi.com</a></p> <p>Although most of us use a web browser for email, if you prefer to use an email client for your daily email chores, Vivaldi also offer an application for this purpose, look for it out on their website.</p> ', ' ', NULL, '2026-04-06 05:08:43', '2026-04-06 05:08:47');

-- --------------------------------------------------------

--
-- Table structure for table `ost_faq_category`
--

DROP TABLE IF EXISTS `ost_faq_category`;
CREATE TABLE `ost_faq_category` (
  `category_id` int(10) UNSIGNED NOT NULL,
  `category_pid` int(10) UNSIGNED DEFAULT NULL,
  `ispublic` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(125) DEFAULT NULL,
  `description` text NOT NULL,
  `notes` tinytext NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost_faq_category`
--

TRUNCATE TABLE `ost_faq_category`;
--
-- Dumping data for table `ost_faq_category`
--

INSERT INTO `ost_faq_category` (`category_id`, `category_pid`, `ispublic`, `name`, `description`, `notes`, `created`, `updated`) VALUES
(1, NULL, 1, 'How To\'s', '<p>This category will have all the guides to help you through many of the features of the application, how to enable it and use it to the benefit of the enterprise.</p>', '', '2026-04-06 04:31:53', '2026-04-06 04:33:59'),
(2, NULL, 1, 'Frequently Asked Questions(FAQ\'s)', '<p>Visit this category for answers to the most frequently asked questions. If you cannot find your answer there, please fee free to put in a request to the helpdesk, we will respond as soon as possible.</p>', '', '2026-04-06 04:47:45', '2026-04-06 04:47:45');

-- --------------------------------------------------------

--
-- Table structure for table `ost_faq_topic`
--

DROP TABLE IF EXISTS `ost_faq_topic`;
CREATE TABLE `ost_faq_topic` (
  `faq_id` int(10) UNSIGNED NOT NULL,
  `topic_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost_faq_topic`
--

TRUNCATE TABLE `ost_faq_topic`;
-- --------------------------------------------------------

--
-- Table structure for table `ost_file`
--

DROP TABLE IF EXISTS `ost_file`;
CREATE TABLE `ost_file` (
  `id` int(11) NOT NULL,
  `ft` char(1) NOT NULL DEFAULT 'T',
  `bk` char(1) NOT NULL DEFAULT 'D',
  `type` varchar(255) CHARACTER SET ascii NOT NULL DEFAULT '',
  `size` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `key` varchar(86) CHARACTER SET ascii NOT NULL,
  `signature` varchar(86) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `attrs` varchar(255) DEFAULT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost_file`
--

TRUNCATE TABLE `ost_file`;
--
-- Dumping data for table `ost_file`
--

INSERT INTO `ost_file` (`id`, `ft`, `bk`, `type`, `size`, `key`, `signature`, `name`, `attrs`, `created`) VALUES
(1, 'T', 'D', 'image/png', 9452, 'b56944cb4722cc5cda9d1e23a3ea7fbc', 'gjMyblHhAxCQvzLfPBW3EjMUY1AmQQmz', 'powered-by-osticket.png', NULL, '2025-11-29 04:12:34'),
(2, 'T', 'D', 'text/plain', 24, 'eY2tIMWtx86n3ccfeGGNagoRoTDtol7o', 'MWtx86n3ccfeGGNafaacpitTxmJ4h3Ls', 'osTicket.txt', NULL, '2025-11-29 04:12:35'),
(3, 'L', 'D', 'image/png', 41560, 'qJNjD4Xt9e9l6xmKhsg6elzJxY12iK1k', '4Xt9e9l6xmKhsg6ecUR7qHRdRi3q5B7J', 'gapShopwebplogo.png', NULL, '2025-11-29 06:32:18');

-- --------------------------------------------------------

--
-- Table structure for table `ost_file_chunk`
--

DROP TABLE IF EXISTS `ost_file_chunk`;
CREATE TABLE `ost_file_chunk` (
  `file_id` int(11) NOT NULL,
  `chunk_id` int(11) NOT NULL,
  `filedata` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost_file_chunk`
--

TRUNCATE TABLE `ost_file_chunk`;
--
-- Dumping data for table `ost_file_chunk`
--

INSERT INTO `ost_file_chunk` (`file_id`, `chunk_id`, `filedata`) VALUES
(1, 0, 0x89504e470d0a1a0a0000000d49484452000000da0000002808060000009847e4c900000a43694343504943432070726f66696c65000078da9d53775893f7163edff7650f5642d8f0b1976c81002223ac08c81059a21092006184101240c585880a561415119c4855c482d50a489d88e2a028b867418a885a8b555c38ee1fdca7b57d7aefededfbd7fbbce79ce7fcce79cf0f8011122691e6a26a003952853c3ad81f8f4f48c4c9bd80021548e0042010e6cbc26705c50000f00379787e74b03ffc01af6f00020070d52e2412c7e1ff83ba50265700209100e02212e70b01905200c82e54c81400c81800b053b3640a009400006c797c422200aa0d00ecf4493e0500d8a993dc1700d8a21ca908008d0100992847240240bb00605581522c02c0c200a0ac40222e04c0ae018059b632470280bd0500768e58900f4060008099422ccc0020380200431e13cd03204c03a030d2bfe0a95f7085b8480100c0cb95cd974bd23314b895d01a77f2f0e0e221e2c26cb142611729106609e4229c979b231348e7034cce0c00001af9d1c1fe383f90e7e6e4e1e666e76ceff4c5a2fe6bf06f223e21f1dffebc8c020400104ecfefda5fe5e5d60370c701b075bf6ba95b00da560068dff95d33db09a05a0ad07af98b7938fc401e9ea150c83c1d1c0a0b0bed2562a1bd30e38b3eff33e16fe08b7ef6fc401efedb7af000719a4099adc0a383fd71616e76ae528ee7cb0442316ef7e723fec7857ffd8e29d1e234b15c2c158af15889b850224dc779b952914421c995e212e97f32f11f96fd0993770d00ac864fc04eb607b5cb6cc07eee01028b0e58d27600407ef32d8c1a0b91001067343279f7000093bff98f402b0100cd97a4e30000bce8185ca894174cc608000044a0812ab041070cc114acc00e9cc11dbcc01702610644400c24c03c104206e4801c0aa11896411954c03ad804b5b0031aa0119ae110b4c131380de7e0125c81eb70170660189ec218bc86090441c8081361213a8811628ed822ce0817998e04226148349280a420e988145122c5c872a402a9426a915d4823f22d7214398d5c40fa90dbc820328afc8abc47319481b25103d4027540b9a81f1a8ac6a073d174340f5d8096a26bd11ab41e3d80b6a2a7d14be87574007d8a8e6380d1310e668cd9615c8c87456089581a26c71663e55835568f35631d583776151bc09e61ef0824028b8013ec085e8410c26c82909047584c5843a825ec23b412ba085709838431c2272293a84fb4257a12f9c478623ab1905846ac26ee211e219e255e270e135f9348240ec992e44e0a21259032490b496b48db482da453a43ed210699c4c26eb906dc9dee408b280ac209791b7900f904f92fbc9c3e4b7143ac588e24c09a22452a494124a35653fe504a59f324299a0aa51cda99ed408aa883a9f5a496da076502f5387a91334759a25cd9b1643cba42da3d5d09a696769f7682fe974ba09dd831e4597d097d26be807e9e7e983f4770c0d860d83c7486228196b197b19a718b7192f994ca605d39799c85430d7321b9967980f986f55582af62a7c1591ca12953a9556957e95e7aa545573553fd579aa0b54ab550fab5e567da64655b350e3a909d416abd5a91d55bba936aece5277528f50cf515fa3be5ffd82fa630db2868546a08648a35463b7c6198d2116c63265f15842d6725603eb2c6b984d625bb2f9ec4c7605fb1b762f7b4c534373aa66ac6691669de671cd010ec6b1e0f039d99c4ace21ce0dce7b2d032d3f2db1d66aad66ad7ead37da7adabeda62ed72ed16edebdaef75709d409d2c9df53a6d3af77509ba36ba51ba85badb75cfea3ed363eb79e909f5caf50ee9ddd147f56df4a3f517eaefd6efd11f373034083690196c313863f0cc9063e86b9869b8d1f084e1a811cb68ba91c468a3d149a327b826ee8767e33578173e66ac6f1c62ac34de65dc6b3c61626932dba4c4a4c5e4be29cd946b9a66bad1b4d374ccccc82cdcacd8acc9ec8e39d59c6b9e61bed9bcdbfc8d85a5459cc54a8b368bc796da967ccb05964d96f7ac98563e567956f556d7ac49d65ceb2ceb6dd6576c501b579b0c9b3a9bcbb6a8ad9badc4769b6ddf14e2148f29d229f5536eda31ecfcec0aec9aec06ed39f661f625f66df6cf1dcc1c121dd63b743b7c727475cc766c70bceba4e134c3a9c4a9c3e957671b67a1739df33517a64b90cb1297769717536da78aa76e9f7acb95e51aeebad2b5d3f5a39bbb9bdcadd96dd4ddcc3dc57dabfb4d2e9b1bc95dc33def41f4f0f758e271cce39da79ba7c2f390e72f5e765e595efbbd1e4fb39c269ed6306dc8dbc45be0bdcb7b603a3e3d65facee9033ec63e029f7a9f87bea6be22df3dbe237ed67e997e07fc9efb3bfacbfd8ff8bfe179f216f14e056001c101e501bd811a81b3036b031f049904a50735058d05bb062f0c3e15420c090d591f72936fc017f21bf96333dc672c9ad115ca089d155a1bfa30cc264c1ed6118e86cf08df107e6fa6f94ce9ccb60888e0476c88b81f69199917f97d14292a32aa2eea51b453747174f72cd6ace459fb67bd8ef18fa98cb93bdb6ab6727667ac6a6c526c63ec9bb880b8aab8817887f845f1971274132409ed89e4c4d8c43d89e37302e76c9a339ce49a54967463aee5dca2b917e6e9cecb9e773c593559907c3885981297b23fe5832042502f184fe5a76e4d1d13f2849b854f45bea28da251b1b7b84a3c92e69d5695f638dd3b7d43fa68864f4675c633094f522b79911992b923f34d5644d6deaccfd971d92d39949c949ca3520d6996b42bd730b728b74f662b2b930de479e66dca1b9387caf7e423f973f3db156c854cd1a3b452ae500e164c2fa82b785b185b78b848bd485ad433df66feeaf9230b82167cbd90b050b8b0b3d8b87859f1e022bf45bb16238b5317772e315d52ba647869f0d27dcb68cbb296fd50e2585255f26a79dcf28e5283d2a5a5432b82573495a994c9cb6eaef45ab9631561956455ef6a97d55b567f2a17955fac70aca8aef8b046b8e6e2574e5fd57cf5796ddadade4ab7caedeb48eba4eb6eacf759bfaf4abd6a41d5d086f00dad1bf18de51b5f6d4ade74a17a6af58ecdb4cdcacd03356135ed5bccb6acdbf2a136a3f67a9d7f5dcb56fdadabb7bed926dad6bfdd777bf30e831d153bdeef94ecbcb52b78576bbd457df56ed2ee82dd8f1a621bbabfe67eddb847774fc59e8f7ba57b07f645efeb6a746f6cdcafbfbfb2096d52368d1e483a70e59b806fda9bed9a77b5705a2a0ec241e5c127dfa67c7be350e8a1cec3dcc3cddf997fb7f508eb48792bd23abf75ac2da36da03da1bdefe88ca39d1d5e1d47beb7ff7eef31e36375c7358f579ea09d283df1f9e48293e3a764a79e9d4e3f3dd499dc79f74cfc996b5d515dbd6743cf9e3f1774ee4cb75ff7c9f3dee78f5df0bc70f422f762db25b74bad3dae3d477e70fde148af5b6feb65f7cbed573cae74f44deb3bd1efd37ffa6ac0d573d7f8d72e5d9f79bdefc6ec1bb76e26dd1cb825baf5f876f6ed17770aee4cdc5d7a8f78affcbedafdea07fa0fea7fb4feb165c06de0f860c060cfc3590fef0e09879efe94ffd387e1d247cc47d52346238d8f9d1f1f1b0d1abdf264ce93e1a7b2a713cfca7e56ff79eb73abe7dffde2fb4bcf58fcd8f00bf98bcfbfae79a9f372efaba9af3ac723c71fbcce793df1a6fcadcedb7defb8efbadfc7bd1f9928fc40fe50f3d1fa63c7a7d04ff73ee77cfefc2ff784f3fb803925110000001974455874536f6674776172650041646f626520496d616765526561647971c9653c0000032869545874584d4c3a636f6d2e61646f62652e786d7000000000003c3f787061636b657420626567696e3d22efbbbf222069643d2257354d304d7043656869487a7265537a4e54637a6b633964223f3e203c783a786d706d65746120786d6c6e733a783d2261646f62653a6e733a6d6574612f2220783a786d70746b3d2241646f626520584d5020436f726520352e362d633031342037392e3135363739372c20323031342f30382f32302d30393a35333a30322020202020202020223e203c7264663a52444620786d6c6e733a7264663d22687474703a2f2f7777772e77332e6f72672f313939392f30322f32322d7264662d73796e7461782d6e7323223e203c7264663a4465736372697074696f6e207264663a61626f75743d222220786d6c6e733a786d703d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f2220786d6c6e733a786d704d4d3d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f6d6d2f2220786d6c6e733a73745265663d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f73547970652f5265736f75726365526566232220786d703a43726561746f72546f6f6c3d2241646f62652050686f746f73686f70204343203230313420284d6163696e746f7368292220786d704d4d3a496e7374616e636549443d22786d702e6969643a36453243393544454136373331314534424443444446393146414639344441352220786d704d4d3a446f63756d656e7449443d22786d702e6469643a3645324339354446413637333131453442444344444639314641463934444135223e203c786d704d4d3a4465726976656446726f6d2073745265663a696e7374616e636549443d22786d702e6969643a4346413734453446413637313131453442444344444639314641463934444135222073745265663a646f63756d656e7449443d22786d702e6469643a4346413734453530413637313131453442444344444639314641463934444135222f3e203c2f7264663a4465736372697074696f6e3e203c2f7264663a5244463e203c2f783a786d706d6574613e203c3f787061636b657420656e643d2272223f3e8bfef6ca0000170b4944415478daec5d099c53d5d53f2f7b32c9646680617118905d3637d0cfad282aa82d0af6f3b3b62ef52bd6d685ba206eb54a15c1adf6538b52b4d53a564454a42c0565d132a86c82a0ac82ec8b0233ccc24c9297f7dd9bfc6f73e64e92c90c5071ccf9fd0e249397f7eebbf7fccff99f73efbb31860f1f4e593936a4da74d2d8eeef53b17f2f51c4fd5d6b7e4ba19385ee177a9bd0ed8d3e832534dfa4d2351ebafaad3cb2d92cb219cd636c6d59f3ceca11920b849e27f4c742af68f4b7a342f34c5ab8de4d3f9b12a4b0005d7301991447d63ebed7e2125a283457a85d680d22d2be26463405995d8dfeb63f4a4b44241bfa463e5902642d7d518a5a59a065e5bb29ad849e2a7480d0d384b617ea05e024bb89080d093d287495d0e94267093d90c1b9edf85f82b4a2d19451006dc65617ed2bb3538f76618a449b57c76781f6fd908e42af14fabf42bb65f89dde42af12ba4ce848a10bd21c9b23741803f3bb42c709fd6d4657921015003b74c8205f8ed9ec4096cdd19abf7884de2e74210cbf5b13ce2123e05ca1f7e37cc9e45788921c3af703d80d47b3a049b3b739e989d21c2aca8d36cb81c802adf94a6ba15385fe41e87147c04e1e018dbc00399da49b4542ef4d13b97e2d343fed999d16d57ee3a0498b7dd426b779e56559ead8fce504a16f0aed7584cf7b2e72bbbd426b01b8d6691c763f8a97fa1f4c471bb71db4d194b51e6a17c8022d2bdf1d9151e695a30032253ee47c99caef285ecd1c9b92df0aea58e88fc672b3e654d2cf52c7e62d922af6ff96ae2de3d152a1cb8556b1bfcb4249cb3a47ca54cc23fec93569fe1a0f4522061946f31d946c443be65c5fe470befd736aca64f19193f5427f227487d00e427f29f432e477dfc4efcf8abbf76094e6adf4d0a4955e9ab6d14d6e41218de63cac59cb3e86bc9e11a592eda79019f60aab6b74f54de64a7725f9bb9c3c2eff0fddc2c342bf04555c47f142493f11e7a6935d00cc6fc6d0f4e55e07fdf4a502ba654690262ef791d76191c76135efb1cd9af7b123d2a36f3e14a4903d4c5eabd1fe5d468e9edadf4a854e04008347b9f9e385be56871afaa22171232119c50e96dbe9c036173d58eaa7399b5c541532c8efb2a87bab08990263d1e68db32cd08e297a61086bb36cb4fa4031f5cfdf127b9da104845ea3fd4d4694a1145f62d5e62837fd39a1a312ad11912b274aabd67b68f1976eea901fa1055b5cf468690eb5f34763343127271eb14debfb31b68eb3cf3e3b6be1c7904c9bbf8cdedcdd8bfab7d824dc7cc67ef02c8a97dd95940178df20b66c10dae22834572ed31a416ad58808c2729de2e37372c914579db5c94d0b05d00c579472dd227ab5689eab3eb211ed3b99a75994e7aa8a17452c8f30de8c5cbe5c31ef62ef1f12ba04afe522e12784be91c178cbfcea75d04c59ccc8a37839df29b412f95e5b009b50f45856e70c820e4e58e1a5cdbb9d542822598fb689758bdf57906581760c8add885255d843353541f2d84399d04759363f91bdff40e8abda316b8456537c82399dc849ee0758cae8a3c42a907244ca2280f64ca18384ce8e013d2a401834e9ab3d4eca775a146a19891539be2570c9f6ca2561edf17e8fd079420f6581969598f8edb5b4a2a20d95ecec4bc33b7f4854eb6fe82b8329be1e51c95f11c5b874a1d4eb1489196349ec559ec8b142229456daaac856673e4cca761457a653e2319b7cf258bbb6ee70d1b0c979b4eda09d5a78a37252ad1dc527b723a0b029fd0bc5579a48aa5b20d48df6ca08bab109dd2823f23d4207328afb43a1dbb240cb4a4c2c11481c24cbddb528f11b149f074e29329aa9b027170fbf9be498ae1ab5d42f2acff027725a9f4b44dcfb561e9d2828dfd567098c1db2c59b107b80c650935d6159c720b96adf8a3d42b39d0a22347e6e80566e7752f7b691588e46f155ff72517315ce904a64e4dc041a7abef437147f22e079a13765a963568e8a14b8aae9fdbddde8e4e00eea259442fe5460cb038553f24fd03b5d4e4e79b15819de7a37e2b61e731cb4d17df302f4e4877e6a2fa8dfac0d6eaa0e1bb4b7d246c37ad7d0c80b2a880ec46696db89e6b48c3529d7dc459ee8a1454b7cf4d66a0f15b73415c808f91c01340d492ef2c2969478b6cddbc42e8c6ac0361b88a8474a8e475ff786d39891055a7a31601c4e78e3508ae33c38a6065efec82418369376d40468555911f50aec8d47b6e4f36a72deac2f5eef448ea58ba461dd539aa3db9a496dc2b74c9c951b1afb5e20669d9d5acb0286413336ba636b0f0f08a0e57b2c1a39a052dcb14057b55125a0b05ae464f3b7d718e3576df6866f9e9627724b8a1dc74af68af65530c33759dea7447e26172aaf07d8f2d1ff9587317effe985263d50483a09efc76581d6b0c8817e01b98f7cd46434c59f3ae6d287e2eb0adbe3987b8ed4c5a30254c7b92b68b22cf38b88d6397777aacd7ae4fc5800afbf04fdd2e5062d874b80cc4e2f52dbf0cdcfcccc0ddd332d488581682b9f61150b70796d762bd2ca67c9a7a537b7f24523f3b63ae9ea92022ab9f28004db12ea5a3b78f906d7ce817715c92a89af4b71a83857e05180cc0580c8b63c04f07b589e269dd2a39478505452cf3b50c49120fc239c979b9ab225c2b727ed19c8482fbc648196a22641f179a90ef83f999517a0b2e54c6ac8870b36e1903d22b2391ca174391a5fa8bb32491e24dbf500e94bed2cda2d22d96801b2179ef9672eddfe76b0b038dfbcc9618b3da8d99e5d4d562a17442d7ab263303a7ff27a3779dfc9a347cfaf282f793dbf7cd2a75e5bb9d3bab66361e41671813ed1ba516a8bd0c729be624497afd96b79839f4a40e3fdd66398e5a44b96b7a1a0a36c657f16680d4b84d1c50329a8e341786e19fd761f8d46380d934ab69d4277772a25476c5ecd96cc8b2af944fb4c56dcfe86aa20972951d378c0e631d74e1054f1376fe69dd12edf7cce65a753a256ec3e5e84d1c8fce807422f911a8ed2bdc707cd715345def6c53e3b2ddeee143431fa74aff6a111a66944c5e7938d3855947d271fd11922f44f42cf107a9d9623f19ccdc5de77a2f8960b76383bb984ec1f49ba463ec83a18d4b91011b312e3b080e24f103444e5e5b3729782d606e18cc653dd6df22ea6f814462125a638e48a9b49ac827922faba9386a78be18465db2a1c48e04e45c366a3027435c5e74b1623c1ae4c929b0c42e2e7c54517c13311e3d936500895a0cbfd248a1156373203f6e33b1edce81e50221931fac393c8b9a0f9e0f2c40ca115dab91e83d4055c7913a8d520e42816aa72ff22aa57b23e139d9583aadd7a16fa53f17d1b8b14ea7c3f419fc8364ea3f88a0c79ce8b700e3948ab9200a2ad8a1ec436c2310c8b361fcaa750d41e075a7d69cd220fa78db2523706c512259206de4fdee8c48dfbedd18b1f6b4355216a2f403631e0b27a09ca27f3895b847ea5e577d7a3fa375600715fae2bf67dea986f5e651834221436b6898ebdc2a80ff47384fe1db6f421c5d75c72e2ca6b9e4a4e02ad54f29724409351f74eaabfae53c9f9a0a5e9e6cc241b795a285f16f53aeb7be9c0e4130757012c94a40db7012f8310b975b9041a73d60e7886e7d1b07168e80fd817e682e7abd02e9fde7d099e8a8b1cec6728be625b1ad673f04c37e3fc5246a1e42baf251fa128c1df47c33822f03412a47281ea29da3556c218168236498fd91946f50d3aef200658523e39b1da513b4729dab412efefa6f813c05e96d34cc8b052c6238bccd32e637f1b05e02fc2a0f5c0352f64d4497a6639b92ce79be6087d4f672b3e7b38be06b2be7871ef2aeaeec06bb9825edf5a6035a2ca72b975c0dc751efabacaa016bee81d22924990cd455b7507548b5cb50ad1718cc8df66e5ba2de90ccfb5e2cdba2f49342538b47b30c63722572b6ba01fab01bc54858c47615fe9641302433ab6f6a80632d9c6e1b8df7600dd59ecf3b5c82dbba3df7bc0b6fa30c79f4eec3656fdf1c2e0fb2131fd9a798817019a020040814c469979e8401f3af63a78e6103aac2f2b459fc3ae752e5e0710663d300809b25718c85622628510a64bd01935ac3347a0ed8468741e0cb823c02bc1f5193e3f0bf7e0c7bd3d82f698308e7d309ece1974a0c9bcd710b4750dfe5688b6ca39ac298c6674d1bc7e3bbc9e579f395874c874c68a23290a364578fd3972a2f3e138b8bc1feb5f4b80cc1fa5671704e80e919715e644fb8a9cec06ac9abf2b09c8b8bc0a1b90ece15aadf4fe759aef2d40df47f0dd4ccaf2a9a2dd4d1ac8c2601fd2f15e4ef10d825e461008a5c8ab09c7ddc8decf60202314b8ce624ce54644da7e9478d68e40379f84d31f053ac9dbfe216cf23119c06c1a979527fe394070298b6203e1010650624ee65550aef371ace2acf701040bf1fe7480e838189d92229627aa0d5c2621c2aa05b2b7e3264f4747d78262de0b6e1d66605d0bca3012e7e8064e3d1c6d3f9112cf6bf5c2ebdb1958ef46243f1714b5b1320614fc62500a15b106c1d89570b6309819eb7bf5124541196f68bf8c7caeea64f9591eebb7452cc7716a51659830d7ed5460d2cb4b7c3462662e15e444c9668bf5878cda6fb3e89e4ed444f87fc381aad2fd3d6c2c75d98131b95ca3a48d957614df558b8bbcee50b09a77c042ae475ffb293117a700bb034e9f6fa9b00481a196a51043d8e712c47fc6e726d281fbd8e79781cd3c0150717eff36aaaeb29d636d5a989ec0e6623ec609945c04a35586f104a302ff82272018f879f83e21dcb646bee447b42c0705cd47e408b2ca4d4f16c966200fca017551e7ec0bc0d5e0fd6e78aaa9888aaa48f019724c173cdc348a3f662fe517a07152a683ea124acabf078dc9a41225650522a389c8328e1d73211cd6a78c21a81caf27f37ecbeb700d234a65110fe5b92b523d759dcbfa6d03a35e4abe821155927ca8b2ca46ef6f709343bcf60bfa28685f6f16493399cc5d0e70754234fb2bae712ea2d6431897028db6495bd9494d9b6754116d288bfc0446f287469c672f22ea5896b7ae41fff05d99af003323b0a82949ce3507e3ad72d801acc063d3a87dcaaae347dafb8540a90340511bbe7c00bac2450128884e919ee57794d8cca5150cfe7544ce4b0096fe68d42ae459aa43a5112e8331dbe0557258343c9e79a2c5cc903bb2c8f95f42bf40874431707e166d78de56cbdeaf03e8bb6708b4355a65f22b78d0e3e048b602cc27c3500d44e9beac9feb806c77ad9ffa04f6500719cdcc64f978ec3e5d68f716fcad428bb09bd50f47bcbed447afadf052b7c2887cc8d260fd9ce98f51ec8113ea0276f011a2dbd3a0c00f42bf86432c45eeb688524ff8672a03b5f72f36f2fb39a070aa382103c4ad8ce613ec94afa07122425a0c3435781d4832c5a2072d473aa09949383325a9bed524f1827c998b1b615919db190015013c1edcb4a45abd19c857b39bd80f301bec26aad1e6cf61546ecde055b9d8c3a2d35a749a9d1213a6657008aa1ad8d4690e2345bf998c46a836ce06fde90c2adb07ed5c0be7f36f17bead26482709903dd06336b96d2210c4b636a85710e9c61cdc4a561451530f712aeab2a862a793a62cf3519ba0a99e64b6b17bce34d2f07b72b2b11c08ca7521c6b21fe8d71046a16ea3a62de8b592cc17963761aeed4cadb89183ea376940e37b509e4ce996ae252490c206281dd0f42771fbb063b6800214c31b77609e946040f90c8835180809b40b1065f6c0b0d4e31a97b2c8f239c01566d5a3a19a975625f508aeafa2939d4d2896c3abfa71ce61f0faea7307bedf17f75180e8a8775ecb0c9377d20a1c525a30c7b28b45cd4fe0746e60c587c5e897b86559063dde6d2e15f9f7922706325faafd434e60c6ae8a2821966bc7fb4dd0c48dfb1d34759d9bba251ebc3429b18f48a65b1cf8d02f11aa3b191b01f5fd107d5c8cfe389b152ae458fc8cd4063d4d77680d1a740ad1135c2722dc0ac684ec5a7e1b4d33b513812d39d938da523889a41f0e67865f4075574e7fc0e634bab2ea939acfb99b356235cbf3545e520c63530f10560268a762e03e62002318e48fd8353aa12cfb77cc6354a7a8506d619dd70ff9a2fabc27a620fe0f45096530c35815d48e42498b46785c791dbe95c055ecf522ad38a1728e1fe3f55bfc8445de723a217f0b051d358864494196c768ed275a345774b0b681b6af67ce3413e986b2f676e43cc751fd5d882df4ff5c140706e2d8412812351560116d0e2caf09e79a8cc2899256a81afa5864afd12aa6e750628ef53ca61742252bfb23632e562aa0e911ed14508e1994982c56d59979283a8c00b04623227c4675378699c1aa6c2b0028bf96b4efc580f462f3149fb282cc6078da975052fd1237d59d150f2a29f92e5e5528e85c8ece9c8af73b0186b6e884ab50d0990083790305971e1ac01b0299eac7f1e8fc001c886acb1bec3899a7fd1ac704d01f1ff393dedd7901d9648551e665a99fae1e0c5af309c6454fc0b7fddb68c206752988d0d0eeb5b468bb33b6210e9b5b5355c427a8e15f8c198871fc1ba2f5c7282efd94524f0eaf42d1621cf2ba579b18d1b668efafd48b470dc84e14abd6c0299eceeee90e7c56a61546fc68ffc126445deef4ea453413206b8f12797f366877e2f517a03ddfe0c43f44a9bd279bb3b99575fc622de1547310fb984795b29479ad7988ac07603897a20cdf1dc73c850a612b56c20d68f73209f31f11789aab31d7d1964d41bc817997296cde6b24b8fcb3ac1c1d4891c3799937fc1cfd740da2956acb48f4012f362dd34ac075263c7d22a251c4956e407bb36af04b1ab52e60112d4eb1420605da86e99ad3ab687fb54d2f5e95829d5cdf80111531765302c32f474a509421bd360f23a2bda339b611193a4362fdb10bf6f080e6181e44c48d52dd5fcc398df886430d8bfe53555d5345343bbcf218d0421faa6faf22a228f907f8f7507829278ce503ccb570cab20f03d409de9dd39c7b01885012ef340509fee5302c17403a15d14c958d7f815c6a13d55ff0f96718f930388230ee63068b2221dceb2c783737aef11a0a149df09d64fb227e8168e083e793e7ba19f9de7e50953949b8fd2c4653e7d43b6b6d4046323f0a25fb357a7c3afab83568d044eddb43d87447c254455493e57d2dfecb717a1ce77b0aa5fb6949eeb31051bf330cfe23e6cc6474fe2dc621d91c4457440cd223772365261cb09a1af1c0514e44fb7781950c80dd946aed71b2a2d47b70a4a318061e076b9b08a7a3162bdc8f7b180f675a0bc7ab72d0a56c0cabc122fc6c8e6d246cdb702449123f8031bb603cc9f8cb3a2493ea07ec4269e6629642939d635d9acedd806b38718db0768d43946492579315e87855de0f27b91f799ebfc0a118aca0f05192e90e2e07883d6f0419858133b581568598202596fe7c46f5d73d8a56ca072bad9e18248b45275e391b4ff5374bed01cf4cf51c83e8bdb25a1b850e19e4c8abb349ce3478f88761b0cfc24195e13ecec4679dd08fb7b3b3be00605f0b631c073a1ac1980d46b42844e49d7e184033d1b73329b1be533ab8df205f3f08f0b580935ca84d29e8b4ee1938d67e782f03c6efc1c64621d5506ee97f702f07d8bde502d8250c685b70dd8b5865732cdabec491a20a6965904cd311981fc9440ef7814a4b4b728fd675944198294ac0772202f664b4b1fef2a5785eb618cce257c8fb0a700fd310c9e624b9c60044f728a22d8b5d069d5d14a2d33a86686bb99de76984fc6433febf15aa8ff12bf0ee3bd8df556efe340a4bc9b650280350c768fdebd70a3b5e061ebbc6b2942c075d7c9e018458becbabb105547709569ec6de760004bc10750baabf8fe0be9e625328c114d5d9965a3f3d0c6718607892dad1a135c04d59391a92835c53816c33a8653a59096ae6426ea976a14a3597730306fb7ad27f9d53d0c62e27d4d2259b6a68cc9c80005a3d5ff01aa2f3a598f66801606f06655b9ae2bacb29f123f132a76907b0ec039d9f4dc937d7998e625618f7f515ab844e4074f253fd5f195d8aebfd08ff7766154875cd994865a6e37f0b6dd0e9ffdb486b06205ab544dbbdf8ee2728989d838ab91f4e541ebb15e77c5f3be722b4eb564a4c8dc99469bef1f2cb2ff742688ca0911bb3b838e222a9c62fe12177c2fb7f9aecc0ebca4635e5fc7654212b51c1ad2f4193464f0fd298d21cea10349b439f1a70306a43950a4acc2736b8a3519a7ed40b377644332fd84235a8aad540db5a2070c9e3cbfe5f800100b3e0af98735d4afd0000000049454e44ae426082),
(2, 0, 0x43616e6e6564204174746163686d656e747320526f636b21);
INSERT INTO `ost_file_chunk` (`file_id`, `chunk_id`, `filedata`) VALUES
(3, 0, 0x89504e470d0a1a0a0000000d49484452000001bc0000007e08060000005fe7a4d4000000017352474200aece1ce90000000467414d410000b18f0bfc6105000000097048597300000b1000000b1001ad23bd750000022b69545874584d4c3a636f6d2e61646f62652e786d7000000000003c3f787061636b657420626567696e3d27efbbbf272069643d2757354d304d7043656869487a7265537a4e54637a6b633964273f3e0d0a3c783a786d706d65746120786d6c6e733a783d2261646f62653a6e733a6d6574612f223e3c7264663a52444620786d6c6e733a7264663d22687474703a2f2f7777772e77332e6f72672f313939392f30322f32322d7264662d73796e7461782d6e7323223e3c7264663a4465736372697074696f6e207264663a61626f75743d22757569643a66616635626464352d626133642d313164612d616433312d6433336437353138326631622220786d6c6e733a786d703d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f223e3c786d703a43726561746f72546f6f6c3e657a6769662e636f6d3c2f786d703a43726561746f72546f6f6c3e3c786d703a63726561746f72746f6f6c3e657a6769662e636f6d3c2f786d703a63726561746f72746f6f6c3e3c2f7264663a4465736372697074696f6e3e3c7264663a4465736372697074696f6e20786d6c6e733a746966663d22687474703a2f2f6e732e61646f62652e636f6d2f746966662f312e302f223e3c746966663a4f7269656e746174696f6e3e313c2f746966663a4f7269656e746174696f6e3e3c2f7264663a4465736372697074696f6e3e3c2f7264663a5244463e3c2f783a786d706d6574613e0d0a3c3f787061636b657420656e643d2777273f3e89202d8600009fb649444154785eecbd797c1cc599ffffaeaa1ed91ce1c69246924d022424d924d8d66143ee03627cdb909b70f9c61cb93607f88440d8dd2480f10d210721d924605b36470e92ec3721b625d90676379b64b3bf80258d2473df96a6abeaf74755b746ad9146a731893e7ed54b9ee9ea9eeeeaaae7a9e716e9b1e32cfd809022f9551708d1fbf1fe420899fcaa0b6481dfebeffdf4b77f1285ce2f347efdc560c7278942f79f447ffb2731e8f387783cfb8b42e3ff5ac35a93fceab08235fd223fdd60edf09e5fe87812a69ffd87fafdf4773cfbfb7c43ddbfd0780d7a7cac5b9f56b8eb1cdeab75042318c10846308221c208c31bc10846308211fc436084e18d60042318c108fe2120466c785dd1dffe49143abfd0f81542a1f148a2d0f82451e8fe93e86fff24fa7bfe60c7afbfe8ef78ffbd61d036944162b86d5249143abfd0f12486dd4695c0708fd750f71ff6f119b1e18d60042318c108fe1131c2f0463082118c6004ff101861782318c1084630827f081c7636bc423693a1b649153a5e0885ce2f345efdc5a11e9f24fadb3f89419f9f184fe967af495cd60202a7c38ffa246104200cb98785ec3abea28773fb8afebe8fa146211bc96031681b4b010cb74d2a8942e7173a9e447fc77fa8c773b8c76fa8fb171aaf818e8fc5adf5dea9e70846f0778ede97d708463082bf0b8c38ad8ce0ef01467497ee88a43bdc4437327f8b16c1084630827f0c8c30bc118c60042318c13f04466c78058e1742a1f30b8d5721141a8f24867a7c9218f6fe43305e919e5f4905c62284c0188d101221045a87281530a6a4188de5c08103f1f9491b43211b5e7fc7fbf586e1b2a90c14fdb54925917cbf8550a87fa1e3491ceaf1ecef78f5f77986baff708d4f148737c2f00a1c2f8442e7171aaf4228341e490cf5f82431ecfd07395eb367cd260c4300da5a5ac1df4349493100e3c69d82d62113264ca0b2b28a751bd6b3f1f6cd5863d0c610044197eb8d30bcde0760a00468a0e82f014fa210c14da250ff42c79338d4e3d9dff1eaeff30c75ffe11a9f1186e751e87821143abfd0781542a1f14862a8c7278961efdfcff18a266f74d67736df4e656525d1cfe68e5eb4d8a27b32c0fa4d9b58b3762d5208a452dd16e408c3eb7d00064a80068afe12f02492efb7100af52f743c89433d9efd1daffe3ecf50f71faef189189e7ac3b1c7ad4c1eec0d850858a1e38550e8fc42c79328d4bfd0f14228747ea1e385d0dff3ff1efb5baf96cc87e8dbe8efbebd7b79e8a15fb377ef3e468f3e82b28ab258ad990ba30d424aeaeb1bd8b36f2f52cabc8b31ffaf762279ddbf37741f91240af718521ce29f1b6a14befdc23dfa8521bedc70a3f0ed16ee911f02842dccf0841408d1d90aa12f7d7211d95586eafab9d72ad4973e5c2f89e1be7e12fd3dbf50ff81dc7f7ffa5b6b292a2a72f34b0aa4754c43871a6b2c4a4a846724d65a10c2f5935ebab29ec149e1fa231080090d810ac01884059dd5a45480c576614acf3dff3c2d6d6dfccf9ffe877d8f3ec20b2fbc4465651552801502193d870410ec69d84343c31e2402fcbd0a7708009578fe641b6a24af9f6c871a42885e494cf2fe926de0042a3fba5d7f682fdf0d85c6bcdbfd1440b2bfc500162bac5327f809280021c8431ffbf7c0c9dfebe7e9871c6e4c7a46b7e7e9b5373e97a6637620fac0f0faf01273f15af72f743c89c3ad7f12fd3dbf50ff42c79318507fe12428bc241504016565657ce4231fe1fdefff003535354c9c584959599ab7bcf50c8e3aea285a5a3239931852410a638c733c01940ab0d6c47d82c07db6c9dbb32e78dc1ac38b2fbe485bdb01ce38e30c4a4a4b5039acd1e2164043c31ef634ec81e442f35d1d7b3e742834de858e0f070a90940218dcd90531cc971f6e9888c9e5a0ab1a3df9be07f9c0833cfd50a07fb758a8b71f3f3fa8056d78fdb5a9f477410eb58daaffbf3fccfdfb397e49bcdec6c75a8b0a14d6582aabaaa89e58c9e2c58bb01602e9ec6612c8b41e205d3206000db41d7892bffded6f6cdcb489faba3a94771e5108b261964005ecdbb797eddb77b06cd9b5e0c746d35da76f8d452ac728ad352c5ab888258b172210b14dcff83bd9b061231b366c0429bad80f22469acb240f05fa3adef9d4afc38942b6959e30509b4b5f31dc36aa087d3dafaffdc0c58f6adf3f9a97c276660f8afae462b0e35968bcfa73ff0c63ffbeceb782e331522d6104c30915284a8a4bf8ce9d7772e71db7b378f122848086867aae5dbe928b2fbe84778d9fc8873ff261fee99defe29cf3a672d9bcf9d4d6d6525353cdd7bf7e3d37de7823656569008cd1482198366d2a003257fd99076136f4ce27265e0c8f3ef668b2dbeb1e7d658c23387c212d480cd26fda0a39488d60f01834c38b544cb9eaa8111c3a486f978ada6b016b9d1d2d909205f317f0c0830f3261c20400dada0eb061c346162c58c8b66d5bd9bb772fc66867cb1382e64c333b77ee64ddba754c99721edbb7ef60dab4a96cdab889450b1722a54208c1ecd97362cf4b6b2d522a8cd15d6f044815158197fe849028a908b3a1b7041646348e039dcfc9f5d0dfd61f24cf1d48eb2b92f3acaff32d7a0f511b6a08e96cc0511b2ef475ac0a8d6f24b9082110d2224d0742b71360e30d9a41f69841680483c3d0cfc011fc434108114b5b2b57aee2f2cb972005040232adad7cf8231f66fdfaf584dac5c6454420227e4248825440369ba5adad8d0debd7f3d18f4ea1bc2ccde2450bb9efbe1d3cfae8234c9c381e80279ed88fb586508779094a12c65a5a5a5bbccd6e0423786d2185200c43acb558dd41faa4a3983de57d9c7cfc11a8915477c38e11863782412348052c59bc84b9b367a27066e2acb12c5fb61c632dda3aef4c27ad799dba355d989e0a02b4d164b3599a9a9a98729e536196a74b917ea25a0b41a09052a1a4449bc204428721810a0eb92d6e047f7fe8cb06ab108477b80a5201019a0b3f712e533f32819aaa3723c5ab2042ac74ce58dd1cb24630688c30bc110c0ad65aaaabaa59bc7811e09c5204b061fd7af6ecd9439072de96d65adf3a9954f4ffc8dee69c4d9caa33d3d2c2d7ae71ce29c63725a0a9a90970c67e99c88a920f5249b2d9ac73fe0e3b55a023137f04870a51c4410ca3b1d997987ace64fee9b43447a73a9835e5bd949c782412a70919c1f0e0b05ff7fdb5191442211dfb6031589bc270db3c0aa1bfe313489839631a4238a61439fc6fdfbe8d0ed381d11a299d593e343ab64d442d97010a295052c51e9abbeb76b36b4f0316d0da312ba1041a8d4c49ac7052626fe3158535e0991f96d89359269eb72ff32b393ec9f67ac360efbfbfebb3d0fb3adc911ca3ceb96ce26695c50843a83bb03a8b301625a28e164507e9e303e64c790fd21c449a2c2afb02efaefc278a8471b1a7168a94b3471fce18ecfce9097d9d4f052172aaa28cd4c31bc160219562c6f419b1da310a146f6d6b8b63f1fa83c8a86fade1c9279f64d3a68d00281f6660bc949894167b43746f2318c1b042185281c584ed144943202d810809443b29d9c168fb2a45e2558e4c1de4f3975f88322fa2acc1841d14c9904995ff84d559b4c9228588377911fa3adf47900723610923180acc9f3fbfcb2432c0b6da6d18a30902d56f6f33a33546bbac2c461b76eedcc99ebd7b92dd463082d70cb9928cf471731290d61076bc4411ed28f332a37915695fe2e4e325678d7f13efae3a85191f7e275f58f2494e3a5611102231a8402295e0b8e38fe1e43127a290186b1123710a438e1186378241616c4505da2748c22b34ad71f6bafeaaacf205c52a15b06bf72e6c94842947baeb6b70ea0846305c10180421ca1ea4c8bec40726bd834b3f3d8dcf2df90cabafb9828ddfbe8eeb975dcd851f3b878b3f3995f3a7bd8f33de3886d1d2206c870bb5d11a610d8114581d62ad536b469ecd8c48774386fe51a46180f4b5ca94ccad63e66e2bfaeb763b5d33614430d622a544fabeb910c24d9a684796af4f2108ef761fd995acb5647df919213b5df2ad75f91f0f05829c2c224944638557031a6b51cac5b2456ac1c8bb712874eed1b57247b6ac2c8db5169d274eae3724ed9e52b939b163c78e388eced97e0442c8a1d1f117403466d1183a46eefe4aef29aa0285f6e5850a2169f3184853818a935d4b1fcf288488e777eefffb8be46f255b1261e8d697f0ebb3afb69740298cd6a4821442489727750850c8865ee8790a21a203524ab09a941204e655de71fac9acffb7af70d1f9efe3bde32bf8a7371e4ffa04c1113ccf11bcc891b283227110ab5f469a7684d52861916884b408eba4bd138e3b06250c425a54ceaa4ada3e5faf36d0d71a87c588253367843a743a6c63fcc276c4246280b990c2a59e8ace1739716152495241aacbb5070aed6367dc35dda48f6c54c227d83e14b0d6107add7eae434604e999bcb116ad5d969288411b4f902397fea118979aea1a049d63ae1054548c2508527d227cf9904bac9454343535d1d0d010dfffa14492c1e5321a3ce1d6a1dbb0e59b9f430d2104461b8c7179456decfdea1afe3d673d231a6ea4529debcb859e38755c21c6970db30829bc07efd0ccc543011d8618138dbf45da97997a4e0d572cf804012f315ab453245e2590af92e265d76c0752742069479245a2011d7b6e46a9c484054988c0903dd89e37b1c2080687e15fa105a07dea28636d67a260a962e9203781703e482919356a54fc7f2104a7bcf114aaaaaba9aaacea42240742308d67baf8ebe73a62482591ca7d277c76ffe1462a48c5c4b5278216f5c113c848228c607d5c5c5f249242c886d998f846eeffe99212cacbcbc96607ef62dd390f34c1216028494473266228d1b31a63d05ac79f072a31f417d1fd44cc37f97fe1a5bba222c78886fb9ea2df883650a176cc9f1e340891562250419775edc6efd0bfdf812048056e5dd1c1b48f5431fd9c4a46ab0e4629109e7be56a5fac700cce88ae79325d7e47d762a6272c426a5771c4e7811cc1d061d0c9a3f34deafea0bcbc9cb2741915632b282f2b07bf88dadada007862ff7eeaebeae2059df45c2247aabbeaeaabb962e9e5f1cec90a686c6ca2b6b6965b6eb9a50bf3ea2bacb594979753515141595919e9b232ac3554548c25d3dccc13fb9fa0a9a99986fa7af04c7030c8b7e8bb2c126b281b3b96964c866c36dbad4277369b25954a61ac255d5a4a797939936b2661ada5a5254326d3c2eeddbb5de71c956c84febecfef7ee7762aabaaba0576df5bbb8daf2ebb0681236ad2bab1eceff808015a875cbe78098b172f66d98a156cdbb615bce42fe95d152685205d52c283f7dfe788739c3ddd0092f51b37c5c9a373c72272b451b8f34b4bd39496963076ec384e3ef964dada5a3970e0008f3ffe048ff85c9d420a744eac5f3ef4777c93b05eba1c533c86b27419e5e5e58c19e392701f387000630c4d4d4d3cf5d453645a32f1062df99e070a6b6d9798326b2d781a519a2e05a0b939e3340da1cb6b9a44797939e9d25226564e04a025d3c2fec6465a5b5a68ce3427bb0f0a8536a1fd1d1781c19810253425c72baebf763147c857306107520984df90e43237698d9f4fb2cb5a8e02791c24598ea2f1e9766ede78379927db11f20874810c41f9cc1abd61a8c7238942e7173a9e443e33562efafafc16b7e6bb31bca166704a8a78971e3d6c2a95e28a2baea0a6a6869aca49e0e3b90cb07f7f13a78c758c2fc2e38dfb69a8af67cbd6ad3cfcfb87914a121a83521281a2b2aa8a9bbff92ddadbdbd9ba750b9fbbeacaf8dcd0b86b7fe9ab5f63cbd62d9d656bfc6344895b8d76b618fc2ebaa2a2820b2eb880993366539e2e8d03aab55fdfd27f3638229ac934b36bd72ed6ae5d4b4b6b2b3a769bef9dc00be108f795575c89b5964c26134b0d0065a52548200802c68f1fcfa4496ebc3e74ee39ec6f6c448a4e82a28da6a6ba86a5572ca5bab21291f3ebb9d26d737333f5f5f5acdbb0894c4b06acc4e06c7d51bf787c12132abaafe8ba777ef73b4c9ce00857b4a19040636b864b2fbd94c6fdcd141515a18dc6681333bc68d2159a4d6136244805cc993d87552b96b37ce52ab66edb166b050aa110c3bb6ddd06366dda840c141d1d1d141515618cc14a414d5515d3ce9bc2cc69d363464344f4fd381863683d7080dada5a366fde44361b924a0584d6abe3fbe3a29a3386c2bba58f4ab93248d930a4a2a28219336630efb2794870c4d08a9c1ca3eeaff231912d2dadd4d66e65d3e6cd186308948ad5e1329aebbdf367162d9887b59656bf0105d01d59c68d1b078031503da98633cf7c171258be7235b5b5b5182c6118925201524a4a4a8a59bc7831e7f90c3a52bafb5539c3131a43a625c3ca952ba96b6800ff9ac250a38a525da526ffb72fa35b88c8e72249903b1997441012488330af70c6a9c54c3fe76cde7a5a09d2b47b35e540103d93c4d85184046cff551d5b7fb18797b301815fdf9dd3285a3f7e05dac169510a8d4d723cfa82fe9cd39fbe0c840126aa250c3bc30b0297e902afc6a89934891fde7557e771044f343673ebadb770cf3df7c6375c5e5eceecd973f8e2e7af8efb6a2cdbb66ee3e65b6ea6b1d965dca8acace64777dfcdee9dbbb9e8a2cf72feecb97ce3a61b00b0c64d1421e06ffb1bf9d0073f18132d17f46cb1de5e28a4530595959571e38d3732b97a128d9926eebd771b75bb77d3d2dac2fe27f6a3828092e2622a2a2a284da7f9dc954b294f97c5f7d872a08d9ffcfb4f58b3ee36ff4def0c0fffac0ffdf2979e8182f14c35925d8c3148e16abc09cf303e7cee393cd1d80838f5667979393367ce64c9e24508a0b1394373a619690d3555d55dde9bb5cee5bfed401bbf7b78279b37df4153a6d911683fa1facaf0162c9ccfd2cb9776e9e38831b4b4b572ce47ce75dff90a0611fa4ab0acb1a45229b25967f349229f449c8b420c6fdd868d6cdcb809a4b37d2aa9983061029b6fdf8cc2799d2a04adadad68ad292b2bebc2f022181f8e71c71d77d0dcdc8c5012ad752ce1f6151163b55e1ab63aa4a4b898d5d75dc78409139cf79e31b4b6b6b07dfb7676ec78804c2603403a9d260814f3e6cd63ead4f30010d672e0c001ea1aead9b86913cdcdcd6e4315a9e273364cf9b06debbd8cad181be7225591bdd6588494f10bd4ae962f2b56ac62fbf6ed7e3c350ac1a2450b59b87041cce032ad07c86432949696505aeca453fc4609bfce9b32cd2c5cb888e6fd9d997572df7f5fe70f7d20eab94812e088e10940d241e98947f2c90ba6f0b6378d2125b348ebec72034727c3c32ab49564d5d17cedfa8db43cd381b6ca6d48930c2ffa3c48b344a1b1498e475fd09f73fad397d703c393d61978478d1ac55d77ddc5a4ea1ab251d60c21686ccef0bef7bf1feb732b463b776b0d0ac9e73e7715575c7185bb96df0536679af9ea57bf4a59ba8c1b6fba897beeb9976bbefa55a4947ce3866f3067ceccf8f78d9f134d99663ef4a10f751b606342e7882203565fb79ab973e662ade5e24b2e66e7ce9d18ebbc1badf7d4cc767410a4021727660c6f1c57c1e5975fceacd9b3bbd45b6bca3473d14517f3844f85d513acb104414069ba94b163c7912e2d65c9922594a54bb106573e44ca4e2ee891cbf06a6aaaf9ee9d772280f51b36f2bbdfff9e47f6ed731d8d4648c1d8b1635976ed32ce3afb2ce764e2255380c6c666e6cf9f4f63636397dfc887e4fb9f5453c5e6cd9bdd73f88c2ae430c4adb53b58b162453ceef9ead7f5062515d96cd6a71cebf4e48d305886b761d3edac5fbf1efc8667dab469ac5cb19cc69616766cabe5fe1ddb696cdcdf4535972e2d65d5aad54c9830a18b5d516369c96498376f1e2d07dadc580dd00e23bc9d70ceac195cbb6c190a118f5c5373133367cec45a8ba5d3961b8db19492caaa2a36ac5d0bc2316c03b41d6863fefcf934353551545444474747a7a4d0034ad3252829a99c3891850b16922e29497601bfceb4b65c77dd756cd9722f464045c55856af5a45d584f16cbcfd0eeaeaead8b97327a9540a6d340a4979799a69d3a6b264d1628cdf6044eba829d3ccca95abd9b56b17c66b39626d91ffddde676b270a11f60849fa10416048d957f8c2a20b78fbe9a508db8e20741b423150e9ce65680190d6313c800e46b3f391c7b9f387db39a84761083089797e38333cfa715e5ffb45182cc3eb56f13c49d0922874bc1bac2148a5b8e1861bf8c839e700c21109e9cacd4f9f3993175e788140392b90735e916e624bc9de867a4a4a4b78c7dbde8ec61208c971c71ccba4c993983e7d3af57bf672f992cb9d57a7365cf4d9cf525151eea43bbfed9412de70cc31ac59b3267977a840228ce5073ff83e1ffdc83958015fbbe66bfce217bff02a3867a076aa26ef9860fdc6c0c28b2f3ccf9ffef427defad6b7525a9ac60ad0da70ccb1c7f0e10f7f88ef7efffbc99fec02210452489e7ffe791a1b1bf9f39fffcc43bffe35a79ffe664ea928cf196f01d66fa381efdff5039e7fe1056a6a6af8c19d77d2d8d4ccecd973f8cd6f7ec381b636e744e036ce586379f1c517d9b66d1b5249aabccd4d7bd5e9f1c71ec3073ff4217ef5ab8778e9a597badc5f12c9f79f696e62d2a44994a64b919e9dd89cf6d6b7bc99193367f29bdffc9ae79f7f1e89e86752dcc8e9c69d24fae9562e84e00d471fcd673efd69f73966781610ecda5d4743433d41518acb2ebd8c7ffee21758bf61235ff8d217d9b7672f2fbdf442ac628cbc735f7ce925f6eedbcbe9a79d46795939d627c8164270d49147f1a10f7d907fffc94fd0a12ec8909388549ac618ae5db68c450b5de15ae14760cfbebd7cea539f024ff422377921849308fd46acadad95eddb7770e1273f193392a38f3a9af7bdefbd1c7bdc71ec697029db5c61a79ef1fcf3cff1ca2b2ff3a7fff913bffef543bcf2f2cbbce31def88c33522587f0fbffded6ff9d39ffec4d871e3d8565b8b548aab3ff739b66cdd425363132a0830d638d38284975e788186863dd46eafe5539f76cfa510682cc7bce118aaaa6a38e69863a8dfd3e047a02bc1ebfdee73d03b9d2c088125c5ab5cfc892948fd3c813008110eba889d151690ee398475615440595905bb76d7f1e2ab1a4b804dce75e1deea609f6bd0e71f6214bedd648fdcf5de177ddb202184e06373cfe782d9737d8e387f43a1e167f7fcac3319b0e90c2476e1086e4165b3216b6e5d43566b84dfa91aa0ac344d10a4b8e5965be35d8252de6ddc8090a00281f559105adb0e44b7d4053a1bf2831ffc809aaa6a270118cbd5575cc9d5575f4d2a151078554baaa8a88b4382359deeeacdcdcdd4d6d6124847f29552ced9215dc6f973cf2f9862cbc5ceb95791cd66696cdccfdab56bd1ddde9d7b79d61357290437de7823f76cab65ca9429645a5ab0de9330720b8f082138879adb6ebb8d7befbdc7ed98a58cd3cc959c5cccdd3f70aa66ab0d0248f53136eade7beec11adb25005de64caeb2d212be73fb1d5c30f77c008a540a8544e1c2460215f4ca180aedea72113d77d4c005afe3e7621245454504418aa9e74d65c9a285acfefad7b9e38e3b9c1d2ff1bba1d64ed29792a6a626aefffad7e37711bd7ba924e97419679e7966416d493e04a9006b2d77dc71077367cd8cc7d118c3e38dfb59b8608137223b893477871ecd49e9bd8933990c2b56aff2aa5527d58f19338679f3e6b160defc98b9c6cf904a75b917fc9a32c665ef6f696d656b6d2d3270f79884f066022124cb962f63efdebd9c37650a7bf6ec4149153b58095f1d4308e7e52ca4a0a9a98915cb57c4ce4f51f69274c918a64f9f4e4d750d268fc35a5f3190770149db99e499679f71ea7929fa9541a82748eb1d59bc74372a48a18446842f71c9a7cf4792f59e9fbdd39011f40d3d53992180b48e682e5dba347608898f29c99e86bea58c6a6cdc4f5d7d5dbcf8a39b96c02915630167d8b6d672eb2db782d3e4418e33cc97bef8c5bc04ef820b2ea0cadbb8acb79fa4d369aebc7c2977dd7597b377081127414ec23114c5ae5dbb928790c0e2858b48a55c706d21081f540dd0b0670f7bf6ec4d76e9823bbf7b27ad2dad7cf5ab5f8d0971215863d9b869139984379c0a04c52527b378d1e2b85f647b2d84bd7bf7d2dadad2293de5c149279dc4fcf9f359b264494c2cad57773b97f6d766416bede22b172e5ac4a6dbef60dbd66d64c3d0059a07aa9b342a2295bbb1343636b2cfab8eb5570e460c68c18285e8021b9d9e306fdebcd809c45ab78b174270c375d7c77d4c1f53b6ddb763078f3ef6686c8b0c8214d658a64d9bc6a4aa6aa72af7686f6fef726e1256405b5b2bf7df7f5ff2500c2104b366cda2bab292e5cb96250f7783b56e9e0921b977cbbdd4eed88ec9d99c64b5a5b4b494050b1776f3483e94b05d98df30c1ba547c084340076f3ca59831638ec5f8dc9a7d59df23e81dc33e823367cea4bcbcd3eb32622c420876eedc097e21e56b00229004a38ac834e777575eb264094484c85876d7ede66bd75c43c39e06ac817bb66ce3a28b9c3d2edfaeb4aab2326664d16ed75a27a95455555353e3bc22a3ef933002f03b549360c800e32acaa8aea9f6d256fee1ce25f652a9383e49e7a416ca851082f1e3c7535959c52db7dee2d4b9792412f28cad4c299a32cdacddb0de79f909e7801061ceac198cab2843484b10145ee146c0fee6262ebee4922ecf1d3d51f468454501e974090be72de0beeddb59bc7811d2c75bbe56cc0ebfc958b0603ed61ad6af5f8fd69ac0db6c4d14839718438345a6148152343434b8cd86772609a4c4e2425982c426af2f282d2965d1a2854ebd1f7de9c3741abce7622e22c697af01648d66e5ea559d6123fe1ed3e934ab57af467a49111f389e84c9235b64322d3d12ff74ba94d52b97b362e52a172691b8a7e4fab6103b6215151571c7e6dbe379648c4129811250337102336776dae60782814879b29b0dd68d88cc899d1b0a44e3131a8d100221355268defce637810809cd41b4c9a507494a3382be60d847ec3def794fbc5b8b08b2634e86c6c6fd89de5d61bd3d4c879ae6e666345db34a586b19575146557535c6188240111ac34feff9199ff8d4a778cbdbdeca57bef2657efffb87514ae58d01ab9934094ba734133163635c2989743a1d4b79d173e4424ae7ce6e7d9c5b12a171448c1e084a12da67450168ec2526e91b377e834d9b36b27b771df4f1da11b2d92c75fe3c219c7a0c4f60cacaca58bd7a3578155e2144e372a0ed00d72c73f5ebba1ca72bc51402caca4a59b87001ab56ad625cf958ac76c4a3a70dc160e198547e482959b46821cb972d47052e7d58f49ef3bdef687e0084d6a03db3d674862d2804e9e292383eae3f58b67c3912507e7146efe78e3beee8b71acd08f77c2d2dadd4fb04dcd1bd67b3598a8b8b99376f1ea1764436df862989506b1a1bf7c7e68524e6cf5fc0efffb08bdadada82d78b999eb588c06d361f6fdc1fc7894a299dbb2f6e4fb678e1a2ce00ed686e1d12382f492b408b004bc070159ab1de1e2ca5205096d3df58464a580291e3e5dc8d098fa0af18969173de746e6656555501381b5c0e01c9b4b620535ea7ef058d7c4d0a853696e6e68c33dec70e0b8ef08406c69695213db3134aba1838e17e535b8b50ee7e8c76d334b73536363abb9bb75f44444b48673877dea33d2f2d6b41d09967b1136e7206122acacabde769e771eb5b1251e56f80b6d6b64e49c9ffc37baa1a2cb7ac5913dba9a26b778e4fe46023bb34a32150456432adecddf76817a225842362e5632b90a2afce252ed62c34962ddbb6b371e326ac75e3e21ec376499194cbd366cc98c69d776ce6ea2b961248013a8b3121d66a642011b9415a034437069143290d70e9a597b267cfbe58358967fc448418d5ad45632950ecdbb7cf8db5b791e1e7bac5724ac5d86eef23d92206aa8465e68c69544f9cd065515a6b090dfc61571d4205dddea78cb2f5fb96bc5b6b9c1d7bfbf6ed7110b3b596c03398d9336691920a250429a59008e77ce4efcfd998a423f05662911c38f014f4403c84b4dcf42f373a294875bdb77cf767ac40ca145a83b6026d05b53bee8b4d12513216259c3d6f527515d21a1f2e938fe50e0ec9f793eb936290fc61f763687524da27488f24bea816de4021d1485c362125dc3b134633e9cc7fa2f4c4a35c5505993afc985d546f2e5f8be1360c6e2d3aca1b7dd668acb46893c558c723a4941861e8301dfefd1b3016138689e7efc378e7decb70d4c30b940b947513c6c5b5414e3d33dfb25af7c94624842b0a8a27fa493889a10ce3f3db45e81ce0deb1e5de7be3ec2da171d22478070004f5f50d08cf54f2658de80b22956e9823bdf507b9af35eb6d89db776ccff9b6ef88d4b6a1d6b14a3989e2e212265455c5cfdd1b926ecdebd76fe0d24b2f7541d00ae75c1174cd954ace86a3b8b898050b16f0c0030f509e2e7344da3b0f65c3c2f363a088c63490505b5bebbe1ba0cd0d3f3795977a22a7a531638a93ddba41e58ccdf8f1e37316a467ba42b077ef5e5a0eb4c647fa0b6b2c7bf7e6b70797948ea172c2843e49d7b9eba9a7de0aafdeb7b660d6995ce4aa39f7ecc9b1ed277686d3a74f779b6121097a493938d490160c01bbf7fd89b6675e057904a1a1cb480ca58a132f081449cdc9c71e85783d5607e9c306a02835caa9aea5220814da8464439747345001461bac76668fc8f9ac133dcdc23c88c23f92df0f1651f0aed1868e8e8ef87b8bf3e28b98564b6b0ba93c5e6149b82cf49ae64c33aa17254694cdbe1022861bb53d7bf6d0d2dae254a252baccf7b898b2ad5bb7d27aa00d3dc8895652528c1da204b95239afd19d3b77e655d1f605d2e75a6cc8252c399052b270e182e4d77d82319a3d7bf6307dfa34329916f0ea3e2795761dfb5c8c193386ef7ce73b2c59b28451a922847412c070c378a71b17e7d7ffdf6bce64d039cc2e62e4a1e9cc2ad31b94ec9cb7d3a74f4f1ec65a9719c7393415be5e12c23b55b564323d32bdc58b1793cd6609fbc1a07ac296da6dce1c203a332cf507c66b827a7a1595dee61eeab04f1be6c1a233df25608b6879f265fe50ff3fb43efd0a2278038614e0a460f7b7ab443b280883149ad34f1de7bc656d527a4aaea2c315b9f7e9c6331a1fa74e77555da43528992515188aa4441a0d562395402a5755277af6dc0d527fd0ff15540046bb9d4814ec1c11f94885217c50a9f59e6e85e0bc933aa5c32484701294f62ee3fdc513fbf773e18517b275eb1632adad84c6d0d8d8c8ad6b6fe3cb5ffee72e8b36d7bed6578486d8336e20043589c8fd7fef9ebdfdda41e7221aa77c8e40d67b1b8e1b77ca80ee3708520821686c6c64fefcf9acdbb01e8153972525f4dcf7298470de780b16b271c3068a8b8be3d094e184049a9a9ad0decb772088ec5932879907bd24f7ce4536eb926f4f9b3e3deffc5202fef33f1f438761dee38520a420cc6631d6f6e8d65f5252825272404e36493cf6e8a358e3e2c906e255190401cdcd19f63df248f210789bfa840913085410abf38715317371ea5c2b8e60c7cf7fc75d3ffb392dcfb61372249a2330761486ce82c77dd530f50e03a69dd34e1d8b92a64b4e08f11a3a7a0d04c90d80c020440781799522fb12a3c58bbcf5d41379ffa4b7f39eea33f8a7d38b293d21a0f48480947e0973f0795241a4caa653addf4ff4ff8c0290be8699108296964c97451fbd228d65ecd8b17dde016aa329ed21c383f43903fb2ae1252185a0b9a989af7ce52bbcf7bdefe18c33dec2873ff4216ebde5966e4c39dff5adb1bdaa3aa5ecf4b61c88975812d2c77b0d54dd171175a30dcdcdcd84a1ab70d0e518505a5c4265a5536be6b642c89ad019f8a5607f7313b7aebd8d733e7a2e4d6dadb8f05dc750a3891731082b04d6ebefabaaaaf9cee6db59b27061410fce7c7177fd41c3de479c14949356ad3f903e4ed3e6c420e2e778e4acd41ba48f1dadaaac8c83c893686e76eba82f126312d6f8b24642f0e8638fe57d9fa525ee5de793f0f2f5ef0d517dc040057d0acb88de5bee6f581f989e8f3c586ba9a8a8702aae1ec6ab37f4770d0aeb82c29d4f81f4d2c868fefb2f4f72c3b7becfef1afe8fd6670ca1184da815da0a8c3008a506ad199216520ade7ada9b38e1b8a391845d18c72063de8715d1bb947ee367ad45cac06d1cac46892ca3ec4b7ce4ecd3f9da95e773d7866bf9ca157359f8e90fb1e4c273b9f6ea8f73cbd79772f3f55770ede73fc3940f4e60ccf1a390844ed23306d587f99844ff57503ff1c4134f4044d88cc1fad441cef3b16f3f1fa8c0d5cccb63c3333e19b24e38c51c2a440b480849693a9d3c7cd8c27a279a471f7b2cfe2e72d889de8a1a00814da22855444b6b0b975e7a09eb36ac8b63f5349d6eff4948a03c5dc682050b59b2640926a7e4cc50a3b5b505e5f35ebe56b0d6f2ce77bd2bf935780d41737373b7cd575f91bb19eb697d0809679ef9ae1e8f1f6a2815d0b0a7a147b566e4fd3a90f1180a18119015a379ee55c5f77ff200cb6f58c39d3fda41db7359b43c12238e24ab8d9be33d3c439f20345687183a38fd4de514c9687b98bb653cbc11d199404aace940da5719250ff2de496f63f36d3772d127cee39d6f4993b2cf73a47a99d1f25546899749891708ec731c215ee2eda78de1924f4ce53dd56fa7e4e4635c60be8450779accfa8a611fb5961667c7c1ab79f08c2f22ae8510ed144a4a7b96f01a1b1b113e94a0bf48aa2092ad1094544821983163c66bb600870ac6982eeab9e2e2c24e1785d0aeb3682c994c0bebd6ade3bcf3a6d0fae401a7daee610e686fef0da464c98205fce297bf1c90f4d51784a146ebce0a05871a91aa7b6c5979bc19c84520a1a525e33293f4533a21a186efe20ce2e152f0416969fa3579fe24b4318461162964178fde0842385389f304efff7aa79f529e8d9a30aef9cf005648da19c541f50676fd6713cb6fdac4b65fd473e0d90e428aba543219288cd448426aaace049345e26ce10e7906e8304314d2a5ad45d241d949a3f8ca959f62fea73ecc689ee188208bb221521b1401d21aac0db19e966bdb0efa2045e22073cefb006f39ad82405ad0ed0403d890f7ff8c7e62ebd6ade0553ee0ec1d81949495a4bb04a4f786506bde78ca1b935f83dfefecdab50b2965b7fc7e8702da682a2b2bf9d79b6eead742ea0f725fd250bf30a3757c4d2925c23a95e3503d494444b57615b8f73736f299cf7c8675ebd7e597d83dd3153e9fa200d2c56378f0c107291902061c217ae6d6d65682a0b32cd2a186b54e251e6d3292686e69456b9789a6af1a915ce4aa41f33134219deb7f6969c96b2ae546904260a520b4fe5ebadf72a784374c9ba03ec34aac4891b5a378354c7190a3d8f6e01ff8de8f77f0f4332f23652a4e193650480b46b7f3b6d32b489f7c1488b04fde8f870b5420c06649f10a6f3bb5846facfa02ff747a09a3453b29fb2ab6e355242ee7ac73ec037c6e51e19f3f081cb34c0586138f3f9640ba1cc8fdf25af5f6befeafa07ee20f0fef7259ffbdb8243d930238f59437a110b15eda869d3aeaa899b003252c9555955dae0bcee6f2f9cf7f91304a5195b3609346d29e9094e8ac14ae748ae8cc001111436b6dfc1b420aaebcf24a1efad5437cef7bdfe5e65b6fa12593896d521192031ced10a317da57efbb282e117f4d2106e6c51849cc516b6b6b7384c35f3b2222a1318cf505797b83ccf38ce43ca7f2ffa40c10422183229a9a5b58bb6e03d3a64ea7a525e3ce37061b7ae6eb83fe739faf78cc497cf73bb73ba3b5ce2285a52ffb9b6e7320678b1eddb7d66e176a7d4c5c6e4b22793c9a1bca3b63454de14a4e15821082e23163f28e61842050ce59290c11d297b28a6c5ffe73d49288b40ece69a5d3533609213aaba677454f6f38179df14dd65a5723522894ecbb8d2d77bd062aa0f5c081cefbf48f15ddbb4c0518a3b1799eb7afe869bcfa0b61acbb6f2bb11491e548fefcbfadd4d5ff17d8be3f7fcf30a4944586cff1d94fcf20201b3b6ee4daacbb4aa0b28b24da1b0a8d4172be2711d34e977b267918136629a29d779e7622d77eee6202fd3cd21cc418e78350148c02ab088dc5a0d02205a208acf2c1f602a58a104261913cffc24b18022020107d18df5ce716db59826a58607cdaa97ffef297111274d869d8b71666cd9aedf4bb3ec34510740f5370a9b624e9d274e7e2f5444608c1bddbb6c646efa18014828e0ef7328c37e2170529170caa0d6f1c378eabafbc8a877ef12baeb87c09a5e9349ffdec452ed9730f5282b08549463ef4765e37423e00087075cd84006b5dd2e8b83284a4a40f4e17fd85733670effbf1fdfbb9f8924b5c791e9c3422f23890489c66a03c5dc6f2e5cb62f55e5fe31a7b1bc7c14016780fb20fbf2b95225d96c678556e3e44891c06e2b41211766b2d4dbe866412d6b894600343e79cefffdd758710826c36eb6d3f9ddfc774034b694989db98f661a338dc8836aee008aa90a3b132c5f1c79de08bff0eee1ea50525348168e74d15277256f55b51e2658a84c1ea4ec7b538594797b35f5b486b48a1499ffc06beb8f41252e64502d14e4a5a0229103245d6a608e55168710ccdcf74d0f69ce6913f36d1f24c9657f49184f2785e0e8fa09da378e48f7fe377bbf638c7a0017ae50fee6df401c6687ef7f0c3fcf49e7b4175d68b53c26561a91837b633438a37f276695a73e55557b95d6db403f57f3ff9e94fa3a4db991a6306a4d24c4a94561b524a9192ae2c90b096e2934ee6aaa557f2ff7ef35b7efdcb5fb164e1229410ac5dbb9e77fcd33f51575fe718f7007effb5466b6b6740739491261acfe65e529b0d1652295410d0d6dac6fa8d1b99366306cd2d99d8b3cd0aa7d28c422f8c8fe39b356b363366cc200cc3c382e00d054e3ef9e458959b4426d382311a15b81a8cfd8510121d3aa79f9e368587db30064140264f9a3ebce41c15b1cdcde0f35a212949591f702fa41d922a07911f81129622da9971ced9549c7804d2be8a128ea938b8584069a473f9f7ad2f2824e5f50669bc04e5e30323492f92f61407f9e4c7a62145079876948972904a0e76c0abe208fe5fddfff2f9156bf9f2aacd7c6ec506ae5ff353ae58be96cf2cbd815537ff98eb6ffe09ebbeff2b6e5af3430e860283c54a4987ee3dd9793e0cfb54b7d6d2dadaca2db7dc4a7d7d3da12b838501c696a7b9fb4777438ed496c459679dcdd2cb97c6f17bf8be9fbaf033ecae7339f7226697ede38ebf37281fddaf75e898dc6fff83fff7bbdf72f9d2c5548c2da3399361ddba757cf0831fe4d69b6f06e3bce7940afa947bf270c39831631c53914e82cd556bb5e6381c0d358cd65d1c2a9a9a9ab8e4d24bd9f7c83ec248856c6c5c65232ad324a564c992257f37ccce684d2a48614ca72d35091155eb18c0862acc66dd06a687e4e77809afa4a4b44786782811ea90300c1933660c3d6596cbb4b4a07c9dcac30d91f3d309c71e87d5d95e3500fd851470d2b129ae58f4194a4f3c02cccb9d1944ac57df45ff3f84c8f77bd282101dcc98f23ece7cfb1b4929c017b3b6427130ab78eaa5907f5ef62f6cfceebdb43d1df252c768dacd9164e53184f278da3996fffeeb011efb7386ffd8f59fb49b23401e81d6162904a93c1ac142e8698d0d19a49464b35932990c5ff8c217b8edb6354e0fef8f579494f0ff7efb1fd454551108499152480b81907c6cee5c7ef0831fc4b15b1acb134d8d5c78e1855dd262456ab881b8aebb4d98cb9461b5215d52c23f7ff18bfce57ffecc15575c413aedbc439b9b5b587bdb7a3ef4a10f71dbdadb72546f06217d1680d7218c8f9bc24b7811841464fac0f072d3fdf487200be90b965ae79061ada1b5a585e5cb9671c777ee70ef3ce77d1adf24503aa698ea6a97a3f57087c86367cb6d006d6d6d2e876a1e95a6b32b7a42d607029fbcbe0a941beb3ea8fde52076fa3d4114b001252184a4a8a8c849a6dd870380968c93fe7a62e0af259ce9c3b9cdf7673df4844e66e2e6c01129283de9282efcf8798c2b3d066b0e220408a5086d889106238873a00e37a20c33b9cc360a4150e141e64c7d3f41f812d2649152616c88b68ad6e70d5f59792b079ed184e228421120832217376a4158edc6d228a41a8d1529844a61ac4088008d40e7d18814c2f08f888fe7ca663b686c6ce4e69b6fe1ddef7e0f37dfba8687773a09adac2ccd0f7f7837bffbddffe3a69bfe851ffff847fceffffe859b6eba292eacd99469e6d65b6ee1fdef7f3fbb76ef42744bd63c304476376b2d575f7535bff9f56f58b468714c8c0c70db9a757ce0031fe05bdffa5697736d1f43170e6774b197e5a8cc22d551216cdab491d5abaf833e12e442686a6a62eb962d34d4d7f73a39e7cd9b97fcea75096b2dc69717caa7d22c2b4bc7eef77d611849b8b00727e1f574be90f0e4934f26bf7e4d60bd039a63d0c9a30e6d075c31e79e9ee7b5869470c289c7c58e198341445fa2bf3adb8ee220679c5ec2a72e98c2d8314791e265a4692735001bef90c2fa24fd6196401ae6cc9c82e220920e4f4921b48a2c29be7f772dedfa68b2e2485f81a2ebbd8b2ecc5a0e288d583e0cfb08190128e5aa1128977aa7a9a5856fdefc6d3ef9994f73d6fbdecf3f7ff5abd4ef6da0b8b484eac9353cd1d8c8cdb7deca6debd6f185af7c99d3de723a67bde73d7cfbd65be908b3ce8bd25741182c02a5983c79320ffdfad72cbd62a9cff6e982e32d960b2fbc8835ebd6627d2db9dc7a5eaf776607505aea555916f09b888801463be9de505355c9a449930882a0cf4e24b948da6c855264da5ab976c5f2bc128fc692d59a53c69d923cf4ba840a824eefde3c6afd6c36240c3541100c2877a4542a0edc2feea55c51636363f2abd704516ed1d27429798603033cf1f813030ed3186a441295a30532de401f73ccd1ee6ec5e0353f319d11ce960b86406479fb69a5dc70cde57cb0fa0c947d09c283ee377d758b7c5e93438d240d1442a0b014c990d34eade832068600a3dec08e5fede4bfffda489654574697136e61f1dea6c279a0763240e78d2aac6bfdc5b08f48543d21d42e258c9292309bedcc8fa935b366cea4bab2925bd7ace13def7e0f5ffef29759bb762ddffcd6b7b8f7de7b3c1176bbbe48772fa41854767b70035c5e5ece0fbeff03c69557800fd4559ed97dfa539f6257dd6e34067caaa05ce23c1008dffa82deeab80df4f7736121ae8587009b53f7cf409f6ca2da3ac72413bacae111067a7bc657c0ce64327cedda6b6255660485bbbf9231c54392fbf1b58653e7fad8c73c2ac5542a70751efbf02ef2c1681d5fb737896870129e2323f17b1aa42a4dfb2c4ccee9a33b9e7ccaddeb5068148616061d663136f4ce74839f9fc975aec3100998f02045aa83c0bec0673ef651be78f967291b339a14af20c5c1d72c5ecf18e7bc72fc31a379ebe9e39c238b7f062b246dcfbdc2cf6a7f49684781e8cc3ddafd5e0737877ac2f05c350759d3e138b2b00861b13a64545180d5593e77e552fee3fffd96b1e3caf9c4a73ec1adb7dcec978dc1981029acabe76584ab058574f5f142f77dbf6e3ff2223221425a2c2e15d9430ffdda4d209ceb7b5190c200175ef4d9b868a6352ef16e3e8261bdd38a10a2a00d3177fd465ea17dc540b383e783b30b39c611956f2262b07e87dad0d0d037095a58d225c5a4cb4a09a4f31a8b6a95f5cd4b4c766b52a6102260d7ce3a8c4f4126019150615754b84dca60208440ca9e6d4cd1f73d1d1f2c84903cf594ab2f970f51a88e31ce56dc5f889c4d41baac2c1ee5e446229bcdc67524a379e608554e4f619cf7a10f08b556e76576ee70f44b7d43544f2ef26c2c2f2dcebb3e24d0dad246a08ad003f05a1d72e432776148a524279d740208d3a738d142886c7111bd900aac0d09a47431cad2325a75f0ae379fcc37562ce682f326517c9ca048b5634c87dba46bafdace192f27410d1ec97764a5402ac37bce9a80d02fc7f93fc149784f3df32a461c4156bb301b6941e6a5135d67a8ab5a0120bdb4d7bff915a1ff670c018cd6fcf8c73fe68a2baea4b5b585f7bffffdecdcb993d027591e4eb864bd0a302c5dbc28ef00d4d5eda6aece851a1c0ec8371d068a542a15871d0071fe4fe3a53be3d586fb9b9b0a1278e927bc9492b143c07c9278fa996778e4d147ba38af9093a22e9b1dfef932dcb0d6900db334b7b802c749149f7c222525a5ae6ede0008bcd63ab6e3e583f1527aeb81b62eef3b295974df81273f0f0d8410086338f39def481e029f5b340c5d2dcd818cc770435bb7a106332015747f216c88b00791f62552e645669c3b99af5c7d31efad792be9938f20650f22097d51d9e11f2f6b2d68e37e53869d6a47afd6fce39fff4a8716042a455870fde69fb383c1d05fb100ac35fcfbbfff3b936b2621a5e4d39ffa34d65852a91441b7027fdd6d3cc9d65f2815a07588528aabaeba3a7918809ffdec670821f3141c7cfd2377114eac9c888a5278796227a4739ed8bb776f5e9b5212d1229a3061c29078a525b1a7610f32472a055c291f9c9afbf50e25154a2af6eedd9b37d59ab62e28dc1a5772abbfc855fb8d1f3fbecb313c0110021af634240fbd2670ef593276ecb8bc1bae1d3b76208420954a0d683c861b42088e3fee78acb5032a8fd45f74d24183244b600f52727c11f33efe11e67de223549c348a23822c421a6cce78f6274eaf37b82aef9dd75108acd51cfb86a3f3567378eed91762b613bfdf281b4a17c92d624d89ef72fb0e4075deff3306890b2eb88089132b638784a83a727b7b7bdedc68499179b0d03a444a495555952ba89807f50d0d686f73fc7b83f4950154a0e2f23591642144a75db4b6b6b64f81fc91f475ded4a9c3b2e3ceb438878e5ce22795442168f105665fcf08c310632ddbb76fef31555c4585ab2b3990f1d5c6d9087b630ed217c13d14124021448cbda7b5b763c776aca7173d49adaf2572cd058742c2eb0a573f4fe99751e665de795a09d72fbb9ae9e79c4d605e42da57bb04aa0f07f9973e11c889271e9ff052758c31d756fc5accb7a17fe2048c77bb16c211da7ffb977f7529a41034353761c210b4a648a5e298384157e78e587fede3f314028c25f0299722e4db112661bd17627979798ffd1b1b1bfbf532dc02353da6163bdc20a5c41a4b754d4dbc378bc6422a49edf65a8c71095dfb02630ca7548c7592484edc585fcfef0d91fdce78c28dbfd74c4e8698d73b7418d2e28b0f47cf983bff4a4a4a062cd128295dbca3b1545526f3d13a09726bed8e3e171316399ebc3dad9fc1c058cb8c1933e26be7ee498d81baba7aacb504a9fe071d1f0a44cc4e889e33db0c25229bb91112232456bae4db922c820e8e902f31fd9c897cedea0b195b7c04421f447815f74036503da373ad5b34638a4fca1b26119b54acedd3867aa8d1fd8e861891cac618cdc73ffef1f87b098c2d2be7739ffb9c5f449d4679e10dacd658171b96d3242efd5720241dd98e7882e189625f60ada5b4347fee40e3894454b9bb10a472b695dcfb38dc21bc976b7555fee0ed9ffef4a7e850f7b8cbce850e9d338f012a2bab5c0a2cef791815be1d0cc68c19d34dc203e22c3baf7708e9d4732d990cf7df7f5ffc9c22a7b4ccd4a953d1fdd880e44248979cfca4934ea4b4b47bbd4625e0befb7610a452fddae40d179472c57085509eb1baf245c6b898cf1174474fa61d499640858c561d9c3aee38ae5efc19ce7cfb388a5407e8f6613041f88dae758cb8abddb753a2b4d6654ae92bbd1e4af47f05f513d61ab4d148a9a8a8a82034c6eb799df7ddd5575ec5ce87ffc08f7e783777ffe02e7ef2e31ff7daeebeeb877cf35fff959b6ebc914f7dfc93545557238440f7b1c69ef4a97f440f15ae2550d20333cc8788512709f2e10aed63baaa2aab28cb9330b86ef76ef6eddbd7e744c55122688b65d1a285f13858ebd2ad0d16e3c68d7371917e4311bdb3bd7bf70e48e2391ca1fdc662ebb66d9ddfe90e378602d22563284b977549c5d657089f96acbaa626ef620f8d1b4b1d8671c69dd7125a1b264c9800fe9d5b6b91cad919376c1861784918d1c948c8d18645125fd87110a35fa1882cc5c7055cbdf8e39c5d751a29d581b09d01e10345415f8a441c62149fd825d59df7a0770c32b791f89cd32feedf3fe45b03438e48c2d35abbb43339ea102104e9749a4993263179f264aaabaaa9f4adbaaa9aeaeacab85555ba3667f66c2eb8602e37dd70033fbaeb2e1efae5aff8f6bf7d939aaaeabc86d25c589fdc75d7ceba2ebbe8dc8178e329a7401fb3712be924bcefdc79679fcae90c0443fd923a3a3a983a6d5aa7ca38e7d8860d1bfccebae78ae43da1349d66dad469085f6aa62f126221149f747297cfd1bcd9b163077ab071988701acb1714cea638f3e1a176955aa087296fd84f1e3fbbc09c985c9ba9242e74d999297b45d77fd7571bc58af71addd1c04ba7e4e1e75de79bd5c2f0fa48569d3a6529eee0c9591d2690f56ae5cd5a5efeb07fd1f87a1841096949271c58551f2152ef9d474ce3fefbda4ec2b281b0eeafebafa58146642279d743c81046bf387797545efd71a0892f374e81179de08c5ee5df52e50d993da4e89ccf80208490e9e7b219702296ad16725e094b1e5cc9d3d931ffdf007fceb4d37a28445094b90fb74deab47ca0029039a9b329d4e025e972dbd17e3cce933dcf5bd0a35a502242e4f1eda100897ef53188b093b387fee6cce9a7c164d99e678405da6834ec4ccd39f2f9442f6c38b2b2aff61adab069e6bd3514aa194caebf483d5581dba49a6c3d83b6b7275659ca3146f2bd9baa5963d7bf62164801401e4a967962b55a53d618a9e4d2158b078211a1738dc97c0db68479a84153069520d95e3273a312407cb972fc75a57113d8948128c25429da5ac34a770acf0cd3ff9f8f1e331fe1942ad0bee58a3cd80b3db5a264e9cd819d094f31c56476addce7bcf673389722f462a9fd5d77f1dbc6dcd558976983fef5214a0a4000c4282a1fb86c21a57f74e49850d0d01969a0913a8aeacea7cd7d602923d7bf750bb7d3ba171c427b729a27a8b7efdd2b9863ac986ec12d0257d857661b58b418b9f373a27d91c0dd0260bc6d9fa674d9fe19d3ddc4bb012da9e7c8ada1ddbd198b845f9575f6bc4f337924eac240c2dd9ac462a91905c7291fc9cfc2edf39dd91ebdf90bb8e3a3f4b5f66c9a08485f02041f82253de7b26179cf76e8479c5e56451029405297a9dfff9e07ecb554110c6a2a4a4f5c9a7b042c50570ddbd188e3bf6182c7e7e44e8d14b339a674387a1bf621e44e5da9b9a9a683970a0c71c790342ce8203983b772ebf79e8d7ae0a401e09c5f89a6f994c86ddf5de153be78652a91435353554d7d4c43b90a85a7718ea38f76436ebbebbe0820bb8f1861bf9cc859fa1a9a97bbd316ba0bcbc3c3e4f78354d188605bdb87aaae3268c65e6f41931318d184ebef24442b804c251250721042b57aea43c5de654cb7e5db5b4b6f2e5af7d355e627d9df4d133459b87f2d232962c59e20a74f68120e563304a3ac7a473cffda8f3c8cc51b5eddebd9bfbeebb0fe3194a6f10d6d5328cecb5f92456e16d094208527dd880585f97ce68431004cef01edd87f5b6668fcaca4a52a9541c07d7179b49737333abaebb1e72e20d8d319495a699316306f8101e61f3671a89ee4f1b8d522ede72fe652eef68f4fcd1bc5eb17c459773870253a74ea5a8a8c86dbe0aecf62162140e7366cd6252758ddbbcf97b95c0d7bef6b5c336eeae2b24d60a1effdb138c1a350a99a341ca8f24831b4eb8b914484b91d41c3d2acbb91f98c8f9d33e4011af1276bc82f03957e9c7fa4fb22777bee4f9e75ec668ff6dc4f430948c3901618d2bba9c6fa73bccc8474f870552489a33cd7ce10b5fa029d392c8849e1cb6a8f501f18ebd131515157cf35fffadeb971ed65ab2618854927beeb9d77de9cfd7a146632949a7b9e1861b282f2f779e7352101a834c294263088da67c6c058b972ee586ebbfce9a356bd8bb772f993c6ef242fa2c29d62283c05fcb957ac9cd82d157443bf039b3e73079f2649472c67ddd8b0ad678fb662a15505d55cd05e75f101fb3169a5b5ab8e4e24bfa64032d086358bc60118b172f769e955df7237977a3b950088485ca091399337366bc41c06f982e9b3f8fd033526b6c67e1cb3c0d3f5e3367ce0472350a9d48a74b497946647cadae9eee0d6fb38c60adb737f902ab4811a76a134a525252e2364bd23965e56350c9b8526d2d3beebf9fcd77dce1a4bc50bbe711824b2fbe9892d2127447d6d98ef3dc672ae1bdb868d12226544e8c3f47e1408b162de4c081b69c9e4383891327c689bd733538f99b0b2257521148c9ea152b31febce8dc4b2e9b4f7d4383b3931f8636db78c3e625142503ac543cf9f433aebe2749a9b82ba20c337dda1c0c04b653cac2cf594b88312145b28359e75673fecc777344910693938e4c188c1cc03d5989d6d0f6e4b38446c4aaf088819efee653918408ab09fbe8193c94c8ff168610113f8a76fb3b77eee4e39ff838b7dce6aa250c6048fb84c993275393a3c6c985f26ef9f76cb9972db5ce51c0e494c909a4a42c5dc6f7beff7daebae20a6a2aab09a4245d5ccaa4ea1aae5c7a05bffdf5afb96ae9e5fcecde7b58bbf6368cd66cddba25f14b0ea5a5a554565661c210615c40ea154b97f283ef7d2fd9b5202269c418cd75d7ade6e4934ff6d2679837534dae54397efc78366fdeec766240680c4d2d1996ad5841634bf380098a3186d6d6561a1a1a1cb102962c5aecead675df8f744192215a6ba9aaaa64d3a64d5dbe6b6d6d65f1e2c55ddcd1f33d6f1213264cf04e10f9515a5ac235d75cebaa72e430a49e185f941d4208c199679ec9942953b0d6a91123440c3a9d4eb36cd9f258c5d8d77c98da681e78f041bef39d3be32af000656565dc76db6d94a6d3cead3ccf0627576b505959d5adaa446b4b0b0b162da4aebe3eaf0664b0d8bb772fe79d771e975d7659defb4b422949baa484db6fbf1d0097f4cf9db76ce50aeaf6d4030cc843f5d0c231352b94f32a45a28dea65f3def5fba17f133d4308819096408504bcc2791f9cc4ec291f203039717a030cecb6d6194a9e7fee656cfcfc110cc26639e1b8a3095232ef0670b821d263c775999585885e2e51e8094238878588d04aa990be7e5ca89daa4b08f7c0a5e95202a1282e2ea6bcbc9c205094959521a5c25ae376804a628c65ecd80aa454949797515c5ce2fae78c6744dc8d3148043b77efe2c28b2eee7532558c2d63e9e225cc9d7b7efc6ac284c7674faffdb6751b58bb6e0d61364b904a3166cc18e6ce9dcb95972fedbc8676f9ef9a9a32ecdebd9b679e7e864be65d4620e10ff5f55c74d1c5c9cbc6e373d5d22b58ba6491fbd2ab738caf13f7d98b2f62faac995455d6b063c70ed66f581f13e35c5b9e12aeffa2458b587ab9ab0611a91f77d7d771c9a5f3ba309cbebcdf0863cbcb79f0fefb30c63075ea541a9b9b282f2f67fefcf9cc9a3d1b81209369e1dead5bd9b061433cb78c364eede6efd3faf2385229962e5ec2a2058e4877849aa240b16edd3a36debe390e4aee4a46bbbe9dd27429e9d234e5e5e54c38733cb3674eef72bc27b4b53ec9ba4d1b686e6a62dfbe7d18631141f758a5d2d252aaaaaa48a7d35c7af125a47c95521dba60fe5c226fb48b8f6a7db28d07ee7f80e6e6665a5b5ba96fa8776b2427b173845cc22e2d54574e60eddab59033bff73737b164c91257cd42a5e2e2b0d2073b0b21983e7d3acbaeb9367effc657b79f31637a177595cb49db33ac4face9326ab87baa9a38914d1bd6bbb9123daebfcce6cd9b01b874fe3c366fdaccf6fbeea7a9a9291e97482311b519d3a6b27af56a648ef4d9dcdccc75ab5753bf770f61d83bd3ec8bdabc3724df6f128598b691ce6e17d58513c2a2cc0b5cfcf1f7f1fec96f45861d483a37218eae598c761a9f769d452808c025d7c76b1be2f1ee89faf41139d21d90e335e9ae6f34101ccdabf608aebdeedb343d1d129a235c3c9ff5b5e97268424fe311dda508026cfb4bbce3cd257cedea79a8f01994ec00a1d12205a963d8fcfdad3cf4f0ff9015477663aa3d5d3f425e3f851c749b0ffefa512ece216778810ae29db71012e1779146385bd6f973cfa7aebe9e9dbb7701b86289398b5c49576223e2fec2abf022c906bfb30f5440717131b77cdb7967e207cb315877bdfdfbf7f3c10f7f24667811c1c845a8b30481e2f39fff3c8b172e065f1a2886c61558f4b768b4731f5fbf6e1dfb1bf7837413157ffd71e34e61e6ac992cbd7c291267c3cbdd9c5ae32a365fb36c193b77eeccab2bef8de1452ab30f9f7b0e08c1cc99b359ba7811fb9b33d4d5d7b3c7ab7fac71c1f55513c75355551da7ad52089a5b326cdbb68d0d1b36924d78e625c7271f84af54515353c31db76fa2b6b696e5cb962195f20e1092f2d25266cc98c192458bc96a4b4b9b9300f7eddb4753531399b6d6d8b65b515ecec489955c76d9658cf25e7912c8b41e60f9f26bd8dbb0c785b3042a8f54d275c16cdabc99ea891310eed581df78448c3e793680b5cef909ef2cb262d52a7efef39fe795c8eaebeb005040d64220dc6f44f334178e8077ce26e15bd5e4b3e26b27d75b529251c2922e2e61faf4e95c76d96568ff1c4d99661e7df4316a77dc87b1362ee574ded4a94c9b3a958a7429c6df672693a176c70eeeb8e30e57f9230743cdf0962f5fce7df7ddc7a2cb9770d9a597d1946961cf9e3d1c387020667c2525258c1d3796f3ce9d126f58a377be61d3266ebb6d0d3208627b506fe846e0fa892161788034cefe2b8420302f33f3a3e339ef43558c125914ed5d4fb24ef2d1169e7de9058e3ef6688aa44561b1ded613bd967c5a867e2397e925185e2a184587168428da9e6ee75fd6de4de393afa082a338d8ae29eae2f9d7f37844bd0c909221817e897f5df5454a8e35a46407c633bc502b7e5fff6736dcf5f3bf0f8607ce553f9bcd628c6154aa88c9932773d55557525555455326c33f7ff9cb3cfc8787ddaed4767f081d8614151511ea1025532e1596b7b368ad9d2380b56813323aa5983d670e37dd70a3638ade93514a49a6b585f7beff0379895c04233db132968a8a0a6aaaaaa9aeaaa2a2a282b1e3c6a143436b6b1b8f3ffe375a5bdbf8d6b7be859482a251a3c8767420bd7d262254420a4a4b4aa8aea961c68c190422a0bcbc1ca30dcdad19eaeb1b58bb762d5a8758e9323224d11bc38b32d97ff89c739c57a80c28292d65ceecd92c5ebcc8a98f3da1ebf4fd73526b5b5b2bb7ae59c3fdf7dd17a79c8a4a7444e829bd558488d94925a9aeaae6baeb57b375eb962e315241a0e8e8704901cad2154c9b368d499326316182cbe528fc3d653da389fe2f0564322ddc7ffffddc73cf3db4b5b56175d6d700f31b1aff1b9d04a1ebf84d9b3e1d29042dadce9eea32fa436b8bcbcc929c6b81729239fed9cad265d4efdd4353539353cf26d6d7f4e9d3c9b474d609543efd9992926ce81c99444e369274f958c03998141717238460fb8eed5e25e96c9cb910399a05e79862b1dad5411b5352ccf8f1e39932650a932babd158b41504c2119a88a10234655a78e08107d8db50cfbe47f661b42648a5e8089db41157ded0bdbfeffe32bc55ab56b16ddb36ac74e14653a74f67faf469141797a08444e7d83203dc463693c9f0e0830f72db6db7d1a1dddacfc69be6de1d89ba11b87e62e8185eb4d220650ff2f6371dcfd54b3e438a1750bcea7b7b1a4111465b7ef9d07ff0c7fffb3f2ebf7c31c2bc4c51a0306107208796e1e545e4f425417a7aca681a9f6ee796f53f24f374079aa2ce8db67ffff10629b2f5f9f517f9a41b24d26429b207f9e21517f1ae379f40913888111a830291e23fffd2c2f537ff84501dd36d7c939f9348aedf24bacd87e16678461b5410608ca6bcb48c8f7ffc635c75d59518037bf63430f763ce61c21a4b30aa089dcdc649a3b57106ec508748a90894a2a3238c195c2e1c51d160345249eefec15d545556393b9ced5c80a7bdf92d183f90324fb0b9c6a9957487abd127852015a462a92d3756cfe6488811414b1505eeffc6d7ecf305378590082908b39a2048a17518977a09c32cd6338e8898e7226278575e71059747151d72243c630c1f3ee72334663228e9ea035a6b294da75da1cfe2622a2a2ab0d6d29a69a2a9a999e64c73fcfcf133083721fac3f0220718a2f108bc9ac67b81761b2323bc1d4a525e5e4eda7b4c1697b8508140289a9b9b696ecdd0b8bf311e3f23605490429bcef222d217fea5178607cee921d49a402934ce99274aaf957cff8108904a928dfa7b09329a2f498213795a460b4bf9ffdba872b9cf6c127d677d68860e3545454568e3aa17c4057393125ec2b146e4b8dfe75eb7284851525c4c49ba9c92921267476d6b430a415d5d5dbc31c9dda0471238d1bb67e819de8a152bd8b16307a1751b492bdc5a4d97a629292da1b8b898542ae5a4fc4c0b99c6269746c5916097a9c7d858127d7d313cd73f105952e645567d6d09e52706285ef6bd9d77af94a33014f1e0cf1fe2c9e79ee1939ffc388a83603a5ce81338e600c83ca127fd43343ec975e2c75c7b1a270cc8516419c5969fff817b76ec02750ce100189e3521472ac3f473263377ca448ac42be0199ed196501dcfe756ae2573a0031174b515161cef02c7bbcd87a1667889f90edaa07cd1d7bbeffe11674fae89d57aa7bce9b4f8bc9e34297d356446445e2ab7082755d770d75d77410e517e78d74e2efc6c771b596f483e5f21141aaf82c8e339688d414827e125195e44403ef8e10fd1dcd2d28521f705859eafd0f12406fdfc09e493787351687ef4fbfe0bf42f743c89a11e8fe1466182ef9ea747869743500db072e56a6a6b6bddb97986221f418bbc4dad284cd092e846e0fa89c2cfdffbf124e10750328b1007f9cc9c73f870e59b2812af3a9bbe4f1c604511a11dc50feefa3163c69cc4391f793f4a762085752620dba97529c8f02275a5d04067b1d57c1bc1bcb0ce5702611004682b09d5b17c65d56d649e3e88954738a6279c07b38ee64382d1e7c25a1707fdb653c770cd9573182d5e8cbf973245bb3d8a0d77ff82ffd8f9df1802f095cda193a1ba3fa6db73149a1f3dcd078b7b57ddef7690903ec3c6dd77ff88c9936b00c7ecfef92b5febf1660603e1d38aeddfbf3ffe2e9240325ead3582118c6078915cd9f9985d4fb04358dcf870407b68c81ac9ff3ed18855a30095a3c9318eb1cb14cfbdf08aff4a237129e0ba39990c3324a0a244d74213284b605ee5734b2f267dd2516873308e97eb22a4f4c050a30d427ba8f9d35ffecad3cfbf8491814ba22015d68658d3ce196f3e05290e7649cf5168f33128441bb6e4f74381b3ce3a9b49936ae2785c80dffffe777dcabcd15fe8d0a9885a7df6fc68c035965dbbfe3e120c8f600423787d402ac9a8a22310a4a8af7f8cd6a79ec7aa22ac71a6122b03ac1108523cf5ccb31c73cc3148e924a882d2641e18a95d136044676574c891fefa02ab303886246596f4c9a3387bf2db50d6e57445baba99ee777cd84e0fd21dc0a851a3102ae08f7f799cd0a6bc6ada20040429c1a4aab75172d2b16eab647b8a554c7e1e3c86fc8ad65acaca5c56f6c8f30d9c3342474747e71743882050cc993307ebe3a18c31343737b3658b0f2c1fc10846308243041d1aac55644349ddde3f12ca23b052d1deeebc358d90582179ee859738e1c4e35c9a38ed7c1106834e7bb3bf4e2271734f3039d29b1081cb73a90f72ee07cfa2f8a4a311b61da944ac4e4cdab573a194f3c130daa0ade0cf7fdd4fd61681cfa76cadaf86ce414e7f53692ce10d84d90f04831be13c104270d6596763ad73f18eb498d61a8a8a5c42dca144e4aaaebdd3840a14524a36ac5f7fc80671a8e10cf78e71c71002723c00f339bb0c056c4e8cd4eb75fc46307c1042b8b45039197072117d37d0f92385e8d20e7bc4d28943948040a090ea481edef50899b6e7b104a8a08830abc14a9f89044acad258e39cdda224e2fd4124d1b9807113c72d3a07a7c2e31f53981ce628ad4459c36801ef9d349e940c31618763c8c2d9fbf2c963f8f79ef2ce7942a4f8fdce7d3cfddc2b84c62514504180093b48890ede725a395278a7b23cbe0cc38161f995bffded6f48e96834800e2d93279f3524f5d19230c660b4e6fcf3cf8f17e1eeddbbb9fbee1f25bbbe6e60bcd34aaa870d82b596d29292d79d83c4085eff30c6c4e9cbf239f49497bb8a2132273dd83f2a0c92279f3fc89fffaf1983f33e955212040a21038c81a38e3cb233c6b70f0caa274481ef2a75048694732e917d28922b741766e7ec688e794ad1c179e7be8f938f3d0285af47da8f5bb4488c1cc5fffcf509844a910a5284d92c522902a1397bd2044e38e10d18db8e450feaf9fb8a6199917bf6ec4102d642a8352a10cc9d3b67586c78005ffcd297a8aeaec65a4b5d5d1d9ffef4a709025741e0f58688880821e2f8b024a49454d7d4fc5d94c719c1eb0bbdcd4b8033cf7c1781cf3893f5317fff9088dcf8e568ea1afe1ba385afd4a20843cd934f3e890c94ab528053f519ed994f6e2b0043942b53814d913529428e447324da38bb5c6f8872794692a2119d76414448917895f79d75268a90512a9523d13aa6580856a4f8f35f9ec01a41181a40a23bb290ed2040932e3d9154ca690dbaa26fd7ef2f869ce1596bd9b97327b7deb60e253a33f8d7545673c5155724bb0f1a175c70014b975c8ef5f1479ffdec675dac9a70bbd1c31dc984c7515916ab35e93c055a23941417bf3e543e23789dc3eff63d411442c4f3d2a9ccba2ab722092f90328eaffd478515101ac97ffde9ffd8d9f05f1c0c5d0e5c6b439e7bee398e3bee38972cdde7f6ed8b0a321786149622b2623459469315a3d95db78f15abaf63ddfa8d98fe7a3d7661b2064116653b983ee5038c39e10de8f0d5ce308c3ec008498716fca16e0f4f3efb12101004a3e234934a40e599ef00db8eb0216a3835025eedacde70ec712b73bfcfa7a6c845f2b8f02d8231162b2cfb9b1a79f3e96fe6947163d11d9ae34f3c8e8ab20a8e3bfe781718eb3a636c0858844f342fbc2a54082f22faab0b21e23c7c00e9b232366edac8672ffc2c59ad59b3762d5ffdca57d1c6ba7a7bded73979bf8530dcfd935012022511588475464f21a0a6aa8a2b7c7a32e83ed06f7bebdb40c09ebd0d18e36a6f4929b0be569acb4ed3dddfbbbff75ba87fa1e3fd45a1eb153a4e1ffb44e84bdfbef489d09fbeaf05acb19d19bb0bd0436b5d350a97b3c7a2a423d82b562ce7d8638e71aee6fe79a3e9f986a38ea6644c09bffded6fdd35a2947639257f7a83f1d974fa707b1e7debd52306797acf106e40ac200824edd9834c9c381e29438cb1ecfbaf3fd3d1dec1e4aab7836e77e101b959767c33282c8e3e80aba6610144406815edf64876d6ff910d77fe989fdc53cb71c71ec5e4ca09bcef3d351c314a1108d119e8980702ebc98a1b71f7d97d27703425abe1950ecb9ffff237ac75f7d3d9ab370847c24dc8b8d2e31957518eb5da79a522302245bae24d3cfc701ded59818e3d3573afdef5377a7e9208891e56fa77e17e73d00c2f092105522a5e7cf145eaebea78e1f91738ebdd930178c3b1c7904e9771c61967f0e28b2fd2dcdc0cd231a5c03b9f48e9c45ba57c4ecd28f38a709fc78e1dcbc5975cccba75eb195b56c6eefa7a3e7be167f9e52f7ee974c089fb2b74bf490c77ff24548ef1dfe596b45c71e5952c59b284a38f3e3aaf14677d3693caaa2a4a4a4b78c3316fe07ffff77fd139f5faa271948940eefede6fa1fe858ef71785ae57e87884c3bddf6b86c21403fc1c737049e09594949496f2ad6f7d8bb7bde50cf00e26490801679cf116ce9b3295638e3d864c6b2b2fbef822da982e1bd69ed0fbd17ce8ff195d30c8d37b8720f049389e79f6394e3af1782ad227901a95e28f7f6dc21acd996f3f950097922e1f2c51b61fcf0c9422b40a111cc99fffdac8f5377e93975e3ec8fbdfff7ee6cc9949f5c47732aea284a38e1c85901651502ddadb0058b01621146f3cf57476d5efe5a557426c0135692eac94081b72fc1b8ee05def7c1b5274207d80bcb00a2124fff95f7fa4e5a917d136f08927a2b1e83e26bdddad43b287bf8667fa83ceb492840e5dce3e704995adcf51f9b9cf7d8e0be6cec1185715195c058187773d4cdd9e3a9a9a9a5052b27bf7eeb8606749499ab3279d8d10829a9a1a2a2a2a48a74b696acab065cb167efad39fd2ecf31a464c20897cdff5867ef72f305e85e02a5843557515dfbdf3bbb1e15609e9f26126372c9ea7c7bc3de7e79b32ae00eda5975c4a535393bbb7448068bf9faf40ffc13e7f1283cdb4928b42f74e1ffb44e84bdfa11e8fa1465f827b739992c0b0635b2de9b40b35c28f4394ccbda7318964b9a8d8416b4b0beb37ace7be1df7e576eb86fe3a2e0c369945a1f128c4a00bc16a57693c90863127047c6ef11c4e3af158eefce17d9c78fc71cc3ca7922291482e9d845548a758468b00cd68eefbc5eff9c52f7fc1473e7c36e77df44304583059524afa747caec06ae1f1e9fdb8d1a05247d06e46f3dd9fdccf2f7eff17b262b463c2c2c7d0f502a124bae3658ee0456e5afd45ca4f94285e75a119a430b688df35fc890ddf7f9057cc1171b50887eef756687e747b5e7f7f43965a2c09255de2e064a91480b165e58c1d3b8eea89958c1d37d6e9fba5a5aaba264e2aebfe75a2b13983b090c934b37b771d3ffbd9cf686e6e760b4e75bade468b2ff99b85ee37897ef72f305e85e15ec4a44993983e7d3a42080e1c38d0f95c79823b8d3104be765f56674997a5515221a44b507ccd35d7d2d6d6ea5448ffc00c8fbedc7f81e34914ea3fd4e331d4e82f812f4b97b06af90adada5cb1d8e6e6e6f898816ea9ed8c8972c76ae7dc229dbda6a4b4948d1b36b067cf9e2efd932844d092e846e0fa89fe8e477f21ac444aebca9c99e759f0d98f52557926b7adfb01a7be692c33cfa92215e7daec01beba8221a0ed9997f9e1bf6fe1c9a75ee0139f3c9f334e2f417190d1d2d958b32644ca94cb68d28310d015bd8f9f1001da0a8c953cf6d727f9c69a9f92e5e8bc29d5f2416311ba8351a283cb3e35950f9e7d1a29fb3246b84ae8a11184ea78aebef616324f77a0642ae15ad2f5fe0acd8f6ef361b8195e3ee4bab226099af0052ec78c19839082f2f2729a9b33b4b6b4106a8d149d018fe4217885eea7d0f124faddbfc0781542a19febbae3e98ee84546e8763f230c2ff95517143a9e447ffb2731d4e3550885087a12dd08bcc85f593d42a1f242ddeb41f48e42042d896e04ae9f28343eddc6a3007aebaf3848e909014b165cc6daf59b9971de47387be2b85e199eb6162b2482d1b43df5122b6ebc99534f3d95ab175f4491d458da11d674c9b9196542e91b0a8d9f634c46408738862faddc44cb33ed64b30629836ec9cf9308ad4b602e4d960fd4bc9d859ffd1045e26530d669004540873d927f5dbf8547fea7096d52d82e346068195eefd465085068e0b53164c32cadadad343767d8b56b178d8dfbc98659a470e96ce25c7b91f7654e1bc1084630bc88d65fbe3682bec108d02220f3d48bfce5f1169e7de6794e38ee9882f41140a8d15879243ffcf72d9c7aeaa95cb97411d2bc8ad02fa36cb61bb31b72088d44a36cc819a78f439a6c5cf8b8108470341b91e2f7bbea696d7b8ea8cca4362168a7863ded94344ae87e79810e04c3cef02224195527c3322829d0261bff3f6ada64bbb8ea776615e86caf772409489298b8ffbb5444dd5bf26a2318c1d0221936936cc9399b6cffe830423af51dd295ce491dc983bffa2d56594e3d6d5c41022f650a6d24db7ffe5b9e7ef605ae5e7c1141f61957c9be4b9cb1e92a0d5985ec4f2ecd1e917b5dc3d993ce24a53a10d2924a15bebe54bea8371619a4f8d35f1fc7aa5108a1189d2a424881b09a334e7f23d2b403c6fda28f0f1c6a1c3286d71394af7116f85459c65ab4d1716dbcfeaab0fe9ed055b4ef097de93382110c0cbd31adde8e8d201f24a10e687dea5974d881d5bd07e61b14468ee2c0532ff0e003bfe0931fbf8022992525b204aae7745cc32308b81c986f3eb58ce2138f41e234738510660dc6db12b35af0e7ff6b22b4a3088d53270b2110c272c6a9e3283ec95db7d0266030c83f62438842aa47970253c67f412244801001e61f6045092b7b6951af6897956c11dcb8397d7ba20d33a2b8a09eda50a3900ebfbfb0fdcc1ddadffe4958e38b05fb365824af976cfd41dee7b1d2c75db966ac885b21fb9d4372ce766dc617ce8d5a21585f10376aaf2f488450480b279d78bc53e181734a895a0c831592ac1ecdda75b773ce87cfe66da7a7c166bdf76588d6b9c9f8ddfa8f999dd0989c20f29e5b0eedc8d372e9b7c010e883bcf5f471843a8be843b2eb14129175b65e83e477bbf6d1410aa102ac142ee7275902d5c19bdf9446892c41944c5b0e7de282c2773c821114405f08d550e250ffde3f02f2323bba9b20926d04fd85632425279fe4abc9f4ccb40d9203cfbcc8332fbcc2f4f3cea548768070a69fce56087de9d357189430bc695c9a40f4359355c43c9d7ad78a144f3ff31251fae998998a0edef2e653c0b864d242ca61a9ae33c2f046302438d44ce850ffdedf337a627623180a74654ec2581482379e5286904e02cbb771706efb01bbf73cc21b4f3d0d84c1584d605ca2e843e5c3e07e2bb24302b68374c949a494f3ab288c1cc66c254205fce92f7f4587c685b0a828c1b5a178cc49082908c310a51445452312de080e631c6a2674a87fefef1123cceed0c195f071a11e278f391e4498d75ee512423bf7fcfbeebb8f534f3d95941231b1ee2d4c64b821ace6d453c671c209c70d68fd19ed623765e01269b7b7b7a3b0eebaa7be91934e388e402ad0611f25c8fe6184e125304200febe30589b5b210cf6fa499b5b7f5b7f31d8fbed0f86fbfa83c540c66fa088a4b1a24022b19c78fc31e03dd373ab2364b5464949d65ada9e7c9aa29460eab91f4667dbb1da79ad47c827190e2b8446088b35ed080c52b84aedbd21f2d68def5b05fce92fff0b38cfcd4082b6591f4b18020621bdd3e23070f61186970787fb421dc1080e771cee6be85032bb5c58abc174f0c67115480c2227860e2048a55cb694a0887dfbf671dc314722e8f0a15a2a6620879ad9c5a1604aa002c9e9a79f82351dfd54ab4a8c86679e7b8183d90eb40fc893368af5339cf1965391d62031794a060d1e230caf071cee0b760423385c71b8af9d43cbec72bd1e5db0f509271ec7a8944b2aedd049d85de99c145a5b9e7eee1926554f40e8571da3f47d87233ead272419abd14e3370fc71c7f8e0f3deef2579be0c52180da960545c48185f7e2afa7f74cd546ac486774871b82fdc111c9ee8246f7f1fe8cf3ae84fdfd7028796d9754d902130089ba5a67a02c26a67d0ea42ecc16ae7a5880878fae9e75c064d290894421bdde93cf21a40dacef77be289c7c64e37fd81ce860452224c547a8a78b5080b279f700256bbaa39235e9a7910bb470b1fb0280c73e6cee6fc39b3396b728def25bbecb33ef1b18f3167d60cce9f3b3b71b5ee105220a4402a979c79eeec39cc9d3b97c9674d46f804ce871251507ebea0d37cdf45b08944b251b6fbc1225675440542e9dafa8bd73ace2a69e3d2748e5b4559393367cc60dab4698c193386acd12e260af73795524c9f761e33a64da5a6aa12e25d79cf10d2626c88fb25779d74ba8479f32f65f3ed1b59be7c390b172e249d4ea33d313c944c455ae75918bd5f13865dbe2b8cdc9597af1dbe189a71cef15204b01d04b603292c29951337171db6166b5c9e4a572fc5210c2dc6ba6c535dc7cf3815608fcd7959f6d40a21f7fe8c006335a1cd82753636917c8004720fcbdc0c3dc605adbb79d51983289171bed94e0970e850f88913189a49307c284b9771e38d37f28d9b6ea0a62662785db168d162feed5ffe95b9b366171c80d841c01acacbcbf9c6376ee01b377c9daaca2ac22829dc2184922aae241d65301042a08d2674d1fb5d1011ebe86f443085107464877e07f5f70621dc86c76ac379e74d61f9b265ac5eb982b1e3c6a272523b19631873f2c9ac5eb192152b56f0ce77bed32de62e57eb8e683d45ef71c1fc056cdbb68d850b16f2ce77be8be9d3a7317fde6508210872543c8782f1e5ce156b6d3cbf7481d2407f0f18aab18d083c80b486226139edd471a0436c9ef5aa5400c63a56662d63c69462707330179d7190bdcdb0de8e0d0c424994549c7cd2c903b0b119460592138f3f06216cd78d40d4c3b882014335fe490cfd881c0650a2b36c503e483f797209564f885c638d36e83027496b2fd71f4e3809cf106a4d7979b92bb1e419616ec5e45c08e1aa50949496228420d4212a5014a58a925d47904098cd62b489a567e3895198759b1d6b2d4190eab6a1e86dfee583b596caca2ae6cf9b8ff245b26ebffd761e78f0e72c5bb1924c4b06a3bb339a81fc565f1131ba88e98dada860dcd871285f647838dcc60f070ce57876e61475daa7934f3a8637bdb11ca970aef9966e929690028c66cc89c7f33f7ffa0b56387566904a75dac472a4a2285f67f7e6421c7a6bfd45c4788f3ffeb8be8d93d7ba596930d2900d5fe1c4938e4148772d9733d325a70678e6b9e73c1b94d8619027f253c802e8d383be46105260bd1acae4d94119e36a531963d0798e2711a452f1c216c2c5c2448fdf1383194e0821d16148755515bffcc5cfb9ff8107282f2f8f196112c618c68f1fcfcf1f7c805fffe2e7149714a3a4c268f3774bb08612d257e9965220a58a994d900a30c660ad250cb3f1f711438a72c31682318e995a6b99f2d18f227c0db1e933a6b371e306965d7b2df7dfe78aa6e632d3e877f231dade5a7f21a52bdf65ad657bed366a6bb73171e2c4d76cc337dc18c818f5159290138e3d82221192cdb67b09a92b0dd13a74e9b6aca5a2e2140e3cfd1c88511824ed878946c65857bdbe4fc861e6cefb32a4a66a02d2427b7b54f8d65540b7025a9f7e9ad08294015a0f3dc71b768a9d5bdfcc5a8b92d28bac26764bed0d22a71e9e528a5087dd76b9b91071115997a72d1fa494bddabb72616de7ae3a5a0c42386f2aa75294718ba440255de9fa8118c88d8fc389c62837cfa0b196402954102095b34ba6fc30042a20c8330963c288cb6d19a82026627d41643732c67453abf405d1185863d1a146873a56c90e15c2308c6d9b7d45a496b3392abb7c73221a2be3eb7709e1ad325eda2a0463ba339ddc66fcba9052525d59e9c61941a62583cd19efe8f7a492485ff8d85aeb36787e5ef66503a3128c5826f22126ef0f3f878a8b8bb19e60586bfb95d43d9e83a2338b467fde9714021d8618ade3b5668dc5f45ba576e821bc46c5d9ba0c6f7bf32948db4e2015522a206a00ee1d1b6db1043cf9ec4bfce5ff9a697bfa05a41c4551aa086dadf759f0b17b859013e397b70d10c618544e01eedea035044282d5149ff4068a4f7a039890a2d4688490c8a00883c28a147ffecbdf10b2082b40256c7843b1c9eabec2871891e38110d2bfe04ece9e5c7cf9603d931442a07527b18c88c46b0d1d86f162c413c8c8bba82f0c225acc91938690c2a92cc310e5c72b17d9308bb586d292d2d81cae8d419bfc129b9492f2f27242eb133ae7216885108d75ae4ab73fb0c6116629252a5064b3d998700d16c657dab0c66d3e0a219bcd12ea9040a978bca2acef7d91f887032651b0f3d147f6f9c4badde78fd1868e0e77bf8e38ba67e8eb7a08b35942ad518193508d7652aae961fe4473249d4e3b6697ec5000b99b8a6c368b90ce761c6d0a0b41464c3208dc7bf6ebc418d327faf15a23a205d65aaccef2c6716528a17d45f2eee31d3180a79f7f95077ef17b4273047fd8fd18a1714e2b878064f70a212452746e020b414a49a014d66a021972f6a4332912daa934bd6f44369b0591a2f5a967b1042ecf6642cd3b14cc8e43397ac6688c57bbf56561e62222e8eeffce43d1f483600f27a21d77f47fe245ee88492174747474f1468a985c2a95ea71071c118a80ae9e90f9086434469124d85f28a5dc780fe0bd8153094675bb72ff1aadf3aa9cfb0b6b8db36f7862580841103895ae716a192104a9c08d7fbef13b941016022909fdc622b21326316ad4a878aea9204005ee39fa72ff2a70b65ea3b5534b198b44c4ef39790de9d5ad2a50440a3821dce625d9371fa27e1d1d1d5d36263dcded24b2d96c3c5fb2de9e6ab42148a508b385cbd3bcd6084615218380300c11124e3db51ca5741c57176d5aa30d8fb521da0afedfae47d1f2688c389a9ffff2773cf3ec2b68637116640797aaac501b5ae830c458c3534f3dd527faeb3c9935d2b6f3d653c7326bea0711e64552ca49bcc618904518465357ff5f71d845a753ced0313b0e05c35348d2c5a5bc7bf2d9cc993d874993262195574bf48140a5cbca78cf5967f3b1b973f9f8051fe33d67bd1b612d45deb6228c6bd608ef4d6971ff1cd3892419a792eaae521a0ce25db936bc71dc29cc9a3e839aaa6a9410a464d0f71da8b1d454563377d61c2e987b3e93aaaac058546eb98f1c58eb984f56bb83d1ae37dff348e5243c63ddf63cda28d83e96632919338669e74d65fad4693d7abdf6061d86643b3aa8a818cbb4a95339f35d670e09a38b505e5e4e755535d3a64fa7a6baf0fd65b35924028ca5f8e493a9aeac64da7953a99c309192d29264f7bce33fdc10d2496ef936184e2ad384d990e292124e3ef964a69c732e3367cca072c2842ec559f34187bacbf34f9f3e9d193367f0ae77bd2b96c6c861fe91d4972e2e75ccce138d7c732d1facb59495a6993d732633a3f58120103d3b59e54208117beda5d36966cd9e455575757cec7087b516ab0d4a094e3ae13846a7029774d9d322c097f271ce27210a138ca66ecf6364ed28b23620b42976d63d06c1d131c98ef3721e6228215002941239c1f03d4018b0596cf6154a4e3c922f5d3d8f40b4a394250cdb09adc60a05b28803cf1ee4deadbf001b74614b7da151fd81488f1dd7e58a7d51c3d1cb6433dac4368671e515cc9d3d8bcf7ffef3ee98ef63b1343737f3e5af7c8587ffb02bceb5668c26106eb7aa94e4f2cb2fe7caabaee89695bba9a989cf7ce6333cbebf89542a7075b984c1184b797939bff9cdaf4158d6dc7a2bb7ac590b7ef71ce57dfbed6f7fcbd8b27276efdecda72ffc6caffb20113809532148a7d3fcf6d7bf0160edfa75ac59731b575c7e39572cb91c21442c05353535d1d0d0c097befccf58ef2022958cd5b1916a4708c955575cced2c54bb039b6242104fbf7efe7924b2e2193c9a0ad41f838c09ffffce794a7cb63c2831f576b71b645e0abd75ccbf6fbefe78107eea7acc411f1a86f9823a949e0cbd77e8dedf7ed8817604428afbce24ae62f98ef6267fcbbd6585a5b5ad8b66d1bb7ad5debde1b2ade89490bfb1e7984515270c965f3d9b3670f3367ce64e5ca1580bbbf6ddbb6b37cf9b278b1db5e398af42a3489c8794b4a2ad2256358b56a1535558ef8999c67ac6b6860e54aefd9685dc886a25322195b56ced4695359b86001b95ab5fdcd4decddbb9765d75e4be0a56ee3ef405858386f3e8b162dc20ac1bc85eef922d58b94927449293bb66d4348d8b4f176366cdc8015a2d742a9e97409b5b5b54822872867a31108426b088464da8c99343737bb79282513264c60e6cc99cc9836353e277ab6d6d656962f5fce9e3d7b104ad2111a8254800d5d30af3196250b17317fc165680b4ab8f72a10b4b464d87edf7dacdfb01ee125c64d1b3652356162f2b663682cb7df7e3bebd7afc75a8b0e43e7e8652dd3a64fe78acb2fa7f8a493e3eb596b69696961c78e1dacdfb4118ba423cc22fd065821d9b1630763cbd3ac587d1db5b55b193f7e3cab57ada23c5d46680cf7df7f1fd75c738d632679d4feb9e8af1dbdaf8c3c828e95bcd10ceccac41ded3210beca196f3a916baffc04817ed61df4b4365a3f9a1459319afb7ebe93da5f3670b063144204042a449a67b9eedaab283f3140e897492989094344017b786756163f4f4d14efe625cc5ee6269eb1e6f691529135a379f4af07f8e6daef73d01c49d6a69ce0219da6c05a4b4718a28425254352fa65be78e5a779fb9bcb49891041b653a21501ede608b6fcbc819fd6fe07461ee1ea2ee6d094fe30bd6e42945f9fd68f43d7b7330488a53763b9e9a67fe1eaabaf06a0b9b999ba5dbba8abdb8d4030b6ac9cef7dfffb4cacaaec72beb586b2b232eebaeb2eaebaeaca98d9653299783296979773d75d775153534d477b88b1b6704c48b7743cc9cf8521ac9bc00a41bab884871efa154b2f5f0afef92246525a52cacc9933f9e5af7ee56d554efa0c75e80dd8eef3f7bef75d962c5e125fbfb9b9397ece8a8a0a7ef8c31f326bd62c17a8a935d658c6a6cbc12b36a2ddb7237aae69eb1c25dadbdb292b29a1ab12a433385dfa11502a88a5be8820ddf99defb068c102e71e2f04cdcdcd343737231094949672ded4a95cb174695e292210022f783261c20456ad5a1133636b61efdebd5eadadfa3891bb4e512124a5e9521ebcff012aabaad05832adadecd8b19dddf57584c630b172229b376fa2b8b4c4a93b55102fc4eaca4ab6efd8c6c2050be26b66321900cacbca99357d06f7dd7f3f00d9c8169b28c522fd421c0a949496b819ee3d3e8570c1c51267bf8a688df50e4b9b376fe6f6cd9b98316d2af80d4c5b5b5be7f54a4a58bd7a3565656584daa9ffb5f74ace6576d6c0536d4f52d7d0c0debd7b914059699a85f3e6b37af56adc2d194a4b4ad0744a23d6af3313cd1f0436d4b1534da4d558b47831ab57ac64cc983148293970e080db2000a5a5a52c58b0804b2fbd34b69fa6fc79c6689492680bc563c670e69967f29dcdb7934e9791d51a21057bf6eeedc2e4870afd65767d813106ac4610f2f6379f868902ae85ed26a5592131e2081eae7f8c6c2862b55e68a0c38e6267c31f697bfa5510a38000190c20ac6890ce2a008134bcf9d40ac61c772429f33229f33201af50443b4abf82d22f91322f318a97796fe55bd87cdb0dbce3f43429fb4a17666750189be2e9e70eb2e5be87d0a2c853ab21674b31865cc21342628ce6631ffb18ff7ad34d08e0965b6ee6d6356be2dd56f9d80ae69e7f3ec5a5257ce10b5fa2a8a8089dcd22a5ab06fce31fff88aaaa2a8480dbd6dec6adb7dc82368640294ad3697e74f7dd9495a6d9df94e1831ff810da1867140d146565e5fce6370f01b066cd1a6e59731b802b1deff1dbdffe96f2749ababa7a3ef5990b7b657db9125e59699afff8f56f1042a0b184c6b061ed3aeedd722f070e1ca0b4a4849a9a1a962e5d4a59691a8de59e2d5bb9e69a6bd16118db5d0215f09d3bbf4375551512b8e79e7bb9f6da65de0b50306edc29dc7efbed9457a4696dce70eeb9e792d51a8d61dcd871602c572e5dcacc993331c045175dccfefd8d4829b052d0dc9c410ac1d8b163b126e4f2cb2f67d6f4190821b8e8928b696b6bc3841a2b058dcd4d31515481e286ebbfce8ce93390405d5d1d5f5b766dcc10d2e934dfffdef7292929e1406b2b175e7c11cd99d62ebbb1ff7aec5124b0b5760733664c23d37680ad5bb6b07ec37acacbcb696d698d25dc4005845daa3627e1aa6c834bcb8497ee56af5e1d4b37972c98475d5d9deb2324656569a64f9f4e5b5b1bdbb66e73d5b9b5a62848914ea7b9afb63696ea56adba8e7bb6dc8308245a1b962e5ec202cf08b7d56e63d5aa552045ccf0e6cf77121ec0fc850ba8df9b23e129a7badf51bb1580cd9bee60c3c60d4efacebf54c04b78c28fddc68d1b49a7d3343737336fc17c27d50bc513fbf7c71eb8eb37ac67526525eb366d62efdebd3434d421bdf661ca94292c5ab888404a9e686a64c6ac996e7b2604ca6f66eaebeb30c66d3c162c588045930a8238aef3dae5cbb9ee86eb696c6cc41a4b45ba0c8c65d68c19f1d8ac5cb992ddf57571c84e535353fc3c4208162e58c0c2858b9040fdde3d6cdcb081fa8606acd7c09c37f53c162d5c44a6ad85e52b57535f5fef36935262b561c78e1d9497a7d9b66d3b33664e27d39a61fbf61dac5d7b1be5e5e5343535c5cc4988a193f006c2f0ac75125c5292ea82f020478857f9c2920b79fba9c71088573b89be8f9703d01c41d33396e55f5f43074710da1429a5e8e8e8402a4b600e3277ca7b983ce12d8c393e454047ec08981742c71bfbdc9464fddbacf90c567e9e0b21098d4506479235017ffecb7efef4d7c7f99ffffdff78f6d91738eed86339f1a41338e9b8a379fb5b4ee5d437a519a50c42bf4ae06fc13daf44338a7671345beeff1df7deff073a4c11f8e7e98c4d749eea7dc52197f08c37464f9c58190bfbb7dc726b3cf18c80c79f789c6f7efb9b7cf9cb5f26f0de62d2074ecf9d3b87caca2a94708ce05bdffe36a1718aa5f630647f63239ffccca7d14045799aea9a1aa7da483ee8302192829a9b9bb9f4d24bb8edb63534373591ede8a0a9a9899ffdec675c78e185e077bf559555de9ddadb188da5b2aa92eaaa2a14f0875dbbf9eab5d7384fbd20c04ac9e38dfbb974de65600565656531911542b2bfb191fdfb9f200c43acb51803994c0b4f3ef5246d070ed0dad24ae09d31fef6f8df78e2f1c7e3fb0668ce6478a2a991c64c338d8d8d10ed42bd44367dfa742c96baba3a2eb9e41247cca40029686c6ae2a28b2fc2184349490973e7ccf5a3d209e997d8ac19d3c8645a38e7231f61fd86f514a58a68dcdfd82556303b00a7838e8e0e2aabaa00d87edf0ef6eeddeb54ab4a6130343637b17ee3467e7aef3db1ba29dac4ad5cb9d249c1a165debc05fcecde7bd01842630802c59a75b7b1c2ab5fababaafcbceadef0c4b14b8becc3fef172fbf68696d61632990c2d2d2db1f4ddd2d2c2934f3e49a62543737333a920c07a89e6faebae67caf4196cdcb09186fa06841064b5a6a5ad954d9b37f3c87f3e8a05cacb2bba683db2d990a953a7794d80e581079c148b770ac36b18162d5ac8fe27f6131a83d6212dad2d3436eeefe2c199c964686ecef0f8dffe46e3fec6786e09ef71bc60e1422490696de5a24b2ea6aea1c1bd092978a2693fdbb6d752bfb781b2d232a64f9feec24ac2106dbcc79ec7f4e98ed92dbb76191b376ec05a4b73b3db7c314006d513067ead24a3337193b8b8b3512aa4e4c4a378cb69e55d086e2eb3c32a2c01bff8e57f20e468ac110412c250bbf84f5904c1916c7bf0f73cbce74f1c78be03131c4d568ceeb9711459e19ab6be310a2d52fd0b3a4f784c2a61b1e65502fb0a6f7dd3c9ccf9e8bbf9ca959772c3f2abf9cae7e7b1e03333f9d8f4f7f3b653c77074aa03c5ab2e1559ecd3203128b428e2bfffd2c8961d0f814c1554cf0e05869ce109e10274dff8c65310406353a3f3cecc092214c2d9af54a0b0915ace2f9a2bafbc0a6b2d3b77d7f1e52f7f253e27b74f6363233b77efc400132a276222af46ef626dadb31376715a4934e834d0f706e38999102236b20b21d8b66d1bbb76ed8a3f478c500841a6a5857bb76ec5001515e5d4c44cd9fdde92254b903817ef8b2eba086bac7344089dbb7c2a087862ff13d4d7d7c7d73746c74c3d72d10690d21fb7d64bba96d01a34d6655f29ea3d1f9d35ce9d5d2ac9cc9933e32c1ff3e6cd73dfe738164825696d6961d3a68d008c1f7f66fc5c81bfa7489da92d5c7bedb298d974643b9c2ad7875e90c388fa8351a346b17fff13008c1933a69b2a3b72864ae5643f712a4d67fb920aee7fe07ef63438f55aa47236da1004017b1af6208192d252264eec6abb0a82a00b718ffedf1b72df7b5f21a544e7e43a8de695b596a6a6265a3219bfcedcbd47f1505249674bc3cdffb3cf3a0b2104d9d0c5aeb6b6b6602da49470125cce75735be77d282ff907203b75245678ef649fea2cba0ec0eaebae43e0ecd9f317cc8f55d7511342d2d2d2ca9e3d7bd0d6904ea749a552a4522994940481729a0a7f1b9b366da2aebece87b2b8f9434c67869c7c154472ac72d5fa5674c648a6944010a2743ba37895cf7ce23c02fb0292b06b05716f25ce5a4bcbd32ff0bb5d7be8f0a4d28421688d12021d1ab246d26e47b1f5e70ff3f0deff63ffd39a9667e9d232cfd8eeed69e1fe3eab79f259cb53cf66b1463adf8702c8adae2ebdd904a40f22d7042a44888328f10a45e220817919255e01fb2a4a663b55b88122ab43679f96292c453cf9cc41feede63b30e248429d8ce98b360e438b6e33a6af2a809e16b1f586eb6ffedb370118575ec18f7efc63c68d3bc575f01e7a56bb2064fce40d75c8a44993a8a82803e09e7bee71929ff7d2ca6dc2424b533300679d75162a113cfb5a4387217bf6340060acdb41171515c544a1baaa8ad0c23d5bb7219522909dcd6a43b6bd1d85a4ae7e370013274e8c7747d69a4e692262eeb94c3d670e47ffb739d327f9d654e05cf48510cc99359bd018b66eddda85f845933d69b32b2f2f8f097f7b7bbb730ef18e33fbf63d425dbd53350e25b2d96cccac2a2ac6b2f4f2cb0984c26a1d7b273a9ba701bf91b0d63265ca7944f471c78e1d4ea52a9c0a5d468671639dc4d5da8ac2a5631b2ae48ee760207d98402e338c987e59ba8c743a8dc539bd8c291e83f5b63f80a6a6665f7013aebbee7aaaaa2ab1513208cf3ca3ebe6aabd22956cee2a8bbe533e817a64c39b306102164b6b6b2badcd1984315d5a44c0f7d4372085a02c9d8e430e3a3abaaae884802d5b9c8a38baafe1c0a0de4b8e6f80b006b2ed14d18eec7881778f3f9d4b3f398535ffb68ab79d56464a392601c469c184902855841147b0abe1bf401ee1368d3644d90e8ac4ab8ce66546891719c5cbce0ea63bd8bead96552baf63f9aa95bdb6152b56b362e54a96af5ccd8a15ab59be6c253bffb0d36945faa0db8cd48f9dffcf6544eeff922cca6611a21d21da51368bc417b78daf2331a4e8b09283a1a0e599766effee3d8462349a221764d58764d68345371b1efdd879e79b8446bb1dfcd8b1e3983b6b365ff8dc55e0d5250f3ffc305bb7d7b273e74e88087194f7d2183ef6b18ff3cd6fdc88b6ce7eb46bd72e84e8ba8b524aa1b566d2a44954d5d4d0d8dcca073ef00174b61d2915151515f9bd347306bf3f5e9a56b98c0e29a5a84897f19b877e0dc09a756bb9f9d65b7274f1ee6fb4606b6aaaf9ee9ddf0504ebd6ade7d6354ead3bf9acc97cefce3b098d65efde3d34d4edee4a5c7276dde5e5e5cc9a358b4c26c3fb3ff8018c70362c290437dd70233366cc00e0c31f9d427373b3237e9ea5191fccac84e586afdfc0ac193301f8c8b9e79069c9c45e99d14f97a7cbf8e52f7f890476efdecddebd7bddfd68b7e930c2dd9b9492743acdcc9933d9dfdcc447a74c055f4dc264c3d886b765db76962dbb162b4537269b8bdcf7d21ddd6d7800e3c68ee38edb37513ca61809b41c68a3b6b696dada5af63ff1446c5bd2d662b4f31efbfaeaeb9935631a001b366c029c2a57ca4e471e2b9d4a6ec68c1994a6d3dc7efbedacdbb03eb6e12d5ab428b6634536bc68972c7bf0d23439cc2117d1da118edba210ecd8b183929212f6eeddcb650be68314dd76e1d13bd05a932e2b63c6d4294c9a348933cf1cefb41ac6ba583e63d8bc79131b37df41a835293f2f172e5cc88205f3905e0a6f6dcdb071d3266a6b6bdddcf3128aced9ec082958bc60118b729ebdce6fe8b476eae0b0bd0321048fee7b04fc7adfb16347b71454daabf7cbcabc3a1358b0681175bbebd061881282071f7c90d2d2521a1a1ab86cc13c0cc6395799ee1534440122d9970d7c7f185e6f7d151d04f2653e7dc134de53fd0ea439484a49301d08fd2a02e7650b3895a2b7b1697514cd4f1b967f7d0daf84a3400414c90ede725a3933cf399b138f3bd25541cffa2c53521048e7b79044f2fe62ba64a5fb55e1aaad0b5cf6179127d940cf707da5ed648491e34db26c51ae7767d4d79222d48a03cfb673c7ddf7f1df7fc990b5a3b0e4aa32bbdfcf50daf0f2323c06c1f474e8929cea30e494b163b960ee9cd853334253a6997ffbe637d972efbd18e1b26f03cc9e339b7ffdc6bf2025180381748fdfdb947ebca999f7bce77d043e33458f6109d1cb12c23bad9451575757d0692597e1959595f19b5f3986b7b6078617494b151515fcc7af7e4d08d4d66ee74b5ffa1200b366cfe6a66fdc08feb97a7ab668e21a6d5081e28cb7bf0da15c50b2b470e38d373273d64c04828f9cfbd198e191732f787d7b3e86672355ad14a4a462c28409dc79e7771139d243e4c8d21b3e70ceb934b76448a552986cc8fffce7638406b66fdfce35d75ee30868f2240ff72bbd8d7ef7b0046b9cfab4acb498193366b078e1a298c93ff9e4933cfcfbdfb379f36632991697ecc0971bb9f1faaf33cd3bba44b006105dc341a2f9161ac38efb76b062d5ca78c3b56461ef0cafb4b494eddbb6a1846378eb366ec8cbec7291cbf0b66fdf4e696969178697dcf566c32c7366cf61c1c205a44b4a3a4d0252d2d292a1a5b595f1e3c7a3106cbc7d336bd76d402985099dc7a6f5f16c9b376fa22c27eeb0b925c3b66ddbd87cfbed18cf38a34d534f0ccff80d119e089695a5b97f87cbfb99a40b1174a891caa5e143b90ade0b972c66e7efffe0921458b8fffefbfc38ece3927997c4e690fc2acc7cdf75a210c34b328842e8a9bfc01070902f2cf92467bcf14452bc82148ec158ebb40d9176cafaa4cee03759f228ee79600ff7def75b42528c4a49de5dfd163e7dfe148e52ed283ad01d59822020ab438a8a8a7cb620e7619d8be4fde5ce3f378f4deca569ad4615b0e5e5d21247eb5cfdbebe323c231ca3d304188a38f0f4cb7c6bcd9dfcaded659047c554305a631163ca45f2197b432186d7fb6c190054a0b0d6c59d35353571f3cd37f3def7be979b6fbe397692282b4df3ed7ffb265ffcd2971815a4b05a63c29040280209d63a29e3df7f7a0ff7dc732f3feda1fd64cb16d6dc761b454581db0dcba8265ece004575f2ac4b57237ceb2b84df31e7ba66477013c0bdb0a8be54200252b2889292323420b0605ced28252c075a9adda01b436beb01b66ea9e5673fbb977befddc6d62db5dc7bef36eebd771b5bb6d4b26deb76b6edb88f7bb66cc3688beed0482b114221a50b609580093b1c43301a91ac8f2582d8934d0261685c6d2d9c1da148a5e838d8eea4184fa89a9b9bb9f7de7bd9be633bf76ead65cbb6ed6cd9d6f9ff7bb66c63cbb6edfc6c5b2d6d6d19f7ce74365691041284d528e9094e4e139ed145eba8b32e57d7663db3737d3b27b1902eae6e7f7386dbd66fe0bc69d3d8b8610302c149279ec4ecd973b8e38e3b98377f1e412a454a052824c5c5c518e3d8ebf6fbee676bed0eb66edfeefee6b4dada1d6cbfef7e1e78e041f6ee79a45312f6792f359df92f3b8f39afdd68611a705e7b79166f37f879193fbbf54c2efebe2bf398337b0eab562ca7b8b80409dc7efbed2c58b880aaaa4ace9b3a95e5cb963b1b9a57ade337618ec8bafb6d6a6ae2b2050bf8da8a95d4efd987b66e4d2e5eb0981ddb765056528eb122268691cad418133f7ba4569742a170f31124d99c1ca3d1bcc96db57eecb7dfff00b53b76b065cb769a9e6826954a799bbb0f6f108e20a32d0a4520823cb5dc7a5fc78598dd50c0bd7f8db5594e3ee148defaa652468b2c5238c6628d00ab902200940bb4f6e36a8424abe1c0d32f73ffcfff03ab8e40a9221421175d308da3c44b48db8e309a20908021a524568728c0ea10617497d665ed5b83329d2d97d9010811254657180d4a15c5731d0ca1ce228cc5645d7c34380d96117e2e18679343f9bca056a1085c7d3b244683318aac29e2a0398a2d0ffe812f2cff36fb9f3c08ea88ae764ce1da60d08dd9e5c1904b7849b817e3d41863c78e65f2e4c97cee739fa3c407447ff3dbb7b066cd1a00264d9ac4dd77df8531b066cdaddc7cf3cd883c099123086f73701e644e955a5156ce6f7ee382c3d7dc7a2bb7dce6ae2d8c1b5ce525bcb2b2d23e4978089fd0554045ba8cdf3ee403cfd7ade5d65b6ee9b6e894721e75b366cde2eb377e9d00b8f9d65b58bb762d2a08a8aaace407dffb3ea1313434d473e18517218c740e1fc6259e265a4852b8c960fd2ed1131d29255ffffad7b960ee1c8c317cf4a31fa531d329e141aead4e72fdd7bfce05b366a22d9c3bc5a93fb33e455b910089a0b4b494071f7c102104bb77efe6b2cb2e736acc9c806d1b49413919fe73ed00d2c27f3df69f006cddba95e5cb9763124acbe4bc4a4ac811a2abf63ebb20a52461364b45450553a74d63e18285b11aedb27997515fd7805201ab56ad62d68c69680bf3e6cd67dfbe7df178e54a78c2e76c8d54e7b9cfb778d162e62f988f40b060c17c1a1af661a23b54902e2975610fc2395b6cd8b8211105d91d42b8ac1b4a7809afa484bd7bf7754a78e0725f4ac9f8f1e3b9f3f6cd00ecdeb397d5ab56d1dcb43fbe8e1082d2925276ecd801c0860debd9b8f98e9c5f73a9cbb4362085bb2e8274ba94258b1633f5bca948050df57b99bf6821edd90ea47271818b172e64f1e2c5682cf3e7cfa7aec1a93485e954e367c32c8f3dfa1881844ceb01a64c99921398ed10d954a58a92abfbf9259c6d5a020f3ef82065a525d4d7d773e9bcf9bdd298e4bc89d0176697bb5efa8ae439da1852290936cba4334f67fec73ec891ea15acb468dd41209cd358340b84107eb3095a2b4cea68bebdf67bfce75f9fe6a0294262283e36e05fae9dcf68f122bd3c3a40a74db000620d54cef5a4f50ccc68b0ca3120e13e5be936144216118686679e7e86934f3a0121dc73399f022fed198df19b1fe1d593420ab415688af843c363fce6e17dfcf75f9ec088235dbe4c01f490492a89be48783d32bbe196f092300252a38a404a9e68dccfbffff4a75cf0898f13fadde2d9679f15f76d6a6a427a09a1aaaa1aa59c575c4f2d82f25948c0c5f244c1e1d2e7079452a2946b430dbf6f8a21bdbde7ecb3cf8a0fb4b4b682725e4a2d6d6d84589082f271e3904180111a1765e7feba7fa1ff6bd1be7c86116085400601c27b444a29d191038b7136b9dce961849b0c169f55c3abc0a270108da54387ee77bc145356514e98e3e1eaee217f3b1c10a452b4b4b6b271c306162c5c1007db4f9e3c39ee13053d23a0b2a62af66475129bfb1b5a43d6689082ac71e99ea2f1b480ee7d6b342cb0be3281b596d9736663fd7c5bb16239cdcdcd71c88b88377ebd437b3b9df1595bac70612d2b57aea4bec179054f9c3801a5a45b3f42a002e5739576af72ee6c6b8ee82a2969f0d71833660c1515153e497267934aa0028992be8492b46e77efd5eb425884b0582120aa54e1e77ebe960f7d61764385944ca15018ab78f4b13ff2dc4baf62640a83754c210ef47663141a4b682c5a2bb47a0377fcf0011efd530b1d7e43ae2d3cf3dcf33cfdfc4b1859e49c3da4cedb3a5392b938c0fc2dc9e43aa53f30e86c3666769a22b26234aff0061efbbf67f875dd137c61c5662eb9f25ff8c2ca8d7c63cd4fd8f2f3bdfcf16f2fd2fca4266b4fe0a03e92501c830e8e23ab8ea523388e17edd1fcbafeffd870d72ff9c2b2dbd8f48307f8f3e34fa3e5d1b1bdced1c9c2f3b52fe891d9e5c1d073803c088d1bf8d0eb751b9b9aa8db538ff09e7e911aa3a9a9e9ff2feeec83b3aaee3cfe39e73e0fa879a375c5e4492238a3466cbb752022d3d9b6d3ee587135e076c6690b5a95b24212a83bdbee4ed58abad6956eb1b5b6f812449d82d8dd56312cd1ee50919dd1421202be5043821a81e47902ad0642c24b9e7bcfd93fceb9f7799efbbc25e2cb77e60ee4b9f79c7beeb9e79edffbefc7abdbdb51c0f4e9d3983d7b7690383ad7a1b526e926cdc6ed9943d94d5bd985ef6fda3eb4363639ad3f9e02969ef2a8acaae4eaabaf0e022d5b5b5b83f37deff5b1b3abcb78d14d9d4a7373b3215e284bfc2c91b22582a41041b2681f9e52c4070602deaeb6b6d666240fe48d005a6b060f1f4603631aaa2a2b712d97ad6db67c2925f1789ccd6d9b91d681a5b9d9a44b13c2300ff98e4f1b9eebe2269336b0df616767278389041e9a73ce3129ad005e7bcd38536860debc79c1bad3b60453fa47a3b4261a890461309f26d219bc2ffeed17d140d7aedd1c1a3c64ec38d168b09673d9b8fcb5efcf83522a0853f0991f61c3325e6833b17942c2a5975e6aff6f0869ba8dd867eafcfe1d2712644c696b7bc132623077ee5c1bf6913ab4568144e0a9a45175a77d979e32ebdba8ccc627bda463bcc42e7d4f385d24932e9e07275dd8be730f27f49978b29ca42c614c9490a48453a28453e22c92b21c26ff0dafef1be417abd7f16ac75b784e1988a84d3c217195e495f63739c9598c89b37029c979f87dfbb176590765e67cc651c698f08f0a98f459c64429274539af7675f3d4339bb9e3df1fe43f7ff9142deb9ee7c05f4e3226ca498a0adee849f0bb4ddb58f5d06fb8e39e5ff283dbefe7a70f3ec9aa5ffd86ff58b5867fbb6b15ffbae26734fff01ed6ac6f65ebf63d0c0e2539a5ce60cc8de2f952a4c9e6fa91ec1e132176142278da06494f14fe42baeebaeba88e55a394672a6c3b32831b8cc56228e095575e4d89d5c0b3cffe1e69d30f3df0c02a62555586cb9436d79e2d372185b1e508c709248dc99327e32693367974e687940e13ff2790321224943629d1c6f70a349af9f3e71bb77c5b8f2c5dea5cb9722542186eeda1d5bf4e2b1d6474e6bfb66a562904f31be671d9cc592601b6e7a15d17a9412865e270ec75c2a66b13d2cc457f7f3f5240d2f3985d5f1fd8c894557fa1b4999f34ce3f22e0efbef42522c2a81222d6e3d3c7ead5ab031966fefcf93434349845a94d008ec0b411dafe66e7d73f7cd583b69e84b93660e567bb7722cc9f7f2d2d2d2d34353551796ee5b8d69b231de6cfbf366002849044274d329ba4e771d9ecd9545655e12078e3f5d7716c30ebfefdfb79e4b1162410abac64cd9a16b432b18ad8583dffe3913676cd578d4ac754e75036e38ebfb6ccdca69c7c9467c232cc74d9bef2cc830f9f5869ad6d3e49c334f97dba568273220e870f1f06e0bcf3ce033b66659da4a4f59ef56324492372fefdeb2faba7a9a9290853c8b0f169cdcc993383b6f17822636df4f79b8c3c008d8d8d60095fd2735168a29326a1a5a47357170389040a58dab494e5cdcd486d4c09789eb5a90a84525457c54ce74ae0389310c231f966ad8d6e72f48ce03ef98e4f1b0aa31170a44431898d7fd8ce038ffc8e67ffd0c9d61dfbd8dad9c7735b76f3ecffee62e396d778fcbfb6f02f773dc4838fb7f266dffb8c11c5d302a505c2891271a268e74c366fe9e4e78ffe9ed62dbbd8dafe2eafeceee7a51deff072475fc6b1ade31db6b5f7e53e3ade615b471fdb3afad8dad9c7d68efdfcf78b5dac79661b8f3ef3322b1fde48f39dbfe6e67f5ec9a2efdfc7634fff91ad7fea65f00385cb59283919a48342e249899293f1e4999c5267709233f9eb3074f71de18ddebfd2d3374ce27d4de2af631c77cf604c4d423b93f064cad3dadf77800c1bf52709a7ac62cadde11fd3518c08e43a3fe7f2393cf2e8a35c75d55594959712119283fb0f80529c575bcb8a3bef64cee57310089e7cf249babbbbad4d48d1d3d38beb29e6cc994369692957ce9dcb8c1933383a3c8c232525a5252c5af43dfef3a73fe5e69b6f66ed136b11d21443755d97b33ffb5916dd7893e121845127eedf7fc0c4b8695314eeca6f5c49754d15cad3ecede9e160ffc1c0732ceb797c2f3e011565e5dc78e38d080465e5655c71c51594955798f22c36c5d7cafbefa7eea23a5ce531301067f9f266c3ad6a0568a29128070f9afbcdbe6c369fa928e7f23973b8e492cf515656cedb6fbf4d2c56c5d7bef675eeb8e30e96df7a2b4f3ef904a04df156214926938c1e3fce776fb801474aaa6331cacaca701c87ea9a1a3ccf63f4f871945644a293e8efefe7a61b6e309b7d553515532ae83fd84fdd8c8b115a737c74140d0c0f0f9388c7f9dad7ff9ef2f2722e9931830b2fbc882953a6d0fd5637b1aa18175e7801f7dd771fcb962d63ddba75190e4202686e32b9417b7a7ad8b66d1bcad6e1f3e113438de6b7bffd2dd36baa99553f8bd2f272b6fddfb6b42b0dc2ababa5a585eb172e64feb5f3292b2d0334fd070f22adabfbedb7dfceb995958060d503ab18fa60282803148f0f7041dd45d4c46294969672cd350d9c7df6d9815da9a2a282850b16f0584b0bb53535fcf1a5970ce36233b1005cdb300f6583f5b76cd98213311216124a4b4a58b060a1217ac0e060828178c210ad3cdf8a94126dd58bdffad6b7282b2b63707090d64d9bc0161af6af3be79c7398595f4f69c959cc9e6d92198c1e3b465ddd45345c730dbf78e0e794949521ac3353e7ce4eba76ed0e88e6f3adad5c366b260df3e631323242454505fd03039c575bcbc2050bb8fefa05006cdab499e75b5b5158a72bcb587ce7dbdf0e885e597919521ab563dd457526072c706468887dfbf671f535d7208560f6cc59d4d4d65052524a4f4f0fd5b118975c72090d0d0dfce847b7f1d2d697191919c55f255208aebf7e211515651c3cd8cfa6ffd914cc552e6479c18e8308ea8f50ba4b410202a51d3e183a4aefbbfb796d4f2f7bbafbd8db7b807def0ed0f34e3ffbe31f3074ec144a9cc99827202d359ab01aa2888c92743583878fb2b7f71d5eff732fbbded8cb6b7b7a797dcf3e5edbd31b1cafbfd993f177f661aedffde63bbcb6671f7fee3d48df8143ec1f789fc45f863939e670d275f0e499249583c2a85111a62e9dc6a8bd8516a6020d122d24c23ae068e1182f4c1149d5b2c34109737d3e07c1e0b585df5f0e147e5b85cf0637b0fb545ea7151f61278330c21f713412a5b2aa8aebaebb8ea6a62626dbf6be14e44329c52f7ff5100f3ef850c0ad1ba2a789c54cfbef7f7f39639e1770a4e97792c0fefe0116dc70bde13e2d472d8067366c60ceeccb7195227e28c157befc1522569a7384e09bfff84d56dad0002161e18d37d1ded19e25099a0bb29d5694527cf7c6ef72fffdf7535b538b522084b191292bfc0c0e0ef2e5af7ed570df76fc5aa41c24b4522c6b5ec6f2a646222109c0574f29207ee830df59b880c1c1c1600efd79bc75f972962c5e8c63c707269dd9f6f61ddc70d38d38d23179ef1c875b972da769a949f9e4daf17a9e476beb4656dc7557a0121442b07cd9329a9636665456f0b5bf529ab957c0a2458b69df69b2cd60d7d45b6fee014c58c26db7dd6639c414fc38ac69d3a7d1b6d9a85001060fff852bbe7145709dbf28c3abafaab28a952b5732f3d22f0246daf6532cfbe3d268962e59427b7b07521adb1380e7b9d4d4d4b07469230d0dd7e0843af76cf50005747474b27469234a9964df00e79e7b2e2fbef862206977eddccde25b9620a5c4c3848bac79acc584053886c05edd301fad8d04941c33b16a19f754a62282509ab617daa83cb792ddbb77b3e89f160731715a6b1cc721168b71e78a15d4cf4a496232edb9fbfbe3fce427f772f7ddf73075ea54d6ae5dcbea471e0ebeabc58b17d3d8b814659f53dbf915b60f80f6f64e1a1b1b71a2514e25c7f0302113421b55f0bdf798d46b49cfac45471a079ac58b17a7c62404f5f5f5b4b43c662d3666fe5ded2185b441261a8964d12d4bd8d1d109b6a6a1725ddada5ea0b6b69acece0e162fbe25afad2e17c6a325381d82176e6b72681ac945d8100e451221cd3a774fb9467ab59a00c3fa80746caca8b25a1c4b1894c048c23262fa120a57bb68a5109639f2615b047fe746a624e55af391d61e524610caec4791a81348fcfe332a812560e9ce25f67ebe138806d23215a7da668ecb7fbeecd8c1ccbd2f170a39ad145569869c563e72094f20183a32c4f6ed7f62536b2b6565e58c1c1ba1a6c66450e9ebdb4ff75b7b59bdfa61d6ac5d6b73c519958ce7b944a3118e1e1da6bdbd83e79edbc894cf4ce10b3366586ed3e4e71b1e3ec6134f3d456363231fbcff3e4e2482b6f936a38ec3f61d3bf8fce7bf40656525c3c7867969eb4b1c1d1a3659d89562f8e8514e9c38c1eccb2fc3b3f925776cdf11a405ca84e19735828ab20a667cee73c4fb07d8f8dcf3b4b6b672ecd80842402c568d1470b03fced34f3fcd2d4b972084201a8d3276ea14d24a08daaf661e89b0b3b3934dcf6f6474649459b3660573393030c0c8c808eb9fde4053733347878fe2d982a5d845e5ba2e5d9d3b6da0bfa4a6ba1a07c181fe38ebd6ada7b7771f601c5c003adadb03225253538d2320317888cd9bdbe8eeee3115b03d13e3d6ded1c9f3ad9b3871e204f5f5b3f03c8d9482c3870f33347484f54f6fe0e6458b6c9e4ddb29e605cd9a3993443c4e7777375dbb77a5bc182d9c8883e344383234c4ceae2ed070f1c575949694f0f0c3a62c8ded2a8bd8018c8e1e67e3f31b914e8481789cd2d212a69497a38103fd077966c306d6b4b4d0d1d169d3b1f95e8e86988f8e1ea7a7672ffbf6bd4d695939955555be3324fd0371f6bdfd0e8f3dd6c2cf7eb6caae05c39c44a351464646880fc4292f2fa73656cd403cc1e6b6170c511246edbb6bf76e2ebaf00262b16a868747d8faf25646474749ba6ee0fd998e88e38075f3beb8ae8ed1d1513aba3ae9ecea425b35b1b405788f1c3dcaae5dbb181e1e062189c5aa48c413ecedd9c7a64d9bf8c10f7e483c1ee7820b2e607474949d3b77d2d3db636a004ac9ceae2e36b7b571e2f8719486ea58151a481c3accf1e327d8b07e03f7dc738f55539a8d4648a3ddf05c977dbdbd48c74f345d4d44c2c0a1c3ac5fbf9e9e9e1ee340234d38c9403ccee6b6368e1c1d0221a98e55832576f1c143fc66dd3a7e7cf70abaf7ee3561335a19e645435d5d1da3a3237475ed0a02dcc78df0e71b42f6f77d7ad0a1f53a964c2245c494055312298caad6753d848c1ab38632aa6061a520b3c7f8fdd9f5ea44715d0f57299011848ca091780a1bb2633275a21d74c1c3b44bb531d60fc789820221a396d1d7d64ae13f8995d07c092ff5c4f65f7fdce64c7856cdbca48e547b11ba3a75261fc27d67a2f0d9a07f6167baa6f6fc822d8c6b7c7e144b4f2384442715d3cf3f9f8101930e4c29651c26a44f9d53543aeca021b52184d3a7a7dafb5c2f960b913697642e27037f7c3e57ae6d002876718922819706f9b91007e3de3dedfce9a64a81ad39661c228a1b1a04a648ae521ed3a64d0ff244e2737b219540d6fc84de8fe1defc7b16e17eecf5f99fcf04bd4f9d7a2e8389043a24a5a743d92065d296b00efa4f415b7ba9f2148e105c3baf817befbd974422c19557cdcdb8d670f6f9c6661071224c9d3a95c4e0a0757e0a5f5f780e221187a953a7329818ccc949ca22d9f80b8faff0bd0d52ed53c1b7a9b3b9fa884423b849972a4bf00aa3d0f8a0b6b69afefe7e237dd88a25fefd9536dec43a943332037954563e342e424862555508691cd3268462fd67490c99f0250b1fe1775c2cf6cb5443183f26f2ede18f276d8c59124b91f141e1399a28819fe8f5e9184f5b734dda7e5f60ecd8f7137e67e9084f571632e6cfc8ab1f2bb43244b36fff7b283449cfc5cb282a586cc446d5e91302dfc01e9cb31b6a2e62970e5f2de573ace35fc785a74809108ee4c08103486962b88c6491ff25a543080952e069cdbbeff5055e9ae355e3f895dcd32bbaa75078ec0685ae318e32f18181c0f1a510fc316b7be482744c2922304e3cf5f5f508214c899f71a8a3c2d0b672c587ada2eeb7f73e84476071149adb6c8c675daa3427acf4ca011f16efed7f2f5833da8629f89019ccd387835626f1f1c04082fe83f194b3c2a7e4b4f0c9418eeffd9fee1c9c6efb8f08135b27fedc7c926337dfccb86c7885b63a294cd0684ed89721ac1dc875dd20979cff9bd6a92a0a842418c3551af77c00d7738320d7740257883888bcaca941411b65da62f2a597f0bd840d1dc07ad4f936af6204d887744c250421249ef232dbe558ccfebce54358a232c8f37ed282caf3412945249a4bd56b91638c3ea4ad969e7e852f814a9bce6ced136b7010ccfd87ab024923209ca270ff0481bfd6712427f23dbb81a73ca2bee3498e0fb758bdb5f121df180a3f5b0a691cb110789e6b6254a5e074e9b4791f8649f39326a463a2124e18beedc9f3426b3b1d45f68f42505ae76d2f6d6c5b3ac2cf07a4699a42d005d67d1ee4be3e4fff64f79f6ea30b90e7f9c63d3f1340783ce3c144daa45f5b44f915c0cb1b5c9f69d3cc85342a0113f8e2f223dfcb2075ceb5713f9148042165d14d3b0cd7eabb8d97628ac07cec28f46c6970adedc20f9798c8f8c6c6c6026297e53433cefb1746a13e0a9d33702282e4d8185a69dc0f51bf2ed79b565a73cb2db7f0f8e38f2310dcbcf87bb989dd38108944181b1b43876aa98d171127c258720c6d633a3f7a149ae342e77c645ee3330b49d75417387d9878372164d6f32be515dd50c603d73a43b8b9a4f0426bbcd0391f85ae2974ce47a16b0a9d1b370af551e89c45a131143af7096122c4eec3a1d033163a97db3a286aa74d2f38e26236bca23715a9f8a6dcc83ce7c745f990d870823c28b63116b73116e9a0001795de362c2966db92f2c1542330b15729693685cc7ec21c5bf8faf0f9acf90d659b09db30b3e6da7e5479e7c9ce8f4fa8c21ea7bef79a0fad4decdb92a54b686868e0c72b7e4c57d74eb45f25c297fc6d7fc574fc4060bb0bcf8541a1b567e0db7f7d1b6f268adfbf308addbf58ffd9ed851478b68ac5e94aa0be0d2c970ddcaca57cf33a3ef8ebdac4d09ada7899c87ebe4c64ce4f782ff9d86d7821954ed6f71142b8ff893e5f78ae3d5b4f2e1fc2e33b5d147bbe30c2d7fbc90c7cf81a3d1fe1eb8b28e0b26c78e1f71f9ebf30529a39bb8fd5145369165dece10164c24f509a1fa1090aaae21a081c44d62664309e775d8ce01545810d37ec30c2b8e62b0c1bf6600388b3db873e88104310ce46113e1fe602c31b7a78c3942182a8acdb74f6b82c74a6dd4788748fac6cb545107a52152331980014a79249a25193f95da6497960facfff060c028295738c85d727f62334736f36e64c14bb7b3184fb0ba358ffd9ed85304e4e66cca75725da3729f87390794ec338d4de85e0d99a96cad6ddcbde0bb29f2f138509962cb66316693fd1fb87bf9f30b29eaf08410def2fe1f661934f18a7ab720e237cff6250a1f908b73f9db50366fed2fbccb6d517fb7e0c7c82f7ffef157c1a4a8b63d60000000049454e44ae426082);

-- --------------------------------------------------------

--
-- Table structure for table `ost_filter`
--

DROP TABLE IF EXISTS `ost_filter`;
CREATE TABLE `ost_filter` (
  `id` int(11) UNSIGNED NOT NULL,
  `execorder` int(10) UNSIGNED NOT NULL DEFAULT '99',
  `isactive` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `flags` int(10) UNSIGNED DEFAULT '0',
  `status` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `match_all_rules` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `stop_onmatch` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `target` enum('Any','Web','Email','API') NOT NULL DEFAULT 'Any',
  `email_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost_filter`
--

TRUNCATE TABLE `ost_filter`;
--
-- Dumping data for table `ost_filter`
--

INSERT INTO `ost_filter` (`id`, `execorder`, `isactive`, `flags`, `status`, `match_all_rules`, `stop_onmatch`, `target`, `email_id`, `name`, `notes`, `created`, `updated`) VALUES
(1, 99, 1, 0, 0, 0, 0, 'Email', 0, 'SYSTEM BAN LIST', 'Internal list for email banning. Do not remove', '2025-11-29 04:12:33', '2025-11-29 04:12:33');

-- --------------------------------------------------------

--
-- Table structure for table `ost_filter_action`
--

DROP TABLE IF EXISTS `ost_filter_action`;
CREATE TABLE `ost_filter_action` (
  `id` int(11) UNSIGNED NOT NULL,
  `filter_id` int(10) UNSIGNED NOT NULL,
  `sort` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `type` varchar(24) NOT NULL,
  `configuration` text,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost_filter_action`
--

TRUNCATE TABLE `ost_filter_action`;
--
-- Dumping data for table `ost_filter_action`
--

INSERT INTO `ost_filter_action` (`id`, `filter_id`, `sort`, `type`, `configuration`, `updated`) VALUES
(1, 1, 1, 'reject', '[]', '2025-11-29 04:12:33');

-- --------------------------------------------------------

--
-- Table structure for table `ost_filter_rule`
--

DROP TABLE IF EXISTS `ost_filter_rule`;
CREATE TABLE `ost_filter_rule` (
  `id` int(11) UNSIGNED NOT NULL,
  `filter_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `what` varchar(32) NOT NULL,
  `how` enum('equal','not_equal','contains','dn_contain','starts','ends','match','not_match') NOT NULL,
  `val` varchar(255) NOT NULL,
  `isactive` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `notes` tinytext NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost_filter_rule`
--

TRUNCATE TABLE `ost_filter_rule`;
--
-- Dumping data for table `ost_filter_rule`
--

INSERT INTO `ost_filter_rule` (`id`, `filter_id`, `what`, `how`, `val`, `isactive`, `notes`, `created`, `updated`) VALUES
(1, 1, 'email', 'equal', 'test@example.com', 1, '', '0000-00-00 00:00:00', '2025-11-29 04:12:33');

-- --------------------------------------------------------

--
-- Table structure for table `ost_form`
--

DROP TABLE IF EXISTS `ost_form`;
CREATE TABLE `ost_form` (
  `id` int(11) UNSIGNED NOT NULL,
  `pid` int(10) UNSIGNED DEFAULT NULL,
  `type` varchar(8) NOT NULL DEFAULT 'G',
  `flags` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `title` varchar(255) NOT NULL,
  `instructions` varchar(512) DEFAULT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost_form`
--

TRUNCATE TABLE `ost_form`;
--
-- Dumping data for table `ost_form`
--

INSERT INTO `ost_form` (`id`, `pid`, `type`, `flags`, `title`, `instructions`, `name`, `notes`, `created`, `updated`) VALUES
(1, NULL, 'U', 1, 'Contact Information', NULL, '', NULL, '2025-11-29 04:12:33', '2025-11-29 04:12:33'),
(2, NULL, 'T', 1, 'Ticket Details', 'Please Describe Your Issue', '', 'This form will be attached to every ticket, regardless of its source.\nYou can add any fields to this form and they will be available to all\ntickets, and will be searchable with advanced search and filterable.', '2025-11-29 04:12:33', '2025-11-29 04:12:33'),
(3, NULL, 'C', 1, 'Company Information', 'Details available in email templates', '', NULL, '2025-11-29 04:12:33', '2025-11-29 04:12:33'),
(4, NULL, 'O', 1, 'Organization Information', 'Details on user organization', '', NULL, '2025-11-29 04:12:33', '2025-11-29 04:12:33'),
(5, NULL, 'A', 1, 'Task Details', 'Please Describe The Issue', '', 'This form is used to create a task.', '2025-11-29 04:12:33', '2025-11-29 04:12:33'),
(6, NULL, 'L1', 0, 'Ticket Status Properties', 'Properties that can be set on a ticket status.', '', NULL, '2025-11-29 04:12:33', '2025-11-29 04:12:33');

-- --------------------------------------------------------

--
-- Table structure for table `ost_form_entry`
--

DROP TABLE IF EXISTS `ost_form_entry`;
CREATE TABLE `ost_form_entry` (
  `id` int(11) UNSIGNED NOT NULL,
  `form_id` int(11) UNSIGNED NOT NULL,
  `object_id` int(11) UNSIGNED DEFAULT NULL,
  `object_type` char(1) NOT NULL DEFAULT 'T',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT '1',
  `extra` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost_form_entry`
--

TRUNCATE TABLE `ost_form_entry`;
--
-- Dumping data for table `ost_form_entry`
--

INSERT INTO `ost_form_entry` (`id`, `form_id`, `object_id`, `object_type`, `sort`, `extra`, `created`, `updated`) VALUES
(1, 4, 1, 'O', 1, NULL, '2025-11-29 04:12:33', '2025-11-29 04:12:33'),
(2, 3, NULL, 'C', 1, NULL, '2025-11-29 04:12:35', '2025-11-29 04:12:35'),
(5, 1, 2, 'U', 1, NULL, '2025-11-29 06:31:08', '2025-11-29 06:31:08'),
(6, 2, 2, 'T', 0, '{\"disable\":[]}', '2025-11-29 06:31:08', '2025-11-29 06:31:08'),
(7, 1, 3, 'U', 1, NULL, '2025-12-01 11:00:18', '2025-12-01 11:00:18'),
(8, 2, 3, 'T', 1, NULL, '2025-12-01 11:00:18', '2025-12-01 11:00:18');

-- --------------------------------------------------------

--
-- Table structure for table `ost_form_entry_values`
--

DROP TABLE IF EXISTS `ost_form_entry_values`;
CREATE TABLE `ost_form_entry_values` (
  `entry_id` int(11) UNSIGNED NOT NULL,
  `field_id` int(11) UNSIGNED NOT NULL,
  `value` text,
  `value_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost_form_entry_values`
--

TRUNCATE TABLE `ost_form_entry_values`;
--
-- Dumping data for table `ost_form_entry_values`
--

INSERT INTO `ost_form_entry_values` (`entry_id`, `field_id`, `value`, `value_id`) VALUES
(2, 23, 'gapShop SupportDesk', NULL),
(2, 24, 'https://gapshop.net/', NULL),
(2, 25, NULL, NULL),
(2, 26, NULL, NULL),
(5, 3, '9547092564', NULL),
(5, 4, NULL, NULL),
(6, 20, 'Testing the gaps', NULL),
(6, 22, 'Normal', 2),
(7, 3, NULL, NULL),
(7, 4, NULL, NULL),
(8, 20, 'Site aint responding', NULL),
(8, 22, 'Normal', 2);

-- --------------------------------------------------------

--
-- Table structure for table `ost_form_field`
--

DROP TABLE IF EXISTS `ost_form_field`;
CREATE TABLE `ost_form_field` (
  `id` int(11) UNSIGNED NOT NULL,
  `form_id` int(11) UNSIGNED NOT NULL,
  `flags` int(10) UNSIGNED DEFAULT '1',
  `type` varchar(255) NOT NULL DEFAULT 'text',
  `label` varchar(255) NOT NULL,
  `name` varchar(64) NOT NULL,
  `configuration` text,
  `sort` int(11) UNSIGNED NOT NULL,
  `hint` varchar(512) DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost_form_field`
--

TRUNCATE TABLE `ost_form_field`;
--
-- Dumping data for table `ost_form_field`
--

INSERT INTO `ost_form_field` (`id`, `form_id`, `flags`, `type`, `label`, `name`, `configuration`, `sort`, `hint`, `created`, `updated`) VALUES
(1, 1, 489395, 'text', 'Email Address', 'email', '{\"size\":40,\"length\":64,\"validator\":\"email\"}', 1, NULL, '2025-11-29 04:12:33', '2025-11-29 04:12:33'),
(2, 1, 489395, 'text', 'Full Name', 'name', '{\"size\":40,\"length\":64}', 2, NULL, '2025-11-29 04:12:33', '2025-11-29 04:12:33'),
(3, 1, 13057, 'phone', 'Phone Number', 'phone', NULL, 3, NULL, '2025-11-29 04:12:33', '2025-11-29 04:12:33'),
(4, 1, 12289, 'memo', 'Internal Notes', 'notes', '{\"rows\":4,\"cols\":40}', 4, NULL, '2025-11-29 04:12:33', '2025-11-29 04:12:33'),
(20, 2, 489265, 'text', 'Issue Summary', 'subject', '{\"size\":40,\"length\":50}', 1, NULL, '2025-11-29 04:12:33', '2025-11-29 04:12:33'),
(21, 2, 480547, 'thread', 'Issue Details', 'message', NULL, 2, 'Details on the reason(s) for opening the ticket.', '2025-11-29 04:12:33', '2025-11-29 04:12:33'),
(22, 2, 274609, 'priority', 'Priority Level', 'priority', NULL, 3, NULL, '2025-11-29 04:12:33', '2025-11-29 04:12:33'),
(23, 3, 291249, 'text', 'Company Name', 'name', '{\"size\":40,\"length\":64}', 1, NULL, '2025-11-29 04:12:33', '2025-11-29 04:12:33'),
(24, 3, 274705, 'text', 'Website', 'website', '{\"size\":40,\"length\":64}', 2, NULL, '2025-11-29 04:12:33', '2025-11-29 04:12:33'),
(25, 3, 274705, 'phone', 'Phone Number', 'phone', '{\"ext\":false}', 3, NULL, '2025-11-29 04:12:33', '2025-11-29 04:12:33'),
(26, 3, 12545, 'memo', 'Address', 'address', '{\"rows\":2,\"cols\":40,\"html\":false,\"length\":100}', 4, NULL, '2025-11-29 04:12:33', '2025-11-29 04:12:33'),
(27, 4, 489395, 'text', 'Name', 'name', '{\"size\":40,\"length\":64}', 1, NULL, '2025-11-29 04:12:33', '2025-11-29 04:12:33'),
(28, 4, 13057, 'memo', 'Address', 'address', '{\"rows\":2,\"cols\":40,\"length\":100,\"html\":false}', 2, NULL, '2025-11-29 04:12:33', '2025-11-29 04:12:33'),
(29, 4, 13057, 'phone', 'Phone', 'phone', NULL, 3, NULL, '2025-11-29 04:12:33', '2025-11-29 04:12:33'),
(30, 4, 13057, 'text', 'Website', 'website', '{\"size\":40,\"length\":0}', 4, NULL, '2025-11-29 04:12:33', '2025-11-29 04:12:33'),
(31, 4, 12289, 'memo', 'Internal Notes', 'notes', '{\"rows\":4,\"cols\":40}', 5, NULL, '2025-11-29 04:12:33', '2025-11-29 04:12:33'),
(32, 5, 487601, 'text', 'Title', 'title', '{\"size\":40,\"length\":50}', 1, NULL, '2025-11-29 04:12:33', '2025-11-29 04:12:33'),
(33, 5, 413939, 'thread', 'Description', 'description', NULL, 2, 'Details on the reason(s) for creating the task.', '2025-11-29 04:12:33', '2025-11-29 04:12:33'),
(34, 6, 487665, 'state', 'State', 'state', '{\"prompt\":\"State of a ticket\"}', 1, NULL, '2025-11-29 04:12:33', '2025-11-29 04:12:33'),
(35, 6, 471073, 'memo', 'Description', 'description', '{\"rows\":\"2\",\"cols\":\"40\",\"html\":\"\",\"length\":\"100\"}', 3, NULL, '2025-11-29 04:12:33', '2025-11-29 04:12:33');

-- --------------------------------------------------------

--
-- Table structure for table `ost_group`
--

DROP TABLE IF EXISTS `ost_group`;
CREATE TABLE `ost_group` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(11) UNSIGNED NOT NULL,
  `flags` int(11) UNSIGNED NOT NULL DEFAULT '1',
  `name` varchar(120) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost_group`
--

TRUNCATE TABLE `ost_group`;
-- --------------------------------------------------------

--
-- Table structure for table `ost_help_topic`
--

DROP TABLE IF EXISTS `ost_help_topic`;
CREATE TABLE `ost_help_topic` (
  `topic_id` int(11) UNSIGNED NOT NULL,
  `topic_pid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `ispublic` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `noautoresp` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `flags` int(10) UNSIGNED DEFAULT '0',
  `status_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `priority_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `dept_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `staff_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `team_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `sla_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `page_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `sequence_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `topic` varchar(128) NOT NULL DEFAULT '',
  `number_format` varchar(32) DEFAULT NULL,
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost_help_topic`
--

TRUNCATE TABLE `ost_help_topic`;
--
-- Dumping data for table `ost_help_topic`
--

INSERT INTO `ost_help_topic` (`topic_id`, `topic_pid`, `ispublic`, `noautoresp`, `flags`, `status_id`, `priority_id`, `dept_id`, `staff_id`, `team_id`, `sla_id`, `page_id`, `sequence_id`, `sort`, `topic`, `number_format`, `notes`, `created`, `updated`) VALUES
(1, 0, 1, 0, 2, 0, 2, 0, 0, 0, 0, 0, 0, 1, 'General Inquiry', NULL, 'Questions about products or services', '2025-11-29 04:12:33', '2025-11-29 04:12:33'),
(2, 0, 1, 0, 2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Feedback', NULL, 'Tickets that primarily concern the sales and billing departments', '2025-11-29 04:12:33', '2026-04-09 09:10:22'),
(10, 0, 1, 0, 2, 0, 2, 3, 0, 0, 0, 0, 0, 0, 'Report a Problem', NULL, 'Product, service, or equipment related issues', '2025-11-29 04:12:33', '2025-11-29 04:12:33'),
(11, 10, 1, 0, 2, 0, 3, 0, 0, 0, 1, 0, 0, 1, 'Access Issue', NULL, 'Report an inability access a physical or virtual asset', '2025-11-29 04:12:33', '2025-11-29 04:12:33'),
(12, 0, 1, 0, 0, 1, 2, 1, 0, 0, 0, 0, 0, 0, 'How To Set DNS', NULL, NULL, '2026-04-09 09:02:42', '2026-04-09 09:02:53');

-- --------------------------------------------------------

--
-- Table structure for table `ost_help_topic_form`
--

DROP TABLE IF EXISTS `ost_help_topic_form`;
CREATE TABLE `ost_help_topic_form` (
  `id` int(11) UNSIGNED NOT NULL,
  `topic_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `form_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `extra` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost_help_topic_form`
--

TRUNCATE TABLE `ost_help_topic_form`;
--
-- Dumping data for table `ost_help_topic_form`
--

INSERT INTO `ost_help_topic_form` (`id`, `topic_id`, `form_id`, `sort`, `extra`) VALUES
(1, 1, 2, 1, '{\"disable\":[]}'),
(2, 2, 2, 1, '{\"disable\":[]}'),
(3, 10, 2, 1, '{\"disable\":[]}'),
(4, 11, 2, 1, '{\"disable\":[]}');

-- --------------------------------------------------------

--
-- Table structure for table `ost_list`
--

DROP TABLE IF EXISTS `ost_list`;
CREATE TABLE `ost_list` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `name_plural` varchar(255) DEFAULT NULL,
  `sort_mode` enum('Alpha','-Alpha','SortCol') NOT NULL DEFAULT 'Alpha',
  `masks` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `type` varchar(16) DEFAULT NULL,
  `configuration` text NOT NULL,
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost_list`
--

TRUNCATE TABLE `ost_list`;
--
-- Dumping data for table `ost_list`
--

INSERT INTO `ost_list` (`id`, `name`, `name_plural`, `sort_mode`, `masks`, `type`, `configuration`, `notes`, `created`, `updated`) VALUES
(1, 'Ticket Status', 'Ticket Statuses', 'SortCol', 13, 'ticket-status', '{\"handler\":\"TicketStatusList\"}', 'Ticket statuses', '2025-11-29 04:12:33', '2025-11-29 04:12:33');

-- --------------------------------------------------------

--
-- Table structure for table `ost_list_items`
--

DROP TABLE IF EXISTS `ost_list_items`;
CREATE TABLE `ost_list_items` (
  `id` int(11) UNSIGNED NOT NULL,
  `list_id` int(11) DEFAULT NULL,
  `status` int(11) UNSIGNED NOT NULL DEFAULT '1',
  `value` varchar(255) NOT NULL,
  `extra` varchar(255) DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '1',
  `properties` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost_list_items`
--

TRUNCATE TABLE `ost_list_items`;
-- --------------------------------------------------------

--
-- Table structure for table `ost_lock`
--

DROP TABLE IF EXISTS `ost_lock`;
CREATE TABLE `ost_lock` (
  `lock_id` int(11) UNSIGNED NOT NULL,
  `staff_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `expire` datetime DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost_lock`
--

TRUNCATE TABLE `ost_lock`;
-- --------------------------------------------------------

--
-- Table structure for table `ost_note`
--

DROP TABLE IF EXISTS `ost_note`;
CREATE TABLE `ost_note` (
  `id` int(11) UNSIGNED NOT NULL,
  `pid` int(11) UNSIGNED DEFAULT NULL,
  `staff_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `ext_id` varchar(10) DEFAULT NULL,
  `body` text,
  `status` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost_note`
--

TRUNCATE TABLE `ost_note`;
-- --------------------------------------------------------

--
-- Table structure for table `ost_organization`
--

DROP TABLE IF EXISTS `ost_organization`;
CREATE TABLE `ost_organization` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `manager` varchar(16) NOT NULL DEFAULT '',
  `status` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `domain` varchar(256) NOT NULL DEFAULT '',
  `extra` text,
  `created` timestamp NULL DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost_organization`
--

TRUNCATE TABLE `ost_organization`;
--
-- Dumping data for table `ost_organization`
--

INSERT INTO `ost_organization` (`id`, `name`, `manager`, `status`, `domain`, `extra`, `created`, `updated`) VALUES
(1, 'osTicket', '', 8, '', NULL, '2025-11-29 12:12:33', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ost_organization__cdata`
--

DROP TABLE IF EXISTS `ost_organization__cdata`;
CREATE TABLE `ost_organization__cdata` (
  `org_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `name` mediumtext,
  `address` mediumtext,
  `phone` mediumtext,
  `website` mediumtext,
  `notes` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost_organization__cdata`
--

TRUNCATE TABLE `ost_organization__cdata`;
-- --------------------------------------------------------

--
-- Table structure for table `ost_plugin`
--

DROP TABLE IF EXISTS `ost_plugin`;
CREATE TABLE `ost_plugin` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `install_path` varchar(60) NOT NULL,
  `isphar` tinyint(1) NOT NULL DEFAULT '0',
  `isactive` tinyint(1) NOT NULL DEFAULT '0',
  `version` varchar(64) DEFAULT NULL,
  `notes` text,
  `installed` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost_plugin`
--

TRUNCATE TABLE `ost_plugin`;
-- --------------------------------------------------------

--
-- Table structure for table `ost_plugin_instance`
--

DROP TABLE IF EXISTS `ost_plugin_instance`;
CREATE TABLE `ost_plugin_instance` (
  `id` int(11) UNSIGNED NOT NULL,
  `plugin_id` int(11) UNSIGNED NOT NULL,
  `flags` int(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost_plugin_instance`
--

TRUNCATE TABLE `ost_plugin_instance`;
-- --------------------------------------------------------

--
-- Table structure for table `ost_queue`
--

DROP TABLE IF EXISTS `ost_queue`;
CREATE TABLE `ost_queue` (
  `id` int(11) UNSIGNED NOT NULL,
  `parent_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `columns_id` int(11) UNSIGNED DEFAULT NULL,
  `sort_id` int(11) UNSIGNED DEFAULT NULL,
  `flags` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `staff_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `title` varchar(60) DEFAULT NULL,
  `config` text,
  `filter` varchar(64) DEFAULT NULL,
  `root` varchar(32) DEFAULT NULL,
  `path` varchar(80) NOT NULL DEFAULT '/',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost_queue`
--

TRUNCATE TABLE `ost_queue`;
--
-- Dumping data for table `ost_queue`
--

INSERT INTO `ost_queue` (`id`, `parent_id`, `columns_id`, `sort_id`, `flags`, `staff_id`, `sort`, `title`, `config`, `filter`, `root`, `path`, `created`, `updated`) VALUES
(1, 0, NULL, 1, 3, 0, 1, 'Open', '[[\"status__state\",\"includes\",{\"open\":\"Open\"}]]', NULL, 'T', '/', '2025-11-29 04:12:34', '0000-00-00 00:00:00'),
(2, 1, NULL, 4, 43, 0, 1, 'Open', '{\"criteria\":[[\"isanswered\",\"nset\",null]],\"conditions\":[]}', NULL, 'T', '/', '2025-11-29 04:12:34', '0000-00-00 00:00:00'),
(3, 1, NULL, 4, 43, 0, 2, 'Answered', '{\"criteria\":[[\"isanswered\",\"set\",null]],\"conditions\":[]}', NULL, 'T', '/', '2025-11-29 04:12:34', '0000-00-00 00:00:00'),
(4, 1, NULL, 4, 43, 0, 3, 'Overdue', '{\"criteria\":[[\"isoverdue\",\"set\",null]],\"conditions\":[]}', NULL, 'T', '/', '2025-11-29 04:12:34', '0000-00-00 00:00:00'),
(5, 0, NULL, 3, 3, 0, 3, 'My Tickets', '{\"criteria\":[[\"assignee\",\"includes\",{\"M\":\"Me\",\"T\":\"One of my teams\"}],[\"status__state\",\"includes\",{\"open\":\"Open\"}]],\"conditions\":[]}', NULL, 'T', '/', '2025-11-29 04:12:34', '0000-00-00 00:00:00'),
(6, 5, NULL, NULL, 43, 0, 1, 'Assigned to Me', '{\"criteria\":[[\"assignee\",\"includes\",{\"M\":\"Me\"}]],\"conditions\":[]}', NULL, 'T', '/', '2025-11-29 04:12:34', '0000-00-00 00:00:00'),
(7, 5, NULL, NULL, 43, 0, 2, 'Assigned to Teams', '{\"criteria\":[[\"assignee\",\"!includes\",{\"M\":\"Me\"}]],\"conditions\":[]}', NULL, 'T', '/', '2025-11-29 04:12:34', '0000-00-00 00:00:00'),
(8, 0, NULL, 5, 3, 0, 4, 'Closed', '{\"criteria\":[[\"status__state\",\"includes\",{\"closed\":\"Closed\"}]],\"conditions\":[]}', NULL, 'T', '/', '2025-11-29 04:12:34', '0000-00-00 00:00:00'),
(9, 8, NULL, 5, 43, 0, 1, 'Today', '{\"criteria\":[[\"closed\",\"period\",\"td\"]],\"conditions\":[]}', NULL, 'T', '/', '2025-11-29 04:12:34', '0000-00-00 00:00:00'),
(10, 8, NULL, 5, 43, 0, 2, 'Yesterday', '{\"criteria\":[[\"closed\",\"period\",\"yd\"]],\"conditions\":[]}', NULL, 'T', '/', '2025-11-29 04:12:34', '0000-00-00 00:00:00'),
(11, 8, NULL, 5, 43, 0, 3, 'This Week', '{\"criteria\":[[\"closed\",\"period\",\"tw\"]],\"conditions\":[]}', NULL, 'T', '/', '2025-11-29 04:12:34', '0000-00-00 00:00:00'),
(12, 8, NULL, 5, 43, 0, 4, 'This Month', '{\"criteria\":[[\"closed\",\"period\",\"tm\"]],\"conditions\":[]}', NULL, 'T', '/', '2025-11-29 04:12:34', '0000-00-00 00:00:00'),
(13, 8, NULL, 6, 43, 0, 5, 'This Quarter', '{\"criteria\":[[\"closed\",\"period\",\"tq\"]],\"conditions\":[]}', NULL, 'T', '/', '2025-11-29 04:12:34', '0000-00-00 00:00:00'),
(14, 8, NULL, 7, 43, 0, 6, 'This Year', '{\"criteria\":[[\"closed\",\"period\",\"ty\"]],\"conditions\":[]}', NULL, 'T', '/', '2025-11-29 04:12:34', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ost_queue_column`
--

DROP TABLE IF EXISTS `ost_queue_column`;
CREATE TABLE `ost_queue_column` (
  `id` int(11) UNSIGNED NOT NULL,
  `flags` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL DEFAULT '',
  `primary` varchar(64) NOT NULL DEFAULT '',
  `secondary` varchar(64) DEFAULT NULL,
  `filter` varchar(32) DEFAULT NULL,
  `truncate` varchar(16) DEFAULT NULL,
  `annotations` text,
  `conditions` text,
  `extra` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost_queue_column`
--

TRUNCATE TABLE `ost_queue_column`;
--
-- Dumping data for table `ost_queue_column`
--

INSERT INTO `ost_queue_column` (`id`, `flags`, `name`, `primary`, `secondary`, `filter`, `truncate`, `annotations`, `conditions`, `extra`) VALUES
(1, 0, 'Ticket #', 'number', NULL, 'link:ticketP', 'wrap', '[{\"c\":\"TicketSourceDecoration\",\"p\":\"b\"}]', '[{\"crit\":[\"isanswered\",\"nset\",null],\"prop\":{\"font-weight\":\"bold\"}}]', NULL),
(2, 0, 'Date Created', 'created', NULL, 'date:full', 'wrap', '[]', '[]', NULL),
(3, 0, 'Subject', 'cdata__subject', NULL, 'link:ticket', 'ellipsis', '[{\"c\":\"TicketThreadCount\",\"p\":\">\"},{\"c\":\"ThreadAttachmentCount\",\"p\":\"a\"},{\"c\":\"OverdueFlagDecoration\",\"p\":\"<\"},{\"c\":\"LockDecoration\",\"p\":\"<\"}]', '[{\"crit\":[\"isanswered\",\"nset\",null],\"prop\":{\"font-weight\":\"bold\"}}]', NULL),
(4, 0, 'User Name', 'user__name', NULL, NULL, 'wrap', '[{\"c\":\"ThreadCollaboratorCount\",\"p\":\">\"}]', '[]', NULL),
(5, 0, 'Priority', 'cdata__priority', NULL, NULL, 'wrap', '[]', '[]', NULL),
(6, 0, 'Status', 'status__id', NULL, NULL, 'wrap', '[]', '[]', NULL),
(7, 0, 'Close Date', 'closed', NULL, 'date:full', 'wrap', '[]', '[]', NULL),
(8, 0, 'Assignee', 'assignee', NULL, NULL, 'wrap', '[]', '[]', NULL),
(9, 0, 'Due Date', 'duedate', 'est_duedate', 'date:human', 'wrap', '[]', '[]', NULL),
(10, 0, 'Last Updated', 'lastupdate', NULL, 'date:full', 'wrap', '[]', '[]', NULL),
(11, 0, 'Department', 'dept_id', NULL, NULL, 'wrap', '[]', '[]', NULL),
(12, 0, 'Last Message', 'thread__lastmessage', NULL, 'date:human', 'wrap', '[]', '[]', NULL),
(13, 0, 'Last Response', 'thread__lastresponse', NULL, 'date:human', 'wrap', '[]', '[]', NULL),
(14, 0, 'Team', 'team_id', NULL, NULL, 'wrap', '[]', '[]', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ost_queue_columns`
--

DROP TABLE IF EXISTS `ost_queue_columns`;
CREATE TABLE `ost_queue_columns` (
  `queue_id` int(11) UNSIGNED NOT NULL,
  `column_id` int(11) UNSIGNED NOT NULL,
  `staff_id` int(11) UNSIGNED NOT NULL,
  `bits` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `heading` varchar(64) DEFAULT NULL,
  `width` int(10) UNSIGNED NOT NULL DEFAULT '100'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost_queue_columns`
--

TRUNCATE TABLE `ost_queue_columns`;
--
-- Dumping data for table `ost_queue_columns`
--

INSERT INTO `ost_queue_columns` (`queue_id`, `column_id`, `staff_id`, `bits`, `sort`, `heading`, `width`) VALUES
(1, 1, 0, 1, 1, 'Ticket', 100),
(1, 3, 0, 1, 3, 'Subject', 300),
(1, 4, 0, 1, 4, 'From', 185),
(1, 5, 0, 1, 5, 'Priority', 85),
(1, 8, 0, 1, 6, 'Assigned To', 160),
(1, 10, 0, 1, 2, 'Last Updated', 150),
(2, 1, 0, 1, 1, 'Ticket', 100),
(2, 3, 0, 1, 3, 'Subject', 300),
(2, 4, 0, 1, 4, 'From', 185),
(2, 5, 0, 1, 5, 'Priority', 85),
(2, 8, 0, 1, 6, 'Assigned To', 160),
(2, 10, 0, 1, 2, 'Last Updated', 150),
(3, 1, 0, 1, 1, 'Ticket', 100),
(3, 3, 0, 1, 3, 'Subject', 300),
(3, 4, 0, 1, 4, 'From', 185),
(3, 5, 0, 1, 5, 'Priority', 85),
(3, 8, 0, 1, 6, 'Assigned To', 160),
(3, 10, 0, 1, 2, 'Last Updated', 150),
(4, 1, 0, 1, 1, 'Ticket', 100),
(4, 3, 0, 1, 3, 'Subject', 300),
(4, 4, 0, 1, 4, 'From', 185),
(4, 5, 0, 1, 5, 'Priority', 85),
(4, 8, 0, 1, 6, 'Assigned To', 160),
(4, 9, 0, 1, 9, 'Due Date', 150),
(5, 1, 0, 1, 1, 'Ticket', 100),
(5, 3, 0, 1, 3, 'Subject', 300),
(5, 4, 0, 1, 4, 'From', 185),
(5, 5, 0, 1, 5, 'Priority', 85),
(5, 10, 0, 1, 2, 'Last Update', 150),
(5, 11, 0, 1, 6, 'Department', 160),
(6, 1, 0, 1, 1, 'Ticket', 100),
(6, 3, 0, 1, 3, 'Subject', 300),
(6, 4, 0, 1, 4, 'From', 185),
(6, 5, 0, 1, 5, 'Priority', 85),
(6, 10, 0, 1, 2, 'Last Update', 150),
(6, 11, 0, 1, 6, 'Department', 160),
(7, 1, 0, 1, 1, 'Ticket', 100),
(7, 3, 0, 1, 3, 'Subject', 300),
(7, 4, 0, 1, 4, 'From', 185),
(7, 5, 0, 1, 5, 'Priority', 85),
(7, 10, 0, 1, 2, 'Last Update', 150),
(7, 14, 0, 1, 6, 'Team', 160),
(8, 1, 0, 1, 1, 'Ticket', 100),
(8, 3, 0, 1, 3, 'Subject', 300),
(8, 4, 0, 1, 4, 'From', 185),
(8, 7, 0, 1, 2, 'Date Closed', 150),
(8, 8, 0, 1, 6, 'Closed By', 160),
(9, 1, 0, 1, 1, 'Ticket', 100),
(9, 3, 0, 1, 3, 'Subject', 300),
(9, 4, 0, 1, 4, 'From', 185),
(9, 7, 0, 1, 2, 'Date Closed', 150),
(9, 8, 0, 1, 6, 'Closed By', 160),
(10, 1, 0, 1, 1, 'Ticket', 100),
(10, 3, 0, 1, 3, 'Subject', 300),
(10, 4, 0, 1, 4, 'From', 185),
(10, 7, 0, 1, 2, 'Date Closed', 150),
(10, 8, 0, 1, 6, 'Closed By', 160),
(11, 1, 0, 1, 1, 'Ticket', 100),
(11, 3, 0, 1, 3, 'Subject', 300),
(11, 4, 0, 1, 4, 'From', 185),
(11, 7, 0, 1, 2, 'Date Closed', 150),
(11, 8, 0, 1, 6, 'Closed By', 160),
(12, 1, 0, 1, 1, 'Ticket', 100),
(12, 3, 0, 1, 3, 'Subject', 300),
(12, 4, 0, 1, 4, 'From', 185),
(12, 7, 0, 1, 2, 'Date Closed', 150),
(12, 8, 0, 1, 6, 'Closed By', 160),
(13, 1, 0, 1, 1, 'Ticket', 100),
(13, 3, 0, 1, 3, 'Subject', 300),
(13, 4, 0, 1, 4, 'From', 185),
(13, 7, 0, 1, 2, 'Date Closed', 150),
(13, 8, 0, 1, 6, 'Closed By', 160),
(14, 1, 0, 1, 1, 'Ticket', 100),
(14, 3, 0, 1, 3, 'Subject', 300),
(14, 4, 0, 1, 4, 'From', 185),
(14, 7, 0, 1, 2, 'Date Closed', 150),
(14, 8, 0, 1, 6, 'Closed By', 160);

-- --------------------------------------------------------

--
-- Table structure for table `ost_queue_config`
--

DROP TABLE IF EXISTS `ost_queue_config`;
CREATE TABLE `ost_queue_config` (
  `queue_id` int(11) UNSIGNED NOT NULL,
  `staff_id` int(11) UNSIGNED NOT NULL,
  `setting` text,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost_queue_config`
--

TRUNCATE TABLE `ost_queue_config`;
-- --------------------------------------------------------

--
-- Table structure for table `ost_queue_export`
--

DROP TABLE IF EXISTS `ost_queue_export`;
CREATE TABLE `ost_queue_export` (
  `id` int(11) UNSIGNED NOT NULL,
  `queue_id` int(11) UNSIGNED NOT NULL,
  `path` varchar(64) NOT NULL DEFAULT '',
  `heading` varchar(64) DEFAULT NULL,
  `sort` int(10) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost_queue_export`
--

TRUNCATE TABLE `ost_queue_export`;
-- --------------------------------------------------------

--
-- Table structure for table `ost_queue_sort`
--

DROP TABLE IF EXISTS `ost_queue_sort`;
CREATE TABLE `ost_queue_sort` (
  `id` int(11) UNSIGNED NOT NULL,
  `root` varchar(32) DEFAULT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `columns` text,
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost_queue_sort`
--

TRUNCATE TABLE `ost_queue_sort`;
--
-- Dumping data for table `ost_queue_sort`
--

INSERT INTO `ost_queue_sort` (`id`, `root`, `name`, `columns`, `updated`) VALUES
(1, NULL, 'Priority + Most Recently Updated', '[\"-cdata__priority\",\"-lastupdate\"]', '2025-11-29 04:12:34'),
(2, NULL, 'Priority + Most Recently Created', '[\"-cdata__priority\",\"-created\"]', '2025-11-29 04:12:34'),
(3, NULL, 'Priority + Due Date', '[\"-cdata__priority\",\"-est_duedate\"]', '2025-11-29 04:12:34'),
(4, NULL, 'Due Date', '[\"-est_duedate\"]', '2025-11-29 04:12:34'),
(5, NULL, 'Closed Date', '[\"-closed\"]', '2025-11-29 04:12:34'),
(6, NULL, 'Create Date', '[\"-created\"]', '2025-11-29 04:12:34'),
(7, NULL, 'Update Date', '[\"-lastupdate\"]', '2025-11-29 04:12:34');

-- --------------------------------------------------------

--
-- Table structure for table `ost_queue_sorts`
--

DROP TABLE IF EXISTS `ost_queue_sorts`;
CREATE TABLE `ost_queue_sorts` (
  `queue_id` int(11) UNSIGNED NOT NULL,
  `sort_id` int(11) UNSIGNED NOT NULL,
  `bits` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost_queue_sorts`
--

TRUNCATE TABLE `ost_queue_sorts`;
--
-- Dumping data for table `ost_queue_sorts`
--

INSERT INTO `ost_queue_sorts` (`queue_id`, `sort_id`, `bits`, `sort`) VALUES
(1, 1, 0, 0),
(1, 2, 0, 0),
(1, 3, 0, 0),
(1, 4, 0, 0),
(1, 6, 0, 0),
(1, 7, 0, 0),
(5, 1, 0, 0),
(5, 2, 0, 0),
(5, 3, 0, 0),
(5, 4, 0, 0),
(5, 6, 0, 0),
(5, 7, 0, 0),
(6, 1, 0, 0),
(6, 2, 0, 0),
(6, 3, 0, 0),
(6, 4, 0, 0),
(6, 6, 0, 0),
(6, 7, 0, 0),
(7, 1, 0, 0),
(7, 2, 0, 0),
(7, 3, 0, 0),
(7, 4, 0, 0),
(7, 6, 0, 0),
(7, 7, 0, 0),
(8, 1, 0, 0),
(8, 2, 0, 0),
(8, 3, 0, 0),
(8, 4, 0, 0),
(8, 5, 0, 0),
(8, 6, 0, 0),
(8, 7, 0, 0),
(9, 1, 0, 0),
(9, 2, 0, 0),
(9, 3, 0, 0),
(9, 4, 0, 0),
(9, 5, 0, 0),
(9, 6, 0, 0),
(9, 7, 0, 0),
(10, 1, 0, 0),
(10, 2, 0, 0),
(10, 3, 0, 0),
(10, 4, 0, 0),
(10, 5, 0, 0),
(10, 6, 0, 0),
(10, 7, 0, 0),
(11, 1, 0, 0),
(11, 2, 0, 0),
(11, 3, 0, 0),
(11, 4, 0, 0),
(11, 5, 0, 0),
(11, 6, 0, 0),
(11, 7, 0, 0),
(12, 1, 0, 0),
(12, 2, 0, 0),
(12, 3, 0, 0),
(12, 4, 0, 0),
(12, 5, 0, 0),
(12, 6, 0, 0),
(12, 7, 0, 0),
(13, 1, 0, 0),
(13, 2, 0, 0),
(13, 3, 0, 0),
(13, 4, 0, 0),
(13, 5, 0, 0),
(13, 6, 0, 0),
(13, 7, 0, 0),
(14, 1, 0, 0),
(14, 2, 0, 0),
(14, 3, 0, 0),
(14, 4, 0, 0),
(14, 5, 0, 0),
(14, 6, 0, 0),
(14, 7, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ost_role`
--

DROP TABLE IF EXISTS `ost_role`;
CREATE TABLE `ost_role` (
  `id` int(11) UNSIGNED NOT NULL,
  `flags` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `name` varchar(64) DEFAULT NULL,
  `permissions` text,
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost_role`
--

TRUNCATE TABLE `ost_role`;
--
-- Dumping data for table `ost_role`
--

INSERT INTO `ost_role` (`id`, `flags`, `name`, `permissions`, `notes`, `created`, `updated`) VALUES
(1, 1, 'All Access', '{\"ticket.assign\":1,\"ticket.close\":1,\"ticket.create\":1,\"ticket.delete\":1,\"ticket.edit\":1,\"thread.edit\":1,\"ticket.link\":1,\"ticket.markanswered\":1,\"ticket.merge\":1,\"ticket.reply\":1,\"ticket.refer\":1,\"ticket.release\":1,\"ticket.transfer\":1,\"task.assign\":1,\"task.close\":1,\"task.create\":1,\"task.delete\":1,\"task.edit\":1,\"task.reply\":1,\"task.transfer\":1,\"canned.manage\":1}', 'Role with unlimited access', '2025-11-29 04:12:34', '2025-11-29 04:12:34'),
(2, 1, 'Expanded Access', '{\"ticket.assign\":1,\"ticket.close\":1,\"ticket.create\":1,\"ticket.edit\":1,\"ticket.link\":1,\"ticket.merge\":1,\"ticket.reply\":1,\"ticket.refer\":1,\"ticket.release\":1,\"ticket.transfer\":1,\"task.assign\":1,\"task.close\":1,\"task.create\":1,\"task.edit\":1,\"task.reply\":1,\"task.transfer\":1,\"canned.manage\":1}', 'Role with expanded access', '2025-11-29 04:12:34', '2025-11-29 04:12:34'),
(3, 1, 'Limited Access', '{\"ticket.assign\":1,\"ticket.create\":1,\"ticket.link\":1,\"ticket.merge\":1,\"ticket.refer\":1,\"ticket.release\":1,\"ticket.transfer\":1,\"task.assign\":1,\"task.reply\":1,\"task.transfer\":1}', 'Role with limited access', '2025-11-29 04:12:34', '2025-11-29 04:12:34'),
(4, 1, 'View only', NULL, 'Simple role with no permissions', '2025-11-29 04:12:34', '2025-11-29 04:12:34');

-- --------------------------------------------------------

--
-- Table structure for table `ost_schedule`
--

DROP TABLE IF EXISTS `ost_schedule`;
CREATE TABLE `ost_schedule` (
  `id` int(11) UNSIGNED NOT NULL,
  `flags` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `timezone` varchar(64) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost_schedule`
--

TRUNCATE TABLE `ost_schedule`;
--
-- Dumping data for table `ost_schedule`
--

INSERT INTO `ost_schedule` (`id`, `flags`, `name`, `timezone`, `description`, `created`, `updated`) VALUES
(1, 1, 'Monday - Friday 8am - 5pm with U.S. Holidays', NULL, '', '2025-11-29 04:12:34', '2025-11-29 04:12:34'),
(2, 1, '24/7', NULL, '', '2025-11-29 04:12:34', '2025-11-29 04:12:34'),
(3, 1, '24/5', NULL, '', '2025-11-29 04:12:34', '2025-11-29 04:12:34'),
(4, 0, 'U.S. Holidays', NULL, '', '2025-11-29 04:12:34', '2025-11-29 04:12:34');

-- --------------------------------------------------------

--
-- Table structure for table `ost_schedule_entry`
--

DROP TABLE IF EXISTS `ost_schedule_entry`;
CREATE TABLE `ost_schedule_entry` (
  `id` int(11) UNSIGNED NOT NULL,
  `schedule_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `flags` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `sort` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `repeats` varchar(16) NOT NULL DEFAULT 'never',
  `starts_on` date DEFAULT NULL,
  `starts_at` time DEFAULT NULL,
  `ends_on` date DEFAULT NULL,
  `ends_at` time DEFAULT NULL,
  `stops_on` datetime DEFAULT NULL,
  `day` tinyint(4) DEFAULT NULL,
  `week` tinyint(4) DEFAULT NULL,
  `month` tinyint(4) DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost_schedule_entry`
--

TRUNCATE TABLE `ost_schedule_entry`;
--
-- Dumping data for table `ost_schedule_entry`
--

INSERT INTO `ost_schedule_entry` (`id`, `schedule_id`, `flags`, `sort`, `name`, `repeats`, `starts_on`, `starts_at`, `ends_on`, `ends_at`, `stops_on`, `day`, `week`, `month`, `created`, `updated`) VALUES
(1, 1, 0, 0, 'Monday', 'weekly', '2019-01-07', '08:00:00', '2019-01-07', '17:00:00', NULL, 1, NULL, NULL, '0000-00-00 00:00:00', '2025-11-29 04:12:34'),
(2, 1, 0, 0, 'Tuesday', 'weekly', '2019-01-08', '08:00:00', '2019-01-08', '17:00:00', NULL, 2, NULL, NULL, '0000-00-00 00:00:00', '2025-11-29 04:12:34'),
(3, 1, 0, 0, 'Wednesday', 'weekly', '2019-01-09', '08:00:00', '2019-01-09', '17:00:00', NULL, 3, NULL, NULL, '0000-00-00 00:00:00', '2025-11-29 04:12:34'),
(4, 1, 0, 0, 'Thursday', 'weekly', '2019-01-10', '08:00:00', '2019-01-10', '17:00:00', NULL, 4, NULL, NULL, '0000-00-00 00:00:00', '2025-11-29 04:12:34'),
(5, 1, 0, 0, 'Friday', 'weekly', '2019-01-11', '08:00:00', '2019-01-11', '17:00:00', NULL, 5, NULL, NULL, '0000-00-00 00:00:00', '2025-11-29 04:12:34'),
(6, 2, 0, 0, 'Daily', 'daily', '2019-01-01', '00:00:00', '2019-01-01', '23:59:59', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '2025-11-29 04:12:34'),
(7, 3, 0, 0, 'Weekdays', 'weekdays', '2019-01-01', '00:00:00', '2019-01-01', '23:59:59', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '2025-11-29 04:12:34'),
(8, 4, 0, 0, 'New Year\'s Day', 'yearly', '2019-01-01', '00:00:00', '2019-01-01', '23:59:59', NULL, 1, NULL, 1, '0000-00-00 00:00:00', '2025-11-29 04:12:34'),
(9, 4, 0, 0, 'MLK Day', 'yearly', '2019-01-21', '00:00:00', '2019-01-21', '23:59:59', NULL, 1, 3, 1, '0000-00-00 00:00:00', '2025-11-29 04:12:34'),
(10, 4, 0, 0, 'Memorial Day', 'yearly', '2019-05-27', '00:00:00', '2019-05-27', '23:59:59', NULL, 1, -1, 5, '0000-00-00 00:00:00', '2025-11-29 04:12:34'),
(11, 4, 0, 0, 'Independence Day (4th of July)', 'yearly', '2019-07-04', '00:00:00', '2019-07-04', '23:59:59', NULL, 4, NULL, 7, '0000-00-00 00:00:00', '2025-11-29 04:12:34'),
(12, 4, 0, 0, 'Labor Day', 'yearly', '2019-09-02', '00:00:00', '2019-09-02', '23:59:59', NULL, 1, 1, 9, '0000-00-00 00:00:00', '2025-11-29 04:12:34'),
(13, 4, 0, 0, 'Indigenous Peoples\' Day (Whodat Columbus)', 'yearly', '2019-10-14', '00:00:00', '2019-10-14', '23:59:59', NULL, 1, 2, 10, '0000-00-00 00:00:00', '2025-11-29 04:12:34'),
(14, 4, 0, 0, 'Veterans Day', 'yearly', '2019-11-11', '00:00:00', '2019-11-11', '23:59:59', NULL, 11, NULL, 11, '0000-00-00 00:00:00', '2025-11-29 04:12:34'),
(15, 4, 0, 0, 'Thanksgiving Day', 'yearly', '2019-11-28', '00:00:00', '2019-11-28', '23:59:59', NULL, 4, 4, 11, '0000-00-00 00:00:00', '2025-11-29 04:12:34'),
(16, 4, 0, 0, 'Christmas Day', 'yearly', '2019-11-25', '00:00:00', '2019-11-25', '23:59:59', NULL, 25, NULL, 12, '0000-00-00 00:00:00', '2025-11-29 04:12:34');

-- --------------------------------------------------------

--
-- Table structure for table `ost_sequence`
--

DROP TABLE IF EXISTS `ost_sequence`;
CREATE TABLE `ost_sequence` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `flags` int(10) UNSIGNED DEFAULT NULL,
  `next` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `increment` int(11) DEFAULT '1',
  `padding` char(1) DEFAULT '0',
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost_sequence`
--

TRUNCATE TABLE `ost_sequence`;
--
-- Dumping data for table `ost_sequence`
--

INSERT INTO `ost_sequence` (`id`, `name`, `flags`, `next`, `increment`, `padding`, `updated`) VALUES
(1, 'General Tickets', 1, 1, 1, '0', '0000-00-00 00:00:00'),
(2, 'Tasks Sequence', 1, 1, 1, '0', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ost_session`
--

DROP TABLE IF EXISTS `ost_session`;
CREATE TABLE `ost_session` (
  `session_id` varchar(255) CHARACTER SET ascii NOT NULL DEFAULT '',
  `session_data` blob,
  `session_expire` datetime DEFAULT NULL,
  `session_updated` datetime DEFAULT NULL,
  `user_id` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT 'osTicket staff/client ID',
  `user_ip` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_agent` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Truncate table before insert `ost_session`
--

TRUNCATE TABLE `ost_session`;
--
-- Dumping data for table `ost_session`
--

INSERT INTO `ost_session` (`session_id`, `session_data`, `session_expire`, `session_updated`, `user_id`, `user_ip`, `user_agent`) VALUES
('007a0cdd060d932f0d01e4e12d2e6e71', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2264313362653339336635663265643061633434353738656365613130323137616534353162653932223b733a343a2274696d65223b693a313737353433393631353b7d5f617574687c613a313a7b733a353a227374616666223b4e3b7d, '2026-04-06 18:40:11', '2026-04-05 18:40:15', '0', '216.73.216.154', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; ClaudeBot/1.0; +claudebot@anthropic.com)'),
('012289d97ab96935ccd705823c073bd0', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2236626536653232366136663437356662633363323238333036303464306139336166613763373037223b733a343a2274696d65223b693a313737353432333633333b7d, '2026-04-06 14:13:53', '2026-04-05 14:13:53', '0', '23.27.145.136', 'Mozilla/5.0 (X11; Linux i686; rv:109.0) Gecko/20100101 Firefox/120.0'),
('016e3e85afd6cd6ef70239f9bd2491ff', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2262393836636237363661326639306566623130336430333833393831613065383230363733383639223b733a343a2274696d65223b693a313737353539323539373b7d, '2026-04-08 13:09:57', '2026-04-07 13:09:57', '0', '178.22.106.230', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Mobile Safari/537.36'),
('016e5ec80bac67124a923620e753c0f4', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2261346463396563363137626163353336353032633966613331616161343737616661383333356533223b733a343a2274696d65223b693a313737353437313438383b7d, '2026-04-07 03:31:28', '2026-04-06 03:31:28', '0', '35.239.77.230', 'Mozilla/5.0 (compatible; CMS-Checker/1.0; +https://example.com)'),
('01a7990909842db7f7e53a5372b1c8bd', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2231373463306637613466656166316564343262663031643236333464663063326165343436633639223b733a343a2274696d65223b693a313737353535303537373b7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31393a22416d65726963612f4c6f735f416e67656c6573223b7d, '2026-04-08 01:29:37', '2026-04-07 01:29:37', '0', '45.148.10.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'),
('0454639d67ef4d97eacabc8b1d215d04', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2238653737323232383033636535616637623331363863633762613863626338656339323963623536223b733a343a2274696d65223b693a313737353535303537353b7d, '2026-04-08 01:29:35', '2026-04-07 01:29:35', '0', '45.148.10.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'),
('059b25aabbdabc79b205759adb59ee9b', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2230613532666531323538656461336532303762333732373038623239356465383834626262303736223b733a343a2274696d65223b693a313737353736383935363b7d, '2026-04-10 14:09:16', '2026-04-09 14:09:16', '0', '23.27.145.237', 'Mozilla/5.0 (X11; Linux i686; rv:109.0) Gecko/20100101 Firefox/120.0'),
('06bec91d6f49ac9e32aa2a61891acd6f', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2239633337653336643831656335343632623432653031353131326266353761343731383361623030223b733a343a2274696d65223b693a313737353531393432363b7d, '2026-04-07 16:50:26', '2026-04-06 16:50:26', '0', '45.148.10.231', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
('07ffdc9a812561c3d04d078d98eb16bc', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2234373336613338336533346334663330313531636536373461306335633562333064303631363063223b733a343a2274696d65223b693a313737353535303536353b7d, '2026-04-08 01:29:25', '2026-04-07 01:29:25', '0', '45.148.10.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'),
('08ea05592268f71f18c445220e9a24c9', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2266343132323835353663626634633731323264396130656435666232653562663663356632353761223b733a343a2274696d65223b693a313737353431383232363b7d, '2026-04-06 12:43:46', '2026-04-05 12:43:46', '0', '66.132.172.131', 'Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)'),
('09d9ef07bdce5710078505eb5b25b5ec', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2232303166663036366564386536326239623839356262613061643630656664626461396131313034223b733a343a2274696d65223b693a313737353432393036333b7d, '2026-04-06 15:44:23', '2026-04-05 15:44:23', '0', '35.90.226.34', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.7680.177 Safari/537.36 Edge/18.19582'),
('09f8052cc41ee4b2b69f7bacd8a9678d', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2231353165646466363365666130353630366561633739626662613239663761353632653039653662223b733a343a2274696d65223b693a313737353937333931333b7d, '2026-04-12 23:05:14', '2026-04-11 23:05:14', '0', '15.237.83.126', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
('0d6b9fd4f348231b83382ab91375d780', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2239616166396564303562376366663463303961383130393136333662653662653831333666656636223b733a343a2274696d65223b693a313737353535303537353b7d5f617574687c613a313a7b733a343a2275736572223b4e3b7d, '2026-04-08 01:29:35', '2026-04-07 01:29:35', '0', '45.148.10.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'),
('0e3c506407caf0128dc248a5f18b93b3', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2266313362333763303634393661346539616133633163356462323163353032343363653865616461223b733a343a2274696d65223b693a313737353535303537323b7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31393a22416d65726963612f4c6f735f416e67656c6573223b7d, '2026-04-08 01:29:32', '2026-04-07 01:29:32', '0', '45.148.10.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'),
('0ea213799dbb6c723b34ef8a41c31241', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2264333062363835643762626131376466346366613933666633666234393033353061646439386436223b733a343a2274696d65223b693a313737353535303535323b7d, '2026-04-08 01:29:12', '2026-04-07 01:29:12', '0', '45.148.10.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'),
('10a6918c6e70569bad2263e69d9344d1', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2263313463666461373062336363306365316135343962396365393335636534653561376431316531223b733a343a2274696d65223b693a313737353532353437333b7d, '2026-04-07 18:31:13', '2026-04-06 18:31:13', '0', '172.70.250.66', 'Go-http-client/1.1'),
('10ddcb05b832fdbef68b5f918db2816c', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2234633265653162653636326339323865313762393263323766633337356362313238633563333831223b733a343a2274696d65223b693a313737353431373639363b7d, '2026-04-06 12:34:56', '2026-04-05 12:34:56', '0', '54.247.57.72', 'Mozilla/5.0 (X11; Linux x86_64; rv:83.0) Gecko/20100101 Firefox/83.0'),
('1349f7e4a7214ffe91be7eb6ef59bbc9', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2262343436623437373533623262636563366465326633316263613833373439306265363030363661223b733a343a2274696d65223b693a313737353438393031383b7d, '2026-04-07 08:23:38', '2026-04-06 08:23:38', '0', '35.226.39.24', 'Mozilla/5.0 (compatible; CMS-Checker/1.0; +https://example.com)'),
('15c1509ec043b0677a94660a0ccec980', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2261343633393162363338643335326535306232363539346534616235616231623966666632663763223b733a343a2274696d65223b693a313737353634363934333b7d, '2026-04-09 04:10:04', '2026-04-08 04:15:43', '0', '35.146.238.149', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0'),
('15f08f2733dc3615541149f4d9124d1c', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2234373863333333323832363365346661316466376234346234343738633736363032656536313837223b733a343a2274696d65223b693a313737353535303537353b7d, '2026-04-08 01:29:35', '2026-04-07 01:29:35', '0', '45.148.10.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'),
('1630a889f059fe3ccdbe0c690d23afad', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2239383861613862376464333065666661363535383364666630626637653463326431303435613739223b733a343a2274696d65223b693a313737353432373630323b7d, '2026-04-06 15:20:02', '2026-04-05 15:20:02', '0', '216.73.216.154', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; ClaudeBot/1.0; +claudebot@anthropic.com)'),
('1709ae39ed8bcfdd9272b0695095d3a9', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2230383136343661313365656235383230336334613964666230666661646562633738306131336563223b733a343a2274696d65223b693a313737353535303538303b7d, '2026-04-08 01:29:40', '2026-04-07 01:29:40', '0', '45.148.10.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'),
('18e8ec394d67516cd5f7f74f69be8583', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2233303933613935323838313864626536643333623730653839336631356338643233366434373038223b733a343a2274696d65223b693a313737353932373035383b7d, '2026-04-12 10:04:18', '2026-04-11 10:04:18', '0', '192.175.111.234', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36'),
('1b01581395f2ddd89122d0c0a888bc51', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2235376637396466626266363235386138633437613934663736303933356138316436353531623736223b733a343a2274696d65223b693a313737353836313939393b7d, '2026-04-11 15:59:59', '2026-04-10 15:59:59', '0', '220.181.108.147', 'Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),
('1bde83c512fefbfd466c25f43eabbb1c', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2235386663336361353930663236356131656335646661353133303765376339636161663063623339223b733a343a2274696d65223b693a313737353433313933303b7d, '2026-04-06 16:32:10', '2026-04-05 16:32:10', '0', '193.32.248.252', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0'),
('1d7ebe4b489c74565e15213b23226f67', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2236373633613265313931386638613834306638383135353433323363366463383539376165313465223b733a343a2274696d65223b693a313737353535303537303b7d, '2026-04-08 01:29:30', '2026-04-07 01:29:30', '0', '45.148.10.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'),
('1d90a028569fd10668d96aab8ece83df', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2238613530353264336536663263356538333664306139646539323730333035323335373562396638223b733a343a2274696d65223b693a313737353839343932363b7d, '2026-04-12 01:08:46', '2026-04-11 01:08:46', '0', '185.177.72.60', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
('1ed6024c1502190812097b23d35e88ad', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2236653539613364363033646330393564613466333161316238346463663364333538306636643130223b733a343a2274696d65223b693a313737353631373332383b7d, '2026-04-08 20:02:08', '2026-04-07 20:02:08', '0', '143.198.63.61', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36'),
('1f30da19d3ec00fe0415c34cd735b6cf', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2261303331646236633461363938346635333438363230343838376130393835626437313931376236223b733a343a2274696d65223b693a313737353439383431393b7d, '2026-04-07 11:00:18', '2026-04-06 11:00:19', '0', '34.11.57.2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36'),
('1f926e684fe47ccf41e2dd122f25bed6', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2262396639313138343263623238323230313837643131663633386138663562653736663834326237223b733a343a2274696d65223b693a313737353530393037323b7d, '2026-04-07 13:57:53', '2026-04-06 13:57:53', '0', '45.92.86.106', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.61 Safari/537.36'),
('21f64d16af48b7a11f70a7f4628bb747', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2232333032366635646234303936346461363762336430663737373031323535383761643238333363223b733a343a2274696d65223b693a313737353432353233353b7d, '2026-04-06 14:40:35', '2026-04-05 14:40:35', '0', '46.202.140.154', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.0 Mobile/15E148 Safari/604.1'),
('21fbb755dbe1ba3fcc4fa9f8d1db8ffa', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2231623562353365393638303730383766363238633232323632386136636163613363303065616434223b733a343a2274696d65223b693a313737353535303538303b7d5f617574687c613a313a7b733a353a227374616666223b4e3b7d, '2026-04-08 01:29:40', '2026-04-07 01:29:40', '0', '45.148.10.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'),
('2359cf68070442f1d8421397b1944228', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2238386536653034346537303933326138393665376464633130303865353462383937396435373666223b733a343a2274696d65223b693a313737353432323439393b7d, '2026-04-06 13:54:59', '2026-04-05 13:54:59', '0', '35.92.155.232', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36 Edge/18.19582'),
('2621e113c0664ca22a741f4b4aaeb881', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2266303864666534313462303461373336646638373461356366633462363563323064633135303962223b733a343a2274696d65223b693a313737353436313030363b7d, '2026-04-07 00:36:47', '2026-04-06 00:36:47', '0', '178.22.106.230', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Mobile Safari/537.36'),
('2848822994273c0b2b1dc10acf0d28a6', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2266653465316166386630346361376262313838383330316339386461346265626363306161366666223b733a343a2274696d65223b693a313737353532363136333b7d, '2026-04-07 18:42:43', '2026-04-06 18:42:43', '0', '121.127.34.138', 'Mozilla/5.0 (Linux; Android 14; Pixel 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36'),
('2a849fdedccbf2fd5a61cc6b699b3664', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2266663537616561353138373032326363373134363235303637383730613563666431326633396465223b733a343a2274696d65223b693a313737353434373333343b7d, '2026-04-06 20:48:54', '2026-04-05 20:48:54', '0', '167.71.98.122', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36'),
('2b946812ac9bac6d4ecc1c6479db443d', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2263333435346566323633353466666232613635386362313134336436363430343430633463633136223b733a343a2274696d65223b693a313737353431373731323b7d, '2026-04-06 12:34:57', '2026-04-05 12:35:12', '0', '54.247.57.72', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36'),
('2c3980842613cdf6fbbd51956546e127', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2264633835653134613833623265306661353930386539353439623262343632626232393366646633223b733a343a2274696d65223b693a313737353535303537323b7d, '2026-04-08 01:29:32', '2026-04-07 01:29:32', '0', '45.148.10.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'),
('2e30a2b074447ae3a695f214d83960cb', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2261303966613031363437343937316336356135626130613735356362653936383134323261383766223b733a343a2274696d65223b693a313737353432393032313b7d, '2026-04-06 15:43:41', '2026-04-05 15:43:41', '0', '34.219.45.92', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.3 Mobile/15E148 Safari/604.1'),
('2e73768a66e9086825e3d4d1e4c2898b', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2263666630313261653736363830353565643063653635303336316432643563633831626639313963223b733a343a2274696d65223b693a313737353433373937303b7d, '2026-04-06 18:12:50', '2026-04-05 18:12:50', '0', '23.27.145.12', 'Mozilla/5.0 (X11; Linux i686; rv:109.0) Gecko/20100101 Firefox/120.0'),
('30f69dd4494859e0adb43e5733ff7b41', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2235643036616365383430316332313863326361643764353533666166353962363364366235373534223b733a343a2274696d65223b693a313737353431383437343b7d, '2026-04-06 12:47:54', '2026-04-05 12:47:54', '0', '91.231.89.37', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:134.0) Gecko/20100101 Firefox/134.0'),
('310964e6b9f6a6e05c770ea298542421', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2265643461663437383436663830326365353230323736383563323466663364653865306232666661223b733a343a2274696d65223b693a313737353530343731303b7d5f617574687c613a313a7b733a353a227374616666223b4e3b7d, '2026-04-07 12:45:11', '2026-04-06 12:45:11', '0', '35.146.238.149', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0'),
('312984a02207e99d6ed7b6e287526a08', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2264366137393931643334653335363630356633366463393831343636386566313230643734353933223b733a343a2274696d65223b693a313737353535303537383b7d, '2026-04-08 01:29:38', '2026-04-07 01:29:38', '0', '45.148.10.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'),
('3197e7f430a822477e2cba0a286c3ea8', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2261336433353333663738663534633131616430653034343963383662353638623232383366313734223b733a343a2274696d65223b693a313737353535303537393b7d5f617574687c613a313a7b733a353a227374616666223b4e3b7d, '2026-04-08 01:29:39', '2026-04-07 01:29:39', '0', '45.148.10.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'),
('31b12e7fded1d0b0a3107c6eec42ec70', 0x637372667c4e3b5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a31343a222f7363702f696e6465782e706870223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d, '2026-04-08 01:29:40', '2026-04-07 01:29:40', '0', '45.148.10.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'),
('321c8b39f264ec5afe54d9241707ecde', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2239306531316131376162323738393063613061336431626433396664623932623062623662363939223b733a343a2274696d65223b693a313737353739373733323b7d, '2026-04-10 22:08:52', '2026-04-09 22:08:52', '0', '104.232.39.159', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Mobile Safari/537.36'),
('34326d0928fbbdd5398e42156dc52f88', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2230613730623438633834666164303665343236383266626532316332636364333239323332623237223b733a343a2274696d65223b693a313737353432393036373b7d, '2026-04-06 15:44:27', '2026-04-05 15:44:27', '0', '35.90.226.34', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.3 Mobile/15E148 Safari/604.1'),
('34f00a3ae5e595ed5a8303ac6b5bae94', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2265633164343037353235633433643530323666656361643632313064636437656163366561653737223b733a343a2274696d65223b693a313737353932373035393b7d, '2026-04-12 10:04:19', '2026-04-11 10:04:19', '0', '64.15.129.101', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36'),
('35fa52b2a8156ed7c1e651b72de8ecef', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2265636663373861653331323330613162633365663435326561663530626464373130636265336134223b733a343a2274696d65223b693a313737353431373239393b7d5f617574687c613a313a7b733a353a227374616666223b4e3b7d, '2026-04-06 12:28:19', '2026-04-05 12:28:19', '0', '35.146.238.149', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0'),
('36592576813126d3e6645457a61d3106', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2231346461643432363130373637303636353730383430373235613466613734626463373435613639223b733a343a2274696d65223b693a313737353535303538333b7d, '2026-04-08 01:29:43', '2026-04-07 01:29:43', '0', '45.148.10.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'),
('36ec09022bf5abea019c5644be377916', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2231346463636132373732656562306464336530393861373166393933353764333664616134373134223b733a343a2274696d65223b693a313737353432303933333b7d, '2026-04-06 13:28:53', '2026-04-05 13:28:53', '0', '45.132.194.18', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36'),
('377e410f3914833e27b6ce0a0d6ebe22', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2261366265373430666437393233396561336132313437306362663431363764666435643639323138223b733a343a2274696d65223b693a313737363032313939323b7d, '2026-04-13 12:26:32', '2026-04-12 12:26:32', '0', '155.2.226.162', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Mobile Safari/537.36'),
('377f15b25e09156aee6cf431b1375a08', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2237616461323566373234323633343133623330393339656337613533373062666439636337323539223b733a343a2274696d65223b693a313737353535303537303b7d, '2026-04-08 01:29:30', '2026-04-07 01:29:30', '0', '45.148.10.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'),
('386f09684e4217a060bb6a305be55b33', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2262326465303834323839343262303366383438613637616539653164636263323663613663343761223b733a343a2274696d65223b693a313737353530343033323b7d, '2026-04-07 12:33:52', '2026-04-06 12:33:52', '0', '178.22.106.230', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Mobile Safari/537.36'),
('3a9d44865cb1dbd201835bf278dd24df', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2232363164633731346533386262323933393636336232373333333139313233356438613362343439223b733a343a2274696d65223b693a313737353437363738333b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a31373a222f7363702f6661712e7068703f69643d31223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a313a7b733a353a227374616666223b4e3b7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31393a22416d65726963612f4c6f735f416e67656c6573223b7d, '2026-04-07 04:38:02', '2026-04-06 04:59:43', '0', '35.146.238.149', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36'),
('3b56dd6c2d448849f0962cc814591d4b', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2265356561643137633137653661373432376531353238343833666462306135633836623636373765223b733a343a2274696d65223b693a313737353431383039343b7d, '2026-04-06 12:41:34', '2026-04-05 12:41:34', '0', '167.94.146.52', 'Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)'),
('3b6689e0e2c375617063cd5c156c8e64', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2236613530326231396165636535393930393231616634623530376636376562656335613335383663223b733a343a2274696d65223b693a313737353432333632383b7d, '2026-04-06 14:13:48', '2026-04-05 14:13:48', '0', '104.198.198.236', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.2 Safari/537.36'),
('3d7ecf0a35962c3f5ae540627109fc90', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2235356662646334616532376533373536643638333931323865653066396663303463363837333365223b733a343a2274696d65223b693a313737353432383131383b7d, '2026-04-06 15:28:38', '2026-04-05 15:28:38', '0', '216.73.216.154', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; ClaudeBot/1.0; +claudebot@anthropic.com)'),
('3e164ad27ddd407259a8b10292db6458', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2264376162613432623263393264323464313639396364356135636365303637616138373539313437223b733a343a2274696d65223b693a313737353432393030393b7d, '2026-04-06 15:43:29', '2026-04-05 15:43:29', '0', '35.87.205.169', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.7680.177 Safari/537.36 Edge/18.19582'),
('44c1c3927aaf83535ce6236d170d6447', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2231363166366164393762376264623932633164396234316637663936333664396663613062396562223b733a343a2274696d65223b693a313737363032353239313b7d, '2026-04-13 13:21:31', '2026-04-12 13:21:31', '0', '155.2.226.162', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Mobile Safari/537.36'),
('44c51c1ac761b9c93277490a86c4adf7', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2262333035393961643032323463363961633665646438333934356165653766666130323232346132223b733a343a2274696d65223b693a313737353431383230383b7d, '2026-04-06 12:43:28', '2026-04-05 12:43:28', '0', '220.181.108.166', 'Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),
('453un1hp78tn22tgeqnd2ouuvg', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2263383033666364643566646334313762366130316131633632373931613037376533373435643661223b733a343a2274696d65223b693a313737353430313639383b7d, '2026-04-06 08:08:18', '2026-04-05 08:08:18', '0', '136.116.54.37', 'Mozilla/5.0 (compatible; CMS-Checker/1.0; +https://example.com)'),
('4851c73990c827a38492a386e15d85fa', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2239323262393766363664333139346332376233346232333566353231633331653137356238633331223b733a343a2274696d65223b693a313737353432303930333b7d, '2026-04-06 13:28:23', '2026-04-05 13:28:23', '0', '178.22.106.230', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Mobile Safari/537.36'),
('48f82bab933c19ef8642d076ee7b7963', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2238376539633532656664623261646337396531383361353865366133333564393737373034616266223b733a343a2274696d65223b693a313737353436353033333b7d, '2026-04-07 01:43:53', '2026-04-06 01:43:53', '0', '54.156.91.154', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.7204.23 Safari/537.36'),
('49b0b8edf2145fb5be256e5ecad13a1d', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2264613865326165396461346363343963366134663863313062626565663933623861383831653763223b733a343a2274696d65223b693a313737353535303536323b7d, '2026-04-08 01:29:22', '2026-04-07 01:29:22', '0', '45.148.10.62', ''),
('49de0a0f52fd9cad8c15901864bd0431', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2239666337663761353336353265623864306161373761313930313433356138336461306663613931223b733a343a2274696d65223b693a313737353733353332303b7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31393a22416d65726963612f4c6f735f416e67656c6573223b7d, '2026-04-10 04:48:25', '2026-04-09 04:48:40', '0', '74.7.243.252', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; GPTBot/1.3; +https://openai.com/gptbot)'),
('4a24297eacf6e27751495397b922829e', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2238643436376434633861353331313461356462363031373865343536663537663636666534323533223b733a343a2274696d65223b693a313737353432353233313b7d, '2026-04-06 14:40:32', '2026-04-05 14:40:32', '0', '46.202.140.154', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.0 Mobile/15E148 Safari/604.1'),
('4b4c9173e376271b423e0edcb401b48e', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2261326336353037386331336262343335363238373732616235366338616565366630633032386664223b733a343a2274696d65223b693a313737353535303537373b7d, '2026-04-08 01:29:37', '2026-04-07 01:29:37', '0', '45.148.10.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'),
('4bc7ba8fdf9304bd304cfab228dc1c7a', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2239396564376534613134313534363532623134663339333132633530626563393266343535653938223b733a343a2274696d65223b693a313737353535303537323b7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31393a22416d65726963612f4c6f735f416e67656c6573223b7d, '2026-04-08 01:29:32', '2026-04-07 01:29:32', '0', '45.148.10.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'),
('4bd3303c11adc5089ca6b31b47f70a81', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2238323033623562636561643033336461663230366430303532316130616536393834346237313335223b733a343a2274696d65223b693a313737353438363237323b7d, '2026-04-07 07:37:52', '2026-04-06 07:37:52', '0', '34.126.183.201', 'Mozilla/5.0 (Linux; Android 12) Chrome/111.0 Mobile Safari/537.36'),
('4f65cb673c4bf624768533aebb7455e0', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2264663138643530653337316366343066393466333638333431383432353537626361363666623736223b733a343a2274696d65223b693a313737353535303537353b7d, '2026-04-08 01:29:35', '2026-04-07 01:29:35', '0', '45.148.10.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'),
('512f24e9ebf9b4e50128a5ae6e0dbff3', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2265386364646334663630306631353033333838663766363638666234313138633038356330623433223b733a343a2274696d65223b693a313737353539363237313b7d, '2026-04-08 14:11:11', '2026-04-07 14:11:11', '0', '23.27.145.63', 'Mozilla/5.0 (X11; Linux i686; rv:109.0) Gecko/20100101 Firefox/120.0'),
('51d202dfae0ec1f55939abca62da47e5', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2239363333323939396633323935346438646565373734356165343730633732363562373833343265223b733a343a2274696d65223b693a313737353535303535333b7d, '2026-04-08 01:29:13', '2026-04-07 01:29:13', '0', '45.148.10.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'),
('551329fd0f01a0a34dbf2b181f649d34', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2232643664316564656661626137303337316134663936343731623763613634323633326166643532223b733a343a2274696d65223b693a313737353438393334353b7d, '2026-04-07 08:29:05', '2026-04-06 08:29:05', '0', '136.116.102.75', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36'),
('56fa3c704b02c8e1841575a872c11fea', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2238356537653336653365313339333966346130373462303131306135613031653736613762613766223b733a343a2274696d65223b693a313737353437393835303b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a31383a222f7363702f64617368626f6172642e706870223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a313a7b733a353a227374616666223b4e3b7d, '2026-04-07 05:50:50', '2026-04-06 05:50:50', '0', '35.146.238.149', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0'),
('5727d802217849986995fdfa20344cff', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2234643932326661383030623036363236336666313233373561646536393865666337323761663033223b733a343a2274696d65223b693a313737353432313939393b7d, '2026-04-06 13:46:39', '2026-04-05 13:46:39', '0', '216.73.216.154', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; ClaudeBot/1.0; +claudebot@anthropic.com)'),
('58a9b61eca86a5c027f2a44559bb7179', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2265306631663333363235333631663463643632363061653762333635393538373761353234303837223b733a343a2274696d65223b693a313737353431373639393b7d, '2026-04-06 12:34:59', '2026-04-05 12:34:59', '0', '54.247.57.72', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36'),
('591970fcc6aebed21c5a606c482f0a6c', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2264646137343636393462326432313865303534313063313331646233636564393138323433643331223b733a343a2274696d65223b693a313737353432393031363b7d, '2026-04-06 15:43:36', '2026-04-05 15:43:36', '0', '34.219.45.92', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.7680.177 Safari/537.36'),
('5aa97d2a0dba53b60862781cd6071804', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2232383665636465623837373033633066373761656637356231323861363237656235313333623432223b733a343a2274696d65223b693a313737353535353632373b7d, '2026-04-08 02:53:47', '2026-04-07 02:53:47', '0', '52.40.27.5', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
('5ae40fc1fbff46edd73d1827eb9f4bd2', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2239633632643639653630393734663565333664636338313630653262663339303235346635623236223b733a343a2274696d65223b693a313737353736343831363b7d, '2026-04-10 13:00:16', '2026-04-09 13:00:16', '0', '178.22.106.230', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Mobile Safari/537.36'),
('5b4660ab3104ec9373e79ce9d876cd89', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2266303532383462306263306564356233313161363931316438633735633031393037623735653538223b733a343a2274696d65223b693a313737353434303032393b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a31343a222f7363702f696e6465782e706870223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a313a7b733a353a227374616666223b4e3b7d, '2026-04-06 18:47:09', '2026-04-05 18:47:09', '0', '216.73.216.154', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; ClaudeBot/1.0; +claudebot@anthropic.com)'),
('5c9401a6f5fd609dad1508f179e953a8', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2239666536656532386261303132326437333730323031323631643565623730653363393564643066223b733a343a2274696d65223b693a313737353432383134323b7d5f617574687c613a313a7b733a343a2275736572223b4e3b7d, '2026-04-06 15:29:01', '2026-04-05 15:29:02', '0', '216.73.216.154', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; ClaudeBot/1.0; +claudebot@anthropic.com)'),
('5de3dbe10e95b88e816785b866b52606', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2265313539643732373139643838333532323063616465666461643763393462383234623964303130223b733a343a2274696d65223b693a313737353932373035393b7d, '2026-04-12 10:04:19', '2026-04-11 10:04:19', '0', '192.175.111.237', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36'),
('63137876959bed16c12b2de1ae8556ac', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2237303462656333313936643465313961633363333465336265306363663266643263663433326633223b733a343a2274696d65223b693a313737353431373731313b7d, '2026-04-06 12:35:12', '2026-04-05 12:35:12', '0', '54.247.57.72', 'Mozilla/5.0 (X11; Linux x86_64; rv:83.0) Gecko/20100101 Firefox/83.0'),
('6601859dafda1e80cb1eeec16a0a7bdd', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2236613162326466323035343661386531356564343466623839323764333964396538313435363038223b733a343a2274696d65223b693a313737353631373332383b7d, '2026-04-08 20:02:08', '2026-04-07 20:02:08', '0', '143.198.63.61', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36'),
('674fc71185957b6547d63cecb68ae30c', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2239626233653230353466343062326534653337386162613264333933363431613136313162393761223b733a343a2274696d65223b693a313737353433323833303b7d, '2026-04-06 16:47:10', '2026-04-05 16:47:10', '0', '45.66.35.35', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Mobile Safari/537.36'),
('6995f56c1111023828141481366c2df9', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2237623363383963343963363262636461353233336363313630316435393231623565366363613935223b733a343a2274696d65223b693a313737353432333630333b7d, '2026-04-06 14:13:24', '2026-04-05 14:13:24', '0', '136.119.228.155', 'Mozilla/5.0 (X11; OpenBSD i386) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36'),
('6f99241f224929078673bb944e70aed1', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2266383163323739653762626434616435343534356563636436663165656138366566653363323435223b733a343a2274696d65223b693a313737353438373231363b7d, '2026-04-07 07:53:36', '2026-04-06 07:53:36', '0', '35.202.232.75', 'Mozilla/5.0 (compatible; CMS-Checker/1.0; +https://example.com)'),
('7076e6383d5b9229a3e6438b880e7ccf', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2265636431336232366536636462663066663633313338643330323731366366653233353662633466223b733a343a2274696d65223b693a313737353434393336313b7d, '2026-04-06 21:22:41', '2026-04-05 21:22:41', '0', '44.221.188.147', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36'),
('739f541ee0251184198a8d3e1b581dda', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2230666437366333363538353932633832613966616666343363386132366131316266383031346564223b733a343a2274696d65223b693a313737353438363232333b7d, '2026-04-07 07:37:03', '2026-04-06 07:37:03', '0', '185.8.106.156', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36'),
('753efb879ec031149fa63ff9559b83f5', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2232616138653063326161356633643861363634656336396163656662353964333239653131326564223b733a343a2274696d65223b693a313737353534373630363b7d, '2026-04-08 00:40:06', '2026-04-07 00:40:06', '0', '31.133.0.235', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.1 Mobile/15E148 Safari/604.1'),
('7758948faa3de327290f1aa5d1502028', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2264353162656537313536313563376435323837653133373266626466303538666531316166336335223b733a343a2274696d65223b693a313737353535303537343b7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31393a22416d65726963612f4c6f735f416e67656c6573223b7d, '2026-04-08 01:29:34', '2026-04-07 01:29:34', '0', '45.148.10.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'),
('7854cc59570f6eb0177b7a63502a4131', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2261336361646538356565366330666563333035336133373337393832666337363033336630393536223b733a343a2274696d65223b693a313737353535303535343b7d, '2026-04-08 01:29:14', '2026-04-07 01:29:14', '0', '45.148.10.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'),
('798661e7a6c136f4c48f064490699fb6', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2233626262613238313664363866616639633039623939636638646461303331623836656534396431223b733a343a2274696d65223b693a313737353531313339313b7d, '2026-04-07 14:36:32', '2026-04-06 14:36:32', '0', '180.97.39.94', 'pc'),
('79d23eca4a2d92a6eaa5c58b5fa5fcb1', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2263643338616638353163356434393139336162306438613937623834653839663637623766333135223b733a343a2274696d65223b693a313737353432383131383b7d, '2026-04-06 15:28:38', '2026-04-05 15:28:38', '0', '216.73.216.154', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; ClaudeBot/1.0; +claudebot@anthropic.com)'),
('7acde4ef07ba219c5370358b8581596b', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2233656532643539333934336261326237353535353762633636336538623139343665373138346132223b733a343a2274696d65223b693a313737353433313834363b7d, '2026-04-06 16:30:46', '2026-04-05 16:30:46', '0', '193.32.248.252', 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_8; es-es) AppleWebKit/533.21.1 (KHTML, like Gecko) Version/5.0.5 Safari/533.21.1'),
('7b71061054de19771bc1b481daca024b', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2236336238343635363762356161323637376366333839383836323638663264653637383833376430223b733a343a2274696d65223b693a313737353933393933383b7d, '2026-04-12 13:38:58', '2026-04-11 13:38:58', '0', '45.148.10.231', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
('7c83ff63d29710663f17918eb5d45f41', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2236306666353031616631306431343436326138383135643437623835616536653737383261336432223b733a343a2274696d65223b693a313737353432393034303b7d, '2026-04-06 15:44:00', '2026-04-05 15:44:00', '0', '23.27.145.12', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36'),
('7d6967a31c1c6206756f8039839b8355', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2238316566643531343230323331636663396166646265366664373665656463303136376161303435223b733a343a2274696d65223b693a313737353433393632303b7d, '2026-04-06 18:40:20', '2026-04-05 18:40:20', '0', '216.73.216.154', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; ClaudeBot/1.0; +claudebot@anthropic.com)'),
('8080eb9a72a0222600361e383e1026f2', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2236356262393338386432623564376430633262323462343962313139383262363736616332383939223b733a343a2274696d65223b693a313737353437353639303b7d, '2026-04-07 04:41:30', '2026-04-06 04:41:30', '0', '121.127.34.138', 'Mozilla/5.0 (X11; Linux x86_64; rv:133.0) Gecko/20100101 Firefox/133.0'),
('82a3a8003dcd7695b24c6090fb56aac5', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2236303232303264643133656364306665323433663436343939663131373366346164323631333131223b733a343a2274696d65223b693a313737353437313433353b7d, '2026-04-07 03:30:35', '2026-04-06 03:30:35', '0', '87.236.176.189', 'Mozilla/5.0 (compatible; InternetMeasurement/1.0; +https://internet-measurement.com/)'),
('83b5472bf24ae7287e01cbf19e6d07f5', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2235346165303339663335343030323836336538323134323161356437613663383761633661636630223b733a343a2274696d65223b693a313737353434373333353b7d, '2026-04-06 20:48:55', '2026-04-05 20:48:55', '0', '167.71.98.122', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36'),
('84ae88bd5834e11740f7f63b58a68a43', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2236616163303335363838623562333536323034633062373965333930323833363464633932353761223b733a343a2274696d65223b693a313737353431383536343b7d, '2026-04-06 12:49:24', '2026-04-05 12:49:24', '0', '91.231.89.120', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:134.0) Gecko/20100101 Firefox/134.0'),
('84de8819f96fd2765250c69c5b8d0c5e', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2263363962383966323935326362653633396339616239313031383736643865623236346461353537223b733a343a2274696d65223b693a313737353932373035353b7d, '2026-04-12 10:04:16', '2026-04-11 10:04:16', '0', '192.175.111.251', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36'),
('85dd5a0e3f0f923461718948cff5b943', 0x637372667c4e3b5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a31343a222f7363702f696e6465782e706870223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d, '2026-04-08 01:29:39', '2026-04-07 01:29:39', '0', '45.148.10.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'),
('861b26c6885e0583726e4d62b5d6d175', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2266633564613138336130393061623137363266663934613336313562656536313234646636343133223b733a343a2274696d65223b693a313737353431383530353b7d, '2026-04-06 12:48:25', '2026-04-05 12:48:25', '0', '91.231.89.125', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:134.0) Gecko/20100101 Firefox/134.0'),
('86b96dc450307313a55e5bd495cecc06', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2237383463356135333332656362626662313230363039633737333338303663363033646430363639223b733a343a2274696d65223b693a313737353439363033383b7d, '2026-04-07 10:20:38', '2026-04-06 10:20:38', '0', '141.98.11.181', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36'),
('8a90496a1411cefaf616e7f63aeb1ac5', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2261326464643764396665396438393466383066336238633134336633613632633561363364636663223b733a343a2274696d65223b693a313737353433333830393b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a353a222f7363702f223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a313a7b733a353a227374616666223b4e3b7d, '2026-04-06 17:03:29', '2026-04-05 17:03:29', '0', '216.73.216.154', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; ClaudeBot/1.0; +claudebot@anthropic.com)'),
('8cf3aab3678c975cb6e1075fc32c3d6b', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2235396536343463656632616266386337633164396133343066343162626435373433333164663036223b733a343a2274696d65223b693a313737353432323530353b7d, '2026-04-06 13:55:05', '2026-04-05 13:55:05', '0', '44.242.189.92', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36 Edge/18.19582'),
('8f5b4cd2fe502a6d37fd23427674833e', 0x637372667c4e3b5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a353a222f7363702f223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d, '2026-04-08 01:29:37', '2026-04-07 01:29:37', '0', '45.148.10.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'),
('8fa655378abf115b518cd73ffb2cb2b2', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2232613863643166386334366563336137393233663135623861393930656632353935636365633964223b733a343a2274696d65223b693a313737353431373731343b7d, '2026-04-06 12:35:14', '2026-04-05 12:35:14', '0', '54.247.57.72', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36'),
('8stelp9lrh71f2jklfrsqefsdd', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2235356237626666313966366263316537383532356535353363393163313531623639616562383566223b733a343a2274696d65223b693a313737353430373833373b7d, '2026-04-06 09:50:37', '2026-04-05 09:50:37', '0', '195.178.110.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36'),
('903ce3cfc5080c218e910db1b38d75ed', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2237336166613165323434653061303037393863336238323634363766623431633138336665643033223b733a343a2274696d65223b693a313737353437373339353b7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31393a22416d65726963612f4c6f735f416e67656c6573223b7d, '2026-04-07 05:08:56', '2026-04-06 05:09:55', '0', '35.146.238.149', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36'),
('90b1f31d767c89cf72d148e28986978e', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2266666337666637363736653037323632636437326233383735363562333738656264343266656365223b733a343a2274696d65223b693a313737353535303537313b7d, '2026-04-08 01:29:31', '2026-04-07 01:29:31', '0', '45.148.10.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'),
('920c411a352b7961dd1f84cbce348927', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2233333433616338326665616537353065346433653964343432303037646432386161373061616363223b733a343a2274696d65223b693a313737353437343038313b7d, '2026-04-07 04:14:41', '2026-04-06 04:14:41', '0', '207.148.118.193', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
('966aa5d40387df70bab6a032df18a983', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2234633330653333323638636561613739343161393966333835323161373938633838303833646232223b733a343a2274696d65223b693a313737353739373738363b7d5f617574687c613a313a7b733a343a2275736572223b4e3b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a353a222f7363702f223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31393a22416d65726963612f4c6f735f416e67656c6573223b7d, '2026-04-10 22:09:32', '2026-04-09 22:09:46', '0', '45.5.67.29', 'Mozilla/5.0 (compatible; Konqueror/3; Linux)');
INSERT INTO `ost_session` (`session_id`, `session_data`, `session_expire`, `session_updated`, `user_id`, `user_ip`, `user_agent`) VALUES
('97179f21dfc5e849f5daa6763699bd10', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2263623562623139346563633439353665326364613738643735353436376531396266623836636138223b733a343a2274696d65223b693a313737353439303536303b7d, '2026-04-07 08:49:20', '2026-04-06 08:49:20', '0', '87.236.176.8', 'Mozilla/5.0 (compatible; InternetMeasurement/1.0; +https://internet-measurement.com/)'),
('976f838a263fbedc38b2b4559bfc7e18', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2265353334653461613030303236316665313763666135303866383965666537323835313135653334223b733a343a2274696d65223b693a313737353432323530353b7d, '2026-04-06 13:55:05', '2026-04-05 13:55:05', '0', '44.242.189.92', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.4 Mobile/15E148 Safari/604.1'),
('97cd1ad531b428acabe843979d0e230a', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2239643838636132333763316130613761636464636134636634653064303266393137386365643163223b733a343a2274696d65223b693a313737353434333837363b7d, '2026-04-06 19:51:16', '2026-04-05 19:51:16', '0', '209.38.74.33', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36'),
('9c53fea4b042f2593c0ad49c76b72710', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2239633434383463666331363165316334663533373135663832313938656164363835363235616235223b733a343a2274696d65223b693a313737353432323439393b7d, '2026-04-06 13:54:59', '2026-04-05 13:54:59', '0', '35.92.155.232', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G965U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.111 Mobile Safari/537.36'),
('9cfba3d6624c86a0f3181495bf4825d7', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2261636266386333373865373832646566383232613661376130636636643834313261353363313962223b733a343a2274696d65223b693a313737353431393638363b7d5f617574687c613a323a7b733a343a2275736572223b4e3b733a353a227374616666223b4e3b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a31343a222f7363702f696e6465782e706870223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d, '2026-04-06 13:07:32', '2026-04-05 13:08:06', '0', '74.7.242.16', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; GPTBot/1.3; +https://openai.com/gptbot)'),
('9edaad826a833652e24ebd0571666ce1', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2266613964383231313135346362623633633434316336623938353838666266306238346665356638223b733a343a2274696d65223b693a313737353434393335333b7d, '2026-04-06 21:22:33', '2026-04-05 21:22:33', '0', '44.221.189.139', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36'),
('a4691e56b4a337453c28d16870982c07', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2263336165333930393930663965626333646338363535616438336537303536396163643137313463223b733a343a2274696d65223b693a313737353433343533303b7d, '2026-04-06 17:15:30', '2026-04-05 17:15:30', '0', '178.22.106.230', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Mobile Safari/537.36'),
('a74033c68cb4bdd7d51b051e8298c5fd', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2233326134616332316562636139333837303061653965386639303939356339346162656465303264223b733a343a2274696d65223b693a313737353432373639373b7d, '2026-04-06 15:21:37', '2026-04-05 15:21:37', '0', '216.73.216.154', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; ClaudeBot/1.0; +claudebot@anthropic.com)'),
('a8406a4d286977a2f62bebebb8338113', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2231326563633561303436313065326237623339363032656561316432306262373361383434343662223b733a343a2274696d65223b693a313737353437333939363b7d, '2026-04-07 04:13:17', '2026-04-06 04:13:17', '0', '45.148.10.231', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
('add7d22333ed7b111d6ce658d74e393e', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2239306364383763316230613461376635616465383062643237356638623532336663353766336663223b733a343a2274696d65223b693a313737353431393339363b7d5f617574687c613a323a7b733a343a2275736572223b4e3b733a353a227374616666223b4e3b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a31343a222f7363702f696e6465782e706870223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d, '2026-04-06 13:02:38', '2026-04-05 13:03:16', '0', '74.7.241.17', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; GPTBot/1.3; +https://openai.com/gptbot)'),
('aeb12be0cf2a187be78cd1672d22f175', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2262333332656465643634353839313666643535643032653136366635353665303761343335623039223b733a343a2274696d65223b693a313737353937343239313b7d, '2026-04-12 23:11:31', '2026-04-11 23:11:31', '0', '34.139.78.222', 'Mozilla/5.0 (compatible; CMS-Checker/1.0; +https://example.com)'),
('b259b5eea585a1d64a2c6320683e0501', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2236346438346137313364343437616633336663616537663434353230353238353635343136663461223b733a343a2274696d65223b693a313737353431383433383b7d, '2026-04-06 12:47:18', '2026-04-05 12:47:18', '0', '91.231.89.36', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:134.0) Gecko/20100101 Firefox/134.0'),
('b2a2ef04141a9ab3f59a7d05dde3addc', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2266646530333663386237313965373430653833666336343933336462366136386464636164363738223b733a343a2274696d65223b693a313737353535303538303b7d5f617574687c613a313a7b733a353a227374616666223b4e3b7d, '2026-04-08 01:29:40', '2026-04-07 01:29:40', '0', '45.148.10.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'),
('b3b3e8beb948d87e90aef006e43683ea', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2264376532363431316439393461343265396265643861303263623433633936336632376439396234223b733a343a2274696d65223b693a313737353535303537373b7d, '2026-04-08 01:29:37', '2026-04-07 01:29:37', '0', '45.148.10.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'),
('b43734a14082c2e8c0d310aa401111a7', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2234313939303137326232336666666534326632376262336536343634393639663835626666626363223b733a343a2274696d65223b693a313737353535303537323b7d, '2026-04-08 01:29:32', '2026-04-07 01:29:32', '0', '45.148.10.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'),
('b5809686d066372a9d5a7dd9dd9e74f9', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2234396139393139653836653131353863393465366361336536393832356430396366636530653331223b733a343a2274696d65223b693a313737353436373036303b7d, '2026-04-07 02:17:40', '2026-04-06 02:17:40', '0', '34.78.252.40', 'Mozilla/5.0 (compatible; CMS-Checker/1.0; +https://example.com)'),
('b9740794751bf821aba0786b823e53a7', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2265383836613661336335323738333735393834363732396532373539303134386539616135383134223b733a343a2274696d65223b693a313737353535303537303b7d, '2026-04-08 01:29:30', '2026-04-07 01:29:30', '0', '45.148.10.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'),
('b998aa6d65950fd0d3e6671a55913a24', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2230316634353337616632663936303530653838636338653132323533353336616566663731643038223b733a343a2274696d65223b693a313737353932373035363b7d, '2026-04-12 10:04:16', '2026-04-11 10:04:16', '0', '192.175.111.253', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36'),
('ba6a14017498a11d75e3c941bcd559dd', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2232623037303764323665623832623234336564623931653536333539343265356638333533383335223b733a343a2274696d65223b693a313737353432343632363b7d, '2026-04-06 14:30:26', '2026-04-05 14:30:26', '0', '51.254.49.103', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:134.0) Gecko/20100101 Firefox/134.0'),
('bbebbcbb384f51ed8e53fdc9e423f6a0', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2262623333323466663730383362643832633963393737303461383730646330383830303366633330223b733a343a2274696d65223b693a313737353432323232353b7d, '2026-04-06 13:50:25', '2026-04-05 13:50:25', '0', '216.73.216.154', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; ClaudeBot/1.0; +claudebot@anthropic.com)'),
('bbec3963d0dcc1d0f11d592b1a809446', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2261643431313561333533303739363731623835356333613234393366363162356165373765383934223b733a343a2274696d65223b693a313737353438373035323b7d5f617574687c613a313a7b733a353a227374616666223b4e3b7d, '2026-04-07 07:50:52', '2026-04-06 07:50:52', '0', '35.146.238.149', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0'),
('bd5682f4c2785376ef983d0548bb6212', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2233373436383332373964363635303165626335326537373639653337663132303436333637386530223b733a343a2274696d65223b693a313737353431383230383b7d, '2026-04-06 12:43:28', '2026-04-05 12:43:28', '0', '116.179.32.147', 'Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),
('be7b873071845d865dbf33106e2f0e73', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2262326236373738313161653766386135313438363264323563396664393338616365653161653639223b733a343a2274696d65223b693a313737353631303238363b7d, '2026-04-08 18:04:46', '2026-04-07 18:04:46', '0', '24.144.95.31', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36'),
('c17aca0bcde114d30353d2cedf140137', 0x637372667c4e3b5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a353a222f7363702f223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d, '2026-04-08 01:29:32', '2026-04-07 01:29:32', '0', '45.148.10.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'),
('c2e36e7f9fede492571e1f45decf91a9', 0x637372667c4e3b, '2026-04-07 04:36:16', '2026-04-06 04:36:16', '0', '85.11.167.19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
('c40ec88cc223c09a0bce869bb2196868', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2237366330613261393064373061353132323136663538353038333933623536393533626337623333223b733a343a2274696d65223b693a313737353433343335343b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a353a222f7363702f223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a313a7b733a353a227374616666223b4e3b7d, '2026-04-06 17:12:34', '2026-04-05 17:12:34', '0', '216.73.216.154', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; ClaudeBot/1.0; +claudebot@anthropic.com)'),
('c43b2b8cb569980fea132694279ad138', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2239353431653830333739353036633166653833353834366263326337646439376565613331333039223b733a343a2274696d65223b693a313737353535303537313b7d, '2026-04-08 01:29:31', '2026-04-07 01:29:31', '0', '45.148.10.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'),
('c48e6fca460c0ae39eeb69ea2377f98e', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2237356363363465663131313161313834353330373365366430333065343733353261343065333365223b733a343a2274696d65223b693a313737353432393031323b7d, '2026-04-06 15:43:32', '2026-04-05 15:43:32', '0', '35.87.205.169', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G965U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.7680.177 Mobile Safari/537.36'),
('c4c629500bd6813838e27ce1203dbfb9', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2232323236313430376261343433383762313638396432626533626266376139653966393038346337223b733a343a2274696d65223b693a313737353531313438353b7d, '2026-04-07 14:38:05', '2026-04-06 14:38:05', '0', '116.179.33.201', 'pc'),
('c502b450794567b4dd3dc177f3799afa', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2236313164346539356563383835643463313364653061633364333834626237363339313437623961223b733a343a2274696d65223b693a313737353531313931323b7d5f617574687c613a313a7b733a353a227374616666223b4e3b7d, '2026-04-07 14:45:12', '2026-04-06 14:45:12', '0', '35.146.238.149', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0'),
('c641f432643c07329a080519d083e984', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2239323539616238363861343230306635356432643035633235353236633236343063663734613964223b733a343a2274696d65223b693a313737353531303337393b7d, '2026-04-07 14:19:39', '2026-04-06 14:19:39', '0', '45.92.87.48', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.61 Safari/537.36'),
('c6654b861edf4c5fcc507a21154acb6c', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2263313664333530633137623961616332653665353530653733356661653764373832353864366337223b733a343a2274696d65223b693a313737353535303535323b7d, '2026-04-08 01:29:12', '2026-04-07 01:29:12', '0', '45.148.10.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'),
('c7a3aeafc3c30585cbfbc2d26d98e1f7', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2233643061656631303335396163666361386338626135613438343064346538666436343739666163223b733a343a2274696d65223b693a313737353435313838323b7d, '2026-04-06 22:04:42', '2026-04-05 22:04:42', '0', '133.242.174.119', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Mobile Safari/537.36'),
('c7cf54c23090e7d3e8e9719efc35fb69', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2264303762626639313939393564643565613731646438613939396565343135323861353933313033223b733a343a2274696d65223b693a313737353431383535373b7d, '2026-04-06 12:49:17', '2026-04-05 12:49:17', '0', '91.231.89.121', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:134.0) Gecko/20100101 Firefox/134.0'),
('c91272df8a0b38a33d6d16e4f4774261', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2238633464383732353564356164666130346265373435636163336539653962303232396337323430223b733a343a2274696d65223b693a313737353535303537393b7d5f617574687c613a313a7b733a353a227374616666223b4e3b7d, '2026-04-08 01:29:39', '2026-04-07 01:29:39', '0', '45.148.10.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'),
('c95aa115e760447959c6dde51c9c119a', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2235643730643134373961643934326334343036323863316166663763633536303431366266313932223b733a343a2274696d65223b693a313737353436353736313b7d, '2026-04-07 01:56:01', '2026-04-06 01:56:01', '0', '34.55.88.149', 'Mozilla/5.0 (compatible; CMS-Checker/1.0; +https://example.com)'),
('ce0c1d9b7cabf932ce427db8c47de31e', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2265393237613632653632386166393939383765643661333734343965646431356234623336626231223b733a343a2274696d65223b693a313737353438323136323b7d, '2026-04-07 06:29:22', '2026-04-06 06:29:22', '0', '85.11.167.19', 'python-requests/2.32.4'),
('ce7n2dtk65ilne7ghgvqlj88ra', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2233306437316236323466363065336638326530366364633761333165343764656663616366666166223b733a343a2274696d65223b693a313737353430353534363b7d, '2026-04-06 09:12:26', '2026-04-05 09:12:26', '0', '51.161.37.71', 'Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)'),
('d169fede45efa1d459385b9d884133ca', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2263353031313864616132316334616266396230373737323339633930363131623037353464623061223b733a343a2274696d65223b693a313737353434333837353b7d, '2026-04-06 19:51:15', '2026-04-05 19:51:15', '0', '209.38.74.33', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36'),
('d1f93d49786fbb6aae94fb2c45675f8f', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2232643931343134653566323735396132653635336262386132643165353936306665666438663530223b733a343a2274696d65223b693a313737353535303537363b7d5f617574687c613a313a7b733a353a227374616666223b4e3b7d, '2026-04-08 01:29:36', '2026-04-07 01:29:36', '0', '45.148.10.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'),
('d1mgnlsr1bj465r0t636d4u0pd', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2230353634633966346234313566636362613030306261633938633633653834326266306233303035223b733a343a2274696d65223b693a313737353431353433393b7d, '2026-04-06 11:57:19', '2026-04-05 11:57:19', '0', '34.187.239.184', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36'),
('d35a1f1bd91319fadf86ed62192d1536', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2264306332363437643338396630623238393938343234346433356335623766613666373134313037223b733a343a2274696d65223b693a313737363030303931373b7d, '2026-04-13 06:35:17', '2026-04-12 06:35:17', '0', '34.132.238.138', 'Mozilla/5.0 (compatible; CMS-Checker/1.0; +https://example.com)'),
('d3b4e48663086f4e4f07aa1fda19334c', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2262333737326362353138616631363462343965666365633331383065326538353639386363353733223b733a343a2274696d65223b693a313737353433333332303b7d, '2026-04-06 16:55:20', '2026-04-05 16:55:20', '0', '216.73.216.154', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; ClaudeBot/1.0; +claudebot@anthropic.com)'),
('d7b95a9ff48e235cfc13cb40a7482def', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2238316531313164343432393365346562623163306466373665376637376435376137366164323133223b733a343a2274696d65223b693a313737353535303537373b7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31393a22416d65726963612f4c6f735f416e67656c6573223b7d, '2026-04-08 01:29:37', '2026-04-07 01:29:37', '0', '45.148.10.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'),
('d824edd4dca406cf34810cba32194d48', 0x637372667c4e3b5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a31343a222f7363702f696e6465782e706870223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d, '2026-04-06 18:40:15', '2026-04-05 18:40:15', '0', '216.73.216.154', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; ClaudeBot/1.0; +claudebot@anthropic.com)'),
('d856addbc3c25970f3251e2eb9469ced', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2232393761353931353061366232333663323537646335353537643534313235333165313931386262223b733a343a2274696d65223b693a313737353432313337373b7d, '2026-04-06 13:36:17', '2026-04-05 13:36:17', '0', '178.22.106.230', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Mobile Safari/537.36'),
('d8aaeaafa934e095b5f996dcd45f99b7', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2234336138636438643462636236393431376539313764623733346231623862636665363630643436223b733a343a2274696d65223b693a313737353539363130343b7d, '2026-04-08 14:08:25', '2026-04-07 14:08:25', '0', '45.92.84.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.61 Safari/537.36'),
('da7e06a710debe2b43e1fd6b6a9d2db0', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2233653231623137316634663235666138386533633031363037376433303661656266396233613361223b733a343a2274696d65223b693a313737353432333631313b7d, '2026-04-06 14:13:31', '2026-04-05 14:13:31', '0', '23.27.145.132', 'Mozilla/5.0 (X11; Linux i686; rv:109.0) Gecko/20100101 Firefox/120.0'),
('dac95b447d533ec92d1d97de092b1511', 0x637372667c4e3b, '2026-04-07 04:36:17', '2026-04-06 04:36:17', '0', '85.11.167.19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
('e5288303daae0fa08d55d30747d4ae05', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2239396635393132323565626336613736346237663431373333353031353366383863663663366465223b733a343a2274696d65223b693a313737353433333734333b7d, '2026-04-06 17:02:24', '2026-04-05 17:02:24', '0', '216.73.216.154', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; ClaudeBot/1.0; +claudebot@anthropic.com)'),
('e52b3351cc5a6b68343b07efb63ce53d', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2235656161383233323130323938323962666362643163653636663166313431363336346363313530223b733a343a2274696d65223b693a313737353738363036303b7d, '2026-04-10 18:54:20', '2026-04-09 18:54:20', '0', '168.144.67.217', 'Mozilla/5.0 (X11; Linux x86_64; rv:142.0) Gecko/20100101 Firefox/142.0'),
('e94a3a4992762ac4e7e0bdc43d3ec1ed', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2231346264646433613038316435346432323933623534333866303435313366623966623764356530223b733a343a2274696d65223b693a313737353431383433353b7d, '2026-04-06 12:47:15', '2026-04-05 12:47:15', '0', '91.231.89.33', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:134.0) Gecko/20100101 Firefox/134.0'),
('ea01f1fbe3e60172b80a9bfb1d031944', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2231393966323433303666316531393133303535353738623362636461383137633465376339313734223b733a343a2274696d65223b693a313737353535313530363b7d, '2026-04-08 01:45:06', '2026-04-07 01:45:06', '0', '193.200.229.243', 'Mozilla/5.0 (Linux; Android 12; Pixel 6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Mobile Safari/537.36'),
('ea1baf43dff49ebe5f8ffd92a94efd43', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2231316538623639373661383634653162613764613438633235316362663365306134316562623430223b733a343a2274696d65223b693a313737353432303939343b7d, '2026-04-06 13:29:55', '2026-04-05 13:29:55', '0', '104.164.126.186', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36'),
('ea1ffcb159467caba38d949ef045a9ec', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2262386262643132333135303431316131613237646137316630353663313439343933396665373534223b733a343a2274696d65223b693a313737353439373530393b7d5f617574687c613a313a7b733a353a227374616666223b4e3b7d, '2026-04-07 10:45:09', '2026-04-06 10:45:09', '0', '35.146.238.149', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0'),
('eac22dc1ae6b636360e80d641c41f0b5', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2236306238336636613731316137313736356236356665626639313332303736643630663665346139223b733a343a2274696d65223b693a313737353436303530323b7d, '2026-04-07 00:28:22', '2026-04-06 00:28:22', '0', '178.22.106.230', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Mobile Safari/537.36'),
('eb128c5df6bc5edd2ef6a8bb1c06c33b', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2237383563363964316537653964373237653337366532333632396530376663366664333461666663223b733a343a2274696d65223b693a313737353431383530343b7d, '2026-04-06 12:48:24', '2026-04-05 12:48:24', '0', '91.231.89.36', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:134.0) Gecko/20100101 Firefox/134.0'),
('eb2080c72c58ac342ea520a240e66042', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2263313065633432663733633265613936323434623032653336376165313037656635346263333931223b733a343a2274696d65223b693a313737353535303537303b7d5f617574687c613a313a7b733a343a2275736572223b4e3b7d, '2026-04-08 01:29:30', '2026-04-07 01:29:30', '0', '45.148.10.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'),
('ebd226e91dca55d1ca68303bab7fac6a', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2261643432396332313738376435393430613539313935663934353238633038636237343839303335223b733a343a2274696d65223b693a313737353535303537353b7d, '2026-04-08 01:29:35', '2026-04-07 01:29:35', '0', '45.148.10.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'),
('ede3287772cfb0b228739bc27bd2161d', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2237313439626265663161343238353031346635373662656138666437613334623333613435643731223b733a343a2274696d65223b693a313737353738333230313b7d, '2026-04-10 18:06:41', '2026-04-09 18:06:41', '0', '23.27.145.63', 'Mozilla/5.0 (X11; Linux i686; rv:109.0) Gecko/20100101 Firefox/120.0'),
('ee020499322b973f59104d9ae0c6d68f', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2233366133616363613762613038326362646661393937663465373331353335313261363834663065223b733a343a2274696d65223b693a313737353631303238363b7d, '2026-04-08 18:04:46', '2026-04-07 18:04:46', '0', '24.144.95.31', 'Mozilla/5.0 (X11; Linux x86_64; rv:142.0) Gecko/20100101 Firefox/142.0'),
('f03680a9e53d0162664cfe694a8ceb4f', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2262623462643162623438623462346537313938653436326436616365373339393263333137663937223b733a343a2274696d65223b693a313737353539373239333b7d, '2026-04-08 14:28:13', '2026-04-07 14:28:13', '0', '45.92.84.85', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.61 Safari/537.36'),
('f1083839bc1176c924aaf3bd1a94a04d', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2262333437373865653338623836363765303663313963373535396236666465323739653966363463223b733a343a2274696d65223b693a313737353535303536373b7d, '2026-04-08 01:29:27', '2026-04-07 01:29:27', '0', '45.148.10.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'),
('f1660bdc3f88a89d9b948e6eeed6afb7', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2239396637376362373166396466326131343862316662306562316337636561643966616366653466223b733a343a2274696d65223b693a313737353434373330333b7d, '2026-04-06 20:48:23', '2026-04-05 20:48:23', '0', '178.22.106.230', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Mobile Safari/537.36'),
('f169ed0210a3c5dcc1e7561662a4b64f', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2235356635383765613665363438656230393063353135633238343535343730653731396263313432223b733a343a2274696d65223b693a313737353535303536393b7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31393a22416d65726963612f4c6f735f416e67656c6573223b7d, '2026-04-08 01:29:29', '2026-04-07 01:29:29', '0', '45.148.10.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'),
('f179eb4c2fbcf5a515d5a4ea65c7387b', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2234646632393631643730303762376138366437643062303938633263663066653764356536393431223b733a343a2274696d65223b693a313737353431393436303b7d, '2026-04-06 13:04:20', '2026-04-05 13:04:20', '0', '34.90.66.217', 'Scrapy/2.13.4 (+https://scrapy.org)'),
('f1ee78556d0cd4fcad2869d9b44cc80a', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2261363032656137663535336333316631393738393339623238636463353036313435613264383837223b733a343a2274696d65223b693a313737353436343939343b7d, '2026-04-07 01:43:14', '2026-04-06 01:43:14', '0', '54.156.91.154', 'okhttp/5.3.0'),
('f2010a06b9a5f3ba5b44faa24d525ae4', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2266613232353764316264666533616634353038643831663037646565653236323130323934366362223b733a343a2274696d65223b693a313737353535303537323b7d, '2026-04-08 01:29:32', '2026-04-07 01:29:32', '0', '45.148.10.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'),
('f2b9a126597c4fcc9e812823e5ec862c', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2263373630333736323361346139666530653064323130653866313234666135376266306664333639223b733a343a2274696d65223b693a313737353535303537353b7d, '2026-04-08 01:29:35', '2026-04-07 01:29:35', '0', '45.148.10.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'),
('f39fd761973f6efdbfe90be67fe85db8', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2233656538653162313638656664303930623938303232306462663831306331313330306161613333223b733a343a2274696d65223b693a313737353432373630313b7d, '2026-04-06 15:20:01', '2026-04-05 15:20:01', '0', '216.73.216.154', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; ClaudeBot/1.0; +claudebot@anthropic.com)'),
('f5fe007253cd3db2b5eeafc22072badc', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2239626630303465393130613736353863353936326432323831333638383534636362396232303135223b733a343a2274696d65223b693a313737353432373638353b7d5f617574687c613a313a7b733a343a2275736572223b4e3b7d, '2026-04-06 15:21:25', '2026-04-05 15:21:25', '0', '216.73.216.154', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; ClaudeBot/1.0; +claudebot@anthropic.com)'),
('f6138d200230c458ecd12d6aa442a1e2', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2263376332313635323262306435636361656265346463623432636565646638633938626533306430223b733a343a2274696d65223b693a313737353535303537303b7d, '2026-04-08 01:29:30', '2026-04-07 01:29:30', '0', '45.148.10.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'),
('f6ad12517bacaa479dcadcd812d800fa', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2234346366363039656233363966373731653962333539343163663339376332613437343030383735223b733a343a2274696d65223b693a313737353432313334323b7d, '2026-04-06 13:35:42', '2026-04-05 13:35:42', '0', '199.91.220.182', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.3 Safari/605.1.15'),
('f7b45999a080f408145da33dbbdde29c', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2233363631373032343464363432383630346666363536336232363836663130663235656431326531223b733a343a2274696d65223b693a313737353535303536303b7d, '2026-04-08 01:29:20', '2026-04-07 01:29:20', '0', '45.148.10.62', ''),
('f7dd016d3518514d6936490d30e513ea', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2263656663303932663933343331643030663363366131343363623338643337623133393137666635223b733a343a2274696d65223b693a313737353432393238303b7d, '2026-04-06 15:48:00', '2026-04-05 15:48:00', '0', '149.57.180.27', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36'),
('f8b0601c8d291e23041c629213a6ea64', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2235663932653137393732393938313131306664393831663561653634663130303931663737363830223b733a343a2274696d65223b693a313737353535303538323b7d5f617574687c613a313a7b733a353a227374616666223b4e3b7d, '2026-04-08 01:29:42', '2026-04-07 01:29:42', '0', '45.148.10.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'),
('f9c30a5b5e82243bbfdda391ffc5441e', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2232633739656331613361323264363034633761343463316439383135623765623233396561613533223b733a343a2274696d65223b693a313737353535303537373b7d, '2026-04-08 01:29:37', '2026-04-07 01:29:37', '0', '45.148.10.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'),
('fbb30e228003523553b635a630f6a576', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2237613532623162666561373139353533323064666164346437356137633038393763343661616362223b733a343a2274696d65223b693a313737353432373131393b7d, '2026-04-06 15:11:59', '2026-04-05 15:11:59', '0', '192.42.116.12', 'Mozilla/5.0 (iPhone; CPU iPhone OS 26_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/146.0.7680.151 Mobile/15E148 Safari/604.1'),
('fbf66f124fe461f4554ad12d9ccf5d64', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2261616534306134333365663437363966313361633431663538623030616233383662336561636566223b733a343a2274696d65223b693a313737353531333632303b7d, '2026-04-07 15:13:40', '2026-04-06 15:13:40', '0', '185.8.106.156', 'Mozilla/5.0 (X11; Linux i686 (x86_64)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3187.0 Safari/537.366'),
('fd794b65ff3a24dba795aaf05884e55c', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2266306431646163303338353831653336623131366633663134666235633463333431303433643364223b733a343a2274696d65223b693a313737353431383433393b7d, '2026-04-06 12:47:19', '2026-04-05 12:47:19', '0', '91.231.89.36', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:134.0) Gecko/20100101 Firefox/134.0'),
('fdc25e288b729176d28d9e59785ef4a5', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2232653464383965636564383333363964386463383830666363636139383737613562623239636532223b733a343a2274696d65223b693a313737353431393439393b7d, '2026-04-06 13:04:59', '2026-04-05 13:04:59', '0', '34.90.66.217', 'Scrapy/2.13.4 (+https://scrapy.org)'),
('ff0b8a418c4c00eaadda54e35b34a4c3', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2232323662636637316365613334306365623862383836343466306466393834346462366330333032223b733a343a2274696d65223b693a313737353432313031393b7d5f617574687c613a313a7b733a343a2275736572223b4e3b7d, '2026-04-06 13:30:05', '2026-04-05 13:30:19', '0', '104.164.126.186', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36'),
('hucje81t4ih1huk9v328kbidg2', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2231383235353238353739323065613833326361623337653432663834326532383663356663613965223b733a343a2274696d65223b693a313737353431343233313b7d, '2026-04-06 11:37:11', '2026-04-05 11:37:11', '0', '45.148.10.245', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36'),
('kjh0jv48b077csfrm0f3bu04n1', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2237653030653730356665303766376664646131666465333466393730353530376638313732376336223b733a343a2274696d65223b693a313737353430373832343b7d, '2026-04-06 09:50:24', '2026-04-05 09:50:24', '0', '195.178.110.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36'),
('ml1pt0mgj6f0h3ih2ke7hdtmrh', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2235373535633161626635396465373466356232363535653563636566393832386139376232333264223b733a343a2274696d65223b693a313737353430323632373b7d, '2026-04-06 08:23:47', '2026-04-05 08:23:47', '0', '136.112.217.105', 'Mozilla/5.0 (compatible; CMS-Checker/1.0; +https://example.com)'),
('nmartr7a4kvf5rhq1e5dlibb6i', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2262613430346131643433663661313336353464393361633030326266386136343934616566643763223b733a343a2274696d65223b693a313737353430373832373b7d, '2026-04-06 09:50:27', '2026-04-05 09:50:27', '0', '195.178.110.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36'),
('ssjtlos8lpjn8u2f3rf5ctpigj', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2238613539633964363066613438633537336164383639313332663535613439666262346637396533223b733a343a2274696d65223b693a313737353431363432313b7d5f617574687c613a313a7b733a353a227374616666223b4e3b7d, '2026-04-06 12:13:41', '2026-04-05 12:13:41', '0', '40.77.167.63', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/116.0.1938.76 Safari/537.36');

-- --------------------------------------------------------

--
-- Table structure for table `ost_sla`
--

DROP TABLE IF EXISTS `ost_sla`;
CREATE TABLE `ost_sla` (
  `id` int(11) UNSIGNED NOT NULL,
  `schedule_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `flags` int(10) UNSIGNED NOT NULL DEFAULT '3',
  `grace_period` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost_sla`
--

TRUNCATE TABLE `ost_sla`;
--
-- Dumping data for table `ost_sla`
--

INSERT INTO `ost_sla` (`id`, `schedule_id`, `flags`, `grace_period`, `name`, `notes`, `created`, `updated`) VALUES
(1, 0, 3, 18, 'Default SLA', NULL, '2025-11-29 04:12:33', '2025-11-29 04:12:33');

-- --------------------------------------------------------

--
-- Table structure for table `ost_staff`
--

DROP TABLE IF EXISTS `ost_staff`;
CREATE TABLE `ost_staff` (
  `staff_id` int(11) UNSIGNED NOT NULL,
  `dept_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `role_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `username` varchar(32) NOT NULL DEFAULT '',
  `firstname` varchar(32) DEFAULT NULL,
  `lastname` varchar(32) DEFAULT NULL,
  `passwd` varchar(128) DEFAULT NULL,
  `backend` varchar(32) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(24) NOT NULL DEFAULT '',
  `phone_ext` varchar(6) DEFAULT NULL,
  `mobile` varchar(24) NOT NULL DEFAULT '',
  `signature` text NOT NULL,
  `lang` varchar(16) DEFAULT NULL,
  `timezone` varchar(64) DEFAULT NULL,
  `locale` varchar(16) DEFAULT NULL,
  `notes` text,
  `isactive` tinyint(1) NOT NULL DEFAULT '1',
  `isadmin` tinyint(1) NOT NULL DEFAULT '0',
  `isvisible` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `onvacation` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `assigned_only` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `show_assigned_tickets` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `change_passwd` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `max_page_size` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `auto_refresh_rate` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `default_signature_type` enum('none','mine','dept') NOT NULL DEFAULT 'none',
  `default_paper_size` enum('Letter','Legal','Ledger','A4','A3') NOT NULL DEFAULT 'Letter',
  `extra` text,
  `permissions` text,
  `created` datetime NOT NULL,
  `lastlogin` datetime DEFAULT NULL,
  `passwdreset` datetime DEFAULT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost_staff`
--

TRUNCATE TABLE `ost_staff`;
--
-- Dumping data for table `ost_staff`
--

INSERT INTO `ost_staff` (`staff_id`, `dept_id`, `role_id`, `username`, `firstname`, `lastname`, `passwd`, `backend`, `email`, `phone`, `phone_ext`, `mobile`, `signature`, `lang`, `timezone`, `locale`, `notes`, `isactive`, `isadmin`, `isvisible`, `onvacation`, `assigned_only`, `show_assigned_tickets`, `change_passwd`, `max_page_size`, `auto_refresh_rate`, `default_signature_type`, `default_paper_size`, `extra`, `permissions`, `created`, `lastlogin`, `passwdreset`, `updated`) VALUES
(1, 1, 1, 'ostadmin', 'Support', 'Admin', '$2a$08$SbBflkKyhbGlXalKBoJMkucf7QusPzmm6duupR6Jgey6SDxsrSJOq', NULL, 'admin@gapshop.net', '', NULL, '', '', NULL, 'America/Chicago', 'en_US', NULL, 1, 1, 1, 0, 0, 0, 0, 25, 0, 'none', 'Letter', '{\"browser_lang\":\"en_US\"}', '{\"user.create\":1,\"user.delete\":1,\"user.edit\":1,\"user.manage\":1,\"user.dir\":1,\"org.create\":1,\"org.delete\":1,\"org.edit\":1,\"faq.manage\":1,\"visibility.agents\":1,\"emails.banlist\":1,\"visibility.departments\":1}', '2025-11-29 04:12:35', '2026-04-06 05:01:16', '2026-04-03 16:34:11', '2026-04-06 05:01:16'),
(2, 1, 1, 'Tiffy', 'Tiffy', 'Wiffy', NULL, 'local', 'trulyhabitforming@gmail.com', '(954) 565-5555', NULL, '', '', NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, 0, 1, 0, 0, 'none', 'Letter', '{\"def_assn_role\":true}', '{\"user.create\":1,\"user.delete\":1,\"user.edit\":1,\"user.manage\":1,\"user.dir\":1,\"org.create\":1,\"org.delete\":1,\"org.edit\":1,\"faq.manage\":1,\"visibility.agents\":1,\"visibility.departments\":1}', '2025-12-01 14:25:36', NULL, NULL, '2025-12-01 18:00:35'),
(3, 1, 0, 'testuser', 'Test', 'User', '', NULL, 'carlosinflorida@gmail.com', '', NULL, '', '', NULL, NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 'none', 'Letter', NULL, NULL, '2026-04-07 15:05:08', NULL, NULL, '2026-04-07 15:05:08'),
(5, 1, 0, 'canceloc', 'Carlos', 'Admin', '', NULL, 'canceloc@outlook.com', '', NULL, '', '', NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, 0, 0, 0, 0, 'none', 'Letter', NULL, NULL, '2026-04-09 03:09:09', NULL, NULL, '2026-04-09 03:09:09');

-- --------------------------------------------------------

--
-- Table structure for table `ost_staff_dept_access`
--

DROP TABLE IF EXISTS `ost_staff_dept_access`;
CREATE TABLE `ost_staff_dept_access` (
  `staff_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `dept_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `role_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `flags` int(10) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost_staff_dept_access`
--

TRUNCATE TABLE `ost_staff_dept_access`;
--
-- Dumping data for table `ost_staff_dept_access`
--

INSERT INTO `ost_staff_dept_access` (`staff_id`, `dept_id`, `role_id`, `flags`) VALUES
(1, 2, 1, 1),
(1, 3, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ost_syslog`
--

DROP TABLE IF EXISTS `ost_syslog`;
CREATE TABLE `ost_syslog` (
  `log_id` int(11) UNSIGNED NOT NULL,
  `log_type` enum('Debug','Warning','Error') NOT NULL,
  `title` varchar(255) NOT NULL,
  `log` text NOT NULL,
  `logger` varchar(64) NOT NULL,
  `ip_address` varchar(64) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost_syslog`
--

TRUNCATE TABLE `ost_syslog`;
--
-- Dumping data for table `ost_syslog`
--

INSERT INTO `ost_syslog` (`log_id`, `log_type`, `title`, `log`, `logger`, `ip_address`, `created`, `updated`) VALUES
(1, 'Debug', 'osTicket installed!', 'Congratulations osTicket basic installation completed!\n\nThank you for choosing osTicket!', '', '112.134.163.34', '2025-11-29 04:12:36', '2025-11-29 04:12:36'),
(2, 'Error', 'Mailer Error', 'Unable to email via Sendmail Unable to send mail: mail(): Failed to connect to mailserver at \"localhost\" port 25, verify your \"SMTP\" and \"smtp_port\" setting in php.ini or use ini_set() ', '', '35.146.238.149', '2025-11-29 06:22:56', '2025-11-29 06:22:56'),
(3, 'Error', 'Mailer Error', 'Unable to email via Sendmail Unable to send mail: mail(): Failed to connect to mailserver at \"localhost\" port 25, verify your \"SMTP\" and \"smtp_port\" setting in php.ini or use ini_set() ', '', '108.85.67.148', '2025-11-29 06:31:10', '2025-11-29 06:31:10'),
(4, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [d88439b669c958861908d96f49e030dbbd9e283c] on http://support.gapshop.net/scp/login.php', '', '35.146.238.149', '2025-11-29 07:57:10', '2025-11-29 07:57:10'),
(5, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [385276b41d31a85a253c2a4e48eb8485f1ceb0c8] on http://support.gapshop.net/scp/login.php', '', '35.146.238.149', '2025-11-29 07:57:21', '2025-11-29 07:57:21'),
(6, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [8606c5e559d2fa83b62acbe98742fa726849e111] on http://support.gapshop.net/scp/login.php', '', '35.146.238.149', '2025-11-29 07:58:21', '2025-11-29 07:58:21'),
(7, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [1d80864e15b689101ade91de5225a9621e0472ca] on http://support.gapshop.net/scp/login.php', '', '35.146.238.149', '2025-11-29 08:08:32', '2025-11-29 08:08:32'),
(8, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [ff7905e6f1148c67b3bb0fa12f64af64811cba99] on https://support.gapshop.net/scp/login.php', '', '35.146.238.149', '2025-11-29 08:09:06', '2025-11-29 08:09:06'),
(9, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [2d347dded3de3eec070a03142e2655226c03542e] on https://support.gapshop.net/scp/login.php', '', '35.146.238.149', '2025-11-29 08:10:08', '2025-11-29 08:10:08'),
(10, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [f3116beb9a7de64b19f699433744fc48edce3ac6] on https://support.gapshop.net/scp/login.php', '', '35.146.238.149', '2025-11-29 08:11:43', '2025-11-29 08:11:43'),
(11, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [40a1ff1e8420f2f3bf2f5c5f03965a6833adf8d9] on https://support.gapshop.net/scp/login.php', '', '35.146.238.149', '2025-11-29 08:12:43', '2025-11-29 08:12:43'),
(12, 'Error', 'Mailer Error', 'Unable to email via SMTP: support@gapshop.net (ssl://mail.gapshop.net:465/SMTP) From address must match authenticated address ', '', '112.134.163.34', '2025-11-30 19:16:04', '2025-11-30 19:16:04'),
(13, 'Error', 'Mailer Error', 'Unable to email via Sendmail Unable to send mail: mail(): Failed to connect to mailserver at \"localhost\" port 25, verify your \"SMTP\" and \"smtp_port\" setting in php.ini or use ini_set() ', '', '112.134.163.34', '2025-11-30 19:16:06', '2025-11-30 19:16:06'),
(14, 'Error', 'Mailer Error', 'Unable to email via SMTP: support@gapshop.net (ssl://mail.gapshop.net:465/SMTP) From address must match authenticated address ', '', '112.134.163.34', '2025-11-30 19:18:10', '2025-11-30 19:18:10'),
(15, 'Error', 'Mailer Error', 'Unable to email via Sendmail Unable to send mail: mail(): Failed to connect to mailserver at \"localhost\" port 25, verify your \"SMTP\" and \"smtp_port\" setting in php.ini or use ini_set() ', '', '112.134.163.34', '2025-11-30 19:18:12', '2025-11-30 19:18:12'),
(16, 'Error', 'Mailer Error', 'Unable to email via SMTP: support@gapshop.net (ssl://mail.gapshop.net:465/SMTP) From address must match authenticated address ', '', '112.134.163.34', '2025-11-30 19:23:27', '2025-11-30 19:23:27'),
(17, 'Error', 'Mailer Error', 'Unable to email via Sendmail Unable to send mail: mail(): Failed to connect to mailserver at \"localhost\" port 25, verify your \"SMTP\" and \"smtp_port\" setting in php.ini or use ini_set() ', '', '112.134.163.34', '2025-11-30 19:23:29', '2025-11-30 19:23:29'),
(18, 'Error', 'Mailer Error', 'Unable to email via SMTP: support@gapshop.net (ssl://mail.gapshop.net:465/SMTP) From address must match authenticated address ', '', '112.134.163.34', '2025-12-01 01:49:06', '2025-12-01 01:49:06'),
(19, 'Error', 'Mailer Error', 'Unable to email via Sendmail Unable to send mail: mail(): Failed to connect to mailserver at \"localhost\" port 25, verify your \"SMTP\" and \"smtp_port\" setting in php.ini or use ini_set() ', '', '112.134.163.34', '2025-12-01 01:49:08', '2025-12-01 01:49:08'),
(20, 'Error', 'Mailer Error', 'Unable to email via SMTP: support@gapshop.net (ssl://mail.gapshop.net:465/SMTP) From address must match authenticated address ', '', '112.134.163.34', '2025-12-01 01:55:08', '2025-12-01 01:55:08'),
(21, 'Error', 'Mailer Error', 'Unable to email via Sendmail Unable to send mail: mail(): Failed to connect to mailserver at \"localhost\" port 25, verify your \"SMTP\" and \"smtp_port\" setting in php.ini or use ini_set() ', '', '112.134.163.34', '2025-12-01 01:55:10', '2025-12-01 01:55:10'),
(22, 'Error', 'Mailer Error', 'Unable to email via SMTP: support@gapshop.net (ssl://mail.gapshop.net:465/SMTP) From address must match authenticated address ', '', '35.146.238.149', '2025-12-01 10:28:34', '2025-12-01 10:28:34'),
(23, 'Error', 'Mailer Error', 'Unable to email via Sendmail Unable to send mail: mail(): Failed to connect to mailserver at \"localhost\" port 25, verify your \"SMTP\" and \"smtp_port\" setting in php.ini or use ini_set() ', '', '35.146.238.149', '2025-12-01 10:28:36', '2025-12-01 10:28:36'),
(24, 'Error', 'Mailer Error', 'Unable to email via SMTP: support@gapshop.net (ssl://mail.gapshop.net:465/SMTP) From address must match authenticated address ', '', '35.146.238.149', '2025-12-01 10:35:30', '2025-12-01 10:35:30'),
(25, 'Error', 'Mailer Error', 'Unable to email via Sendmail Unable to send mail: mail(): Failed to connect to mailserver at \"localhost\" port 25, verify your \"SMTP\" and \"smtp_port\" setting in php.ini or use ini_set() ', '', '35.146.238.149', '2025-12-01 10:35:32', '2025-12-01 10:35:32'),
(26, 'Error', 'Mailer Error', 'Unable to email via SMTP: support@gapshop.net (ssl://mail.gapshop.net:465/SMTP) From address must match authenticated address ', '', '35.146.238.149', '2025-12-01 10:39:56', '2025-12-01 10:39:56'),
(27, 'Error', 'Mailer Error', 'Unable to email via Sendmail Unable to send mail: mail(): Failed to connect to mailserver at \"localhost\" port 25, verify your \"SMTP\" and \"smtp_port\" setting in php.ini or use ini_set() ', '', '35.146.238.149', '2025-12-01 10:39:58', '2025-12-01 10:39:58'),
(28, 'Warning', 'Agent Password Reset', 'Password reset was attempted for agent: Tiffy Wiffy<br /><br /> Requested-User-Id: <br /> Source-Ip: 35.146.238.149<br /> Email-Sent-To: trulyhabitforming@gmail.com<br /> Email-Sent-Via: support@gapshop.net', '', '35.146.238.149', '2025-12-01 14:25:49', '2025-12-01 14:25:49'),
(29, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://support.gapshop.net/', '', '54.254.222.231', '2025-12-16 22:55:27', '2025-12-16 22:55:27'),
(30, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://support.gapshop.net/', '', '54.254.222.231', '2025-12-16 22:55:27', '2025-12-16 22:55:27'),
(31, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://support.gapshop.net/', '', '46.101.119.189', '2025-12-17 07:06:53', '2025-12-17 07:06:53'),
(32, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://www.support.gapshop.net/', '', '46.101.119.189', '2025-12-18 04:50:19', '2025-12-18 04:50:19'),
(33, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://support.gapshop.net/', '', '164.90.183.185', '2025-12-19 15:44:52', '2025-12-19 15:44:52'),
(34, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://www.support.gapshop.net/', '', '164.90.183.185', '2025-12-20 08:48:20', '2025-12-20 08:48:20'),
(35, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://support.gapshop.net/', '', '207.154.244.234', '2025-12-21 21:54:28', '2025-12-21 21:54:28'),
(36, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://support.gapshop.net/', '', '157.230.113.249', '2026-01-02 17:45:21', '2026-01-02 17:45:21'),
(37, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://www.support.gapshop.net/', '', '157.230.113.249', '2026-01-03 07:35:25', '2026-01-03 07:35:25'),
(38, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://support.gapshop.net/', '', '20.51.155.167', '2026-01-20 00:51:02', '2026-01-20 00:51:02'),
(39, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://www.support.gapshop.net/', '', '20.51.155.167', '2026-01-20 07:04:22', '2026-01-20 07:04:22'),
(40, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://support.gapshop.net/', '', '35.225.81.143', '2026-01-21 09:48:48', '2026-01-21 09:48:48'),
(41, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://www.support.gapshop.net/', '', '35.225.81.143', '2026-01-21 23:59:06', '2026-01-21 23:59:06'),
(42, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://support.gapshop.net/', '', '85.11.167.4', '2026-01-29 23:41:54', '2026-01-29 23:41:54'),
(43, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://support.gapshop.net/', '', '85.11.167.4', '2026-01-29 23:41:54', '2026-01-29 23:41:54'),
(44, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://support.gapshop.net/', '', '85.11.167.4', '2026-01-31 10:29:05', '2026-01-31 10:29:05'),
(45, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://support.gapshop.net/', '', '85.11.167.4', '2026-01-31 10:29:06', '2026-01-31 10:29:06'),
(46, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://support.gapshop.net/', '', '185.177.72.52', '2026-02-01 17:39:34', '2026-02-01 17:39:34'),
(47, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://support.gapshop.net/', '', '185.177.72.30', '2026-02-01 17:42:11', '2026-02-01 17:42:11'),
(48, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://support.gapshop.net/', '', '185.177.72.13', '2026-02-03 08:44:40', '2026-02-03 08:44:40'),
(49, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://support.gapshop.net/', '', '185.177.72.51', '2026-02-03 08:47:18', '2026-02-03 08:47:18'),
(50, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://support.gapshop.net/', '', '185.177.72.52', '2026-02-03 21:59:45', '2026-02-03 21:59:45'),
(51, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://support.gapshop.net/', '', '185.177.72.38', '2026-02-03 22:01:32', '2026-02-03 22:01:32'),
(52, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://support.gapshop.net/', '', '15.237.119.0', '2026-02-03 23:14:51', '2026-02-03 23:14:51'),
(53, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://www.support.gapshop.net/', '', '185.177.72.56', '2026-02-04 09:37:53', '2026-02-04 09:37:53'),
(54, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://www.support.gapshop.net/', '', '185.177.72.52', '2026-02-04 09:41:13', '2026-02-04 09:41:13'),
(55, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://www.support.gapshop.net/', '', '15.237.119.0', '2026-02-05 07:25:53', '2026-02-05 07:25:53'),
(56, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://support.gapshop.net/', '', '185.177.72.51', '2026-02-05 11:58:25', '2026-02-05 11:58:25'),
(57, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://support.gapshop.net/', '', '185.177.72.23', '2026-02-05 12:02:28', '2026-02-05 12:02:28'),
(58, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://support.gapshop.net/', '', '185.177.72.30', '2026-02-05 23:40:50', '2026-02-05 23:40:50'),
(59, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://support.gapshop.net/', '', '185.177.72.51', '2026-02-05 23:42:26', '2026-02-05 23:42:26'),
(60, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://www.support.gapshop.net/', '', '185.177.72.56', '2026-02-06 04:59:28', '2026-02-06 04:59:28'),
(61, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://www.support.gapshop.net/', '', '185.177.72.56', '2026-02-06 05:02:18', '2026-02-06 05:02:18'),
(62, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://support.gapshop.net/', '', '15.237.119.0', '2026-02-11 21:20:08', '2026-02-11 21:20:08'),
(63, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://support.gapshop.net/', '', '85.11.167.25', '2026-02-14 17:12:33', '2026-02-14 17:12:33'),
(64, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://support.gapshop.net/', '', '85.11.167.25', '2026-02-14 17:12:33', '2026-02-14 17:12:33'),
(65, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://www.support.gapshop.net/', '', '15.237.119.0', '2026-02-15 18:09:15', '2026-02-15 18:09:15'),
(66, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://support.gapshop.net/', '', '48.199.108.206', '2026-02-17 07:34:00', '2026-02-17 07:34:00'),
(67, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://support.gapshop.net/', '', '48.199.108.206', '2026-02-17 07:34:00', '2026-02-17 07:34:00'),
(68, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://support.gapshop.net/', '', '3.76.94.210', '2026-02-17 07:48:16', '2026-02-17 07:48:16'),
(69, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://support.gapshop.net/', '', '3.76.94.210', '2026-02-17 07:48:17', '2026-02-17 07:48:17'),
(70, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://www.support.gapshop.net/', '', '140.177.92.244', '2026-02-17 14:56:38', '2026-02-17 14:56:38'),
(71, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://www.support.gapshop.net/', '', '140.177.92.244', '2026-02-17 14:56:38', '2026-02-17 14:56:38'),
(72, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://support.gapshop.net/', '', '178.128.247.137', '2026-02-18 06:40:48', '2026-02-18 06:40:48'),
(73, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://support.gapshop.net/', '', '178.128.247.137', '2026-02-18 06:40:49', '2026-02-18 06:40:49'),
(74, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://www.support.gapshop.net/', '', '20.207.56.175', '2026-02-18 07:33:59', '2026-02-18 07:33:59'),
(75, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://www.support.gapshop.net/', '', '20.207.56.175', '2026-02-18 07:34:01', '2026-02-18 07:34:01'),
(76, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://www.support.gapshop.net/', '', '18.222.107.253', '2026-02-18 12:22:40', '2026-02-18 12:22:40'),
(77, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://www.support.gapshop.net/', '', '18.222.107.253', '2026-02-18 12:22:41', '2026-02-18 12:22:41'),
(78, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://www.support.gapshop.net/', '', '35.247.254.15', '2026-02-18 12:25:40', '2026-02-18 12:25:40'),
(79, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://www.support.gapshop.net/', '', '35.247.254.15', '2026-02-18 12:25:40', '2026-02-18 12:25:40'),
(80, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://support.gapshop.net/', '', '185.177.72.49', '2026-02-20 14:45:59', '2026-02-20 14:45:59'),
(81, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://support.gapshop.net/', '', '185.177.72.49', '2026-02-20 14:46:00', '2026-02-20 14:46:00'),
(82, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://support.gapshop.net/', '', '185.177.72.13', '2026-02-20 14:54:17', '2026-02-20 14:54:17'),
(83, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://support.gapshop.net/', '', '185.177.72.13', '2026-02-20 14:54:17', '2026-02-20 14:54:17'),
(84, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://support.gapshop.net/', '', '3.252.79.125', '2026-03-05 18:51:36', '2026-03-05 18:51:36'),
(85, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://support.gapshop.net/', '', '3.252.79.125', '2026-03-05 18:51:36', '2026-03-05 18:51:36'),
(86, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://support.gapshop.net/', '', '3.252.79.125', '2026-03-05 18:51:37', '2026-03-05 18:51:37'),
(87, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://support.gapshop.net/', '', '185.177.72.22', '2026-03-07 00:13:37', '2026-03-07 00:13:37'),
(88, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://support.gapshop.net/', '', '185.177.72.22', '2026-03-07 00:13:38', '2026-03-07 00:13:38'),
(89, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://support.gapshop.net/', '', '3.90.60.146', '2026-03-07 11:31:51', '2026-03-07 11:31:51'),
(90, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://support.gapshop.net/', '', '3.90.60.146', '2026-03-07 11:31:51', '2026-03-07 11:31:51'),
(91, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://support.gapshop.net/', '', '3.90.60.146', '2026-03-07 11:31:51', '2026-03-07 11:31:51'),
(92, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://support.gapshop.net/', '', '13.43.89.186', '2026-03-08 01:03:52', '2026-03-08 01:03:52'),
(93, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://support.gapshop.net/', '', '13.43.89.186', '2026-03-08 01:03:52', '2026-03-08 01:03:52'),
(94, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://support.gapshop.net/', '', '13.43.89.186', '2026-03-08 01:03:52', '2026-03-08 01:03:52'),
(95, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://www.support.gapshop.net/', '', '52.53.172.182', '2026-03-08 01:13:42', '2026-03-08 01:13:42'),
(96, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://www.support.gapshop.net/', '', '52.53.172.182', '2026-03-08 01:13:42', '2026-03-08 01:13:42'),
(97, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://www.support.gapshop.net/', '', '52.53.172.182', '2026-03-08 01:13:42', '2026-03-08 01:13:42'),
(98, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://support.gapshop.net/', '', '13.43.138.225', '2026-03-08 13:57:52', '2026-03-08 13:57:52'),
(99, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://support.gapshop.net/', '', '13.43.138.225', '2026-03-08 13:57:52', '2026-03-08 13:57:52'),
(100, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://support.gapshop.net/', '', '13.43.138.225', '2026-03-08 13:57:52', '2026-03-08 13:57:52'),
(101, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://www.support.gapshop.net/', '', '52.67.98.248', '2026-03-08 14:14:44', '2026-03-08 14:14:44'),
(102, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://www.support.gapshop.net/', '', '52.67.98.248', '2026-03-08 14:14:44', '2026-03-08 14:14:44'),
(103, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://www.support.gapshop.net/', '', '52.67.98.248', '2026-03-08 14:14:45', '2026-03-08 14:14:45'),
(104, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://support.gapshop.net/', '', '185.177.72.23', '2026-03-10 06:45:41', '2026-03-10 06:45:41'),
(105, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://support.gapshop.net/', '', '185.177.72.23', '2026-03-10 06:45:42', '2026-03-10 06:45:42'),
(106, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://support.gapshop.net/', '', '185.177.72.56', '2026-03-10 06:46:45', '2026-03-10 06:46:45'),
(107, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://support.gapshop.net/', '', '185.177.72.56', '2026-03-10 06:46:45', '2026-03-10 06:46:45'),
(108, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://www.support.gapshop.net/', '', '185.177.72.51', '2026-03-10 11:16:08', '2026-03-10 11:16:08'),
(109, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://www.support.gapshop.net/', '', '185.177.72.51', '2026-03-10 11:16:08', '2026-03-10 11:16:08'),
(110, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://www.support.gapshop.net/', '', '185.177.72.51', '2026-03-10 11:16:09', '2026-03-10 11:16:09'),
(111, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://www.support.gapshop.net/', '', '185.177.72.51', '2026-03-10 11:16:09', '2026-03-10 11:16:09'),
(112, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://www.support.gapshop.net/', '', '185.177.72.23', '2026-03-12 04:05:03', '2026-03-12 04:05:03'),
(113, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://www.support.gapshop.net/', '', '185.177.72.23', '2026-03-12 04:05:04', '2026-03-12 04:05:04'),
(114, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://www.support.gapshop.net/', '', '185.177.72.49', '2026-03-12 04:06:11', '2026-03-12 04:06:11'),
(115, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://www.support.gapshop.net/', '', '185.177.72.49', '2026-03-12 04:06:12', '2026-03-12 04:06:12'),
(116, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://www.support.gapshop.net/', '', '185.177.72.49', '2026-03-12 04:06:12', '2026-03-12 04:06:12'),
(117, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://www.support.gapshop.net/', '', '185.177.72.49', '2026-03-12 04:06:12', '2026-03-12 04:06:12'),
(118, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://www.support.gapshop.net/', '', '185.177.72.49', '2026-03-12 04:06:16', '2026-03-12 04:06:16'),
(119, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://www.support.gapshop.net/', '', '185.177.72.49', '2026-03-12 04:06:16', '2026-03-12 04:06:16'),
(120, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://www.support.gapshop.net/', '', '185.177.72.51', '2026-03-12 04:06:17', '2026-03-12 04:06:17'),
(121, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://www.support.gapshop.net/', '', '185.177.72.51', '2026-03-12 04:06:17', '2026-03-12 04:06:17'),
(122, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://www.support.gapshop.net/', '', '185.177.72.51', '2026-03-12 04:06:18', '2026-03-12 04:06:18'),
(123, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://www.support.gapshop.net/', '', '185.177.72.51', '2026-03-12 04:06:19', '2026-03-12 04:06:19'),
(124, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://www.support.gapshop.net/', '', '185.177.72.51', '2026-03-12 04:06:26', '2026-03-12 04:06:26'),
(125, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://www.support.gapshop.net/', '', '185.177.72.51', '2026-03-12 04:06:26', '2026-03-12 04:06:26'),
(126, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://www.support.gapshop.net/', '', '185.177.72.49', '2026-03-12 04:07:06', '2026-03-12 04:07:06'),
(127, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://www.support.gapshop.net/', '', '185.177.72.49', '2026-03-12 04:07:07', '2026-03-12 04:07:07'),
(128, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://support.gapshop.net/', '', '3.252.218.100', '2026-03-27 16:05:20', '2026-03-27 16:05:20'),
(129, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://support.gapshop.net/', '', '3.252.218.100', '2026-03-27 16:05:20', '2026-03-27 16:05:20'),
(130, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://support.gapshop.net/', '', '3.252.218.100', '2026-03-27 16:05:20', '2026-03-27 16:05:20'),
(131, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://www.support.gapshop.net/', '', '34.219.230.76', '2026-03-30 00:11:47', '2026-03-30 00:11:47'),
(132, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://www.support.gapshop.net/', '', '34.219.230.76', '2026-03-30 00:11:52', '2026-03-30 00:11:52'),
(133, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://www.support.gapshop.net/', '', '34.219.230.76', '2026-03-30 00:11:52', '2026-03-30 00:11:52'),
(134, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://www.support.gapshop.net/', '', '34.219.230.76', '2026-03-30 00:11:52', '2026-03-30 00:11:52'),
(135, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://support.gapshop.net/', '', '85.11.167.19', '2026-03-30 06:25:28', '2026-03-30 06:25:28'),
(136, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://support.gapshop.net/', '', '85.11.167.19', '2026-03-30 06:25:28', '2026-03-30 06:25:28'),
(137, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://www.support.gapshop.net/', '', '13.56.18.2', '2026-03-31 10:39:07', '2026-03-31 10:39:07'),
(138, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://www.support.gapshop.net/', '', '13.56.18.2', '2026-03-31 10:39:09', '2026-03-31 10:39:09'),
(139, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://www.support.gapshop.net/', '', '13.56.18.2', '2026-03-31 10:39:09', '2026-03-31 10:39:09'),
(140, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://www.support.gapshop.net/', '', '13.56.18.2', '2026-03-31 10:39:09', '2026-03-31 10:39:09'),
(141, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://support.gapshop.net/', '', '185.177.72.51', '2026-04-02 07:51:07', '2026-04-02 07:51:07'),
(142, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://support.gapshop.net/', '', '185.177.72.51', '2026-04-02 07:51:07', '2026-04-02 07:51:07'),
(143, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://www.support.gapshop.net/', '', '185.177.72.22', '2026-04-02 08:16:13', '2026-04-02 08:16:13'),
(144, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://support.gapshop.net/', '', '185.177.72.23', '2026-04-02 08:16:13', '2026-04-02 08:16:13'),
(145, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://www.support.gapshop.net/', '', '185.177.72.22', '2026-04-02 08:16:13', '2026-04-02 08:16:13'),
(146, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://support.gapshop.net/', '', '185.177.72.23', '2026-04-02 08:16:13', '2026-04-02 08:16:13'),
(147, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://www.support.gapshop.net/', '', '185.177.72.23', '2026-04-02 08:16:21', '2026-04-02 08:16:21'),
(148, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://www.support.gapshop.net/', '', '185.177.72.23', '2026-04-02 08:16:21', '2026-04-02 08:16:21'),
(149, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://www.support.gapshop.net/', '', '185.177.72.23', '2026-04-02 08:16:22', '2026-04-02 08:16:22'),
(150, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://www.support.gapshop.net/', '', '185.177.72.23', '2026-04-02 08:16:22', '2026-04-02 08:16:22'),
(151, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://www.support.gapshop.net/', '', '185.177.72.23', '2026-04-02 08:16:22', '2026-04-02 08:16:22'),
(152, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://www.support.gapshop.net/', '', '185.177.72.23', '2026-04-02 08:16:22', '2026-04-02 08:16:22'),
(153, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://www.support.gapshop.net/', '', '185.177.72.23', '2026-04-02 08:16:22', '2026-04-02 08:16:22'),
(154, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://www.support.gapshop.net/', '', '185.177.72.23', '2026-04-02 08:16:22', '2026-04-02 08:16:22'),
(155, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://www.support.gapshop.net/', '', '185.177.72.23', '2026-04-02 08:17:04', '2026-04-02 08:17:04'),
(156, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://www.support.gapshop.net/', '', '185.177.72.23', '2026-04-02 08:17:05', '2026-04-02 08:17:05'),
(157, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://support.gapshop.net/', '', '185.177.72.23', '2026-04-02 08:18:13', '2026-04-02 08:18:13'),
(158, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://support.gapshop.net/', '', '185.177.72.23', '2026-04-02 08:18:13', '2026-04-02 08:18:13'),
(159, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://support.gapshop.net/', '', '185.177.72.23', '2026-04-02 08:18:13', '2026-04-02 08:18:13'),
(160, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://support.gapshop.net/', '', '185.177.72.23', '2026-04-02 08:18:14', '2026-04-02 08:18:14'),
(161, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://support.gapshop.net/', '', '185.177.72.23', '2026-04-02 08:18:14', '2026-04-02 08:18:14'),
(162, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://support.gapshop.net/', '', '185.177.72.23', '2026-04-02 08:18:14', '2026-04-02 08:18:14'),
(163, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://support.gapshop.net/', '', '185.177.72.23', '2026-04-02 08:18:15', '2026-04-02 08:18:15'),
(164, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://support.gapshop.net/', '', '185.177.72.23', '2026-04-02 08:18:15', '2026-04-02 08:18:15'),
(165, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://www.support.gapshop.net/', '', '185.177.72.23', '2026-04-02 08:18:16', '2026-04-02 08:18:16'),
(166, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://www.support.gapshop.net/', '', '185.177.72.23', '2026-04-02 08:18:16', '2026-04-02 08:18:16'),
(167, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://support.gapshop.net/', '', '185.177.72.23', '2026-04-02 08:18:39', '2026-04-02 08:18:39'),
(168, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://support.gapshop.net/', '', '185.177.72.23', '2026-04-02 08:18:39', '2026-04-02 08:18:39'),
(169, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://support.gapshop.net/', '', '185.177.72.23', '2026-04-02 08:18:40', '2026-04-02 08:18:40'),
(170, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on http://support.gapshop.net/', '', '185.177.72.23', '2026-04-02 08:18:40', '2026-04-02 08:18:40'),
(171, 'Warning', 'Failed agent login attempt (canceloc@outlook.com)', 'Username: canceloc@outlook.com IP: 35.146.238.149 Time: Apr 3, 2026, 7:45 pm UTC Attempts: 3', '', '35.146.238.149', '2026-04-03 12:45:11', '2026-04-03 12:45:11'),
(172, 'Warning', 'Excessive login attempts (admin@gapshop.net)', 'Excessive login attempts by an agent? Username: admin@gapshop.net IP: 35.146.238.149 Time: Apr 3, 2026, 11:29 pm UTC Attempts: 5 Timeout: 2 minutes ', '', '35.146.238.149', '2026-04-03 16:29:23', '2026-04-03 16:29:23'),
(173, 'Warning', 'Excessive login attempts ()', 'Excessive login attempts by an agent? Username: IP: 35.146.238.149 Time: Apr 3, 2026, 11:29 pm UTC Attempts: 6 Timeout: 2 minutes ', '', '35.146.238.149', '2026-04-03 16:29:26', '2026-04-03 16:29:26'),
(174, 'Warning', 'Agent Password Reset', 'Password reset was attempted for agent: Support Admin<br /><br /> Requested-User-Id: admin@gapshop.net<br /> Source-Ip: 35.146.238.149<br /> Email-Sent-To: admin@gapshop.net<br /> Email-Sent-Via: support@gapshop.net', '', '35.146.238.149', '2026-04-03 16:29:33', '2026-04-03 16:29:33'),
(175, 'Warning', 'Agent Password Reset', 'Password reset was attempted for agent: Support Admin<br /><br /> Requested-User-Id: admin@gapshop.net<br /> Source-Ip: 35.146.238.149<br /> Email-Sent-To: admin@gapshop.net<br /> Email-Sent-Via: support@gapshop.net', '', '35.146.238.149', '2026-04-03 16:33:15', '2026-04-03 16:33:15'),
(176, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://support.gapshop.net/', '', '3.8.93.250', '2026-04-04 04:23:03', '2026-04-04 04:23:03'),
(177, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://support.gapshop.net/', '', '3.8.93.250', '2026-04-04 04:23:23', '2026-04-04 04:23:23'),
(178, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://support.gapshop.net/', '', '3.8.93.250', '2026-04-04 04:23:24', '2026-04-04 04:23:24'),
(179, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://support.gapshop.net/', '', '3.8.93.250', '2026-04-04 04:23:24', '2026-04-04 04:23:24'),
(180, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://www.support.gapshop.net/', '', '35.182.231.243', '2026-04-04 04:47:06', '2026-04-04 04:47:06'),
(181, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://www.support.gapshop.net/', '', '35.182.231.243', '2026-04-04 04:47:16', '2026-04-04 04:47:16'),
(182, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://www.support.gapshop.net/', '', '35.182.231.243', '2026-04-04 04:47:16', '2026-04-04 04:47:16'),
(183, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://www.support.gapshop.net/', '', '35.182.231.243', '2026-04-04 04:47:16', '2026-04-04 04:47:16'),
(184, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://support.gapshop.net/', '', '44.222.64.246', '2026-04-05 02:30:38', '2026-04-05 02:30:38'),
(185, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://support.gapshop.net/', '', '44.222.64.246', '2026-04-05 02:30:45', '2026-04-05 02:30:45'),
(186, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://support.gapshop.net/', '', '44.222.64.246', '2026-04-05 02:30:45', '2026-04-05 02:30:45'),
(187, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://support.gapshop.net/', '', '44.222.64.246', '2026-04-05 02:30:45', '2026-04-05 02:30:45'),
(188, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://www.support.gapshop.net/', '', '3.71.36.92', '2026-04-05 02:59:10', '2026-04-05 02:59:10'),
(189, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://www.support.gapshop.net/', '', '3.71.36.92', '2026-04-05 02:59:32', '2026-04-05 02:59:32'),
(190, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://www.support.gapshop.net/', '', '3.71.36.92', '2026-04-05 02:59:32', '2026-04-05 02:59:32'),
(191, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://www.support.gapshop.net/', '', '3.71.36.92', '2026-04-05 02:59:33', '2026-04-05 02:59:33'),
(192, 'Warning', 'Failed agent login attempt (admin)', 'Username: admin IP: 35.146.238.149 Time: Apr 5, 2026, 7:27 pm UTC Attempts: 3', '', '35.146.238.149', '2026-04-05 12:27:37', '2026-04-05 12:27:37'),
(193, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://supportapi.gapshop.net/', '', '85.11.167.19', '2026-04-06 04:36:16', '2026-04-06 04:36:16'),
(194, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://supportapi.gapshop.net/', '', '85.11.167.19', '2026-04-06 04:36:17', '2026-04-06 04:36:17'),
(195, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://supportapi.gapshop.net/', '', '52.40.27.5', '2026-04-07 02:53:47', '2026-04-07 02:53:47'),
(196, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://supportapi.gapshop.net/', '', '52.40.27.5', '2026-04-07 02:54:03', '2026-04-07 02:54:03'),
(197, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://supportapi.gapshop.net/', '', '52.40.27.5', '2026-04-07 02:54:03', '2026-04-07 02:54:03'),
(198, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://supportapi.gapshop.net/', '', '52.40.27.5', '2026-04-07 02:54:04', '2026-04-07 02:54:04'),
(199, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://www.supportapi.gapshop.net/', '', '15.237.83.126', '2026-04-11 23:05:14', '2026-04-11 23:05:14'),
(200, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://www.supportapi.gapshop.net/', '', '15.237.83.126', '2026-04-11 23:05:14', '2026-04-11 23:05:14'),
(201, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://www.supportapi.gapshop.net/', '', '15.237.83.126', '2026-04-11 23:05:14', '2026-04-11 23:05:14'),
(202, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [] on https://www.supportapi.gapshop.net/', '', '15.237.83.126', '2026-04-11 23:05:15', '2026-04-11 23:05:15');

-- --------------------------------------------------------

--
-- Table structure for table `ost_task`
--

DROP TABLE IF EXISTS `ost_task`;
CREATE TABLE `ost_task` (
  `id` int(11) UNSIGNED NOT NULL,
  `object_id` int(11) NOT NULL DEFAULT '0',
  `object_type` char(1) NOT NULL,
  `number` varchar(20) DEFAULT NULL,
  `dept_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `staff_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `team_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `lock_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `flags` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `duedate` datetime DEFAULT NULL,
  `closed` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost_task`
--

TRUNCATE TABLE `ost_task`;
-- --------------------------------------------------------

--
-- Table structure for table `ost_task__cdata`
--

DROP TABLE IF EXISTS `ost_task__cdata`;
CREATE TABLE `ost_task__cdata` (
  `task_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `title` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost_task__cdata`
--

TRUNCATE TABLE `ost_task__cdata`;
-- --------------------------------------------------------

--
-- Table structure for table `ost_team`
--

DROP TABLE IF EXISTS `ost_team`;
CREATE TABLE `ost_team` (
  `team_id` int(10) UNSIGNED NOT NULL,
  `lead_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `flags` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `name` varchar(125) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost_team`
--

TRUNCATE TABLE `ost_team`;
--
-- Dumping data for table `ost_team`
--

INSERT INTO `ost_team` (`team_id`, `lead_id`, `flags`, `name`, `notes`, `created`, `updated`) VALUES
(1, 0, 1, 'Level I Support', 'Tier 1 support, responsible for the initial iteraction with customers', '2025-11-29 04:12:33', '2025-11-29 04:12:33');

-- --------------------------------------------------------

--
-- Table structure for table `ost_team_member`
--

DROP TABLE IF EXISTS `ost_team_member`;
CREATE TABLE `ost_team_member` (
  `team_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `staff_id` int(10) UNSIGNED NOT NULL,
  `flags` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost_team_member`
--

TRUNCATE TABLE `ost_team_member`;
-- --------------------------------------------------------

--
-- Table structure for table `ost_thread`
--

DROP TABLE IF EXISTS `ost_thread`;
CREATE TABLE `ost_thread` (
  `id` int(11) UNSIGNED NOT NULL,
  `object_id` int(11) UNSIGNED NOT NULL,
  `object_type` char(1) NOT NULL,
  `extra` text,
  `lastresponse` datetime DEFAULT NULL,
  `lastmessage` datetime DEFAULT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost_thread`
--

TRUNCATE TABLE `ost_thread`;
--
-- Dumping data for table `ost_thread`
--

INSERT INTO `ost_thread` (`id`, `object_id`, `object_type`, `extra`, `lastresponse`, `lastmessage`, `created`) VALUES
(2, 2, 'T', NULL, '2025-12-01 10:45:42', '2025-11-29 06:31:08', '2025-11-29 06:31:08'),
(3, 3, 'T', NULL, '2025-12-01 11:03:03', '2025-12-01 11:00:18', '2025-12-01 11:00:18'),
(4, 4, 'T', NULL, NULL, '2026-04-08 13:42:15', '2026-04-08 13:42:15'),
(5, 5, 'T', NULL, NULL, '2026-04-08 14:11:18', '2026-04-08 14:11:18'),
(6, 6, 'T', NULL, NULL, '2026-04-08 14:24:45', '2026-04-08 14:24:44'),
(7, 7, 'T', NULL, NULL, '2026-04-09 03:22:59', '2026-04-09 03:22:59'),
(8, 8, 'T', NULL, NULL, '2026-04-09 06:14:00', '2026-04-09 06:13:59'),
(9, 9, 'T', NULL, NULL, '2026-04-09 06:16:53', '2026-04-09 06:16:53'),
(10, 10, 'T', NULL, NULL, '2026-04-09 06:39:41', '2026-04-09 06:39:41'),
(11, 11, 'T', NULL, NULL, '2026-04-09 16:26:00', '2026-04-09 16:25:59');

-- --------------------------------------------------------

--
-- Table structure for table `ost_thread_collaborator`
--

DROP TABLE IF EXISTS `ost_thread_collaborator`;
CREATE TABLE `ost_thread_collaborator` (
  `id` int(11) UNSIGNED NOT NULL,
  `flags` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `thread_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `role` char(1) NOT NULL DEFAULT 'M',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost_thread_collaborator`
--

TRUNCATE TABLE `ost_thread_collaborator`;
-- --------------------------------------------------------

--
-- Table structure for table `ost_thread_entry`
--

DROP TABLE IF EXISTS `ost_thread_entry`;
CREATE TABLE `ost_thread_entry` (
  `id` int(11) UNSIGNED NOT NULL,
  `pid` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `thread_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `staff_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `type` char(1) NOT NULL DEFAULT '',
  `flags` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `poster` varchar(128) NOT NULL DEFAULT '',
  `editor` int(10) UNSIGNED DEFAULT NULL,
  `editor_type` char(1) DEFAULT NULL,
  `source` varchar(32) NOT NULL DEFAULT '',
  `title` varchar(255) DEFAULT NULL,
  `body` text NOT NULL,
  `format` varchar(16) NOT NULL DEFAULT 'html',
  `ip_address` varchar(64) NOT NULL DEFAULT '',
  `extra` text,
  `recipients` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost_thread_entry`
--

TRUNCATE TABLE `ost_thread_entry`;
--
-- Dumping data for table `ost_thread_entry`
--

INSERT INTO `ost_thread_entry` (`id`, `pid`, `thread_id`, `staff_id`, `user_id`, `type`, `flags`, `poster`, `editor`, `editor_type`, `source`, `title`, `body`, `format`, `ip_address`, `extra`, `recipients`, `created`, `updated`) VALUES
(2, 0, 2, 0, 2, 'M', 65, 'Tiffy', NULL, NULL, '', NULL, '<p>Testing</p>', 'html', '108.85.67.148', NULL, NULL, '2025-11-29 06:31:08', '2025-11-29 06:31:08'),
(3, 2, 2, 1, 0, 'R', 576, 'Support Admin', NULL, NULL, '', NULL, '<p>Hi Tiffy,</p> <p><br /></p> <p><br /></p> <p>Your ticket #913808 created on 11/29/25 8:31 AM is in</p> <p>Support department.</p>', 'html', '35.146.238.149', NULL, '{\"to\":{\"2\":\"Tiffy <trulyhabitforming@gmail.com>\"}}', '2025-12-01 10:45:42', '2025-12-01 10:45:42'),
(5, 0, 3, 0, 3, 'M', 577, 'Carlos C', NULL, NULL, 'Email', 'Site aint responding', ' <div style=\"font-family:inherit;font-size:inherit;background-color:transparent\">Another test, no forwarding for the email address.</div> <div><br /> </div> <div><p style=\"font-family:Calibri, Helvetica, sans-serif;font-size:12pt;color:rgb(0, 0, 0)\">Carlos S. Cancelo</p> <p style=\"font-family:Calibri, Helvetica, sans-serif;font-size:12pt;color:rgb(0, 0, 0)\">https://www.theticketstore.net</p> </div> ', 'html', '35.146.238.149', NULL, '{\"to\":[\"Support <support@gapshop.net>\"]}', '2025-12-01 11:00:18', '2025-12-01 11:00:18'),
(6, 5, 3, 1, 0, 'R', 576, 'Support Admin', NULL, NULL, '', NULL, '<p>Issue should be resolved.Hi Carlos,<br /><br /><br /><br /><br />Your ticket #281913 created on 12/1/25 1:00 PM is in<br />Support department.</p>', 'html', '35.146.238.149', NULL, '{\"to\":{\"3\":\"Carlos C <canceloc@outlook.com>\"}}', '2025-12-01 11:03:03', '2025-12-01 11:03:03'),
(7, 0, 3, 3, 0, 'R', 0, 'Test User', NULL, NULL, '', NULL, 'Testing the ticket reply functionality.', 'html', '', NULL, NULL, '2026-04-07 15:07:42', '2026-04-07 15:07:42'),
(8, 0, 3, 3, 0, 'R', 0, 'Test User', NULL, NULL, '', NULL, 'Testing the ticket reply functionality and email.', 'html', '', NULL, NULL, '2026-04-07 15:13:14', '2026-04-07 15:13:14'),
(9, 0, 3, 3, 0, 'R', 0, 'Test User', NULL, NULL, '', NULL, 'Testing the ticket reply functionality and email.', 'html', '', NULL, NULL, '2026-04-08 04:40:24', '2026-04-08 04:40:24'),
(10, 0, 3, 3, 0, 'R', 0, 'Test User', NULL, NULL, '', NULL, 'Testing the ticket reply functionality and email.', 'html', '', NULL, NULL, '2026-04-08 04:43:13', '2026-04-08 04:43:13'),
(11, 0, 3, 3, 0, 'R', 0, 'Test User', NULL, NULL, '', NULL, 'Testing the ticket reply functionality and email.', 'html', '', NULL, NULL, '2026-04-08 04:45:05', '2026-04-08 04:45:05'),
(12, 0, 3, 3, 0, 'R', 0, 'Test User', NULL, NULL, '', NULL, 'Testing the ticket reply functionality and email.', 'html', '', NULL, NULL, '2026-04-08 04:59:15', '2026-04-08 04:59:15'),
(13, 0, 3, 3, 0, 'R', 0, 'Test User', NULL, NULL, '', NULL, 'Testing the ticket reply functionality and email.', 'html', '', NULL, NULL, '2026-04-08 05:03:55', '2026-04-08 05:03:55'),
(14, 0, 4, 0, 3, 'M', 0, 'The Greatest Store', NULL, NULL, '', NULL, 'This is a new ticket for testing', 'html', '', NULL, NULL, '2026-04-08 13:42:15', '2026-04-08 13:42:15'),
(15, 0, 4, 3, 0, 'R', 0, 'Test User', NULL, NULL, '', NULL, 'testing', 'html', '', NULL, NULL, '2026-04-08 13:55:44', '2026-04-08 13:55:44'),
(16, 0, 5, 0, 4, 'M', 0, 'The Greatest Store', NULL, NULL, '', NULL, 'This is a new issue', 'html', '', NULL, NULL, '2026-04-08 14:11:18', '2026-04-08 14:11:18'),
(17, 0, 6, 0, 4, 'M', 0, 'The Greatest Store', NULL, NULL, '', NULL, 'TESTING FOR EMAIL AND POSTING', 'html', '', NULL, NULL, '2026-04-08 14:24:44', '2026-04-08 14:24:44'),
(18, 0, 6, 3, 0, 'R', 0, 'Test User', NULL, NULL, '', NULL, 'test ', 'html', '', NULL, NULL, '2026-04-08 14:26:51', '2026-04-08 14:26:51'),
(19, 0, 6, 5, 0, 'R', 0, 'Carlos Admin', NULL, NULL, '', NULL, 'Posting a reply to see if it sends to the email address that created the ticket.', 'html', '', NULL, NULL, '2026-04-09 03:12:37', '2026-04-09 03:12:37'),
(20, 0, 7, 0, 4, 'M', 0, 'The Greatest Store', NULL, NULL, '', NULL, 'Testing to send an email to the Support team about the new issue.', 'html', '', NULL, NULL, '2026-04-09 03:22:59', '2026-04-09 03:22:59'),
(21, 0, 7, 5, 0, 'R', 0, 'Carlos Admin', NULL, NULL, '', NULL, '<p><strong>This is a response!</strong></p><p><br></p><p><strong>This is another response.</strong></p><p><br></p><p><u>This is a third response.</u></p>', 'html', '', NULL, NULL, '2026-04-09 04:18:02', '2026-04-09 04:18:02'),
(22, 0, 8, 0, 4, 'M', 0, 'The Greatest Store', NULL, NULL, '', NULL, '<p><strong><u>THIS IS AN EMERGENCY!</u></strong></p><p><br></p><p><strong>DANGER, WILL ROBINSON!</strong></p>', 'html', '', NULL, NULL, '2026-04-09 06:13:59', '2026-04-09 06:13:59'),
(23, 0, 9, 0, 4, 'M', 0, 'The Greatest Store', NULL, NULL, '', NULL, '<p>This is a maintenance request.</p>', 'html', '', NULL, NULL, '2026-04-09 06:16:53', '2026-04-09 06:16:53'),
(24, 0, 10, 0, 4, 'M', 0, 'The Greatest Store', NULL, NULL, '', NULL, '<p>A new ticket for the maintenance&nbsp;peeps</p>', 'html', '', NULL, NULL, '2026-04-09 06:39:41', '2026-04-09 06:39:41'),
(25, 0, 11, 0, 4, 'M', 0, 'The Greatest Store', NULL, NULL, '', NULL, '<p>We can submit tickets with help topics now.</p>', 'html', '', NULL, NULL, '2026-04-09 16:26:00', '2026-04-09 16:26:00'),
(26, 0, 11, 3, 0, 'R', 0, 'Test User', NULL, NULL, '', NULL, '<p>I am adding an attachment for your review.</p>', 'html', '', NULL, NULL, '2026-04-09 16:37:14', '2026-04-09 16:37:14'),
(27, 0, 11, 3, 0, 'R', 0, 'Test User', NULL, NULL, '', NULL, '<p><br></p>', 'html', '', NULL, NULL, '2026-04-09 16:57:04', '2026-04-09 16:57:04'),
(28, 0, 11, 3, 0, 'R', 0, 'Test User', NULL, NULL, '', NULL, '<p><br></p>', 'html', '', NULL, NULL, '2026-04-09 16:57:15', '2026-04-09 16:57:15'),
(29, 0, 11, 3, 0, 'R', 0, 'Test User', NULL, NULL, '', NULL, '<p>Another image upload test for tickets.</p>', 'html', '', NULL, NULL, '2026-04-09 17:01:00', '2026-04-09 17:01:00'),
(30, 0, 11, 5, 0, 'R', 0, 'Carlos Admin', NULL, NULL, '', NULL, '<p>This is a response to the ticket with an attachment.</p>', 'html', '', NULL, NULL, '2026-04-09 17:22:23', '2026-04-09 17:22:23');

-- --------------------------------------------------------

--
-- Table structure for table `ost_thread_entry_email`
--

DROP TABLE IF EXISTS `ost_thread_entry_email`;
CREATE TABLE `ost_thread_entry_email` (
  `id` int(11) UNSIGNED NOT NULL,
  `thread_entry_id` int(11) UNSIGNED NOT NULL,
  `email_id` int(11) UNSIGNED DEFAULT NULL,
  `mid` varchar(255) NOT NULL,
  `headers` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost_thread_entry_email`
--

TRUNCATE TABLE `ost_thread_entry_email`;
--
-- Dumping data for table `ost_thread_entry_email`
--

INSERT INTO `ost_thread_entry_email` (`id`, `thread_entry_id`, `email_id`, `mid`, `headers`) VALUES
(1, 5, NULL, '<SJ0PR11MB67913C3E49AAF04B7241731CD6DBA@SJ0PR11MB6791.namprd11.prod.outlook.com>', 'Return-Path: <canceloc@outlook.com>\r\nReceived: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazolkn19010004.outbound.protection.outlook.com [52.103.13.4]) by mail5010.site4now.net with SMTP;\r\n   Mon, 1 Dec 2025 10:59:00 -0800\r\nARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;\r\n b=NEWEBPr7hze0U7m0sREll6e08Yz4fS0E/gxXOr190maQqLtnAdIf12JVb/6sq4nBorHsea5kezBMrQ6tAE73Xzx3Gn5cAz6av3WwJt5X3o0GbiqANZyHkkO7mzXPh8Cc8GsW1x/cbs27vjvKRX476fhU6IyiiwdiWYBnpj0g38cDhnAlommKsaaAHDvexxo5hylvX+aDI1lTXr6VsVuwqM6fLCbwPTe3igPMFjtS3TsCHajqjp7IcC/Ac21aIo4OOmsxJFUn5EtzytyJgkYIIZQq6xNS6oKuMTFFX4xzJu1K9wQwCw9Vnp5inTyaMTd+clvT1JaHZjYgvD1oEtykSA==\r\nARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;\r\n s=arcselector10001;\r\n h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;\r\n bh=xk/xvCpbTFjOEHv15mTbWSej9sfOMDvxFBRFG6myd4U=;\r\n b=bVDRkFEpDln7dDRjIZcy5R4JYP/z7nP90rBjZRKtriBXTrGiIjghqUFQNwzCfaNHaBkwjvQAH/t9C1A+Rv+Rz4GIgmY82Ey5d9VflMcNf6Rbx7O5tK9r59XoW2GHj825Q7VViN5Qtz+bDaWltqKm2pqOqWNHMHMlJZm/DZIg5eibfBBTVaa3c97aywRQtOGFDSdyyzn/9ry3W1NZDUrPUA08pmu2LuI3EUWhNmVeRXSqYx4fyc72TenIceHWvoobn/i8qo/Mkr5gLw8G3ykX509pFa1FMjvQlLXC/FlhpZnl3toMBJ6o+Vc/D9C+N5+zucArmEAdb9rH3auH1XOcOg==\r\nARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;\r\n dkim=none; arc=none\r\nDKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;\r\n s=selector1;\r\n h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;\r\n bh=xk/xvCpbTFjOEHv15mTbWSej9sfOMDvxFBRFG6myd4U=;\r\n b=Olii4bHnrooFcd81hLmppxquEhecqGf86vJFeS+5/P07ZKRBfrcfpDRBa19/1y7BLsDLDHFCl27n7+jUvE4ky3xKHmPoMNWk8dmKo80RYwD5smhf8c62i9D47JXKmi/djg4F+xEyUjyEC8YIv+MeFDcdWRnbkjIgqbk2EIUm8Ax6ZKrsIn6R1EXRicnEMyCmX9UiviCyb4nNSpdWS5LlOc0TtbUEOaouGh0zA8mqBOkJU0fxOfyC1FPYFrYIEJu7hgb08jNv7yQ3oTzu1mZhu1+BWZUUSMN7ggzxo5qbyJ2SJEvIyLELxU9JkEfRUYyBIW+x+PyOae2AVkJ6fjKe6Q==\r\nReceived: from SJ0PR11MB6791.namprd11.prod.outlook.com (2603:10b6:a03:484::8)\r\n by PH7PR11MB5913.namprd11.prod.outlook.com (2603:10b6:510:137::18) with\r\n Microsoft SMTP Server (version=TLS1_2,\r\n cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec\r\n 2025 18:58:57 +0000\r\nReceived: from SJ0PR11MB6791.namprd11.prod.outlook.com\r\n ([fe80::10c2:4698:d539:b855]) by SJ0PR11MB6791.namprd11.prod.outlook.com\r\n ([fe80::10c2:4698:d539:b855%7]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025\r\n 18:58:57 +0000\r\nFrom: Carlos C <canceloc@outlook.com>\r\nTo: \"support@gapshop.net\" <support@gapshop.net>\r\nSubject: Site aint responding\r\nThread-Topic: Site aint responding\r\nThread-Index: AQHcYvSLTC3vF5F0YUG8DaGI728Z1Q==\r\nDate: Mon, 1 Dec 2025 18:58:56 +0000\r\nMessage-ID: <SJ0PR11MB67913C3E49AAF04B7241731CD6DBA@SJ0PR11MB6791.namprd11.prod.outlook.com>\r\nAccept-Language: en-US\r\nContent-Language: en-US\r\nX-MS-Has-Attach: \r\nX-MS-TNEF-Correlator: \r\nx-ms-exchange-messagesentrepresentingtype: 1\r\nx-ms-publictraffictype: Email\r\nx-ms-traffictypediagnostic: SJ0PR11MB6791:EE_|PH7PR11MB5913:EE_\r\nx-ms-office365-filtering-correlation-id: b4667fcb-c45f-4603-8661-08de310bae23\r\nx-ms-exchange-slblob-mailprops: UDhyqGRoB4Z9XxllH+hkfKujfk0E5MqYgBvL334g5+hHY7xVKyiXwQZGT+IBp/JzLWLmZQbxwlZPritFDnAlwWJDQQXs4Uv86/iKZoK+88APNeSnKyUHALr3vcx9CM9GpaaNuT7+v92u+e76yx7UjFdwh4gF6FfqXxalOx6hBmNUuBOywMmuJYMwC6QGWaLQko6ThcN/ILUNVYcwGNZpqDp+cMZcm9v58lgiEq6TOPFKkLv/WBrGUBVb+pSpqU1yjmPdrseGqz8YL0WkUDQ+TUVU0PftRQmy7CaRS+/GrHTFt+AFcQZhSZjwKpi+kWRxAglODL5SzEMMfHSL4v1s5No9dP0MBFzGrhV1jkXr3bCRn05UVjeC8G7eY938ngu/sQ0X/WVR0Pi3g0d2/uCBY4BRqu6EpCdtEErK/0rbfn3yiDsB9AQEbXFtwLf412Ai1UthlYtlfhF52xZlxRXlBpOExE4ip8XJaXUDSLfO8WD9aXVF+gWmi1e2zsuukeGyO1j7vK3g9vrbvGvdwwEO8bAGmu34GFxbbwpKEcRbxqXPOAHTvDVJKkG0ndzuy5CvhWchhFjpxe0ViiANdHO9var/aCjZrK1eUHOds9AdwuVdZ2PRnRcVP19wEwyNX9xjTrBe73BaY/kkfxG3wLWbtp/GEXR+5Rz0QIi9NTatp+sArVyOggReFg==\r\nx-microsoft-antispam: BCL:0;ARA:14566002|8060799015|8062599012|461199028|15080799012|15030799006|41001999006|31061999003|19110799012|51005399006|1602099012|40105399003|10035399007|3412199025|4302099013|440099028|102099032;\r\nx-microsoft-antispam-message-info: =?iso-8859-1?Q?iaUTQnPLxf0SQ4pJHC+ClQdpYTx9UagkBfs7cY+xoxzLjzHY4Y9BhO8zmG?=\r\n =?iso-8859-1?Q?VAjWnstVcdhlPhg9QpAlutmHhsI1KxyHG5ZQtFjkrehchbEMxT2UXQjRlI?=\r\n =?iso-8859-1?Q?cICIkot88MBXuuwJhstHoL3O4MN9aDLI8gCbThb28+lMYX18p+ScLDqiwY?=\r\n =?iso-8859-1?Q?ImCj0kh8qpv4zYOHcg7FP/2nr5QjXijgvrZCg9EiFzYPUIypjull8ilvrL?=\r\n =?iso-8859-1?Q?zbn/SkglW8G7MIpV73Iw69CRdK6riXXyDLEI8pTIuuneXd7BEbGY5hvuVc?=\r\n =?iso-8859-1?Q?h/qHzQBxCgp6R0z7EExN/+T/Rsmq0BhyDPeRsO5Jy9a2uolxJLaZf6tEAf?=\r\n =?iso-8859-1?Q?IPTvV0Gh4Iqao71IM68lN8diSbV276PR8XZEyUll43W3AnmY1W0CrpI29S?=\r\n =?iso-8859-1?Q?2cWAhcL2EHN9aihrVN/8ZBf/hIocAapmkJ3/prer6ZQiyYyQcAeMGLIMOk?=\r\n =?iso-8859-1?Q?flpI9a1l2+VhTKSh51Kj57A9ljI9GuQ2pPbgA+/kMJXf3/kfSAFoRCYKqi?=\r\n =?iso-8859-1?Q?/WoMpZoryYzwebwO88RhKjjzTYmQ8JaUzzooz0BzwhDbcPmMSHSuac3+R+?=\r\n =?iso-8859-1?Q?lJC4j/AxlAhR6vwlqOqXFdr+ZXnDF5cpHTeUITDem8s1mcVR7h1ERRISfb?=\r\n =?iso-8859-1?Q?eERER2NrMEFAuLzcGH+MI7OC5Xa5xg/6HrcxYKo5LPXNbfaC0dhPd3KOy2?=\r\n =?iso-8859-1?Q?ke0sxao5e4g4Qio4/ylAEUGBcl3ETv7Gi4hSgYC+eCj3D5Us9jVGTN7Ch8?=\r\n =?iso-8859-1?Q?zycBDeKX2fFZUG9x7qtKMB7MtK/vs8GFmCzHRYb340WCJ9cvMn+2ZwEzGG?=\r\n =?iso-8859-1?Q?EZeCm0wPPgluA0zuPaZZ+0r3otriqsTsnpeHV2q+zuPnoPAHff4xkLb4fU?=\r\n =?iso-8859-1?Q?qFOOCD2hAYwi7Pio+WITgYahi73zA6ecV1EJb9Swr791K4FCRuqDnI92yr?=\r\n =?iso-8859-1?Q?fQWPmtmBtVSLqnQON+9FyJcNQ4ybapKPtZrJeD3ldh47AGtCYu35kOqa3Z?=\r\n =?iso-8859-1?Q?wkfYf+SYKOkC0X9+A815VBa2Z9QsnsC/hVtFt5hKEDmfEFcY6HSISoQXLC?=\r\n =?iso-8859-1?Q?ngeZVJUAlST4PJB82FjD4A7mZ13OXyp+33t4xJ3ZkaS2SjWdvTGGbxvPIp?=\r\n =?iso-8859-1?Q?Lira/2jT6SES3FLq1IsD855kE/GK5JLHkGqGxwfMPhtlM74Dh05J+2of38?=\r\n =?iso-8859-1?Q?MjPHkINa/nmkgHmZRfAQt5wRZFhP83aQ+SjLRWHV+4QU36wSkPzidEjRZn?=\r\n =?iso-8859-1?Q?2RXQNZMThq2Brd63qu7gIqf2lig7xbl1YEazlW4mn3JPd5HRn1d957fbDY?=\r\n =?iso-8859-1?Q?/OwTf9tvfNzdincmZiZt2gN4hANOYMa/wqqwCIKGL7oabe85XCjzROhfIg?=\r\n =?iso-8859-1?Q?K2/Gcskki8?=\r\nx-ms-exchange-antispam-messagedata-chunkcount: 1\r\nx-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?0AtSkQVz2xO2q8ZgAJ07AYddhi+sOcGBfMHF14WRMc9+5TKEOek407z5g6?=\r\n =?iso-8859-1?Q?tnlViNJ2GtAf4YfunmPkRJx075tBguNJgg8TwPpyFeyEyX1TIEiVJzgnzN?=\r\n =?iso-8859-1?Q?2Rzx0ThoRmRhEYAOkWC0E7eU4FFQi4GFwI3oAkMuICBVt+fYgqbpoFtUCq?=\r\n =?iso-8859-1?Q?AeGpNehY9k48BUZZMZdxAXtmfw1VPzY67ZA9IG+psn3IHht8LQ05it/vC6?=\r\n =?iso-8859-1?Q?LabVPYYYSdU9t7Vb6qOlNEVp8N56sxOJqPNYad9IYfJso3PLQ2l1r/f7YD?=\r\n =?iso-8859-1?Q?Du8yQQCTvoOuvrC+lJ/zfgONo5vH7lTo/mDIqY1fKAwL65Zr2bE783YHOB?=\r\n =?iso-8859-1?Q?R0LKO6ycPLcBKIYju8s99yJHNAILcbMdqK4MhGZnV3NRAOB3AeUQq1R4aJ?=\r\n =?iso-8859-1?Q?EJX7uZErzvGZ9bW/xhE5hSWjzcR7YsEQAJaZHMkp76iif7kz5zG5wAb6QY?=\r\n =?iso-8859-1?Q?4LcAVz1aHMQTPc3fjIFeZ8BUuZg/yEpdqm/5Rw5sdwqfymBGS255NMKr0w?=\r\n =?iso-8859-1?Q?qvwwZbjIns3Q+l3pfiLM2QatB6JiE8jI7tzy7X/XRGc2XnGfY55ANeNzj8?=\r\n =?iso-8859-1?Q?TNvstotzt2YnlcDy4sSEFDTO51EA7IXoDId4QAquC7n3L97dPp6+VEtnvQ?=\r\n =?iso-8859-1?Q?jmtmIBX5pv+p4iZnD9TRV0Ql2QC1yKv3yzNSAM3SD31JNEP9AaY26b5VdF?=\r\n =?iso-8859-1?Q?qnNaHDs04noGYRsRahPMd/zrxj5rUDod156XwEloTeTL24uOnXSa/6BNS4?=\r\n =?iso-8859-1?Q?PZCfgNIv0ZnLnuxJ3emhmH8Y3ezWejSewM4N42qQCysxnk+SBKnjUZ2aH+?=\r\n =?iso-8859-1?Q?XyqJAEyWxBfGCrTFlSiE6GTM+MywjiMYcjRRuxI22k1gt9KJxNGkOlxgU2?=\r\n =?iso-8859-1?Q?VS8UYu+pK+yH7eSk3Xjw286tnr5mCmf228GIUCtY3Vmf8a+RRRF4lnfuLE?=\r\n =?iso-8859-1?Q?t20etgyhjtF/gQvAhrnIswyTn7IBn5/MJfh8AXstW+bLLv/7ym+3u9EWMN?=\r\n =?iso-8859-1?Q?lHJwxK2EoBdrxyacx4Ygk0piaZc6I4iuZNHC6fBH3//q2FenPh4GHQHsFi?=\r\n =?iso-8859-1?Q?xXuNFH2HmznDDeMTlTOlcaNetNiBlyItOVvda82YWg9Sg/4/5O/zdLxVyg?=\r\n =?iso-8859-1?Q?lmLFS0LJQMFOgN61spINwXD+0n6+p0F+YwEaUwRsxWYwkZqnzp0ZS+ThUq?=\r\n =?iso-8859-1?Q?Zff/vOMsGiXX19Tzg2DWzEB8NPXHg9Yms/qsy36+xsr87wmIuq38W9g1TP?=\r\n =?iso-8859-1?Q?Bm8UlzuDcz/9fS2lBJUrVyNVTB4YQ7/TwGJv/auzB7coViSZIxLcYSRjDj?=\r\n =?iso-8859-1?Q?XUr7ma1f/B7U87aApVmwfds26/mhNcC5d7EEdcBF/wvlkZU=3D?=\r\nContent-Type: multipart/alternative;\r\n	boundary=\"_000_SJ0PR11MB67913C3E49AAF04B7241731CD6DBASJ0PR11MB6791namp_\"\r\nMIME-Version: 1.0\r\nX-OriginatorOrg: outlook.com\r\nX-MS-Exchange-CrossTenant-AuthAs: Internal\r\nX-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB6791.namprd11.prod.outlook.com\r\nX-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000\r\nX-MS-Exchange-CrossTenant-Network-Message-Id: b4667fcb-c45f-4603-8661-08de310bae23\r\nX-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2025 18:58:56.8625\r\n (UTC)\r\nX-MS-Exchange-CrossTenant-fromentityheader: Hosted\r\nX-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa\r\nX-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000\r\nX-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5913\r\nX-SmarterMail-Spam: SPF_Pass, Reverse DNS Lookup [Passed], ISpamAssassin 0 [raw: 0], DKIM_Pass, Custom Rules []\r\nX-SmarterMail-TotalSpamWeight: -4\r\nX-Antivirus: Avast (VPS 251201-6, 12/1/2025), Inbound message\r\nX-Antivirus-Status: Clean');

-- --------------------------------------------------------

--
-- Table structure for table `ost_thread_entry_merge`
--

DROP TABLE IF EXISTS `ost_thread_entry_merge`;
CREATE TABLE `ost_thread_entry_merge` (
  `id` int(11) UNSIGNED NOT NULL,
  `thread_entry_id` int(11) UNSIGNED NOT NULL,
  `data` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost_thread_entry_merge`
--

TRUNCATE TABLE `ost_thread_entry_merge`;
-- --------------------------------------------------------

--
-- Table structure for table `ost_thread_event`
--

DROP TABLE IF EXISTS `ost_thread_event`;
CREATE TABLE `ost_thread_event` (
  `id` int(10) UNSIGNED NOT NULL,
  `thread_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `thread_type` char(1) NOT NULL DEFAULT '',
  `event_id` int(11) UNSIGNED DEFAULT NULL,
  `staff_id` int(11) UNSIGNED NOT NULL,
  `team_id` int(11) UNSIGNED NOT NULL,
  `dept_id` int(11) UNSIGNED NOT NULL,
  `topic_id` int(11) UNSIGNED NOT NULL,
  `data` varchar(1024) DEFAULT NULL COMMENT 'Encoded differences',
  `username` varchar(128) NOT NULL DEFAULT 'SYSTEM',
  `uid` int(11) UNSIGNED DEFAULT NULL,
  `uid_type` char(1) NOT NULL DEFAULT 'S',
  `annulled` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost_thread_event`
--

TRUNCATE TABLE `ost_thread_event`;
--
-- Dumping data for table `ost_thread_event`
--

INSERT INTO `ost_thread_event` (`id`, `thread_id`, `thread_type`, `event_id`, `staff_id`, `team_id`, `dept_id`, `topic_id`, `data`, `username`, `uid`, `uid_type`, `annulled`, `timestamp`) VALUES
(1, 0, 'T', 1, 0, 0, 1, 1, NULL, 'SYSTEM', 1, 'U', 0, '2025-11-29 04:12:36'),
(2, 2, 'T', 1, 0, 0, 1, 1, NULL, 'SYSTEM', 2, 'U', 0, '2025-11-29 06:31:08'),
(3, 2, 'T', 2, 1, 0, 1, 1, '{\"status\":[3,\"Closed\"]}', 'ostadmin', 1, 'S', 0, '2025-12-01 10:45:42'),
(4, 0, 'T', 2, 1, 0, 1, 1, '{\"status\":[3,\"Closed\"]}', 'ostadmin', 1, 'S', 0, '2025-12-01 10:46:10'),
(5, 3, 'T', 1, 0, 0, 1, 0, NULL, 'SYSTEM', 3, 'U', 0, '2025-12-01 11:00:18'),
(6, 3, 'T', 2, 1, 0, 1, 0, '{\"status\":[3,\"Closed\"]}', 'ostadmin', 1, 'S', 0, '2025-12-01 11:03:03'),
(7, 1, 'T', 14, 1, 0, 1, 1, NULL, 'ostadmin', 1, 'S', 0, '2026-04-03 16:40:56');

-- --------------------------------------------------------

--
-- Table structure for table `ost_thread_referral`
--

DROP TABLE IF EXISTS `ost_thread_referral`;
CREATE TABLE `ost_thread_referral` (
  `id` int(10) UNSIGNED NOT NULL,
  `thread_id` int(11) UNSIGNED NOT NULL,
  `object_id` int(11) UNSIGNED NOT NULL,
  `object_type` char(1) NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost_thread_referral`
--

TRUNCATE TABLE `ost_thread_referral`;
--
-- Dumping data for table `ost_thread_referral`
--

INSERT INTO `ost_thread_referral` (`id`, `thread_id`, `object_id`, `object_type`, `created`) VALUES
(1, 2, 1, 'S', '2025-12-01 10:45:42'),
(3, 3, 1, 'S', '2025-12-01 11:03:03');

-- --------------------------------------------------------

--
-- Table structure for table `ost_ticket`
--

DROP TABLE IF EXISTS `ost_ticket`;
CREATE TABLE `ost_ticket` (
  `ticket_id` int(11) UNSIGNED NOT NULL,
  `ticket_pid` int(11) UNSIGNED DEFAULT NULL,
  `number` varchar(20) DEFAULT NULL,
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `user_email_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `status_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `dept_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `sla_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `topic_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `staff_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `team_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `email_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `lock_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `flags` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `ip_address` varchar(64) NOT NULL DEFAULT '',
  `source` enum('Web','Email','Phone','API','Other') NOT NULL DEFAULT 'Other',
  `source_extra` varchar(40) DEFAULT NULL,
  `isoverdue` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `isanswered` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `duedate` datetime DEFAULT NULL,
  `est_duedate` datetime DEFAULT NULL,
  `reopened` datetime DEFAULT NULL,
  `closed` datetime DEFAULT NULL,
  `lastupdate` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost_ticket`
--

TRUNCATE TABLE `ost_ticket`;
--
-- Dumping data for table `ost_ticket`
--

INSERT INTO `ost_ticket` (`ticket_id`, `ticket_pid`, `number`, `user_id`, `user_email_id`, `status_id`, `dept_id`, `sla_id`, `topic_id`, `staff_id`, `team_id`, `email_id`, `lock_id`, `flags`, `sort`, `ip_address`, `source`, `source_extra`, `isoverdue`, `isanswered`, `duedate`, `est_duedate`, `reopened`, `closed`, `lastupdate`, `created`, `updated`) VALUES
(2, NULL, '913808', 2, 0, 3, 1, 1, 1, 1, 0, 0, 1, 0, 0, '108.85.67.148', 'Web', NULL, 0, 1, NULL, '2025-12-02 15:00:00', NULL, '2025-12-01 10:45:42', '2025-12-01 10:45:42', '2025-11-29 06:31:08', '2025-12-01 10:47:50'),
(3, NULL, '281913', 3, 0, 3, 1, 1, 0, 1, 0, 1, 0, 0, 0, '35.146.238.149', 'Email', NULL, 0, 1, NULL, '2025-12-03 11:00:18', NULL, '2025-12-01 11:03:03', '2026-04-08 05:03:55', '2025-12-01 11:00:18', '2025-12-01 11:03:03'),
(4, NULL, '260408204216', 3, 3, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, '', 'Web', NULL, 0, 0, NULL, NULL, NULL, NULL, '2026-04-08 13:55:44', '2026-04-08 13:42:14', '2026-04-08 13:42:14'),
(5, NULL, '260408211119', 4, 4, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, '', 'Web', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '2026-04-08 14:11:17', '2026-04-08 14:11:17'),
(6, NULL, '260408212446', 4, 4, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, '', 'Web', NULL, 0, 0, NULL, NULL, NULL, NULL, '2026-04-09 03:12:37', '2026-04-08 14:24:44', '2026-04-08 14:24:44'),
(7, NULL, '260409102258', 4, 4, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, '', 'Web', NULL, 0, 0, NULL, NULL, NULL, NULL, '2026-04-09 04:18:02', '2026-04-09 03:22:58', '2026-04-09 03:22:58'),
(8, NULL, '260409131359', 4, 4, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, '', 'Web', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '2026-04-09 06:13:59', '2026-04-09 06:13:59'),
(9, NULL, '260409131653', 4, 4, 1, 3, 1, 1, 0, 0, 1, 0, 0, 0, '', 'Web', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '2026-04-09 06:16:53', '2026-04-09 06:16:53'),
(10, NULL, '260409133941', 4, 4, 1, 3, 1, 1, 0, 0, 1, 0, 0, 0, '', 'Web', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '2026-04-09 06:39:41', '2026-04-09 06:39:41'),
(11, NULL, '260409232559', 4, 4, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, '', 'Web', NULL, 0, 0, NULL, NULL, NULL, NULL, '2026-04-09 17:22:23', '2026-04-09 16:25:59', '2026-04-09 16:25:59');

-- --------------------------------------------------------

--
-- Table structure for table `ost_ticket_priority`
--

DROP TABLE IF EXISTS `ost_ticket_priority`;
CREATE TABLE `ost_ticket_priority` (
  `priority_id` tinyint(4) NOT NULL,
  `priority` varchar(60) NOT NULL DEFAULT '',
  `priority_desc` varchar(30) NOT NULL DEFAULT '',
  `priority_color` varchar(7) NOT NULL DEFAULT '',
  `priority_urgency` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `ispublic` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost_ticket_priority`
--

TRUNCATE TABLE `ost_ticket_priority`;
--
-- Dumping data for table `ost_ticket_priority`
--

INSERT INTO `ost_ticket_priority` (`priority_id`, `priority`, `priority_desc`, `priority_color`, `priority_urgency`, `ispublic`) VALUES
(1, 'low', 'Low', '#DDFFDD', 4, 1),
(2, 'normal', 'Normal', '#FFFFF0', 3, 1),
(3, 'high', 'High', '#FEE7E7', 2, 1),
(4, 'emergency', 'Emergency', '#FEE7E7', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ost_ticket_status`
--

DROP TABLE IF EXISTS `ost_ticket_status`;
CREATE TABLE `ost_ticket_status` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL DEFAULT '',
  `state` varchar(16) DEFAULT NULL,
  `mode` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `flags` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `properties` text NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost_ticket_status`
--

TRUNCATE TABLE `ost_ticket_status`;
--
-- Dumping data for table `ost_ticket_status`
--

INSERT INTO `ost_ticket_status` (`id`, `name`, `state`, `mode`, `flags`, `sort`, `properties`, `created`, `updated`) VALUES
(1, 'Open', 'open', 3, 0, 1, '{\"description\":\"Open tickets.\"}', '2025-11-29 04:12:33', '0000-00-00 00:00:00'),
(2, 'Resolved', 'closed', 1, 0, 2, '{\"allowreopen\":true,\"reopenstatus\":0,\"description\":\"Resolved tickets\"}', '2025-11-29 04:12:33', '0000-00-00 00:00:00'),
(3, 'Closed', 'closed', 3, 0, 3, '{\"allowreopen\":true,\"reopenstatus\":0,\"description\":\"Closed tickets. Tickets will still be accessible on client and staff panels.\"}', '2025-11-29 04:12:33', '0000-00-00 00:00:00'),
(4, 'Archived', 'archived', 3, 0, 4, '{\"description\":\"Tickets only adminstratively available but no longer accessible on ticket queues and client panel.\"}', '2025-11-29 04:12:33', '0000-00-00 00:00:00'),
(5, 'Deleted', 'deleted', 3, 0, 5, '{\"description\":\"Tickets queued for deletion. Not accessible on ticket queues.\"}', '2025-11-29 04:12:33', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ost_ticket__cdata`
--

DROP TABLE IF EXISTS `ost_ticket__cdata`;
CREATE TABLE `ost_ticket__cdata` (
  `ticket_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `subject` mediumtext,
  `priority` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost_ticket__cdata`
--

TRUNCATE TABLE `ost_ticket__cdata`;
--
-- Dumping data for table `ost_ticket__cdata`
--

INSERT INTO `ost_ticket__cdata` (`ticket_id`, `subject`, `priority`) VALUES
(2, 'Testing the gaps', '2'),
(3, 'Site aint responding', '2'),
(4, 'New Ticket Test', 'Normal'),
(5, 'New Ticket', 'Normal'),
(6, 'A NEW ISSUE', 'Normal'),
(7, 'A New Ticket', 'Normal'),
(8, 'Testing the NEW tickets', 'Normal'),
(9, 'Ticket For Maintenance', 'Normal'),
(10, 'Maintenance Request', 'Emergency'),
(11, 'Show me Topics', 'Emergency');

-- --------------------------------------------------------

--
-- Table structure for table `ost_translation`
--

DROP TABLE IF EXISTS `ost_translation`;
CREATE TABLE `ost_translation` (
  `id` int(11) UNSIGNED NOT NULL,
  `object_hash` char(16) CHARACTER SET ascii DEFAULT NULL,
  `type` enum('phrase','article','override') DEFAULT NULL,
  `flags` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `revision` int(11) UNSIGNED DEFAULT NULL,
  `agent_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `lang` varchar(16) NOT NULL DEFAULT '',
  `text` mediumtext NOT NULL,
  `source_text` text,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost_translation`
--

TRUNCATE TABLE `ost_translation`;
-- --------------------------------------------------------

--
-- Table structure for table `ost_user`
--

DROP TABLE IF EXISTS `ost_user`;
CREATE TABLE `ost_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `org_id` int(10) UNSIGNED NOT NULL,
  `default_email_id` int(10) NOT NULL,
  `status` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost_user`
--

TRUNCATE TABLE `ost_user`;
--
-- Dumping data for table `ost_user`
--

INSERT INTO `ost_user` (`id`, `org_id`, `default_email_id`, `status`, `name`, `created`, `updated`) VALUES
(2, 0, 2, 0, 'Tiffy', '2025-11-29 06:31:08', '2025-11-29 06:31:08'),
(3, 0, 3, 0, 'Carlos C', '2025-12-01 11:00:18', '2025-12-01 11:00:18'),
(4, 0, 4, 0, 'The Greatest Store', '2026-04-08 14:11:17', '2026-04-08 14:11:17');

-- --------------------------------------------------------

--
-- Table structure for table `ost_user_account`
--

DROP TABLE IF EXISTS `ost_user_account`;
CREATE TABLE `ost_user_account` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `status` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `timezone` varchar(64) DEFAULT NULL,
  `lang` varchar(16) DEFAULT NULL,
  `username` varchar(64) DEFAULT NULL,
  `passwd` varchar(128) CHARACTER SET ascii COLLATE ascii_bin DEFAULT NULL,
  `backend` varchar(32) DEFAULT NULL,
  `extra` text,
  `registered` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost_user_account`
--

TRUNCATE TABLE `ost_user_account`;
--
-- Dumping data for table `ost_user_account`
--

INSERT INTO `ost_user_account` (`id`, `user_id`, `status`, `timezone`, `lang`, `username`, `passwd`, `backend`, `extra`, `registered`) VALUES
(1, 3, 1, NULL, NULL, NULL, '$2a$08$K4TBzhu.iCO3HutLzSMZRuo/oi6ht9ovDB1Xus9zDSYJOasi0X0ZG', NULL, '{\"browser_lang\":\"en_US\"}', '2026-04-03 23:38:31');

-- --------------------------------------------------------

--
-- Table structure for table `ost_user_email`
--

DROP TABLE IF EXISTS `ost_user_email`;
CREATE TABLE `ost_user_email` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `flags` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost_user_email`
--

TRUNCATE TABLE `ost_user_email`;
--
-- Dumping data for table `ost_user_email`
--

INSERT INTO `ost_user_email` (`id`, `user_id`, `flags`, `address`) VALUES
(2, 2, 0, 'trulyhabitforming@gmail.com'),
(3, 3, 0, 'canceloc@outlook.com'),
(4, 4, 0, 'carlosinflorida@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `ost_user__cdata`
--

DROP TABLE IF EXISTS `ost_user__cdata`;
CREATE TABLE `ost_user__cdata` (
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `email` mediumtext,
  `name` mediumtext,
  `phone` mediumtext,
  `notes` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost_user__cdata`
--

TRUNCATE TABLE `ost_user__cdata`;
--
-- Dumping data for table `ost_user__cdata`
--

INSERT INTO `ost_user__cdata` (`user_id`, `email`, `name`, `phone`, `notes`) VALUES
(1, NULL, NULL, '', ''),
(2, NULL, NULL, '9547092564', ''),
(3, NULL, NULL, '', ''),
(4, 'carlosinflorida@gmail.com', 'The Greatest Store', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ost__search`
--

DROP TABLE IF EXISTS `ost__search`;
CREATE TABLE `ost__search` (
  `object_type` varchar(8) NOT NULL,
  `object_id` int(11) UNSIGNED NOT NULL,
  `title` text,
  `content` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ost__search`
--

TRUNCATE TABLE `ost__search`;
--
-- Dumping data for table `ost__search`
--

INSERT INTO `ost__search` (`object_type`, `object_id`, `title`, `content`) VALUES
('H', 2, '', 'Testing'),
('H', 3, '', 'Hi Tiffy, Your ticket #913808 created on 11/29/25 8:31 AM is in Support department.'),
('H', 5, 'Site aint responding', 'Another test, no forwarding for the email address. Carlos S. Cancelo https://www.theticketstore.net'),
('H', 6, '', 'Issue should be resolved.Hi Carlos, Your ticket #281913 created on 12/1/25 1:00 PM is in Support department.'),
('K', 1, 'Password Change', 'There is no password update necessary, the system uses the OTP(one time password) method. There are no passwords to store, they cannot be hacked or compromised and there is no forgetting passwords and needing to change them every so often for security reasons. Once you log in to the system using the code that is sent to you, that code is no longer active and cannot be used again. Unless your email gets compromised, there is no way for this method to be hacked.'),
('K', 2, 'Does DeskFlow offer Technical Support', 'Yes. DeskFlow , TeamFlow and CallFlow all have technical support services available. However, the method of contacting the support staff depends on the service tier for your enterprise. Phone and priority support is available only for the Scale tier. Priority email and chat support is available for the Growth plan. The Starter plan has email support, only. There is no SLA for email support when on the Starter plan.'),
('K', 3, 'What Browser Does gapShop Recommend?', 'gapShop , and all applications, function properly on any compliant browser. Any of the major brands will work properly on the platform. However, we do have a preference, it is Vivaldi . At Vivaldi, they \"Respect Your Privacy\", it is a fast and feature rich browser that is also highly secure. For a straight comparison of the 2 major browsers and Vivaldi, see the link here: Chrome vs. Edge vs. Firefox vs. Vivaldi: Which Browser Is Better? For more information on Vivaldi: https://vivaldi.com Although most of us use a web browser for email, if you prefer to use an email client for your daily email chores, Vivaldi also offer an application for this purpose, look for it out on their website.'),
('O', 1, 'osTicket', ''),
('T', 2, '913808 Testing the gaps', 'Testing the gaps'),
('T', 3, '281913 Site aint responding', 'Site aint responding'),
('U', 2, 'Tiffy', '(954) 709-2564 trulyhabitforming@gmail.com\ntrulyhabitforming@gmail.com'),
('U', 3, 'Carlos C', ' canceloc@outlook.com\ncanceloc@outlook.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ost_api_key`
--
ALTER TABLE `ost_api_key`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `apikey` (`apikey`),
  ADD KEY `ipaddr` (`ipaddr`);

--
-- Indexes for table `ost_attachment`
--
ALTER TABLE `ost_attachment`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `file-type` (`object_id`,`file_id`,`type`),
  ADD UNIQUE KEY `file_object` (`file_id`,`object_id`);

--
-- Indexes for table `ost_canned_response`
--
ALTER TABLE `ost_canned_response`
  ADD PRIMARY KEY (`canned_id`),
  ADD UNIQUE KEY `title` (`title`),
  ADD KEY `dept_id` (`dept_id`),
  ADD KEY `active` (`isenabled`);

--
-- Indexes for table `ost_config`
--
ALTER TABLE `ost_config`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `namespace` (`namespace`,`key`);

--
-- Indexes for table `ost_content`
--
ALTER TABLE `ost_content`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `ost_department`
--
ALTER TABLE `ost_department`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`,`pid`),
  ADD KEY `manager_id` (`manager_id`),
  ADD KEY `autoresp_email_id` (`autoresp_email_id`),
  ADD KEY `tpl_id` (`tpl_id`),
  ADD KEY `flags` (`flags`);

--
-- Indexes for table `ost_draft`
--
ALTER TABLE `ost_draft`
  ADD PRIMARY KEY (`id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `namespace` (`namespace`);

--
-- Indexes for table `ost_email`
--
ALTER TABLE `ost_email`
  ADD PRIMARY KEY (`email_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `priority_id` (`priority_id`),
  ADD KEY `dept_id` (`dept_id`);

--
-- Indexes for table `ost_email_account`
--
ALTER TABLE `ost_email_account`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email_id` (`email_id`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `ost_email_template`
--
ALTER TABLE `ost_email_template`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `template_lookup` (`tpl_id`,`code_name`);

--
-- Indexes for table `ost_email_template_group`
--
ALTER TABLE `ost_email_template_group`
  ADD PRIMARY KEY (`tpl_id`);

--
-- Indexes for table `ost_event`
--
ALTER TABLE `ost_event`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `ost_faq`
--
ALTER TABLE `ost_faq`
  ADD PRIMARY KEY (`faq_id`),
  ADD UNIQUE KEY `question` (`question`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `ispublished` (`ispublished`);

--
-- Indexes for table `ost_faq_category`
--
ALTER TABLE `ost_faq_category`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `ispublic` (`ispublic`);

--
-- Indexes for table `ost_faq_topic`
--
ALTER TABLE `ost_faq_topic`
  ADD PRIMARY KEY (`faq_id`,`topic_id`);

--
-- Indexes for table `ost_file`
--
ALTER TABLE `ost_file`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ft` (`ft`),
  ADD KEY `key` (`key`),
  ADD KEY `signature` (`signature`),
  ADD KEY `type` (`type`),
  ADD KEY `created` (`created`),
  ADD KEY `size` (`size`);

--
-- Indexes for table `ost_file_chunk`
--
ALTER TABLE `ost_file_chunk`
  ADD PRIMARY KEY (`file_id`,`chunk_id`);

--
-- Indexes for table `ost_filter`
--
ALTER TABLE `ost_filter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `target` (`target`),
  ADD KEY `email_id` (`email_id`);

--
-- Indexes for table `ost_filter_action`
--
ALTER TABLE `ost_filter_action`
  ADD PRIMARY KEY (`id`),
  ADD KEY `filter_id` (`filter_id`);

--
-- Indexes for table `ost_filter_rule`
--
ALTER TABLE `ost_filter_rule`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `filter` (`filter_id`,`what`,`how`,`val`),
  ADD KEY `filter_id` (`filter_id`);

--
-- Indexes for table `ost_form`
--
ALTER TABLE `ost_form`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `ost_form_entry`
--
ALTER TABLE `ost_form_entry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entry_lookup` (`object_type`,`object_id`);

--
-- Indexes for table `ost_form_entry_values`
--
ALTER TABLE `ost_form_entry_values`
  ADD PRIMARY KEY (`entry_id`,`field_id`);

--
-- Indexes for table `ost_form_field`
--
ALTER TABLE `ost_form_field`
  ADD PRIMARY KEY (`id`),
  ADD KEY `form_id` (`form_id`),
  ADD KEY `sort` (`sort`);

--
-- Indexes for table `ost_group`
--
ALTER TABLE `ost_group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `ost_help_topic`
--
ALTER TABLE `ost_help_topic`
  ADD PRIMARY KEY (`topic_id`),
  ADD UNIQUE KEY `topic` (`topic`,`topic_pid`),
  ADD KEY `topic_pid` (`topic_pid`),
  ADD KEY `priority_id` (`priority_id`),
  ADD KEY `dept_id` (`dept_id`),
  ADD KEY `staff_id` (`staff_id`,`team_id`),
  ADD KEY `sla_id` (`sla_id`),
  ADD KEY `page_id` (`page_id`);

--
-- Indexes for table `ost_help_topic_form`
--
ALTER TABLE `ost_help_topic_form`
  ADD PRIMARY KEY (`id`),
  ADD KEY `topic-form` (`topic_id`,`form_id`);

--
-- Indexes for table `ost_list`
--
ALTER TABLE `ost_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `ost_list_items`
--
ALTER TABLE `ost_list_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `list_item_lookup` (`list_id`);

--
-- Indexes for table `ost_lock`
--
ALTER TABLE `ost_lock`
  ADD PRIMARY KEY (`lock_id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indexes for table `ost_note`
--
ALTER TABLE `ost_note`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ext_id` (`ext_id`);

--
-- Indexes for table `ost_organization`
--
ALTER TABLE `ost_organization`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ost_organization__cdata`
--
ALTER TABLE `ost_organization__cdata`
  ADD PRIMARY KEY (`org_id`);

--
-- Indexes for table `ost_plugin`
--
ALTER TABLE `ost_plugin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `install_path` (`install_path`);

--
-- Indexes for table `ost_plugin_instance`
--
ALTER TABLE `ost_plugin_instance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plugin_id` (`plugin_id`);

--
-- Indexes for table `ost_queue`
--
ALTER TABLE `ost_queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `ost_queue_column`
--
ALTER TABLE `ost_queue_column`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ost_queue_columns`
--
ALTER TABLE `ost_queue_columns`
  ADD PRIMARY KEY (`queue_id`,`column_id`,`staff_id`);

--
-- Indexes for table `ost_queue_config`
--
ALTER TABLE `ost_queue_config`
  ADD PRIMARY KEY (`queue_id`,`staff_id`);

--
-- Indexes for table `ost_queue_export`
--
ALTER TABLE `ost_queue_export`
  ADD PRIMARY KEY (`id`),
  ADD KEY `queue_id` (`queue_id`);

--
-- Indexes for table `ost_queue_sort`
--
ALTER TABLE `ost_queue_sort`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ost_queue_sorts`
--
ALTER TABLE `ost_queue_sorts`
  ADD PRIMARY KEY (`queue_id`,`sort_id`);

--
-- Indexes for table `ost_role`
--
ALTER TABLE `ost_role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `ost_schedule`
--
ALTER TABLE `ost_schedule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ost_schedule_entry`
--
ALTER TABLE `ost_schedule_entry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `schedule_id` (`schedule_id`),
  ADD KEY `repeats` (`repeats`);

--
-- Indexes for table `ost_sequence`
--
ALTER TABLE `ost_sequence`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ost_session`
--
ALTER TABLE `ost_session`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `updated` (`session_updated`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `ost_sla`
--
ALTER TABLE `ost_sla`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `ost_staff`
--
ALTER TABLE `ost_staff`
  ADD PRIMARY KEY (`staff_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `dept_id` (`dept_id`),
  ADD KEY `issuperuser` (`isadmin`),
  ADD KEY `isactive` (`isactive`),
  ADD KEY `onvacation` (`onvacation`);

--
-- Indexes for table `ost_staff_dept_access`
--
ALTER TABLE `ost_staff_dept_access`
  ADD PRIMARY KEY (`staff_id`,`dept_id`),
  ADD KEY `dept_id` (`dept_id`);

--
-- Indexes for table `ost_syslog`
--
ALTER TABLE `ost_syslog`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `log_type` (`log_type`);

--
-- Indexes for table `ost_task`
--
ALTER TABLE `ost_task`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dept_id` (`dept_id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `team_id` (`team_id`),
  ADD KEY `created` (`created`),
  ADD KEY `object` (`object_id`,`object_type`),
  ADD KEY `flags` (`flags`);

--
-- Indexes for table `ost_task__cdata`
--
ALTER TABLE `ost_task__cdata`
  ADD PRIMARY KEY (`task_id`);

--
-- Indexes for table `ost_team`
--
ALTER TABLE `ost_team`
  ADD PRIMARY KEY (`team_id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `lead_id` (`lead_id`);

--
-- Indexes for table `ost_team_member`
--
ALTER TABLE `ost_team_member`
  ADD PRIMARY KEY (`team_id`,`staff_id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indexes for table `ost_thread`
--
ALTER TABLE `ost_thread`
  ADD PRIMARY KEY (`id`),
  ADD KEY `object_id` (`object_id`),
  ADD KEY `object_type` (`object_type`);

--
-- Indexes for table `ost_thread_collaborator`
--
ALTER TABLE `ost_thread_collaborator`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `collab` (`thread_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `ost_thread_entry`
--
ALTER TABLE `ost_thread_entry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`),
  ADD KEY `thread_id` (`thread_id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `ost_thread_entry_email`
--
ALTER TABLE `ost_thread_entry_email`
  ADD PRIMARY KEY (`id`),
  ADD KEY `thread_entry_id` (`thread_entry_id`),
  ADD KEY `mid` (`mid`),
  ADD KEY `email_id` (`email_id`);

--
-- Indexes for table `ost_thread_entry_merge`
--
ALTER TABLE `ost_thread_entry_merge`
  ADD PRIMARY KEY (`id`),
  ADD KEY `thread_entry_id` (`thread_entry_id`);

--
-- Indexes for table `ost_thread_event`
--
ALTER TABLE `ost_thread_event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_state` (`thread_id`,`event_id`,`timestamp`),
  ADD KEY `ticket_stats` (`timestamp`,`event_id`);

--
-- Indexes for table `ost_thread_referral`
--
ALTER TABLE `ost_thread_referral`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ref` (`object_id`,`object_type`,`thread_id`),
  ADD KEY `thread_id` (`thread_id`);

--
-- Indexes for table `ost_ticket`
--
ALTER TABLE `ost_ticket`
  ADD PRIMARY KEY (`ticket_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `dept_id` (`dept_id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `team_id` (`team_id`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `created` (`created`),
  ADD KEY `closed` (`closed`),
  ADD KEY `duedate` (`duedate`),
  ADD KEY `topic_id` (`topic_id`),
  ADD KEY `sla_id` (`sla_id`),
  ADD KEY `ticket_pid` (`ticket_pid`);

--
-- Indexes for table `ost_ticket_priority`
--
ALTER TABLE `ost_ticket_priority`
  ADD PRIMARY KEY (`priority_id`),
  ADD UNIQUE KEY `priority` (`priority`),
  ADD KEY `priority_urgency` (`priority_urgency`),
  ADD KEY `ispublic` (`ispublic`);

--
-- Indexes for table `ost_ticket_status`
--
ALTER TABLE `ost_ticket_status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `state` (`state`);

--
-- Indexes for table `ost_ticket__cdata`
--
ALTER TABLE `ost_ticket__cdata`
  ADD PRIMARY KEY (`ticket_id`);

--
-- Indexes for table `ost_translation`
--
ALTER TABLE `ost_translation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`,`lang`),
  ADD KEY `object_hash` (`object_hash`);

--
-- Indexes for table `ost_user`
--
ALTER TABLE `ost_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `org_id` (`org_id`),
  ADD KEY `default_email_id` (`default_email_id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `ost_user_account`
--
ALTER TABLE `ost_user_account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `ost_user_email`
--
ALTER TABLE `ost_user_email`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `address` (`address`),
  ADD KEY `user_email_lookup` (`user_id`);

--
-- Indexes for table `ost_user__cdata`
--
ALTER TABLE `ost_user__cdata`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `ost__search`
--
ALTER TABLE `ost__search`
  ADD PRIMARY KEY (`object_type`,`object_id`);
ALTER TABLE `ost__search` ADD FULLTEXT KEY `search` (`title`,`content`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ost_api_key`
--
ALTER TABLE `ost_api_key`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ost_attachment`
--
ALTER TABLE `ost_attachment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `ost_canned_response`
--
ALTER TABLE `ost_canned_response`
  MODIFY `canned_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ost_config`
--
ALTER TABLE `ost_config`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- AUTO_INCREMENT for table `ost_content`
--
ALTER TABLE `ost_content`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `ost_department`
--
ALTER TABLE `ost_department`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ost_draft`
--
ALTER TABLE `ost_draft`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ost_email`
--
ALTER TABLE `ost_email`
  MODIFY `email_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ost_email_account`
--
ALTER TABLE `ost_email_account`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ost_email_template`
--
ALTER TABLE `ost_email_template`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `ost_email_template_group`
--
ALTER TABLE `ost_email_template_group`
  MODIFY `tpl_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ost_event`
--
ALTER TABLE `ost_event`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `ost_faq`
--
ALTER TABLE `ost_faq`
  MODIFY `faq_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ost_faq_category`
--
ALTER TABLE `ost_faq_category`
  MODIFY `category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ost_file`
--
ALTER TABLE `ost_file`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ost_filter`
--
ALTER TABLE `ost_filter`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ost_filter_action`
--
ALTER TABLE `ost_filter_action`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ost_filter_rule`
--
ALTER TABLE `ost_filter_rule`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ost_form`
--
ALTER TABLE `ost_form`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ost_form_entry`
--
ALTER TABLE `ost_form_entry`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `ost_form_field`
--
ALTER TABLE `ost_form_field`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `ost_group`
--
ALTER TABLE `ost_group`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ost_help_topic`
--
ALTER TABLE `ost_help_topic`
  MODIFY `topic_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `ost_help_topic_form`
--
ALTER TABLE `ost_help_topic_form`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ost_list`
--
ALTER TABLE `ost_list`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ost_list_items`
--
ALTER TABLE `ost_list_items`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ost_lock`
--
ALTER TABLE `ost_lock`
  MODIFY `lock_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ost_note`
--
ALTER TABLE `ost_note`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ost_organization`
--
ALTER TABLE `ost_organization`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ost_plugin`
--
ALTER TABLE `ost_plugin`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ost_plugin_instance`
--
ALTER TABLE `ost_plugin_instance`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ost_queue`
--
ALTER TABLE `ost_queue`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `ost_queue_column`
--
ALTER TABLE `ost_queue_column`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `ost_queue_export`
--
ALTER TABLE `ost_queue_export`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ost_queue_sort`
--
ALTER TABLE `ost_queue_sort`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `ost_role`
--
ALTER TABLE `ost_role`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ost_schedule`
--
ALTER TABLE `ost_schedule`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ost_schedule_entry`
--
ALTER TABLE `ost_schedule_entry`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `ost_sequence`
--
ALTER TABLE `ost_sequence`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ost_sla`
--
ALTER TABLE `ost_sla`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ost_staff`
--
ALTER TABLE `ost_staff`
  MODIFY `staff_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ost_syslog`
--
ALTER TABLE `ost_syslog`
  MODIFY `log_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=203;

--
-- AUTO_INCREMENT for table `ost_task`
--
ALTER TABLE `ost_task`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ost_team`
--
ALTER TABLE `ost_team`
  MODIFY `team_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ost_thread`
--
ALTER TABLE `ost_thread`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `ost_thread_collaborator`
--
ALTER TABLE `ost_thread_collaborator`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ost_thread_entry`
--
ALTER TABLE `ost_thread_entry`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `ost_thread_entry_email`
--
ALTER TABLE `ost_thread_entry_email`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ost_thread_entry_merge`
--
ALTER TABLE `ost_thread_entry_merge`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ost_thread_event`
--
ALTER TABLE `ost_thread_event`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `ost_thread_referral`
--
ALTER TABLE `ost_thread_referral`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ost_ticket`
--
ALTER TABLE `ost_ticket`
  MODIFY `ticket_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `ost_ticket_priority`
--
ALTER TABLE `ost_ticket_priority`
  MODIFY `priority_id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ost_ticket_status`
--
ALTER TABLE `ost_ticket_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ost_translation`
--
ALTER TABLE `ost_translation`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ost_user`
--
ALTER TABLE `ost_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ost_user_account`
--
ALTER TABLE `ost_user_account`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ost_user_email`
--
ALTER TABLE `ost_user_email`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
