-- ================================
-- Base de données : gestion_produits
-- Tables essentielles uniquement
-- ================================

-- Création de la base de données
CREATE DATABASE IF NOT EXISTS `gestion_produits` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `gestion_produits`;

-- ================================
-- TABLES ESSENTIELLES
-- ================================

-- Table des utilisateurs
CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table des rôles
CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table de liaison utilisateurs-rôles
CREATE TABLE `role_user` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`,`user_type`),
  KEY `role_user_role_id_foreign` (`role_id`),
  CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table des tokens d'accès (Laravel Sanctum)
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table des produits
CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_created_by_foreign` (`created_by`),
  CONSTRAINT `products_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table des galeries
CREATE TABLE `galleries` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_size` bigint(20) DEFAULT NULL,
  `image_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `galleries_created_by_foreign` (`created_by`),
  CONSTRAINT `galleries_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ================================
-- INSERTION DES DONNÉES
-- ================================

-- Insertion des rôles
INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrateur', 'Administrateur avec tous les privilèges', NOW(), NOW()),
(2, 'user', 'Utilisateur', 'Utilisateur standard avec privilèges limités', NOW(), NOW());

-- Insertion des utilisateurs
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Administrateur', 'admin@example.com', NOW(), '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NOW(), NOW()),
(2, 'Utilisateur Test', 'user@example.com', NOW(), '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NOW(), NOW()),
(3, 'Ahmed Benali', 'ahmed.benali@ensaj.ma', NOW(), '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NOW(), NOW());

-- Attribution des rôles aux utilisateurs
INSERT INTO `role_user` (`role_id`, `user_id`, `user_type`) VALUES
(1, 1, 'App\\Models\\User'), -- Admin
(2, 2, 'App\\Models\\User'), -- User
(1, 3, 'App\\Models\\User'); -- Admin

-- Insertion des produits

INSERT INTO `products` (`id`, `name`, `description`, `price`, `created_at`, `updated_at`) VALUES
(1, 'Ordinateur Portable HP', 'Ordinateur portable HP Pavilion 15.6" avec processeur Intel Core i5, 8GB RAM, 256GB SSD', 12500.00, NOW(), NOW()),
(2, 'Smartphone Samsung Galaxy', 'Samsung Galaxy A54 5G, 128GB, Écran 6.4", Caméra 50MP', 3200.00, NOW(), NOW()),
(3, 'Casque Audio Sony', 'Casque sans fil Sony WH-1000XM4, Réduction de bruit active', 2800.00, NOW(), NOW()),
(4, 'Tablette iPad Air', 'Apple iPad Air 10.9", 64GB, Wi-Fi, Puce M1', 6500.00, NOW(), NOW()),
(5, 'Montre Connectée Apple', 'Apple Watch Series 8, GPS, 45mm, Bracelet Sport', 4200.00, NOW(), NOW()),
(6, 'Clavier Mécanique Logitech', 'Logitech MX Mechanical, Rétroéclairé, Sans fil', 1200.00, NOW(), NOW());

-- Insertion des galeries

INSERT INTO `galleries` (`id`, `name_gallery`, `description_gallery`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Espace de Travail Moderne', 'Un bureau moderne avec setup informatique complet', 'galleries/workspace-modern.jpg', NOW(), NOW()),
(2, 'Collection Smartphones', 'Présentation de notre gamme de smartphones', 'galleries/smartphones-collection.jpg', NOW(), NOW()),
(3, 'Setup Gaming', 'Configuration gaming complète avec éclairage RGB', 'galleries/gaming-setup.jpg', NOW(), NOW()),
(4, 'Accessoires Apple', 'Gamme complète d\'accessoires Apple', 'galleries/apple-accessories.jpg', NOW(), NOW());

-- ================================
-- MISE À JOUR DES COMPTEURS
-- ================================

ALTER TABLE `users` AUTO_INCREMENT = 4;
ALTER TABLE `roles` AUTO_INCREMENT = 3;
ALTER TABLE `products` AUTO_INCREMENT = 7;
ALTER TABLE `galleries` AUTO_INCREMENT = 5;

-- ================================
-- INFORMATIONS DE CONNEXION
-- ================================

-- Comptes de test (mot de passe : "password") :
-- admin@example.com - Administrateur
-- user@example.com - Utilisateur
-- ahmed.benali@ensaj.ma - Administrateur ENSAJ

-- ================================
-- FIN DU SCRIPT
-- ================================
