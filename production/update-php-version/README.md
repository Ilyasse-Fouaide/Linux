# Installing and Upgrading PHP (Ubuntu with Nginx)

In addition to updating PHP, you will need to update any PHP related packages your server is using. To help with this, run the following command:

```bash
sudo dpkg -l | awk '/^ii/{print $2}' | grep php
```

Example Output:

```
php-cli
php-common
php-curl
php-fpm
php-mbstring
php-mysql
php-tokenizer
php-xml
php8.1
php8.1-cli
php8.1-common
php8.1-curl
php8.1-fpm
php8.1-mbstring
php8.1-mysql
php8.1-opcache
php8.1-readline
php8.1-xml
```

## Installing PHP by Add repository

Next, we’ll use the Linux package manager **apt** to target a repository called [ondrej/php PPA](#https://launchpad.net/~ondrej/+archive/ubuntu/php) which contains all the PHP software we’ll need:

```
sudo add-apt-repository ppa:ondrej/php
sudo apt update
```

## Install PHP and packages

Now we’re ready to install PHP and its related packages referencing the text file you created in the above step. Here’s a template for a command you can use to do this:

```bash
sudo apt install php8.3 php8.3-common php8.3-{desired_extensions}
```

As an example, based on my above packages list and an update to PHP 8.2 my install command would look like this:

```bash
sudo apt install php8.3 php8.3-cli php8.3-common php8.3-curl php8.3-fpm php8.3-mbstring php8.3-mysql php8.3-opcache php8.3-readline php8.3-xml 
```

Next you need to update your Nginx site configs

```
server {
        listen 80 default_server;
        listen [::]:80 default_server;

        root /var/www/html;

        index index.html index.htm index.php index.nginx-debian.html;

        server_name _;

        location / {
                try_files $uri $uri/ =404;
        }

        location ~ \.php$ {
                include snippets/fastcgi-php.conf;
		#                             ↓↓↓
                fastcgi_pass unix:/run/php/php8.3-fpm.sock;
        }

        location ~ /\.ht {
                deny all;
        }
}

```

Then restart Nginx:

```bash
sudo systemctl reload nginx
```

---

if you already have the PHP repository set up, you can easily update PHP by running the following commands:

### Step 1: Update Package Index
First, make sure your package index is up to date:

```bash
sudo apt update
```

### Step 2: Upgrade PHP
To upgrade PHP along with any other packages, you can run:

```bash
sudo apt upgrade
```

If you want to specifically upgrade PHP without upgrading other packages, you can use:

```bash
sudo apt install --only-upgrade php
```

### Step 3: Verify the Installation
Check the version of PHP to confirm the update:

```bash
php -v
```

### Conclusion
This will update PHP to the latest version available in the repository. If you have any further questions or issues, feel free to ask!
