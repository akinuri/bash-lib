read -p "User password: " user_pass
read -p "Database name: " db_name

date=$(TZ=Europe/Istanbul date +"%Y-%m-%d_%H-%M")

# TODO: detect db
db_vendor="mariadb"

sub_dir=""

sudo /opt/bitnami/${db_vendor}/bin/mysqldump --user=root --password=${user_pass} ${db_name} > /home/bitnami/htdocs${sub_dir}/dump_${date}.sql

cd /home/bitnami/htdocs${sub_dir}
zip -r htdocs_${date}.zip .

rm /home/bitnami/htdocs${sub_dir}/dump_${date}.sql
