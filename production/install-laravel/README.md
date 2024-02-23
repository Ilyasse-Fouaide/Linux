# How to install laravel on Ubuntu

Before you begin installing laravel make sure you have these PHP extensions.

The specific PHP extensions you need to install for Laravel on Ubuntu server will depend on the version of Laravel you're using. Here's a breakdown:

**Laravel 10.x**:

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
