# How to install Linux, Nginx, Myqsl, PHP (LEMP stack) on Ubuntu

## Table of content:

- [Installing the Nginx Web Server](#a)
- [Installing MySQL](#b)
- [Installing PHP](#c)
- [Configuring Nginx to Use the PHP Processor](#d)
- [Testing PHP with Nginx](#e)

## Step 1 – Installing the Nginx Web Server _(EnginX)_ <a id="a"></a>

You can use apt install to get Nginx installed:

```bash
sudo apt udpate
sudo apt install nginx
```

It is recommended that you enable the most restrictive profile that will still allow the traffic you need. Since you haven’t configured SSL for your server in this guide, you will only need to allow regular HTTP traffic on port `80`.

```bash
sudo ufw allow 80/tcp
```

## Step 2 — Installing MySQL/MariaDB <a id="b"></a>

Now that you have a web server up and running, you need to install the database system to be able to store and manage data for your site. MySQL is a popular database management system used within PHP environments.

```bash
sudo apt install mysql-server
sudo apt install mariadb-server
```

### Starting the Database Service

When MariaDB or Mysql installed start the database service by typing:

```bash
sudo systemctl start mysql
```

When the installation is finished, it’s recommended that you run a **security** script that comes pre-installed with MySQL. This script will remove some insecure default settings and lock down access to your database system. Start the interactive script by running:

```bash
sudo mysql_secure_installation
```

## Step 3 – Installing PHP <a id="c"></a>

You have Nginx installed to serve your content and MySQL installed to store and manage your data. Now you can install PHP to process code and generate dynamic content for the web server.

You need to install the `php-fpm` and `php-mysql` packages, run:

```bash
sudo apt install php-fpm php-mysql
```

- `php-fpm`: which stands for “PHP fastCGI process manager”, and tell Nginx to pass PHP requests to this software for processing
- `php-mysql`: a PHP module that allows PHP to communicate with MySQL-based databases

## Step 4 — Configuring Nginx to Use the PHP Processor <a id="d"></a>

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
# /etc/nginx/sites-available/your_domain
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
        # replace you php version with php7.4-fpm.sock
        fastcgi_pass unix:/var/run/php/php7.4-fpm.sock;
     }

    location ~ /\.ht {
        deny all;
    }

}
```

### Optional

<details>
<summary>My own configuration</summary>

```
server {
    listen 80;
    listen [::]:80;

    root /var/www/ilyasse-fouaide.com;

    server_name ilyasse-fouaide.com;

    index index.php info.php info.php;

    location /sites-1 {
        try_files $uri $uri/ /sites-1/index.html =404;
    }

    location /sites-2 {
        try_files $uri $uri/ /sites-2/index.html =404;
    }

    location /php {
        try_files $uri $uri/ /php/info.php =404;
    }

    # pass PHP scripts to FastCGI server
    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        # With php-fpm (or other unix sockets):
        fastcgi_pass unix:/run/php/php8.1-fpm.sock;
        # With php-cgi (or other tcp sockets):
        # fastcgi_pass 127.0.0.1:9000;
    }

    # deny access to .htaccess files, if Apache's document root
    # concurs with nginx's one
    location ~ /\.ht {
        deny all;
    }
}
```

</details>

Activate your configuration by linking to the config file from Nginx’s `sites-enabled` directory:

```bash
sudo ln -s /etc/nginx/sites-available/your_domain /etc/nginx/sites-enabled/
```

Then, unlink the default configuration file from the `/sites-enabled/` directory:

```bash
sudo unlink /etc/nginx/sites-enabled/default
```

You can test your configuration for syntax errors by typing:

```bash
sudo nginx -t
```

When you are ready, reload Nginx to apply the changes:

```bash
sudo systemctl reload nginx
```

Your new website is now active, but the web root /var/www/your_domain is still empty. Create an index.html file in that location so that we can test that your new server block works as expected:

```
nano /var/www/your_domain/index.html

<html>
  <head>
    <title>your_domain website</title>
  </head>
  <body>
    <h1>Hello World!</h1>

    <p>This is the landing page of <strong>your_domain</strong>.</p>
  </body>
</html>
```

## Step 5 –Testing PHP with Nginx <a id="e"></a>

Your LEMP stack should now be completely set up. You can test it to validate that Nginx can correctly hand `.php` files off to your PHP processor.

Open a new file called info.php within your document root in your text editor:

```bash
nano /var/www/your_domain/info.php
# type this: 
<?php phpinfo(); ?>
```

You can now access this page in your web browser by visiting the domain name or public IP address you’ve set up in your Nginx configuration file, followed by `/info.php`:

```bash
http://your_server_domain/info.php
```

## Next step

- [Install Composer](../install-composer/README.md)

## Conclusion

In this guide, we’ve built a flexible foundation for serving PHP websites and applications to your visitors, using Nginx as web server and MySQL as database system.
