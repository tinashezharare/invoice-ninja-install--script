create database invoiceninja;
create user 'ninja'@'localhost' identified by 'your-password-here';
grant all privileges on invoiceninja.* to 'ninja'@'localhost';
flush privileges;
exit;
