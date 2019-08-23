echo "----- move repos and intall phpmyadmin -----"
sudo mv ./mariadb.repo /etc/yum.repos.d
sudo yum -y install MariaDB-devel MariaDB-client MariaDB-server
echo "----- 🍺chill out🍺 -----"
sudo systemctl start mysqld
sudo systemctl enable mysqld
