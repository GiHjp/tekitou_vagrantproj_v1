echo "----- 💪overload httpd.conf for phpmyadmin🤳 -----"
sudo rm -rf /etc/httpd/conf.d/phpMyAdmin.conf
sudo mv ./phpMyAdmin.conf /etc/httpd/conf.d/phpMyAdmin.conf
sudo systemctl restart httpd
sudo systemctl status httpd
echo "----- 🍺one more🍺 -----"
