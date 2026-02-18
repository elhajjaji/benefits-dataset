# benefits-dataset

Stack Docker pour charger un jeu de données dans PostgreSQL et l’explorer via pgAdmin.

## Contenu

- PostgreSQL (image personnalisée avec import CSV automatique)
- pgAdmin (interface web d’administration)
- 4 jeux de données CSV importés dans le schéma `src` de la base `pocs`

## Structure

- `data/` : fichiers CSV source
- `docker/postgres/Dockerfile` : image Postgres custom
- `docker/postgres/init/01-init.sql` : création schéma/tables + import
- `docker-compose.yml` : orchestration des services

## Prérequis

- Docker Desktop (ou Docker Engine + Compose)

## Démarrage rapide

```bash
docker compose up -d --build
```

## Accès

### PostgreSQL (depuis la machine hôte)

- Host: `localhost`
- Port: `5433`
- Database: `pocs`
- Schema: `src`
- User: `user`
- Password: `password`

### pgAdmin

- URL: `http://localhost:5050`
- Email: `admin@admin.com`
- Password: `admin`

## Connexion serveur dans pgAdmin

Créer un serveur avec:

- Name: `benefits-dataset-db`
- Hostname/address: `postgres`
- Port: `5432`
- Maintenance database: `pocs`
- Username: `user`
- Password: `password`

## Tables chargées

- `src.individu`
- `src.dossier`
- `src.permis`
- `src.prestation`

## Schéma MCD

```mermaid
erDiagram
	INDIVIDU ||--o{ DOSSIER : possede
	INDIVIDU ||--o{ PERMIS : detient
	INDIVIDU ||--o{ PRESTATION : beneficie

	INDIVIDU {
		int id PK
		varchar nom
		varchar prenom
		varchar email
		char sexe
		date date_naissance
		date date_deces
		varchar navs
		varchar numero_individu UK
	}

	DOSSIER {
		int id PK
		varchar numero_dossier
		varchar numero_individu FK
		date date_debut
		date date_fin
	}

	PERMIS {
		int id PK
		varchar numero_individu FK
		varchar permis
		date date_debut
		date date_fin
	}

	PRESTATION {
		int id PK
		varchar numero_individu FK
		date date_debut_prestation
		date date_prestation
		varchar type_prestation
		int montant_prestation
		date date_fin_prestation
	}
```

## Rechargement complet des données

L’import CSV ne se fait qu’à l’initialisation du volume Postgres.

Pour repartir de zéro:

```bash
docker compose down -v
docker compose up -d --build
```

## Arrêt

```bash
docker compose down
```
