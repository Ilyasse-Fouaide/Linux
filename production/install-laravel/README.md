# How to install laravel on Ubuntu

Before you begin installing laravel make sure you have `composer` and some `PHP extensions`.

## Prerequisites:

In order to follow this guide, you will need first to follow [Setting up LEMP Stack](../install-lemp-stack/README.md) 

**Install Composer**:

`composer` is package manager for **PHP** and is required by laravel. Follow the installation instruction here [install composer](../install-composer/README.md)

**PHP Extesnsions for Laravel 10.x**:

The specific PHP extensions you need to install for Laravel on Ubuntu server will depend on the version of Laravel you're using. Here's a breakdown:

- Minimum requirements

    - PHP >= 8.1
    - Ctype, cURL, DOM, Fileinfo, Filter, Hash, Mbstring, OpenSSL, PCRE, PDO, Session, Tokenizer, XML

- Additional extensions for specific features

    - BCMath (for calculations involving arbitrary precision numbers)
    - GD (for image manipulation)
    - Intl (for working with internationalization and localization)
    - Redis (for using Redis as a cache or queueing system)
    - Imagick (for advanced image manipulation)
    - Zip (for archive manipulation)

## How to check and install extensions:

1. Check installed extensions:

    ```bash
    php -m
    ```

2. Install missing extensions:

    ```bash
    sudo apt install php-Y (replace Y with extension name)
    ```
## Installing Laravel

Use composer to create new laravel project in your desired directory:

```bash
composer create-project laravel/laravel example-app
```

replace `example.com` with your desired project name

Once everyting is set up start development server by typing: 

```bash
cd example-app
php artisan serve
```

Now you should be able to access your laravel application through the URL on port ***8000***
