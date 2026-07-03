# Validation finale technique

## Objectif

Cette étape permet de vérifier que l'ensemble de la plateforme InfraOps est opérationnel et que le dépôt Git est propre.

## État du dépôt Git

La commande suivante a été utilisée :

git status

Le résultat confirme que le dépôt est propre :

nothing to commit, working tree clean

## Services Docker actifs

La commande suivante a été utilisée :

docker ps

Les conteneurs actifs sont :

| Conteneur | Rôle |
|---|---|
| infraops-nginx | Reverse proxy Nginx |
| uptime-kuma | Supervision |
| glpi | Application GLPI |
| glpi-db | Base de données MariaDB |

## Accès aux services

Les services sont accessibles aux adresses suivantes :

| Service | URL |
|---|---|
| GLPI via Nginx | http://localhost |
| GLPI direct | http://localhost:8080 |
| Uptime Kuma | http://localhost:3001 |

## Vérification des fichiers sensibles

La commande suivante a été utilisée :

git check-ignore -v docker/glpi/.env backups/

Elle confirme que les fichiers sensibles et les sauvegardes sont bien ignorés par Git :

- docker/glpi/.env
- backups/

## Conclusion

La plateforme InfraOps est fonctionnelle.

Les services principaux sont déployés, supervisés, sauvegardés, sécurisés et versionnés proprement sur GitHub.
