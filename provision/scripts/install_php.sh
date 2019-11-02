echo "----- 💪we are to install php(s)🤳 -----"
echo "----- first setup repos -----"
sudo yum install -y http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
sudo yum install -y epel-release yum-utils
sudo yum install -y http://rpms.remirepo.net/enterprise/remi-release-73.rpm
sudo yum remove php-*
echo "----- let's install!! here we go... -----"
sudo yum-config-manager --enable remi-php73
sudo yum install -y php php-common php-opcache php-mcrypt php-cli php-gd php-curl php-zip php-devel php-mbstring php-xml php-pear php-json php-pdo php-pecl-apcu php-pecl-apcu-devel php-bcmatch php-imap php-ldap php-odbc php-xmlrpc php-soap php-tidy
echo "----- 🍺it's all over🍺 -----"
