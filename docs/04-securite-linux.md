# Sécurisation Linux

## Objectif

L'objectif de cette étape est de sécuriser la machine Linux utilisée pour héberger la plateforme InfraOps.

Deux outils sont utilisés :

- UFW pour filtrer les connexions réseau ;
- Fail2Ban pour protéger le service SSH contre les tentatives répétées de connexion.

## Pare-feu UFW

Le pare-feu UFW a été activé afin de limiter les ports accessibles.

Les ports autorisés sont :

| Port | Service |
|---|---|
| 80/tcp | Nginx reverse proxy |
| 22/tcp | SSH |
| 8080/tcp | GLPI |
| 3001/tcp | Uptime Kuma |

La vérification a été réalisée avec la commande :

sudo ufw status numbered

Le pare-feu est actif et les règles sont appliquées au démarrage du système.

## Fail2Ban

Fail2Ban a été installé et activé afin de surveiller les tentatives de connexion SSH.

Le service a été vérifié avec :

sudo systemctl status fail2ban --no-pager
sudo fail2ban-client status

La jail active est :

sshd

Cela confirme que Fail2Ban protège le service SSH.

## Validation

La sécurisation de base est validée car :

- UFW est actif ;
- seuls les ports nécessaires sont ouverts ;
- Fail2Ban est actif ;
- la jail SSH est chargée.
