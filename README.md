# InfraOps Platform

Projet réalisé dans le cadre du titre RNCP Administrateur Système DevOps niveau 6.

## Objectif

Déployer une plateforme GLPI conteneurisée sur une infrastructure Azure, avec automatisation, supervision, sauvegarde et sécurisation.

## Technologies utilisées

- Ubuntu Server
- Microsoft Azure
- Terraform
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

Le projet repose sur un poste d'administration Ubuntu permettant de piloter le déploiement de l'infrastructure cloud avec Terraform.

L'application GLPI et les services associés seront déployés dans des conteneurs Docker sur une machine virtuelle Azure.

## Structure

```text
terraform/
docker/
monitoring/
scripts/
docs/
screenshots/
diagrams/
.github/workflows/
