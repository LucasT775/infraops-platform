# Reverse proxy Nginx

## Objectif

L'objectif de cette étape est d'ajouter un reverse proxy Nginx devant l'application GLPI.

Nginx permet d'accéder à GLPI via le port HTTP standard 80, au lieu d'utiliser directement le port applicatif 8080.

## Architecture

Le service GLPI reste disponible sur le port 8080.

Le reverse proxy Nginx est exposé sur le port 80.

L'accès utilisateur se fait via l'adresse suivante :

http://localhost

## Déploiement

Nginx est déployé dans un conteneur Docker dédié avec Docker Compose.

Le fichier de configuration Nginx redirige les requêtes HTTP vers GLPI avec la directive suivante :

proxy_pass http://host.docker.internal:8080;

## Sécurité réseau

Le port 80/tcp a été autorisé dans UFW afin de permettre l'accès au reverse proxy.

Les ports liés à la plateforme sont :

| Port | Service |
|---|---|
| 80/tcp | Nginx reverse proxy |
| 8080/tcp | GLPI |
| 3001/tcp | Uptime Kuma |
| 22/tcp | SSH |

## Validation

Le conteneur Nginx est actif et expose le port 80.

L'accès à http://localhost affiche bien la page d'authentification GLPI.

Cela confirme que le reverse proxy fonctionne correctement.
