echo "----- 💪overload httpd.conf for phpmyadmin🤳 -----"
sudo rm -rf /etc/httpd/conf.d/phpMyAdmin.conf
sudo cp phpMyAdmin.conf /etc/httpd/conf.d/
sudo rm -rf phpMyAdmin.conf
sudo systemctl restart httpd mysqld
sudo systemctl status httpd mysqld
echo "----- 🍺one more🍺 -----"
