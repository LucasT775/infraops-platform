# DOSSIER DE PROJET

# InfraOps Platform

Déploiement, sauvegarde, supervision et sécurisation d'une plateforme GLPI conteneurisée

**Titre Professionnel : Administrateur Système DevOps**

**Candidat : Lucas Tillou**

**Centre de formation : M2i Formation**

**Session : 2026**

**Dépôt GitHub :** github.com/LucasT775/infraops-platform

---

# Sommaire

Remerciements  
Introduction  

1. Liste des compétences du référentiel couvertes par le projet  
2. Cahier des charges  
3. Spécifications techniques et schéma d'architecture  
4. Démarche, outils et organisation du travail  
5. Réalisations : scripts et configurations les plus significatifs  
6. Situation de travail ayant nécessité une recherche  
7. Résultat final obtenu  
8. Difficultés rencontrées et solutions apportées  
9. Bilan personnel  
10. Limites assumées et évolutions possibles  
Conclusion générale  
11. Références  
12. Annexes  

---

# Remerciements

Je tiens à remercier l'équipe pédagogique de M2i Formation pour son accompagnement tout au long de la formation Administrateur Système DevOps.

Je remercie également les formateurs pour les apports techniques sur l'administration système, la conteneurisation, l'automatisation, la supervision et la sécurité.

Enfin, je remercie les personnes qui m'ont accompagné et encouragé pendant la réalisation de ce projet.

---

# Introduction

Ce dossier présente le projet **InfraOps Platform**, réalisé dans le cadre de la validation du titre professionnel **Administrateur Système DevOps**.

L'objectif du projet est de mettre en place une plateforme d'administration système basée sur une machine virtuelle Ubuntu et plusieurs services conteneurisés avec Docker.

Le service principal déployé est **GLPI**, une solution de gestion de parc informatique et de tickets. GLPI est associé à une base de données **MariaDB**, déployée dans un conteneur séparé.

Autour de cette application, plusieurs briques techniques ont été ajoutées afin de rendre la plateforme plus complète et plus proche d'un contexte professionnel :

- sauvegarde de la base de données ;
- supervision de la disponibilité avec Uptime Kuma ;
- reverse proxy avec Nginx ;
- sécurisation Linux avec UFW et Fail2Ban ;
- validation automatique du dépôt avec GitHub Actions ;
- documentation et versionnement avec GitHub.

Le projet répond à une problématique concrète du métier d'administrateur système DevOps : déployer un service applicatif de manière reproductible, le sécuriser, le superviser, le sauvegarder et documenter les preuves de fonctionnement.

Le dossier suit une progression logique : présentation des compétences, cahier des charges, architecture, démarche de travail, réalisations techniques, difficultés rencontrées, résultat final et limites assumées.

## 1. Liste des compétences du référentiel couvertes par le projet

Le projet InfraOps Platform consiste à mettre en place une plateforme d'administration système orientée DevOps.

Cette plateforme repose sur une machine virtuelle Ubuntu et plusieurs services déployés avec Docker et Docker Compose.

Le service principal est GLPI, utilisé comme outil de gestion de parc informatique et de tickets. Il est associé à une base de données MariaDB.

Le projet intègre également des briques complémentaires permettant d'améliorer l'exploitation de la plateforme :

- sauvegarde de la base de données ;
- supervision de la disponibilité avec Uptime Kuma ;
- reverse proxy avec Nginx ;
- sécurisation Linux avec UFW et Fail2Ban ;
- validation automatique avec GitHub Actions ;
- versionnement du projet avec Git et GitHub.

## 2. Cahier des charges

Dans un contexte d'administration système, il est important de pouvoir déployer, superviser, sécuriser et sauvegarder les services essentiels.

L'objectif du projet est donc de construire une plateforme simple, documentée et reproductible.

Les objectifs principaux sont :

- déployer une application GLPI fonctionnelle ;
- séparer l'application et la base de données ;
- utiliser Docker Compose pour faciliter le déploiement ;
- protéger les fichiers sensibles comme le fichier `.env` ;
- mettre en place une sauvegarde de la base GLPI ;
- superviser l'application avec Uptime Kuma ;
- rendre l'accès plus propre grâce à un reverse proxy Nginx ;
- sécuriser la machine Linux avec un pare-feu et Fail2Ban ;
- automatiser des contrôles simples avec GitHub Actions ;
- documenter chaque étape avec des preuves et captures.

## 3. Spécifications techniques et schéma d'architecture

L'architecture du projet repose sur une machine virtuelle Ubuntu exécutée dans VirtualBox.

La plateforme est organisée autour des composants suivants :

| Composant | Rôle |
|---|---|
| Ubuntu | Système d'exploitation de la machine virtuelle |
| Docker | Exécution des services en conteneurs |
| Docker Compose | Définition et lancement des services |
| GLPI | Application de gestion de parc et de tickets |
| MariaDB | Base de données utilisée par GLPI |
| Uptime Kuma | Supervision de la disponibilité de GLPI |
| Nginx | Reverse proxy HTTP vers GLPI |
| UFW | Pare-feu Linux |
| Fail2Ban | Protection contre les tentatives SSH répétées |
| GitHub Actions | Validation automatique du dépôt |
| GitHub | Hébergement du code et de la documentation |

Les principaux accès sont :

| Service | Adresse |
|---|---|
| GLPI via Nginx | http://localhost |
| GLPI direct | http://localhost:8080 |
| Uptime Kuma | http://localhost:3001 |

Le code du projet est versionné dans un dépôt GitHub public. Les fichiers sensibles, comme `.env`, et les sauvegardes SQL sont exclus du dépôt grâce au fichier `.gitignore`.

## 4. Démarche, outils et organisation du travail

### 4.1 Méthode de travail

J'ai réalisé ce projet de manière progressive, en avançant brique par brique.

Chaque étape a été testée avant de passer à la suivante :

- création de l'arborescence du projet ;
- mise en place de Git et GitHub ;
- déploiement de GLPI et MariaDB ;
- ajout des sauvegardes ;
- ajout de la supervision ;
- ajout du reverse proxy ;
- sécurisation Linux ;
- validation GitHub Actions ;
- documentation et captures.

Cette méthode m'a permis de limiter les erreurs et de valider chaque composant séparément.

### 4.2 Outils utilisés

| Catégorie | Outil | Usage |
|---|---|---|
| Virtualisation | VirtualBox | Hébergement de la VM Ubuntu |
| Système | Ubuntu | Environnement Linux du projet |
| Conteneurs | Docker | Exécution des services |
| Orchestration | Docker Compose | Déploiement multi-conteneurs |
| Application | GLPI | Gestion de parc informatique et tickets |
| Base de données | MariaDB | Stockage des données GLPI |
| Supervision | Uptime Kuma | Surveillance de la disponibilité |
| Reverse proxy | Nginx | Accès à GLPI via le port 80 |
| Sécurité | UFW / Fail2Ban | Pare-feu et protection SSH |
| Versionnement | Git / GitHub | Suivi du code et documentation |
| CI | GitHub Actions | Validation automatique du dépôt |

### 4.3 Organisation du travail

Le projet a été organisé dans un dépôt GitHub structuré.

Chaque brique technique dispose de son propre dossier ou fichier de documentation. Les changements ont été validés par des commits réguliers et des captures d'écran.

Cette organisation permet de retrouver facilement les configurations, les scripts, les preuves de fonctionnement et les choix techniques.

## 5. Réalisations : scripts et configurations les plus significatifs

### 5.1 Déploiement de GLPI

GLPI a été déployé avec Docker Compose afin de faciliter l'installation et la reproductibilité de l'environnement.

Deux conteneurs principaux sont utilisés :

| Conteneur | Rôle |
|---|---|
| glpi | Application GLPI |
| glpi-db | Base de données MariaDB |

La configuration Docker Compose se trouve dans le dossier :

docker/glpi/

### 5.2 Sauvegarde de la base de données

La base de données GLPI contient les informations importantes de l'application.

Une procédure de sauvegarde a donc été mise en place avec un script Bash.

Le script se trouve dans le dossier :

scripts/backup-glpi.sh

Ce script réalise une exportation SQL de la base MariaDB utilisée par GLPI.

Les sauvegardes sont stockées localement dans :

backups/glpi/

Le dossier backups/ est ignoré par Git afin d'éviter de publier les fichiers SQL sur GitHub.

Le script utilise le fichier .env local pour récupérer les informations de connexion nécessaires. Cela évite d'inscrire directement les mots de passe dans le script.

La sauvegarde a été testée avec succès et plusieurs fichiers SQL valides ont été générés.

### 5.3 Supervision avec Uptime Kuma

La supervision de la plateforme est assurée avec Uptime Kuma.

Uptime Kuma est déployé dans un conteneur Docker dédié et accessible à l'adresse :

http://localhost:3001

Un monitor HTTP a été créé afin de surveiller la disponibilité de GLPI.

Depuis le conteneur Uptime Kuma, GLPI est supervisé via l'adresse :

http://host.docker.internal:8080

Le monitor nommé GLPI retourne le statut UP avec un code HTTP 200 OK.

Cette supervision permet de vérifier rapidement que l'application GLPI est disponible.

### 5.4 Reverse proxy avec Nginx

Un reverse proxy Nginx a été ajouté devant GLPI.

L'objectif est de permettre un accès plus propre à l'application via le port HTTP standard 80, au lieu d'utiliser directement le port applicatif 8080.

Nginx est déployé dans un conteneur Docker dédié.

Le fichier de configuration Nginx redirige les requêtes vers GLPI avec la directive suivante :

proxy_pass http://host.docker.internal:8080;

Après le démarrage du conteneur Nginx, GLPI est accessible depuis le navigateur à l'adresse :

http://localhost

Le port 80 a également été autorisé dans UFW afin de permettre l'accès au reverse proxy.

### 5.5 Sécurisation Linux

La machine Linux a été sécurisée avec deux outils principaux : UFW et Fail2Ban.

UFW permet de filtrer les connexions réseau entrantes.

Les ports autorisés sont :

- 22/tcp pour SSH ;
- 80/tcp pour Nginx ;
- 8080/tcp pour GLPI ;
- 3001/tcp pour Uptime Kuma.

Fail2Ban a été installé et activé afin de protéger le service SSH contre les tentatives répétées de connexion.

La jail active est :

sshd

La vérification finale montre que UFW est actif et que Fail2Ban fonctionne correctement.

### 5.6 Intégration continue avec GitHub Actions

Une intégration continue simple a été mise en place avec GitHub Actions.

L'objectif du workflow est de vérifier automatiquement la présence des fichiers importants du projet à chaque push.

Le workflow contrôle notamment :

- les fichiers de documentation ;
- les fichiers Docker Compose ;
- la configuration Nginx ;
- le script de sauvegarde ;
- l'absence du fichier sensible docker/glpi/.env dans le dépôt.

Après le dernier push, le workflow GitHub Actions est passé au vert, ce qui valide la cohérence minimale du dépôt.

## 6. Situation de travail ayant nécessité une recherche

Pendant le projet, une situation a nécessité une recherche technique particulière : l'accès à GLPI depuis un autre conteneur Docker.

Au départ, GLPI était accessible depuis la machine virtuelle avec l'adresse :

http://localhost:8080

Cependant, depuis le conteneur Uptime Kuma ou le conteneur Nginx, l'adresse localhost ne désigne pas la machine hôte, mais le conteneur lui-même.

Il a donc fallu rechercher une solution permettant à un conteneur d'accéder à un service exposé sur l'hôte Docker.

La solution retenue a été d'utiliser :

host.docker.internal

avec l'option Docker Compose suivante :

extra_hosts:
  - "host.docker.internal:host-gateway"

Cette configuration a permis :

- à Uptime Kuma de superviser GLPI ;
- à Nginx de rediriger les requêtes vers GLPI ;
- de conserver une architecture simple sans regrouper tous les services dans un seul fichier Compose.

Cette recherche m'a permis de mieux comprendre la différence entre le réseau de la machine hôte et le réseau interne des conteneurs Docker.

## 7. Résultat final obtenu

À la fin du projet, la plateforme InfraOps est fonctionnelle.

Les services suivants sont actifs :

| Service | Rôle |
|---|---|
| GLPI | Application de gestion de parc et de tickets |
| MariaDB | Base de données GLPI |
| Uptime Kuma | Supervision de la disponibilité |
| Nginx | Reverse proxy vers GLPI |

Les accès validés sont :

| Service | Adresse |
|---|---|
| GLPI via Nginx | http://localhost |
| GLPI direct | http://localhost:8080 |
| Uptime Kuma | http://localhost:3001 |

Les contrôles finaux ont confirmé que :

- le dépôt Git est propre ;
- les conteneurs Docker sont actifs ;
- GLPI est accessible ;
- Uptime Kuma surveille GLPI ;
- Nginx permet l'accès via le port 80 ;
- le fichier .env est ignoré par Git ;
- le dossier backups/ est ignoré par Git ;
- GitHub Actions valide le dépôt.

Le résultat obtenu correspond donc au périmètre défini dans le cahier des charges.

## 8. Difficultés rencontrées et solutions apportées

Plusieurs difficultés ont été rencontrées pendant le projet.

| Difficulté | Solution apportée |
|---|---|
| Accès au dossier partagé VirtualBox | Ajout de l'utilisateur au groupe vboxsf et redémarrage de la VM |
| Protection du fichier .env | Ajout de règles dans .gitignore et vérification avec git check-ignore |
| Sauvegarde GLPI | Création d'un script Bash utilisant les variables du fichier .env |
| Accès à GLPI depuis Uptime Kuma | Utilisation de host.docker.internal avec host-gateway |
| Reverse proxy Nginx | Ajout d'un conteneur Nginx dédié redirigeant vers GLPI |
| README trop ambitieux | Suppression de Prometheus et Grafana car non réalisés |
| Organisation des captures | Création d'un fichier listant les preuves disponibles |

Ces difficultés ont été corrigées progressivement, avec des vérifications à chaque étape.

## 9. Bilan personnel

Ce projet m'a permis de consolider plusieurs compétences importantes du métier d'administrateur système DevOps.

J'ai notamment pratiqué :

- l'administration d'une VM Linux ;
- l'utilisation de Docker et Docker Compose ;
- le déploiement d'une application avec base de données ;
- la gestion de fichiers sensibles ;
- l'écriture d'un script de sauvegarde ;
- la supervision d'un service web ;
- la configuration d'un reverse proxy ;
- la sécurisation réseau avec UFW et Fail2Ban ;
- le versionnement avec Git et GitHub ;
- la mise en place d'un workflow GitHub Actions.

Le projet m'a aussi appris à avancer de manière progressive, à vérifier chaque étape et à documenter les preuves de fonctionnement.

## 10. Limites assumées et évolutions possibles

Le projet est volontairement limité à une architecture locale sur une seule machine virtuelle.

Les limites principales sont :

- pas de haute disponibilité ;
- pas de certificat HTTPS ;
- pas de sauvegarde externalisée ;
- pas de restauration automatisée complète ;
- pas de supervision avancée avec métriques système ;
- pas d'orchestration Kubernetes.

Ces limites sont assumées, car l'objectif était de construire une plateforme fonctionnelle, compréhensible et démontrable dans le temps disponible.

Des évolutions possibles seraient :

- ajouter HTTPS avec un certificat ;
- externaliser les sauvegardes ;
- ajouter une procédure de restauration complète ;
- déployer la plateforme sur un cloud public ;
- ajouter Prometheus et Grafana pour une supervision plus avancée ;
- automatiser davantage le déploiement.

## Conclusion générale

Le projet InfraOps Platform a permis de mettre en place une plateforme d'administration système complète et documentée.

La solution repose sur GLPI, MariaDB, Docker, Uptime Kuma, Nginx, UFW, Fail2Ban, GitHub et GitHub Actions.

Le projet répond aux objectifs fixés : déployer, sauvegarder, superviser, sécuriser, versionner et documenter une plateforme applicative.

Cette réalisation constitue une base solide pour un environnement d'administration système DevOps et peut être enrichie dans une version ultérieure.

## 11. Références

Les ressources principales utilisées pendant le projet sont :

- documentation officielle Docker ;
- documentation officielle Docker Compose ;
- documentation officielle GLPI ;
- documentation officielle Uptime Kuma ;
- documentation officielle Nginx ;
- documentation Ubuntu ;
- documentation GitHub Actions ;
- pages man et aide des commandes Linux utilisées.

## 12. Annexes

Les annexes du projet sont constituées des éléments suivants :

- dépôt GitHub du projet ;
- fichiers Docker Compose ;
- script de sauvegarde GLPI ;
- documentations techniques présentes dans le dossier docs/ ;
- captures d'écran listées dans docs/07-captures-projet.md ;
- validation finale technique.
