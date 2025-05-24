# Système de Gestion de Produits et Galeries

[![React](https://img.shields.io/badge/React-18.x-61DAFB?logo=react)](https://reactjs.org/)
[![Laravel](https://img.shields.io/badge/Laravel-10.x-FF2D20?logo=laravel)](https://laravel.com/)
[![Vite](https://img.shields.io/badge/Vite-Latest-646CFF?logo=vite)](https://vitejs.dev/)
[![Tailwind CSS](https://img.shields.io/badge/Tailwind-3.x-38B2AC?logo=tailwind-css)](https://tailwindcss.com/)

Une application web moderne développée avec React.js (frontend avec Vite) et Laravel (backend) pour la gestion complète de produits et de galeries d'images avec un système d'authentification avancé.

## Description

Cette application offre une solution complète de gestion de produits avec une interface utilisateur intuitive et des fonctionnalités avancées. Elle permet aux utilisateurs de gérer efficacement des catalogues de produits, des galeries d'images, et dispose d'un système de rôles pour différents niveaux d'accès.

## Fonctionnalités principales

### Authentification et Sécurité

- Système de connexion et d'inscription sécurisé
- Gestion des sessions avec chiffrement
- Système de rôles (Administrateur / Utilisateur)
- Protection des routes selon les permissions
- Pages d'erreur personnalisées (403, 404)

### Gestion des Utilisateurs

- Profils utilisateurs personnalisables
- Modification des informations personnelles
- Changement de mot de passe sécurisé
- Gestion des autorisations par rôle

### Gestion des Produits

- Création, lecture, mise à jour et suppression (CRUD) complète
- Recherche avancée avec filtres
- Pagination intelligente des résultats
- Insertion multiple de produits
- Validation des données en temps réel

### Gestion des Galeries

- Upload et gestion d'images
- Organisation en galeries thématiques
- Prévisualisation des images
- Gestion des métadonnées d'images

### Interface Utilisateur

- Design responsive adaptatif
- Navigation intuitive avec sidebar
- Notifications utilisateur élégantes
- Composants réutilisables et modulaires

## Technologies utilisées

### Frontend

- **React.js** - Framework JavaScript moderne
- **Vite** - Outil de build ultra-rapide
- **React Router DOM** - Routage côté client
- **Axios** - Client HTTP pour les requêtes API
- **SweetAlert2** - Notifications et alertes élégantes
- **CryptoJS** - Chiffrement des données sensibles
- **Lodash** - Utilitaires JavaScript (debounce, etc.)
- **Tailwind CSS** - Framework CSS utilitaire

### Backend

- **Laravel** - Framework PHP robuste
- **MySQL** - Système de gestion de base de données
- **Laravel Sanctum** - Authentification API
- **Laratrust** - Gestion des rôles et permissions

## Prérequis

Avant de commencer, assurez-vous d'avoir installé :

- **Node.js** (version 14.0.0 ou supérieure)
- **npm** ou **yarn**
- **PHP** (version 8.0 ou supérieure)
- **Composer** (gestionnaire de dépendances PHP)
- **MySQL** (version 5.7 ou supérieure)
- **Git** (pour le clonage du repository)

## Installation

### 1. Clonage du projet

```bash
git clone https://github.com/votre-nom/gestion-produits-react-laravel.git
cd gestion-produits-react-laravel
```

### 2. Configuration du Backend (Laravel)

```bash
# Naviguer vers le dossier backend
cd backend

# Installer les dépendances PHP
composer install

# Copier le fichier d'environnement
cp .env.example .env

# Générer la clé d'application
php artisan key:generate
```

### 3. Configuration de la base de données

Éditez le fichier `.env` et configurez votre base de données :

```
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=gestion_produits
DB_USERNAME=votre_utilisateur
DB_PASSWORD=votre_mot_de_passe
```

### 4. Migration et données de test

```bash
# Créer les tables de la base de données
php artisan migrate

# Insérer les données de test (optionnel)
php artisan db:seed

# Créer le lien symbolique pour le stockage
php artisan storage:link
```

### 5. Démarrage du serveur Laravel

```bash
# Démarrer le serveur de développement
php artisan serve
```

Le backend sera accessible à l'adresse : `http://127.0.0.1:8000`

### 6. Configuration du Frontend (React avec Vite)

```bash
# Naviguer vers le dossier frontend
cd ../frontend

# Installer les dépendances Node.js
npm install
# ou avec yarn
yarn install
```

### 7. Configuration de l'API

Créez ou modifiez le fichier `src/config/appConfig.js` :

```javascript
const appConfig = {
    baseurlAPI: "http://127.0.0.1:8000/api",
    baseURL: "http://127.0.0.1:8000",
    expirationTime: 3600000, // 1 heure en millisecondes
    debounceTimeout: 500,
};

export default appConfig;
```

### 8. Variables d'environnement pour Vite

Créez un fichier `.env.local` à la racine du dossier frontend :

```
VITE_ENCRYPTION_KEY=votre-cle-de-chiffrement-securisee
VITE_API_URL=http://127.0.0.1:8000/api
```

### 9. Démarrage de l'application React avec Vite

```bash
# Démarrer le serveur de développement
npm run dev
# ou avec yarn
yarn dev
```

L'application sera accessible à l'adresse : `http://localhost:5173`

## Configuration avancée

### Variables d'environnement Backend

Dans le fichier `.env` du backend, vous pouvez configurer :

```
APP_NAME="Gestion Produits"
APP_URL=http://localhost:8000
APP_DEBUG=true

# Configuration CORS pour le frontend
SANCTUM_STATEFUL_DOMAINS=localhost:5173

# Configuration de session
SESSION_LIFETIME=120
```

### Configuration Frontend avec Vite

Dans `appConfig.js`, ajustez selon vos besoins :

```javascript
const appConfig = {
    baseurlAPI: import.meta.env.VITE_API_URL || "http://127.0.0.1:8000/api",
    baseURL: "http://127.0.0.1:8000",
    expirationTime: 3600000, // Durée de session
    debounceTimeout: 500,     // Délai pour la recherche
    itemsPerPage: 10,         // Éléments par page
};
```

Pour utiliser les variables d'environnement dans Vite, utilisez `import.meta.env.VITE_*` :

```javascript
// Exemple d'utilisation dans Session.js
const keyStr = import.meta.env.VITE_ENCRYPTION_KEY || "cle-par-defaut";
```

## Utilisation

### Comptes de démonstration

L'application est livrée avec des comptes de test :

| Email | Mot de passe | Rôle | Permissions |
|-------|-------------|------|------------|
| `admin@example.com` | `password` | Administrateur | Accès complet |
| `user@example.com` | `password` | Utilisateur | Accès limité |

### Navigation principale

- **Dashboard** - Vue d'ensemble et statistiques
- **Module Principal**
  - **General Feature** - Fonctionnalités générales
  - **Products** - Gestion des produits (admin uniquement)
  - **Gallery** - Gestion des galeries (admin uniquement)
  - **Multiple Insert** - Insertion en lot (admin uniquement)
- **Profile** - Gestion du profil utilisateur

### Fonctionnalités par rôle

**Utilisateur Standard :**

- Consultation du dashboard
- Accès aux fonctionnalités générales
- Gestion de son profil personnel
- Consultation des produits (lecture seule)

**Administrateur :**

- Toutes les fonctionnalités utilisateur
- Gestion complète des produits (CRUD)
- Gestion des galeries d'images
- Insertion multiple de données
- Accès aux statistiques avancées
- Gestion des utilisateurs

## Structure du projet

```
projet/
├── backend/                          # API Laravel
│   ├── app/
│   │   ├── Http/Controllers/         # Contrôleurs API
│   │   ├── Models/                   # Modèles Eloquent
│   │   └── Middleware/               # Middlewares personnalisés
│   ├── database/
│   │   ├── migrations/               # Migrations de base de données
│   │   └── seeders/                  # Données de test
│   ├── routes/
│   │   └── api.php                   # Routes API
│   └── config/                       # Configuration Laravel
│
├── frontend/                         # Application React avec Vite
│   ├── public/                       # Fichiers statiques
│   ├── src/
│   │   ├── components/               # Composants réutilisables
│   │   │   ├── Case.jsx              # Conteneur principal
│   │   │   ├── Footer.jsx            # Pied de page
│   │   │   ├── Navbar.jsx            # Barre de navigation
│   │   │   ├── Router.jsx            # Configuration des routes
│   │   │   └── Sidebar.jsx           # Menu latéral
│   │   ├── pages/                    # Pages de l'application
│   │   │   ├── Auth/                 # Authentification
│   │   │   │   ├── Login.jsx         # Page de connexion
│   │   │   │   ├── Register.jsx      # Page d'inscription
│   │   │   │   └── Session.js        # Gestion des sessions
│   │   │   ├── Products/             # Gestion des produits
│   │   │   │   ├── Product.jsx       # CRUD produits
│   │   │   │   └── MultipleInsert.jsx # Insertion multiple
│   │   │   ├── Gallery/              # Gestion des galeries
│   │   │   │   └── Gallery.jsx       # CRUD galeries
│   │   │   ├── Profile/              # Profil utilisateur
│   │   │   │   └── Profile.jsx       # Gestion du profil
│   │   │   ├── Error/                # Pages d'erreur
│   │   │   │   ├── 403.jsx           # Accès interdit
│   │   │   │   └── 404.jsx           # Page non trouvée
│   │   │   └── Layout/Components/    # Composants de mise en page
│   │   ├── config/
│   │   │   └── appConfig.js          # Configuration de l'app
│   │   ├── App.jsx                   # Composant racine
│   │   ├── main.jsx                  # Point d'entrée
│   │   └── index.css                 # Styles globaux
│   ├── .env.local                    # Variables d'environnement locales
│   ├── vite.config.js                # Configuration Vite
│   └── package.json                  # Dépendances npm
│
├── database/
│   └── gestion_produits.sql          # Export de la base de données
└── README.md                         # Ce fichier
```

## API Endpoints

### Authentification

```
POST   /api/login              # Connexion utilisateur
POST   /api/register           # Inscription utilisateur
POST   /api/logout             # Déconnexion
GET    /api/user               # Informations utilisateur connecté
```

### Gestion du profil

```
GET    /api/profile            # Récupérer le profil
PUT    /api/profile            # Mettre à jour le profil
PUT    /api/update-password    # Changer le mot de passe
```

### Gestion des produits

```
GET    /api/products           # Liste des produits (avec pagination/recherche)
POST   /api/products           # Créer un produit
GET    /api/products/{id}      # Détails d'un produit
PUT    /api/products/{id}      # Mettre à jour un produit
DELETE /api/products/{id}      # Supprimer un produit
POST   /api/products/multiple-store # Création multiple
```

### Gestion des galeries

```
GET    /api/gallery            # Liste des galeries
POST   /api/gallery            # Créer une galerie
GET    /api/gallery/{id}       # Détails d'une galerie
PUT    /api/gallery/{id}       # Mettre à jour une galerie
DELETE /api/gallery/{id}       # Supprimer une galerie
```

## Dépannage

### Problèmes courants

**Erreur de connexion à la base de données :**

```bash
# Vérifiez la configuration dans .env
# Assurez-vous que MySQL est démarré
# Vérifiez les permissions utilisateur
```

**Erreur CORS :**

```bash
# Vérifiez la configuration SANCTUM_STATEFUL_DOMAINS dans .env
# Assurez-vous d'inclure localhost:5173 (port Vite)
# Redémarrez le serveur Laravel après modification
```

**Erreur de dépendances npm :**

```bash
# Supprimez node_modules et package-lock.json
rm -rf node_modules package-lock.json
npm install
```

**Erreur de permissions Laravel :**

```bash
# Donnez les bonnes permissions aux dossiers
chmod -R 775 storage bootstrap/cache
```

### Commandes utiles

```bash
# Nettoyer le cache Laravel
php artisan cache:clear
php artisan config:clear
php artisan route:clear

# Recréer la base de données
php artisan migrate:fresh --seed

# Vérifier les routes API
php artisan route:list --path=api

# Redémarrer les serveurs de développement
php artisan serve
npm run dev
```

## Fonctionnalités avancées

### Recherche et filtrage

- Recherche en temps réel avec debounce
- Filtres multiples par catégorie
- Tri par colonnes
- Pagination dynamique

### Upload de fichiers

- Support des formats d'image courants
- Validation côté client et serveur
- Redimensionnement automatique
- Stockage sécurisé

### Sécurité

- Chiffrement des données sensibles
- Validation des formulaires
- Protection CSRF
- Sanitisation des entrées utilisateur

## Déploiement

### Préparation pour la production

1. **Configuration de l'environnement :**

```
APP_ENV=production
APP_DEBUG=false
```

2. **Optimisation Laravel :**

```bash
php artisan config:cache
php artisan route:cache
php artisan view:cache
```

3. **Build de production avec Vite :**

```bash
# Dans le dossier frontend
npm run build
# ou
yarn build
```

Les fichiers de build seront générés dans le dossier `dist/`.

## Contribution

Pour contribuer au projet :

1. Forkez le repository
2. Créez une branche pour votre fonctionnalité
3. Committez vos changements
4. Poussez vers la branche
5. Ouvrez une Pull Request

## Support

Pour toute question ou problème :

1. Consultez cette documentation
2. Vérifiez les issues existantes sur GitHub
3. Créez une nouvelle issue si nécessaire
4. Contactez l'équipe de développement

## Changelog

### Version 1.0.0 (Actuelle)

- Système d'authentification complet avec rôles
- CRUD complet pour les produits
- Gestion des galeries d'images
- Interface utilisateur responsive
- Recherche et pagination avancées
- Insertion multiple de produits
- Gestion de profil utilisateur
- Pages d'erreur personnalisées

---

**Développé pour la gestion moderne de produits**
