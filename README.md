# invoice-ninja-install-script
This script will install invoice ninja v5. This has been tested on Ubuntu 20.04 and 20.10.

# Prerequisites
1) Install LAMP server: https://github.com/tinashezharare/lamp-for-ubuntu .
2) Create database user using the steps shown in install-invoice-ninja.sql(Edit username and password to match your needs.)

# Installation
- Run the install.sh file.

# What next?
Edit /etc/apache2/sites-available/invoice-ninja.conf to match the host name you want to use. 

Visit the host you specified in the .conf file from your browser and fill in the setup for that comes up. From there the system should be up and almost ready to use.

NB: you need to then setup a cron job as shown in https://invoiceninja.github.io/docs/self-host-installation/#cron-configuration-1

# The end!
