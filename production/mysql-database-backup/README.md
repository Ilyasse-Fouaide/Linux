# How To Import and Export Databases in MySQL or MariaDB

## Introduction

Importing and exporting databases is a common task in software development. You can use data dumps to back up and restore your information. You can also use them to migrate data to a new server or development environment.

## Step 1 — Exporting a MySQL or MariaDB Database

The `mysqldump` console utility exports databases to SQL text files. This makes it easier to transfer and move databases. You will need your database’s name and credentials for an account whose privileges allow at least full read-only access to the database.

Use `mysqldump` to export your database:

```bash
mysqldump -u username -p database_name > data-dump.sql
```

- `username` is the username you can log in to the database with
- `database_name` is the name of the database to export
- `data-dump.sql` is the file in the current directory that stores the output.

## Step 2 — Importing a MySQL or MariaDB Database

To import an existing dump file into MySQL or MariaDB, you will have to create a new database. This database will hold the imported data.

First, log in to MySQL as *root* or another user with sufficient privileges to create new databases:

```bash
mysql -u root -p
```

This command will bring you into the MySQL shell prompt. Next, create a new database with the following command. In this example, the new database is called `new_database`:

```mysql
CREATE DATABASE new_database;
```

Then exit the MySQL shell by pressing <kbd>CTRL+D</kbd> or:

```mysql
exit
```

From the normal command line, you can import the dump file with the following command:

```mysql
mysql -u username -p new_database < data-dump.sql
```

- `username` is the username you can log in to the database with
- `newdatabase` is the name of the freshly created database
- `data-dump.sql` is the data dump file to be imported, located in the current directory

If the command runs successfully, it won’t produce any output. If any errors occur during the process, mysql will print them to the terminal instead. To check if the import was successful, log in to the MySQL shell and inspect the data. Selecting the new database with `USE new_database` and then use `SHOW TABLES;` or a similar command to look at some of the data.
