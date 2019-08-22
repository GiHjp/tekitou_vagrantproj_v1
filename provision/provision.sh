echo let\'s update!!!!!!!!!!!
sudo yum update -y
echo "...and install vim! wget!!! httpd!!!!!! and gcc! make! for nodejs!"
sudo yum install -y vim wget httpd gcc-c++ make
echo "...okay, let\'s set enforce to 0"
sudo setenforce 0
echo "start and enbale httpd!!!!!!!"
sudo systemctl start httpd
sudo systemctl enable httpd
echo "hey, are you ready to install php?? first, add repository."
sudo yum install epel-release yum-utils
sudo yum install http://rpms.remirepo.net/enterprise/remi-release-73.rpm
echo "second, we here, remove old (pre install) php."
sudo yum remove php-*
echo "yeaaah! finaly have installed php!!!!!!!"
sudo yum-config-manager --enable remi-php73
sudo yum install php php-common php-opcache php-mcrypt php-cli php-gd php-curl php-mysqlnd
echo "congulatiolation!!!"
echo "ほんとはここでphpmyadminをリポジトリに追加するんだけどファイル編集をプロビジョニングでやる方法がわからなかったから飛ばしたよ"
echo "next, the time to mariadb(mysql). first, remove old one."
sudo yum remove mysql*
echo "second, add repository file."
sudo rpm --import https://yum.mariadb.orb/RPM-GPG-KEY-MariaDB/etc/yum.repos.d/mariadb.repo
echo "!!!!ATTENTION!!!!"
echo "you need repository manually on /files/mariadb.repo to guest /etc/yum.repos.d/mariadb.repo ."
echo "third, install mariadb!!!!"
echo "... if you have added mariadb repo, then `sudo yum -y install MariaDB-devel MariaDB-client MariaDB-server`"
echo "wow, great! shall we last dance? start and enable mysqld!!!!"
echo "... if you have installed mariadb, then `sudo systemctl start mysqld`"
echo "... and `systemctl enable mysqld` too."
echo "perfect! okok, next time, the turn of node and npm."
sudo curl -sL https://rpm.nodesource.com/setup_12.x | sudo -E bash -
sudo yum install -y nodejs