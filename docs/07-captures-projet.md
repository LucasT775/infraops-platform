# Captures du projet

## Objectif

Cette page liste les captures d'écran réalisées pendant le projet InfraOps.

Les captures servent à prouver les étapes techniques suivantes :

- préparation de l'environnement Linux ;
- déploiement de GLPI avec MariaDB ;
- gestion des fichiers sensibles ;
- sauvegarde de la base de données ;
- supervision avec Uptime Kuma ;
- sécurisation avec UFW et Fail2Ban ;
- mise en place d'un reverse proxy Nginx ;
- validation automatique avec GitHub Actions ;
- validation finale de la plateforme.

## Captures principales à intégrer dans le dossier

| Nom de la capture | Preuve apportée |
|---|---|
| ubuntu.png | Environnement Ubuntu utilisé pour le projet |
| capture_02_depot_github_initial.png | Dépôt GitHub initial du projet |
| creation-dossier-docker-glpi.png | Création de l'arborescence Docker pour GLPI |
| docker-ps-glpi-env.png | Conteneurs GLPI et MariaDB actifs |
| glpi-installation.png | Installation de GLPI dans le navigateur |
| glpi-connexion-bdd-reussie.png | Connexion réussie entre GLPI et la base MariaDB |
| glpi-dashboard-operationnel.png | Interface GLPI fonctionnelle après installation |
| glpi-utilisateurs-par-defaut.png | Vérification des utilisateurs GLPI par défaut |
| glpi-dashboard-mots-de-passe-corriges.png | Sécurisation des comptes GLPI par défaut |
| github-docker-glpi-sans-env.png | Vérification que le fichier .env n'est pas publié sur GitHub |
| github-doc-glpi.png | Documentation GLPI visible dans le dépôt GitHub |
| docker-volume-glpi-db.png | Identification du volume Docker contenant la base GLPI |
| backup-glpi-script.png | Script Bash de sauvegarde GLPI |
| backup-glpi-reussie.png | Exécution réussie de la sauvegarde GLPI |
| git-push-backup-script.png | Script de sauvegarde versionné sur GitHub |
| docker-ps-uptime-kuma.png | Conteneur Uptime Kuma actif |
| uptime-kuma-setup.png | Initialisation de l'interface Uptime Kuma |
| uptime-kuma-glpi-up.png | Supervision GLPI active avec statut UP |
| install-ufw-fail2ban.png | Installation des outils UFW et Fail2Ban |
| ufw-regles-actives.png | Pare-feu UFW actif avec les règles principales |
| fail2ban-actif-sshd.png | Fail2Ban actif avec la jail SSH |
| docker-ps-nginx.png | Conteneur Nginx actif |
| glpi-via-nginx-localhost.png | Accès à GLPI via le reverse proxy Nginx sur http://localhost |
| ufw-port-80-nginx.png | Port 80 autorisé dans UFW pour Nginx |
| github-actions-validation-success.png | Première validation GitHub Actions réussie |
| github-actions-nginx-success.png | Validation GitHub Actions après ajout de Nginx |
| validation-technique-finale.png | Vérification finale : Git propre, services actifs, fichiers sensibles ignorés |

## Captures Git et GitHub

| Nom de la capture | Preuve apportée |
|---|---|
| git-push-glpi-compose.png | Envoi de la configuration GLPI sur GitHub |
| git-push-doc-uptime-kuma.png | Documentation Uptime Kuma envoyée sur GitHub |
| git-push-uptime-kuma.png | Configuration Uptime Kuma envoyée sur GitHub |
| git-push-doc-securite-linux.png | Documentation sécurité Linux envoyée sur GitHub |
| git-push-nginx-reverse-proxy.png | Reverse proxy Nginx envoyé sur GitHub |
| git-push-update-securite-nginx.png | Mise à jour de la documentation sécurité avec le port 80 |
| git-push-readme-services-corriges.png | README corrigé avec uniquement les services réellement réalisés |
| git-push-workflow-nginx.png | Workflow GitHub Actions mis à jour pour vérifier Nginx |
| git-push-validation-finale.png | Documentation de validation finale envoyée sur GitHub |

## Captures complémentaires disponibles

Les captures suivantes peuvent être conservées comme preuves complémentaires :

| Nom de la capture | Utilité |
|---|---|
| docker-verification.png | Vérification de l'installation Docker |
| installation-docker.png | Installation de Docker |
| docker-ps-glpi.png | Premier contrôle des conteneurs GLPI |
| glpi-prerequis.png | Vérification des prérequis GLPI |
| glpi-prerequis2.png | Suite de la vérification des prérequis GLPI |
| glpi-login.png | Page de connexion GLPI |
| glpi-dashboard-final.png | Tableau de bord GLPI final |
| glpi-dashboard-alertes.png | Alertes GLPI après installation |
| uptime-kuma-dashboard-vide.png | Tableau de bord Uptime Kuma avant ajout du monitor |
| readme-prometheus-grafana-a-corriger.png | Preuve du contrôle qualité du README avant correction |

## Sélection recommandée pour le dossier final

Pour éviter un dossier trop lourd, il est recommandé d'intégrer environ 15 à 20 captures.

Les captures prioritaires sont :

1. creation-dossier-docker-glpi.png
2. docker-ps-glpi-env.png
3. glpi-dashboard-operationnel.png
4. glpi-utilisateurs-par-defaut.png
5. github-docker-glpi-sans-env.png
6. docker-volume-glpi-db.png
7. backup-glpi-reussie.png
8. uptime-kuma-glpi-up.png
9. ufw-regles-actives.png
10. fail2ban-actif-sshd.png
11. docker-ps-nginx.png
12. glpi-via-nginx-localhost.png
13. github-actions-nginx-success.png
14. validation-technique-finale.png
15. git-push-validation-finale.png

## Conclusion

Les captures disponibles permettent de démontrer l'ensemble du cycle projet :

- création de l'infrastructure ;
- déploiement applicatif ;
- sauvegarde ;
- supervision ;
- sécurisation ;
- automatisation ;
- versionnement ;
- validation finale.

Elles constituent des preuves techniques exploitables pour le dossier projet et la soutenance.
