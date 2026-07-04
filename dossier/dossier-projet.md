# Dossier projet - InfraOps Platform

## 1. Présentation du projet

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

## 2. Contexte et objectifs

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

## 3. Architecture technique

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

## 4. Déploiement de GLPI

GLPI a été déployé avec Docker Compose afin de faciliter l'installation et la reproductibilité de l'environnement.

Deux conteneurs principaux sont utilisés :

| Conteneur | Rôle |
|---|---|
| glpi | Application GLPI |
| glpi-db | Base de données MariaDB |

La configuration Docker Compose se trouve dans le dossier :

```text
docker/glpi/

## 5. Sauvegarde de la base de données

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

## 6. Supervision avec Uptime Kuma

La supervision de la plateforme est assurée avec Uptime Kuma.

Uptime Kuma est déployé dans un conteneur Docker dédié et accessible à l'adresse :

http://localhost:3001

Un monitor HTTP a été créé afin de surveiller la disponibilité de GLPI.

Depuis le conteneur Uptime Kuma, GLPI est supervisé via l'adresse :

http://host.docker.internal:8080

Le monitor nommé GLPI retourne le statut UP avec un code HTTP 200 OK.

Cette supervision permet de vérifier rapidement que l'application GLPI est disponible.

## 7. Reverse proxy avec Nginx

Un reverse proxy Nginx a été ajouté devant GLPI.

L'objectif est de permettre un accès plus propre à l'application via le port HTTP standard 80, au lieu d'utiliser directement le port applicatif 8080.

Nginx est déployé dans un conteneur Docker dédié.

Le fichier de configuration Nginx redirige les requêtes vers GLPI avec la directive suivante :

proxy_pass http://host.docker.internal:8080;

Après le démarrage du conteneur Nginx, GLPI est accessible depuis le navigateur à l'adresse :

http://localhost

Le port 80 a également été autorisé dans UFW afin de permettre l'accès au reverse proxy.

## 8. Sécurisation Linux

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

## 9. Intégration continue avec GitHub Actions

Une intégration continue simple a été mise en place avec GitHub Actions.

L'objectif du workflow est de vérifier automatiquement la présence des fichiers importants du projet à chaque push.

Le workflow contrôle notamment :

- les fichiers de documentation ;
- les fichiers Docker Compose ;
- la configuration Nginx ;
- le script de sauvegarde ;
- l'absence du fichier sensible docker/glpi/.env dans le dépôt.

Après le dernier push, le workflow GitHub Actions est passé au vert, ce qui valide la cohérence minimale du dépôt.

## 10. Gestion des preuves et captures

Les captures d'écran réalisées pendant le projet sont listées dans le fichier :

docs/07-captures-projet.md

Elles permettent de prouver les étapes importantes du projet :

- déploiement de GLPI ;
- connexion à MariaDB ;
- protection du fichier .env ;
- sauvegarde de la base de données ;
- supervision avec Uptime Kuma ;
- sécurisation avec UFW et Fail2Ban ;
- fonctionnement du reverse proxy Nginx ;
- validation GitHub Actions ;
- validation finale de la plateforme.

Pour le dossier final, seules les captures les plus importantes seront intégrées afin de garder un document lisible.

## 11. Validation finale
Une validation finale a été réalisée afin de vérifier l'état global du projet.

Les points suivants ont été contrôlés :

- le dépôt Git est propre ;
- les conteneurs Docker principaux sont actifs ;
- GLPI est accessible ;
- Uptime Kuma surveille GLPI ;
- Nginx permet l'accès à GLPI via http://localhost ;
- le fichier .env est ignoré par Git ;
- le dossier backups/ est ignoré par Git ;
- GitHub Actions valide le dépôt.

Les conteneurs actifs à la fin du projet sont :

- infraops-nginx ;
- uptime-kuma ;
- glpi ;
- glpi-db.

Cette validation confirme que la plateforme est opérationnelle.

## 12. Conclusion

Le projet InfraOps Platform a permis de mettre en place une plateforme d'administration système complète et documentée.

Le projet répond aux objectifs fixés :

- déployer une application métier avec Docker ;
- utiliser une base de données séparée ;
- protéger les informations sensibles ;
- sauvegarder les données ;
- superviser la disponibilité du service ;
- sécuriser la machine Linux ;
- utiliser un reverse proxy ;
- automatiser des contrôles avec GitHub Actions ;
- documenter les étapes avec des preuves.

Cette réalisation constitue une base solide pour un environnement d'administration système DevOps.

Des améliorations futures pourraient être ajoutées, comme la mise en place de certificats HTTPS, une supervision plus avancée ou une automatisation plus poussée du déploiement.
