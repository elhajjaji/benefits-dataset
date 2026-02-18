# Données CSV

Ce dossier contient les fichiers sources importés automatiquement dans PostgreSQL au premier démarrage.

## Fichiers

- `data-individu.csv` -> table `src.individu`
- `data-dossier.csv` -> table `src.dossier`
- `data-permis.csv` -> table `src.permis`
- `data-prestation.csv` -> table `src.prestation`

## Format attendu

- Encodage UTF-8
- Séparateur: virgule
- En-tête présent (header)
- Valeurs nulles: `NULL`

## Important

Les changements dans ces CSV ne sont pris en compte qu’après réinitialisation du volume Postgres:

```bash
docker compose down -v
docker compose up -d --build
```
