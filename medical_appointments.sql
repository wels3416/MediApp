-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 17 mai 2026 à 01:57
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `medical_appointments`
--

-- --------------------------------------------------------

--
-- Structure de la table `appointments`
--

CREATE TABLE `appointments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` bigint(20) UNSIGNED NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `date` datetime NOT NULL,
  `status` enum('pending','accepted','completed','cancelled') NOT NULL DEFAULT 'pending',
  `notes` text DEFAULT NULL,
  `cancel_reason` varchar(500) DEFAULT NULL,
  `diagnosis` varchar(500) DEFAULT NULL,
  `treatment` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `appointments`
--

INSERT INTO `appointments` (`id`, `patient_id`, `doctor_id`, `date`, `status`, `notes`, `cancel_reason`, `diagnosis`, `treatment`, `created_at`, `updated_at`) VALUES
(1, 2, 1, '2026-05-15 16:58:00', 'accepted', NULL, NULL, NULL, NULL, '2026-05-15 14:58:49', '2026-05-15 15:04:05'),
(2, 4, 3, '2026-05-15 22:23:00', 'cancelled', NULL, NULL, NULL, NULL, '2026-05-15 20:34:11', '2026-05-15 20:34:24'),
(3, 4, 3, '2026-05-15 22:34:00', 'cancelled', NULL, NULL, NULL, NULL, '2026-05-15 20:34:52', '2026-05-15 21:22:21'),
(4, 4, 1, '2026-05-16 13:58:00', 'pending', NULL, NULL, NULL, NULL, '2026-05-15 21:58:51', '2026-05-15 21:58:51'),
(5, 4, 3, '2026-05-16 14:59:00', 'accepted', NULL, NULL, NULL, NULL, '2026-05-15 21:59:41', '2026-05-15 22:09:22');

-- --------------------------------------------------------

--
-- Structure de la table `doctors`
--

CREATE TABLE `doctors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `specialisation` varchar(255) NOT NULL,
  `fees` decimal(8,2) NOT NULL DEFAULT 0.00,
  `bio` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `doctors`
--

INSERT INTO `doctors` (`id`, `user_id`, `specialisation`, `fees`, `bio`, `created_at`, `updated_at`) VALUES
(1, 1, 'General Medicine', 300.00, 'Demo profile used for tests.', '2026-05-15 14:57:06', '2026-05-15 14:57:06'),
(2, 3, 'Médecine générale', 448.50, '', '2026-05-15 20:22:05', '2026-05-15 20:22:05');

-- --------------------------------------------------------

--
-- Structure de la table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sender_id` bigint(20) UNSIGNED NOT NULL,
  `receiver_id` bigint(20) UNSIGNED NOT NULL,
  `content` text NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `messages`
--

INSERT INTO `messages` (`id`, `sender_id`, `receiver_id`, `content`, `is_read`, `read_at`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 'bonjour Mr', 1, '2026-05-15 15:00:50', '2026-05-15 14:59:24', '2026-05-15 15:00:50'),
(2, 1, 2, '😊😊😊', 1, '2026-05-15 15:07:00', '2026-05-15 15:01:14', '2026-05-15 15:07:00'),
(3, 4, 3, '😂', 1, '2026-05-15 21:03:55', '2026-05-15 20:35:11', '2026-05-15 21:03:55'),
(4, 3, 4, 'ca va', 1, '2026-05-15 21:10:17', '2026-05-15 21:04:08', '2026-05-15 21:10:17'),
(5, 4, 3, 'oui', 1, '2026-05-15 21:21:07', '2026-05-15 21:10:25', '2026-05-15 21:21:07'),
(6, 3, 4, '❤️', 1, '2026-05-15 21:57:08', '2026-05-15 21:21:15', '2026-05-15 21:57:08'),
(7, 4, 3, '😊🙏', 1, '2026-05-15 22:08:30', '2026-05-15 22:00:01', '2026-05-15 22:08:30');

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(2, '2026_04_25_000001_create_users_table', 1),
(3, '2026_04_25_000002_create_doctors_table', 1),
(4, '2026_04_25_000003_create_appointments_table', 1),
(5, '2026_04_25_000004_create_messages_table', 1),
(6, '2026_04_27_000001_karl_add_columns', 1),
(7, '2026_04_28_035531_create_notifications_table', 1),
(8, '2026_05_16_000001_add_preferred_locale_to_users_table', 2);

-- --------------------------------------------------------

--
-- Structure de la table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(255) NOT NULL,
  `notifiable_type` varchar(255) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('0034db4a-2306-4c26-91e4-f95d329db694', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 4, '{\"type\":\"message\",\"title\":\"\\ud83d\\udcac Nouveau message de Hurel GAZA\",\"content\":\"\\u2764\\ufe0f\",\"sender_id\":3,\"sender_name\":\"Hurel GAZA\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/messages?contact=3\"}', NULL, '2026-05-15 21:21:15', '2026-05-15 21:21:15'),
('03ba4856-c686-4248-ad5d-81b3af0113fc', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 4, '{\"type\":\"message\",\"title\":\"\\ud83d\\udcac Nouveau message de Hurel GAZA\",\"content\":\"ca va\",\"sender_id\":3,\"sender_name\":\"Hurel GAZA\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/messages?contact=3\"}', NULL, '2026-05-15 21:04:08', '2026-05-15 21:04:08'),
('0b66c905-ec5f-4f52-becd-60125ddf9b46', 'App\\Notifications\\AppointmentStatusChanged', 'App\\Models\\User', 4, '{\"type\":\"appointment_status\",\"appointment_id\":5,\"new_status\":\"accepted\",\"doctor_name\":\"Hurel GAZA\",\"date\":\"2026-05-16T14:59:00+00:00\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/patient\\/rendez-vous\"}', NULL, '2026-05-15 22:09:22', '2026-05-15 22:09:22'),
('2c998262-ee84-4319-a245-e8d759c4da7d', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 3, '{\"type\":\"message\",\"title\":\"\\ud83d\\udcac Nouveau message de Hurel GAZA\",\"content\":\"\\ud83d\\ude02\",\"sender_id\":4,\"sender_name\":\"Hurel GAZA\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/messages?contact=4\"}', '2026-05-15 21:53:37', '2026-05-15 20:35:11', '2026-05-15 21:53:37'),
('837cde2d-6df7-494c-94af-cc6bb5904c3d', 'App\\Notifications\\AppointmentStatusChanged', 'App\\Models\\User', 4, '{\"type\":\"appointment_status\",\"appointment_id\":3,\"new_status\":\"cancelled\",\"doctor_name\":\"Hurel GAZA\",\"date\":\"2026-05-15T22:34:00+00:00\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/patient\\/rendez-vous\"}', NULL, '2026-05-15 21:22:21', '2026-05-15 21:22:21'),
('8be25531-5f3d-4df0-b73a-f25a0611dd08', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 1, '{\"type\":\"message\",\"title\":\"\\ud83d\\udcac Nouveau message de Patient Demo\",\"content\":\"bonjour Mr\",\"sender_id\":2,\"sender_name\":\"Patient Demo\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/messages?contact=2\"}', NULL, '2026-05-15 14:59:24', '2026-05-15 14:59:24'),
('8ce90594-3bf4-45f8-8593-672de63ea146', 'App\\Notifications\\AppointmentStatusChanged', 'App\\Models\\User', 2, '{\"type\":\"appointment_status\",\"appointment_id\":1,\"new_status\":\"accepted\",\"doctor_name\":\"Doctor Demo\",\"date\":\"2026-05-15T16:58:00+00:00\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/patient\\/rendez-vous\"}', NULL, '2026-05-15 15:04:05', '2026-05-15 15:04:05'),
('b7d8f62b-ea83-41fe-a7c4-1c34dc5455be', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 2, '{\"type\":\"message\",\"title\":\"\\ud83d\\udcac Nouveau message de Doctor Demo\",\"content\":\"\\ud83d\\ude0a\\ud83d\\ude0a\\ud83d\\ude0a\",\"sender_id\":1,\"sender_name\":\"Doctor Demo\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/messages?contact=1\"}', NULL, '2026-05-15 15:01:14', '2026-05-15 15:01:14'),
('c33238ea-3c9e-4059-9515-49eb099fadca', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 3, '{\"type\":\"message\",\"title\":\"\\ud83d\\udcac Nouveau message de Hurel GAZA\",\"content\":\"\\ud83d\\ude0a\\ud83d\\ude4f\",\"sender_id\":4,\"sender_name\":\"Hurel GAZA\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/messages?contact=4\"}', '2026-05-15 22:08:38', '2026-05-15 22:00:01', '2026-05-15 22:08:38'),
('e397b4da-438a-4144-9721-f47b2c12655a', 'App\\Notifications\\NewMessageNotification', 'App\\Models\\User', 3, '{\"type\":\"message\",\"title\":\"\\ud83d\\udcac Nouveau message de Hurel GAZA\",\"content\":\"oui\",\"sender_id\":4,\"sender_name\":\"Hurel GAZA\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/messages?contact=4\"}', '2026-05-15 21:53:37', '2026-05-15 21:10:25', '2026-05-15 21:53:37'),
('f1dd1f0c-72ac-4d32-8109-ab5018565ed4', 'App\\Notifications\\AppointmentStatusChanged', 'App\\Models\\User', 4, '{\"type\":\"appointment_status\",\"appointment_id\":3,\"new_status\":\"accepted\",\"doctor_name\":\"Hurel GAZA\",\"date\":\"2026-05-15T22:34:00+00:00\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/patient\\/rendez-vous\"}', NULL, '2026-05-15 21:09:04', '2026-05-15 21:09:04');

-- --------------------------------------------------------

--
-- Structure de la table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('doctor','patient') NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `notifications_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `notification_sound` varchar(20) NOT NULL DEFAULT 'chime',
  `dnd_mode` tinyint(1) NOT NULL DEFAULT 0,
  `preferred_locale` varchar(2) NOT NULL DEFAULT 'fr',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `notifications_enabled`, `notification_sound`, `dnd_mode`, `preferred_locale`, `created_at`, `updated_at`) VALUES
(1, 'Doctor Demo', 'doctor@example.com', NULL, '$2y$12$9AJ6mBcdk6CdO8T39yRareMS6zSNwwznrj6rjw4DVdZr24eVaAdqq', 'doctor', NULL, 1, 'crystal', 0, 'fr', '2026-05-15 14:57:06', '2026-05-15 18:15:53'),
(2, 'Patient Demo', 'patient@example.com', NULL, '$2y$12$cTafMcyu9V49h8Tyh200E.jqANvQxxrMySzwe7gnBI25bJHCLM5Iy', 'patient', NULL, 1, 'chime', 0, 'fr', '2026-05-15 14:57:07', '2026-05-15 14:57:07'),
(3, 'Hurel GAZA', 'hgazaabdoulaye@gmail.com', NULL, '$2y$12$dkkYzpYGlNTrtUnXkEaJt.xFEVr.SWD0g4KaFU9gEKgSQ5cHoMG3a', 'doctor', NULL, 1, 'chime', 0, 'en', '2026-05-15 20:22:05', '2026-05-16 21:32:00'),
(4, 'Hurel GAZA', 'hgazaabdoulayew@gmail.com', NULL, '$2y$12$VnfElh9sQRUcgGpab1LciOK3/VmTW9Yt2mSBJ4ud8D9GdEHcIp7PK', 'patient', NULL, 1, 'chime', 0, 'en', '2026-05-15 20:22:57', '2026-05-16 20:38:38');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appointments_doctor_id_date_index` (`doctor_id`,`date`),
  ADD KEY `appointments_patient_id_date_index` (`patient_id`,`date`);

--
-- Index pour la table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctors_user_id_foreign` (`user_id`);

--
-- Index pour la table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messages_sender_id_receiver_id_index` (`sender_id`,`receiver_id`),
  ADD KEY `messages_receiver_id_is_read_index` (`receiver_id`,`is_read`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Index pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `appointments_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `doctors`
--
ALTER TABLE `doctors`
  ADD CONSTRAINT `doctors_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_receiver_id_foreign` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `messages_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
