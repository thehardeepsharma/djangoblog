-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 29, 2017 at 03:00 PM
-- Server version: 5.7.20-0ubuntu0.16.04.1
-- PHP Version: 5.6.31-4+ubuntu16.04.1+deb.sury.org+4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `python_polls`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add post', 1, 'add_post'),
(2, 'Can change post', 1, 'change_post'),
(3, 'Can delete post', 1, 'delete_post'),
(4, 'Can add comment', 2, 'add_comment'),
(5, 'Can change comment', 2, 'change_comment'),
(6, 'Can delete comment', 2, 'delete_comment'),
(7, 'Can add question', 3, 'add_question'),
(8, 'Can change question', 3, 'change_question'),
(9, 'Can delete question', 3, 'delete_question'),
(10, 'Can add choice', 4, 'add_choice'),
(11, 'Can change choice', 4, 'change_choice'),
(12, 'Can delete choice', 4, 'delete_choice'),
(13, 'Can add log entry', 5, 'add_logentry'),
(14, 'Can change log entry', 5, 'change_logentry'),
(15, 'Can delete log entry', 5, 'delete_logentry'),
(16, 'Can add group', 6, 'add_group'),
(17, 'Can change group', 6, 'change_group'),
(18, 'Can delete group', 6, 'delete_group'),
(19, 'Can add permission', 7, 'add_permission'),
(20, 'Can change permission', 7, 'change_permission'),
(21, 'Can delete permission', 7, 'delete_permission'),
(22, 'Can add user', 8, 'add_user'),
(23, 'Can change user', 8, 'change_user'),
(24, 'Can delete user', 8, 'delete_user'),
(25, 'Can add content type', 9, 'add_contenttype'),
(26, 'Can change content type', 9, 'change_contenttype'),
(27, 'Can delete content type', 9, 'delete_contenttype'),
(28, 'Can add session', 10, 'add_session'),
(29, 'Can change session', 10, 'change_session'),
(30, 'Can delete session', 10, 'delete_session');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$100000$isC2yvJR7TWW$uKUxQa5aSHcD/W19XeVji4CTs3bowGYq0ujVhwM+ei8=', '2017-12-26 04:15:59.752378', 1, 'admin', '', '', 'demo@demo.com', 1, 1, '2017-12-26 04:15:30.820047');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `blog_comment`
--

CREATE TABLE `blog_comment` (
  `id` int(11) NOT NULL,
  `comment_author` varchar(100) NOT NULL,
  `comment` longtext NOT NULL,
  `comment_date` datetime(6) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `blog_comment`
--

INSERT INTO `blog_comment` (`id`, `comment_author`, `comment`, `comment_date`, `post_id`) VALUES
(1, 'Amit Kumar', 'This is good tutorials', '2017-12-26 04:21:50.906863', 3),
(2, 'Amit Kumar', 'This is Test', '2017-12-29 09:29:37.184885', 1);

-- --------------------------------------------------------

--
-- Table structure for table `blog_post`
--

CREATE TABLE `blog_post` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `content` longtext NOT NULL,
  `pub_date` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `blog_post`
--

INSERT INTO `blog_post` (`id`, `title`, `content`, `pub_date`, `user_id`) VALUES
(1, 'PHP 5 Introduction', 'PHP scripts are executed on the server.\r\n\r\nWhat You Should Already Know\r\nBefore you continue you should have a basic understanding of the following:\r\n\r\nHTML\r\nCSS\r\nJavaScript\r\nIf you want to study these subjects first, find the tutorials on our Home page.\r\n\r\nWhat is PHP?\r\nPHP is an acronym for "PHP: Hypertext Preprocessor"\r\nPHP is a widely-used, open source scripting language\r\nPHP scripts are executed on the server\r\nPHP is free to download and use', '2017-12-26 04:17:11.000000', 1),
(2, 'PHP 5 Installation', 'What Do I Need?\r\nTo start using PHP, you can:\r\n\r\nFind a web host with PHP and MySQL support\r\nInstall a web server on your own PC, and then install PHP and MySQL\r\nUse a Web Host With PHP Support\r\nIf your server has activated support for PHP you do not need to do anything.\r\n\r\nJust create some .php files, place them in your web directory, and the server will automatically parse them for you.\r\n\r\nYou do not need to compile anything or install any extra tools.\r\n\r\nBecause PHP is free, most web hosts offer PHP support.\r\n\r\nSet Up PHP on Your Own PC\r\nHowever, if your server does not support PHP, you must:\r\n\r\ninstall a web server\r\ninstall PHP\r\ninstall a database, such as MySQL', '2017-12-26 04:17:36.000000', 1),
(3, 'PHP 5 Syntax', 'A PHP script is executed on the server, and the plain HTML result is sent back to the browser.\r\n\r\nBasic PHP Syntax\r\nA PHP script can be placed anywhere in the document.\r\n\r\nA PHP script starts with <?php and ends with ?>:', '2017-12-26 04:18:08.000000', 1),
(4, 'PHP 5 Variables', 'Variables are "containers" for storing information.\r\n\r\nCreating (Declaring) PHP Variables\r\nIn PHP, a variable starts with the $ sign, followed by the name of the variable:', '2017-12-26 04:18:27.000000', 1),
(5, 'PHP 5 echo and print Statements', 'In PHP there are two basic ways to get output: echo and print.\r\n\r\nIn this tutorial we use echo (and print) in almost every example. So, this chapter contains a little more info about those two output statements.\r\n\r\nPHP echo and print Statements\r\necho and print are more or less the same. They are both used to output data to the screen.\r\n\r\nThe differences are small: echo has no return value while print has a return value of 1 so it can be used in expressions. echo can take multiple parameters (although such usage is rare) while print can take one argument. echo is marginally faster than print.\r\n\r\nThe PHP echo Statement\r\nThe echo statement can be used with or without parentheses: echo or echo().', '2017-12-26 04:18:50.000000', 1),
(6, 'PHP 5 Data Types', 'PHP Data Types\r\nVariables can store data of different types, and different data types can do different things.\r\n\r\nPHP supports the following data types:\r\n\r\nString\r\nInteger\r\nFloat (floating point numbers - also called double)\r\nBoolean\r\nArray\r\nObject\r\nNULL\r\nResource\r\nPHP String\r\nA string is a sequence of characters, like "Hello world!".\r\n\r\nA string can be any text inside quotes. You can use single or double quotes:', '2017-12-26 04:19:09.000000', 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2017-12-26 04:17:12.685894', '1', 'PHP 5 Introduction', 1, '[{"added": {}}]', 1, 1),
(2, '2017-12-26 04:17:38.528598', '2', 'PHP 5 Installation', 1, '[{"added": {}}]', 1, 1),
(3, '2017-12-26 04:18:09.677267', '3', 'PHP 5 Syntax', 1, '[{"added": {}}]', 1, 1),
(4, '2017-12-26 04:18:28.296588', '4', 'PHP 5 Variables', 1, '[{"added": {}}]', 1, 1),
(5, '2017-12-26 04:18:51.657159', '5', 'PHP 5 echo and print Statements', 1, '[{"added": {}}]', 1, 1),
(6, '2017-12-26 04:19:11.477945', '6', 'PHP 5 Data Types', 1, '[{"added": {}}]', 1, 1),
(7, '2017-12-26 04:20:00.096400', '1', 'Which is your favourite movie?', 1, '[{"added": {}}, {"added": {"object": "Sholey", "name": "choice"}}, {"added": {"object": "Shool", "name": "choice"}}, {"added": {"object": "Shalimar", "name": "choice"}}]', 3, 1),
(8, '2017-12-26 04:20:28.909322', '2', 'Who is your favourite star ?', 1, '[{"added": {}}, {"added": {"object": "Suny", "name": "choice"}}, {"added": {"object": "Ajay", "name": "choice"}}, {"added": {"object": "Akshay", "name": "choice"}}]', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(5, 'admin', 'logentry'),
(6, 'auth', 'group'),
(7, 'auth', 'permission'),
(8, 'auth', 'user'),
(2, 'blog', 'comment'),
(1, 'blog', 'post'),
(9, 'contenttypes', 'contenttype'),
(4, 'polls', 'choice'),
(3, 'polls', 'question'),
(10, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2017-12-26 04:13:40.082098'),
(2, 'auth', '0001_initial', '2017-12-26 04:13:47.423347'),
(3, 'admin', '0001_initial', '2017-12-26 04:13:48.847840'),
(4, 'admin', '0002_logentry_remove_auto_add', '2017-12-26 04:13:48.950404'),
(5, 'contenttypes', '0002_remove_content_type_name', '2017-12-26 04:13:49.852702'),
(6, 'auth', '0002_alter_permission_name_max_length', '2017-12-26 04:13:50.656679'),
(7, 'auth', '0003_alter_user_email_max_length', '2017-12-26 04:13:51.293213'),
(8, 'auth', '0004_alter_user_username_opts', '2017-12-26 04:13:51.328873'),
(9, 'auth', '0005_alter_user_last_login_null', '2017-12-26 04:13:51.728965'),
(10, 'auth', '0006_require_contenttypes_0002', '2017-12-26 04:13:51.753780'),
(11, 'auth', '0007_alter_validators_add_error_messages', '2017-12-26 04:13:51.792837'),
(12, 'auth', '0008_alter_user_username_max_length', '2017-12-26 04:13:53.153003'),
(13, 'auth', '0009_alter_user_last_name_max_length', '2017-12-26 04:13:53.831238'),
(14, 'sessions', '0001_initial', '2017-12-26 04:13:54.326087'),
(15, 'blog', '0001_initial', '2017-12-26 04:14:43.656650'),
(16, 'polls', '0001_initial', '2017-12-26 04:14:45.173899');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('z7nhja9h2sw72kuyb1btf54p4euboj6a', 'M2Q4ZGIwY2FmZjQ3MGI1MzMwODI0ZGM4NTMxOWQwMmNkNWNlMDY2Mzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNDc4MDhmN2Y0MmNkNGViZTk5NzlhMWMxYWU0ODFhOTZlNzUzY2I5OSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2018-01-09 04:15:59.786565');

-- --------------------------------------------------------

--
-- Table structure for table `polls_choice`
--

CREATE TABLE `polls_choice` (
  `id` int(11) NOT NULL,
  `choice_text` varchar(200) NOT NULL,
  `votes` int(11) NOT NULL,
  `question_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `polls_choice`
--

INSERT INTO `polls_choice` (`id`, `choice_text`, `votes`, `question_id`) VALUES
(1, 'Sholey', 2, 1),
(2, 'Shool', 0, 1),
(3, 'Shalimar', 0, 1),
(4, 'Suny', 0, 2),
(5, 'Ajay', 1, 2),
(6, 'Akshay', 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `polls_question`
--

CREATE TABLE `polls_question` (
  `id` int(11) NOT NULL,
  `question_text` varchar(200) NOT NULL,
  `pub_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `polls_question`
--

INSERT INTO `polls_question` (`id`, `question_text`, `pub_date`) VALUES
(1, 'Which is your favourite movie?', '2017-12-26 04:19:58.000000'),
(2, 'Who is your favourite star ?', '2017-12-26 04:20:17.000000');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `blog_comment`
--
ALTER TABLE `blog_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_comment_post_id_580e96ef_fk_blog_post_id` (`post_id`);

--
-- Indexes for table `blog_post`
--
ALTER TABLE `blog_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_post_user_id_710cc4d2_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `polls_choice`
--
ALTER TABLE `polls_choice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `polls_choice_question_id_c5b4b260_fk_polls_question_id` (`question_id`);

--
-- Indexes for table `polls_question`
--
ALTER TABLE `polls_question`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `blog_comment`
--
ALTER TABLE `blog_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `blog_post`
--
ALTER TABLE `blog_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `polls_choice`
--
ALTER TABLE `polls_choice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `polls_question`
--
ALTER TABLE `polls_question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `blog_comment`
--
ALTER TABLE `blog_comment`
  ADD CONSTRAINT `blog_comment_post_id_580e96ef_fk_blog_post_id` FOREIGN KEY (`post_id`) REFERENCES `blog_post` (`id`);

--
-- Constraints for table `blog_post`
--
ALTER TABLE `blog_post`
  ADD CONSTRAINT `blog_post_user_id_710cc4d2_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `polls_choice`
--
ALTER TABLE `polls_choice`
  ADD CONSTRAINT `polls_choice_question_id_c5b4b260_fk_polls_question_id` FOREIGN KEY (`question_id`) REFERENCES `polls_question` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
