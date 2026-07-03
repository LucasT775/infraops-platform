# InfraOps Platform

Projet réalisé dans le cadre du titre RNCP Administrateur Système DevOps niveau 6.

## Objectif

Déployer une plateforme GLPI conteneurisée sur une infrastructure Linux virtuelle avec automatisation, supervision, sauvegarde et sécurisation.

## Technologies utilisées

- Ubuntu Server
- Docker
- Docker Compose
- GLPI
- MariaDB
- Nginx
- Prometheus
- Grafana
- Uptime Kuma
- GitHub
- GitHub Actions
- Bash
- UFW / Fail2Ban

## Architecture du projet

Le projet repose sur un poste d'administration Ubuntu exécuté dans VirtualBox.

Les différents services seront déployés dans des conteneurs Docker :

- GLPI
- MariaDB
- Nginx
- Prometheus
- Grafana
- Uptime Kuma

L'ensemble sera administré via Git et GitHub.

## Structure

```text
docker/
monitoring/
scripts/
docs/
screenshots/
diagrams/
.github/workflows/
