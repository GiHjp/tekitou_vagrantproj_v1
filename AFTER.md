いれたあと。なんか自動化できないやつ。

- SELinuxの無効化
  - `/etc/selinux/config`
  - reboot必要っぽい
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
  - 新しいパスワードは途中で出てくることに注意　ちゃんと読もう