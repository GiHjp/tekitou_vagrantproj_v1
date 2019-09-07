## Things should do next after you have finished provision(like first `vagrant up`)

- Disable SELinux
  - `/etc/selinux/config`
  - need to **reboot** to reflect changing configl
- Initialize MySQL pasword
  - `sudo mysql_secure_installation`
