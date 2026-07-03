# Déploiement de GLPI avec Docker Compose

## Objectif

L'objectif de cette étape est de déployer une plateforme GLPI conteneurisée avec une base de données MariaDB.

GLPI est utilisé comme outil de gestion de parc informatique et de gestion des tickets.  
MariaDB est utilisé comme système de gestion de base de données.

## Choix technique

Le déploiement repose sur Docker Compose afin de séparer les services dans plusieurs conteneurs :

- un conteneur pour l'application GLPI ;
- un conteneur pour la base de données MariaDB ;
- un volume Docker pour conserver les données de la base.

Cette séparation permet de mieux organiser les services et de faciliter la maintenance.

## Services déployés

| Service | Rôle | Port |
|---|---|---|
| GLPI | Application web de gestion de parc | 8080 |
| MariaDB | Base de données GLPI | 3306 interne |

## Sécurisation des variables

Les mots de passe de la base de données ne sont pas écrits directement dans le fichier `docker-compose.yml`.

Ils sont placés dans un fichier `.env`, ignoré par Git grâce au fichier `.gitignore`.

Un fichier `.env.example` est fourni pour documenter les variables nécessaires sans exposer les secrets.

## Validation

Le bon fonctionnement du déploiement a été vérifié avec la commande :

```bash
docker ps
