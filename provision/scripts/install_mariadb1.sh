echo "----- 💪the turn of mariaDB🤳-----"
sudo yum -y remove mysql*
sudo yum -y remove MariaDB*
sudo rpm --import https://yum.mariadb.org/RPM-GPG-KEY-MariaDB/etc/yum.repos.d/mariadb.repo
echo "----- next, copy the repo -----"
