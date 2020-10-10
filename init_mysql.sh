#/bin/bash
docker-compose exec mariadb mysql --user=root --password=mariadb -e "CREATE DATABASE IF NOT EXISTS $1;"
docker-compose exec mariadb mysql --user=root --password=mariadb -e "CREATE USER $1@'%' IDENTIFIED BY '$1';"
docker-compose exec mariadb mysql --user=root --password=mariadb -e "GRANT ALL PRIVILEGES ON $1.* TO $1@'%';"
docker-compose exec mariadb mysql --user=root --password=mariadb -e "CREATE USER $1@'localhost' IDENTIFIED BY '$1';"
docker-compose exec mariadb mysql --user=root --password=mariadb -e "GRANT ALL PRIVILEGES ON $1.* TO $1@'localhost';"
docker-compose exec mariadb mysql --user=root --password=mariadb -e "show databases;"