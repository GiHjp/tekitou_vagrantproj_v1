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
sudo rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo wget http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
sudo rpm -Uvh remi-release-7.rpm
echo "second, we here, remove old (pre install) php."
sudo yum remove php-*
echo "yeaaah! finaly install php!!!!!!!"
sudo yum install -y --disablerepo=* --enablerepo=epel,remi,remi-safe,remi-php73 php
sudo yum info php --enablerepo=remi-php73
sudo yum-config-manager --enable remi-php73
echo "congulatiolation!!!"
echo "ほんとはここでphpmyadminをリポジトリに追加するんだけどファイル編集をプロビジョニングでやる方法がわからなかったから飛ばしたよ"
echo "next, the time to mysql. first, remove old one."
sudo yum remove mysql*
echo "second, install repository."
sudo yum -y install http://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm
echo "third, install mysql-community-server!!!!"
sudo yum -y install mysql-community-server
echo "wow, great! shall we last dance? start and enable mysqld!!!!"
sudo systemctl start mysqld
sudo systemctl enable mysqld
echo "perfect! okok, next time, the turn of node and npm."
sudo curl -sL https://rpm.nodesource.com/setup_12.x | sudo -E bash -
sudo yum install -y nodejs