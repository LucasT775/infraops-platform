# Sauvegardes GLPI

## Objectif

L'objectif de cette étape est de mettre en place une sauvegarde de la base de données GLPI.

La sauvegarde permet de restaurer les données en cas d'erreur, de suppression accidentelle ou de problème sur le conteneur MariaDB.

## Principe

GLPI utilise une base de données MariaDB déployée dans un conteneur Docker nommé `glpi-db`.

Un script Bash exécute la commande `mariadb-dump` dans le conteneur MariaDB afin d'exporter la base `glpi` dans un fichier SQL.

Les fichiers de sauvegarde sont stockés dans :

```text
backups/glpi/
