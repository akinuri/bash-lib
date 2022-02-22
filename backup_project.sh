read -p "User password: " user_pass
read -p "Database name: " db_name

date=$(TZ=Europe/Istanbul date +"%Y-%m-%d_%H-%M")

# TODO: detect db
db_vendor="mariadb"

sudo /opt/bitnami/${db_vendor}/bin/mysqldump --user=root --password=${user_pass} ${db_name} > /home/bitnami/htdocs/dump_${date}.sql

cd /home/bitnami/htdocs
zip -r htdocs_${date}.zip .

rm /home/bitnami/htdocs/dump_${date}.sql
