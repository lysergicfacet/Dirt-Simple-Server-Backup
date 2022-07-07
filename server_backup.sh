#!/bin/bash
# Use:
#   You want to run this with the subfolder added as an argument to the end.  This makes it simple to simply
#   add a backup job to the cronjob and be obvious what it's doing.
#   Example, in the crontab:
#     0  3  *  *  * root            /usr/bin/bash /opt/server_backup.sh daily
#

#echo "Make the backup directory if it does not exist ( /opt/docs_backup )."
sudo mkdir -p /var/cache/server_backups/$1

#echo "bz2 the whole docs into a backup file, in that directory."
sudo tar -cvjf /var/cache/server_backups/$1/backup.etc.$(date "+%Y.%m.%d-%H.%M.%S").tar.bz2 /etc/
sudo tar -cvjf /var/cache/server_backups/$1/backup.home.$(date "+%Y.%m.%d-%H.%M.%S").tar.bz2 /home
sudo tar -cvjf /var/cache/server_backups/$1/backup.usr_local.$(date "+%Y.%m.%d-%H.%M.%S").tar.bz2 /usr/local
sudo tar -cvjf /var/cache/server_backups/$1/backup.opt.$(date "+%Y.%m.%d-%H.%M.%S").tar.bz2 /opt
