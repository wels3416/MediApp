# Systeme de Gestion de Rendez-vous Medicaux

Projet Laravel 10+ pour la gestion des rendez-vous entre patients et medecins.

## Etat reel du projet

Fonctionnel aujourd'hui:
- Authentification web (inscription, connexion, deconnexion) avec roles `doctor` et `patient`
- Espace patient: recherche medecins, prise de RDV, annulation, historique
- Espace medecin: dashboard, gestion des statuts RDV, notes, patients, stats
- Messagerie asynchrone patient/medecin (polling HTTP)
- Notifications Laravel (database + mail selon cas)
- Changement de langue FR/EN via session + preference utilisateur

Limites connues:
- L'upload photo de profil n'est pas implemente
- Les tests automatises metier sont absents (seulement tests exemple)
- Le fichier de migration `2026_04_25_000002_create_doctors_table.php` est incoherent avec son nom

## Stack technique

- PHP: `^8.2`
- Laravel: `^10.10`
- Base de donnees: MySQL
- Frontend: Blade + CSS/JS publics
- Build frontend: Vite
- API interne: Sanctum

## Installation locale

1. Copier `.env.example` vers `.env`
2. Configurer les variables DB dans `.env`
3. Installer dependances PHP

```bash
php composer.phar install
```

4. Installer dependances JS

```bash
npm install
```

5. Generer la cle application

```bash
php artisan key:generate
```

6. Migrer et seed

```bash
php artisan migrate --seed
```

7. Lancer le serveur local

```bash
php artisan serve
```

## Commandes utiles

- Lister les routes:
```bash
php artisan route:list --json
```

- Verifier les migrations:
```bash
php artisan migrate:status
```

- Linter le code PHP:
```bash
php -l app/Http/Controllers/AuthController.php
```

- Build frontend:
```bash
npm run build
```

## Structure principale

- `app/Http/Controllers` logique metier
- `app/Models` modeles Eloquent
- `app/Http/Middleware` securite et locale
- `app/Notifications` notifications applicatives
- `resources/views` vues Blade
- `routes/web.php` routes web
- `routes/api.php` routes API internes
- `database/migrations` schema DB

## Documentation de passation

- [PASSATION_HUREL_FINAL.md](docs/PASSATION_HUREL_FINAL.md)
- [PASSATION_KARL_FINAL.md](docs/PASSATION_KARL_FINAL.md)
- [PASSATION_HERVE_FINAL.md](docs/PASSATION_HERVE_FINAL.md)

## Production (minimum)

- `APP_ENV=production`
- `APP_DEBUG=false`
- `APP_URL` correct
- credentials DB corrects
- permissions ecriture sur `storage/` et `bootstrap/cache/`
- caches Laravel:

```bash
php artisan config:cache
php artisan route:cache
php artisan view:cache
```
