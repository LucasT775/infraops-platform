#!/bin/bash

set -e

PROJECT_DIR="/media/sf_Projets/infraops-platform/projet"
ENV_FILE="$PROJECT_DIR/docker/glpi/.env"
BACKUP_DIR="$PROJECT_DIR/backups/glpi"
DATE=$(date +"%Y-%m-%d_%H-%M-%S")

if [ ! -f "$ENV_FILE" ]; then
  echo "Erreur : fichier .env introuvable : $ENV_FILE"
  exit 1
fi

source "$ENV_FILE"

mkdir -p "$BACKUP_DIR"

echo "Début de la sauvegarde GLPI : $DATE"

docker exec glpi-db sh -c 'mariadb-dump -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE"' \
  > "$BACKUP_DIR/glpi-db-$DATE.sql"

echo "Sauvegarde terminée : $BACKUP_DIR/glpi-db-$DATE.sql"
