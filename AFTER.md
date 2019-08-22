いれたあと。なんか自動化できないやつ。

- SELinuxの無効化
  - `/etc/selinux/config`
  - reboot必要っぽい
- mariadbのインストール
  - `/etc/yum.repos.d/mariadb.repo`を作成し/files/mariadb.repoをコピー
  - `sudo yum -y install MariaDB-devel MariaDB-client MariaDB-server`
  - mariadbの起動と永続化
  - `sudo systemctl start mysqld`, `sudo systemctl enable mysqld`
- phpmyadminのリポジトリ追加とインストール
  - `/etc/yum.repos.d/remi.repo`
  - provisionのfileの`remi.repo`参照して一行加える
  - `sudo yum install -y phpmyadmin`
- phpmyadminにアクセスできるようにする
  - `/etc/httpd/conf.d/phpMyAdmin.conf`
  
  
  変更前
  ```
  :
  <Directory /usr/share/phpMyAdmin/>
   AddDefaultCharset UTF-8

   <IfModule mod_authz_core.c>
     # Apache 2.4
     <RequireAny>
       Require ip 127.0.0.1 # ここを変える
       Require ip ::1
     </RequireAny>
   </IfModule>
  :
  ```
  変更後
  ```
  :
  <Directory /usr/share/phpMyAdmin/>
   AddDefaultCharset UTF-8

   <IfModule mod_authz_core.c>
     # Apache 2.4
     <RequireAny>
       # Require ip 127.0.0.1 # コメントアウト
       Require all granted    # 追記
       Require ip ::1
     </RequireAny>
   </IfModule>
  :
  ```
- パスワード変更
  - `sudo mysql_secure_installation`
  - 新しいパスワード以外ぜんぶ"y"でいい
  - 新しいパスワードは途中で出てくることに注意　ちゃんと読もう