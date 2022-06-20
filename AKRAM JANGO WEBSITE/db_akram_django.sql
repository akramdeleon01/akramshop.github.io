-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : sam. 18 juin 2022 à 00:56
-- Version du serveur :  10.4.11-MariaDB
-- Version de PHP : 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `db_akram_django`
--

-- --------------------------------------------------------

--
-- Structure de la table `akramshop_app_category`
--

CREATE TABLE `akramshop_app_category` (
  `id` bigint(20) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `akramshop_app_category`
--

INSERT INTO `akramshop_app_category` (`id`, `name`) VALUES
(2, 'vestes'),
(3, 'chemise'),
(4, 'chaussures'),
(5, 'accessoires'),
(6, 't-shirt');

-- --------------------------------------------------------

--
-- Structure de la table `akramshop_app_color`
--

CREATE TABLE `akramshop_app_color` (
  `id` bigint(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `color_code` varchar(20) NOT NULL,
  `id_product_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `akramshop_app_color`
--

INSERT INTO `akramshop_app_color` (`id`, `name`, `color_code`, `id_product_id`) VALUES
(2, 'red', '#F5DEB3', 3),
(4, 'black', '#000000', 3),
(5, 'black', '#000000', 6),
(6, 'Hunter Lab', '#BCD4E6', 2),
(22, 'black', '#000000', 2),
(35, 'black', '#000000', 8),
(54, 'black', '#000000', 22),
(56, 'black', '#000000', 33),
(66, 'nilok', '#074723', 33),
(70, 'nilok', '#074723', 8),
(74, 'nilok', '#074723', 22),
(77, 'nilok', '#074723', 6);

-- --------------------------------------------------------

--
-- Structure de la table `akramshop_app_detail_order`
--

CREATE TABLE `akramshop_app_detail_order` (
  `id` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `color_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `size_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `akramshop_app_images`
--

CREATE TABLE `akramshop_app_images` (
  `id` bigint(20) NOT NULL,
  `image` varchar(100) NOT NULL,
  `id_product_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `akramshop_app_images`
--

INSERT INTO `akramshop_app_images` (`id`, `image`, `id_product_id`) VALUES
(2, 'Vestedecostumeslim.png', 2),
(3, 'Veste3.png', 3),
(4, 'teeshirt1.png', 6),
(5, 'teeshirt2.png', 8),
(22, 'Chemise1.png', 22),
(44, 'Chemise2.png', 33);

-- --------------------------------------------------------

--
-- Structure de la table `akramshop_app_order`
--

CREATE TABLE `akramshop_app_order` (
  `id` bigint(20) NOT NULL,
  `clinet_name` varchar(70) NOT NULL,
  `phone` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `name_card` varchar(100) NOT NULL,
  `number_card` int(11) NOT NULL,
  `cvc_card` int(11) NOT NULL,
  `product_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `akramshop_app_order`
--

INSERT INTO `akramshop_app_order` (`id`, `clinet_name`, `phone`, `email`, `address`, `name_card`, `number_card`, `cvc_card`, `product_id`) VALUES
(1, 'rachid', 625021314, 'rachid.bouctta1997@gmail.com', 'casablanca', 'boucetta', 2147483647, 333, 2),
(2, 'rachid', 625021314, 'rachid.bouctta1997@gmail.com', 'casablanca', 'boucetta', 2147483647, 333, 2);

-- --------------------------------------------------------

--
-- Structure de la table `akramshop_app_product`
--

CREATE TABLE `akramshop_app_product` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` double NOT NULL,
  `description` longtext NOT NULL,
  `id_category_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `akramshop_app_product`
--

INSERT INTO `akramshop_app_product` (`id`, `name`, `price`, `description`, `id_category_id`) VALUES
(2, 'Veste de costume slim - Bleu moyen', 200, 'Casual ou raffinée, la veste s\'adapte à tous les styles. Avec une chemise, vous êtes chic sans trop en faire. Cette veste de costume possède 2 poches à rabat avant, 1 poche poitrine, 2 boutons de fermeture et 4 boutons au niveau des manches. Elle est dotée d\'une fente d\'aisance au dos et d\'une coupe slim.', 2),
(3, 'Veste de costume extra slim en matière bistretch - Gris Foncé', 250, 'Cette veste de costume, avec fermeture deux boutons, poches passepoilées à rabat, petite poche plaquée avant, boutonnière col et poches intérieures, possède 1 fente dos et 3 boutons bas de manche. Sa coupe extra slim vous donnera une allure élégante et soignée.', 2),
(6, 'tee shirt enfant fête des pères - Vert', 0, 'Ce tee shirt enfant à manches courtes spécial fête des pères est imprimé sur la poitrine. Il possède un col rond et une coupe slim, pour un porté près du corps. Il s\'associe très bien avec un chino ou un jean.', 6),
(8, 'tee shirt imprime summer of love - Pêche', 250, 'Ce tee-shirt à manches courtes, imprimé Summer of Love sur la poitrine, possède un col rond et une coupe slim, pour un porté près du corps. Il s\'associe très bien avec un bermuda ou un short pour cet été.', 6),
(22, 'Chemise hawaienne regular à fleur viscose ecovero - Vert', 250, 'Cette chemise hawaienne en viscose à manches courtes est imprimée fleurs all over. Elle possède un col thermocollant sur le dessus; col renforcé par une bande thermocollante permettant de garantir un maintien optimal de celui-ci; et une coupe regular, pour un porté casual et cool. Elle s\'associe bien avec un short pour cet été.', 3),
(33, 'Chemise hawaienne regular fleur viscose ecovero - Rose', 250, 'Cette chemise hawaienne à manches courtes en viscose possède une fermeture boutonnée, un imprimé fleurs all over et une coupe regular, pour un porté cool. Elle s\'associe parfaitement avec un bermuda ou un pantalon chino.', 3);

-- --------------------------------------------------------

--
-- Structure de la table `akramshop_app_size`
--

CREATE TABLE `akramshop_app_size` (
  `id` bigint(20) NOT NULL,
  `name` varchar(10) NOT NULL,
  `id_product_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `akramshop_app_size`
--

INSERT INTO `akramshop_app_size` (`id`, `name`, `id_product_id`) VALUES
(1, 'S', 2),
(2, 'X', 2),
(3, 'XL', 2),
(11, 'S', 3),
(12, 'S', 6),
(13, 'S', 8),
(14, 'S', 22),
(15, 'S', 33),
(21, 'X', 3),
(22, 'X', 6),
(23, 'X', 8),
(24, 'X', 22),
(25, 'X', 33),
(31, 'XL', 3),
(32, 'XL', 6),
(33, 'XL', 8),
(34, 'XL', 22),
(35, 'XL', 33);

-- --------------------------------------------------------

--
-- Structure de la table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add my product', 7, 'add_myproduct'),
(26, 'Can change my product', 7, 'change_myproduct'),
(27, 'Can delete my product', 7, 'delete_myproduct'),
(28, 'Can view my product', 7, 'view_myproduct'),
(29, 'Can add detail_order', 8, 'add_detail_order'),
(30, 'Can change detail_order', 8, 'change_detail_order'),
(31, 'Can delete detail_order', 8, 'delete_detail_order'),
(32, 'Can view detail_order', 8, 'view_detail_order'),
(33, 'Can add product', 9, 'add_product'),
(34, 'Can change product', 9, 'change_product'),
(35, 'Can delete product', 9, 'delete_product'),
(36, 'Can view product', 9, 'view_product'),
(37, 'Can add size', 10, 'add_size'),
(38, 'Can change size', 10, 'change_size'),
(39, 'Can delete size', 10, 'delete_size'),
(40, 'Can view size', 10, 'view_size'),
(41, 'Can add images', 11, 'add_images'),
(42, 'Can change images', 11, 'change_images'),
(43, 'Can delete images', 11, 'delete_images'),
(44, 'Can view images', 11, 'view_images'),
(45, 'Can add category', 12, 'add_category'),
(46, 'Can change category', 12, 'change_category'),
(47, 'Can delete category', 12, 'delete_category'),
(48, 'Can view category', 12, 'view_category'),
(49, 'Can add color', 13, 'add_color'),
(50, 'Can change color', 13, 'change_color'),
(51, 'Can delete color', 13, 'delete_color'),
(52, 'Can view color', 13, 'view_color'),
(53, 'Can add order', 14, 'add_order'),
(54, 'Can change order', 14, 'change_order'),
(55, 'Can delete order', 14, 'delete_order'),
(56, 'Can view order', 14, 'view_order'),
(57, 'Can add cart', 15, 'add_cart'),
(58, 'Can change cart', 15, 'change_cart'),
(59, 'Can delete cart', 15, 'delete_cart'),
(60, 'Can view cart', 15, 'view_cart');

-- --------------------------------------------------------

--
-- Structure de la table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(15, 'akramshop_app', 'cart'),
(12, 'akramshop_app', 'category'),
(13, 'akramshop_app', 'color'),
(8, 'akramshop_app', 'detail_order'),
(11, 'akramshop_app', 'images'),
(14, 'akramshop_app', 'order'),
(9, 'akramshop_app', 'product'),
(10, 'akramshop_app', 'size'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'my_model', 'myproduct'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Structure de la table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-06-12 12:02:40.788779'),
(2, 'auth', '0001_initial', '2022-06-12 12:02:41.106319'),
(3, 'admin', '0001_initial', '2022-06-12 12:02:41.656586'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-06-12 12:02:41.789689'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-06-12 12:02:41.803085'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-06-12 12:02:41.876422'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-06-12 12:02:41.968142'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-06-12 12:02:41.995295'),
(9, 'auth', '0004_alter_user_username_opts', '2022-06-12 12:02:42.007513'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-06-12 12:02:42.074252'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-06-12 12:02:42.081738'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-06-12 12:02:42.096530'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-06-12 12:02:42.118617'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-06-12 12:02:42.141276'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-06-12 12:02:42.162786'),
(16, 'auth', '0011_update_proxy_permissions', '2022-06-12 12:02:42.181820'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-06-12 12:02:42.211356'),
(18, 'my_model', '0001_initial', '2022-06-12 12:02:42.267048'),
(19, 'sessions', '0001_initial', '2022-06-12 12:02:42.313099'),
(20, 'akramshop_app', '0001_initial', '2022-06-13 22:32:34.060135');

-- --------------------------------------------------------

--
-- Structure de la table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('crkrx5bsg62zzjkcym1nsnjaspev8t1u', 'eyJJRF9wcm9kdWN0IjpbMzMsOF19:1o2Ei4:OtWWr0Z-kCFkrsTB_jgZ6vjLoW1llX7z99sOY3OvBb0', '2022-07-01 16:20:36.434485');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `akramshop_app_category`
--
ALTER TABLE `akramshop_app_category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `akramshop_app_color`
--
ALTER TABLE `akramshop_app_color`
  ADD PRIMARY KEY (`id`),
  ADD KEY `akramshop_app_color_id_product_id_00c2a1fe_fk_akramshop` (`id_product_id`);

--
-- Index pour la table `akramshop_app_detail_order`
--
ALTER TABLE `akramshop_app_detail_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `akramshop_app_detail_color_id_fc6cf7fc_fk_akramshop` (`color_id`),
  ADD KEY `akramshop_app_detail_product_id_a758215e_fk_akramshop` (`product_id`),
  ADD KEY `akramshop_app_detail_size_id_ea962303_fk_akramshop` (`size_id`);

--
-- Index pour la table `akramshop_app_images`
--
ALTER TABLE `akramshop_app_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `akramshop_app_images_id_product_id_70682884_fk_akramshop` (`id_product_id`);

--
-- Index pour la table `akramshop_app_order`
--
ALTER TABLE `akramshop_app_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `akramshop_app_order_product_id_86366c54_fk_akramshop` (`product_id`);

--
-- Index pour la table `akramshop_app_product`
--
ALTER TABLE `akramshop_app_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `akramshop_app_produc_id_category_id_c316cd5d_fk_akramshop` (`id_category_id`);

--
-- Index pour la table `akramshop_app_size`
--
ALTER TABLE `akramshop_app_size`
  ADD PRIMARY KEY (`id`),
  ADD KEY `akramshop_app_size_id_product_id_e6d5811d_fk_akramshop` (`id_product_id`);

--
-- Index pour la table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Index pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Index pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Index pour la table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Index pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Index pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Index pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Index pour la table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Index pour la table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `akramshop_app_category`
--
ALTER TABLE `akramshop_app_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `akramshop_app_color`
--
ALTER TABLE `akramshop_app_color`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT pour la table `akramshop_app_detail_order`
--
ALTER TABLE `akramshop_app_detail_order`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `akramshop_app_images`
--
ALTER TABLE `akramshop_app_images`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT pour la table `akramshop_app_order`
--
ALTER TABLE `akramshop_app_order`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `akramshop_app_product`
--
ALTER TABLE `akramshop_app_product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT pour la table `akramshop_app_size`
--
ALTER TABLE `akramshop_app_size`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT pour la table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT pour la table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `akramshop_app_color`
--
ALTER TABLE `akramshop_app_color`
  ADD CONSTRAINT `akramshop_app_color_id_product_id_00c2a1fe_fk_akramshop` FOREIGN KEY (`id_product_id`) REFERENCES `akramshop_app_product` (`id`);

--
-- Contraintes pour la table `akramshop_app_detail_order`
--
ALTER TABLE `akramshop_app_detail_order`
  ADD CONSTRAINT `akramshop_app_detail_color_id_fc6cf7fc_fk_akramshop` FOREIGN KEY (`color_id`) REFERENCES `akramshop_app_color` (`id`),
  ADD CONSTRAINT `akramshop_app_detail_product_id_a758215e_fk_akramshop` FOREIGN KEY (`product_id`) REFERENCES `akramshop_app_product` (`id`),
  ADD CONSTRAINT `akramshop_app_detail_size_id_ea962303_fk_akramshop` FOREIGN KEY (`size_id`) REFERENCES `akramshop_app_size` (`id`);

--
-- Contraintes pour la table `akramshop_app_images`
--
ALTER TABLE `akramshop_app_images`
  ADD CONSTRAINT `akramshop_app_images_id_product_id_70682884_fk_akramshop` FOREIGN KEY (`id_product_id`) REFERENCES `akramshop_app_product` (`id`);

--
-- Contraintes pour la table `akramshop_app_order`
--
ALTER TABLE `akramshop_app_order`
  ADD CONSTRAINT `akramshop_app_order_product_id_86366c54_fk_akramshop` FOREIGN KEY (`product_id`) REFERENCES `akramshop_app_product` (`id`);

--
-- Contraintes pour la table `akramshop_app_product`
--
ALTER TABLE `akramshop_app_product`
  ADD CONSTRAINT `akramshop_app_produc_id_category_id_c316cd5d_fk_akramshop` FOREIGN KEY (`id_category_id`) REFERENCES `akramshop_app_category` (`id`);

--
-- Contraintes pour la table `akramshop_app_size`
--
ALTER TABLE `akramshop_app_size`
  ADD CONSTRAINT `akramshop_app_size_id_product_id_e6d5811d_fk_akramshop` FOREIGN KEY (`id_product_id`) REFERENCES `akramshop_app_product` (`id`);

--
-- Contraintes pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Contraintes pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Contraintes pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
