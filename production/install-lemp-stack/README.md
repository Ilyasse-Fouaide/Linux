# How to install Linux, Nginx, Myqsl, PHP (LEMP stack) on Ubuntu

## Step 1 – Installing the Nginx Web Server _(EnginX)_

You can use apt install to get Nginx installed:

```bash
sudo apt udpate
sudo apt install nginx
```

It is recommended that you enable the most restrictive profile that will still allow the traffic you need. Since you haven’t configured SSL for your server in this guide, you will only need to allow regular HTTP traffic on port `80`.

```bash
sudo ufw allow 80/tcp
```

## Step 2 — Installing MySQL

Now that you have a web server up and running, you need to install the database system to be able to store and manage data for your site. MySQL is a popular database management system used within PHP environments.

```bash
sudo apt install mysql-server
```

When the installation is finished, it’s recommended that you run a **security** script that comes pre-installed with MySQL. This script will remove some insecure default settings and lock down access to your database system. Start the interactive script by running:

```bash
sudo mysql_secure_installation
```

## Step 3 – Installing PHP

You have Nginx installed to serve your content and MySQL installed to store and manage your data. Now you can install PHP to process code and generate dynamic content for the web server.

You need to install the `php-fpm` and `php-mysql` packages, run:

```bash
sudo apt install php-fpm php-mysql
```

- `php-fpm`: which stands for “PHP fastCGI process manager”, and tell Nginx to pass PHP requests to this software for processing
- `php-mysql`: a PHP module that allows PHP to communicate with MySQL-based databases

## Step 4 — Configuring Nginx to Use the PHP Processor

Create the root web directory for your_domain as follows:

```bash
sudo mkdir /var/www/your_domain
```

Next, assign ownership of the directory with the $USER environment variable, which will reference your current system user:

```bash
sudo chown -R $USER:$USER /var/www/your_domain
```

Then, open a new configuration file in Nginx’s sites-available directory using your preferred command-line editor. Here, we’ll use nano:

```bash
sudo nano /etc/nginx/sites-available/your_domain 
```

```nginx
server {
    listen 80;
    server_name your_domain www.your_domain;
    root /var/www/your_domain;

    index index.html index.htm index.php;

    location / {
        try_files $uri $uri/ =404;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php7.4-fpm.sock;
     }

    location ~ /\.ht {
        deny all;
    }

}
```