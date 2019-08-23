echo "----- 💪we are to update and install some package🤳 -----"
sudo yum update -y
echo "----- wget, vim, httpd, gcc, make -----"
sudo yum install -y vim wget httpd gcc-c++ make
echo "----- start and enable httpd -----"
sudo systemctl start httpd
sudo systemctl enable httpd
echo "----- 🍺finish🍺 -----"